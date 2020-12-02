******SE-SRAM_6T CIRCUIT********


******Inverter 1*******
M2 qbar q 0 0 n w=0.8u l=0.4u
M1 qbar q avdd avdd p w=0.6u l=0.4u

******Inverter 2*******
M4 q qbar wa 0 n w=0.6u l=0.4u
M3 q qbar avdd avdd p w=0.7u l=0.4u

******Write Asiist transistor***
Mwa wa w0 0 0 n w=0.6u l=0.4u

******Acess Transistor*****
M5 bl wl q 0 n w=1u l=0.4u

******Read AssistTransistor*****
M6 bl qbar ra 0 n w=0.6u l=0.4u
Mra ra r 0 0 n w=0.6u l=0.4u


****Parasitcs*****
cw1 bl 0 1270f
cw3 wl 0 2560f
m10 bl 0 avdd 0 n w=1u l=0.4u m=127
m11 avdd wl 0 0 n w=1u l=0.4u m=255

*****Precharge****
Mp1 bl pc avdd avdd p w=3u l=0.4u
Mn bl write_bl 0 0 n w=3u l=0.4u
*****Supply****
.nodeset v(q)=0
.nodeset v(qbar)=5
.temp 25

.tran 5p 160n
.lib '../scmos_bsim4.lib' nom

******Voltage Sources******
vsup avdd 0 dc 5

v_pc pc 0 pulse(5 0 0n 1n 1n 13n 30n)
v_R r 0 pulse(0 5 22n 1n 1n 6n 60n)
v_WL wl 0 pulse(0 5 52n 1n 1n 6n 60n)
v_nw0 w0 0 pulse(5 0 52n 1n 1n 6n 60n)
v_write write_bl 0 pulse(0 5 105n 1n 1n 5n 120n)

.control
run
plot v(pc)+30 v(r)+24 v(wl)+18 v(w0)+12 v(bl)+6 v(q) v(qbar)
.endc
.end
