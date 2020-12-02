*****SE-SRAM SNM ***********

******Inverter 1*******
M1 q1 qbar1 0 0 n w=0.8u l=0.4u
M2 q1 qbar1 avdd avdd p w=0.6u l=0.4u

******Inverter 2*******
M3 q2 qbar2  nwa 0 n w=0.6u l=0.4u
M4 q2 qbar2  avdd avdd p w=0.7u l=0.4u
m5 nwa avdd 0 0 n w=0.6u l=0.4u

****** .lib file******
.lib '../scmos_bsim4.lib' nom
.temp 25

******Voltage sources******
v_nqbar1 qbar1 0 5
v_nqbar2 qbar2 0 5
vdd avdd 0 5

******Dc Analysis*****
.dc v_nqbar1 0 5 0.1 v_nqbar2 0 5 0.1

.control
run 
plot  v(q1) vs v(qbar1)  v(qbar2) vs v(q2)
.endc
.end
