SRAM Design 
*Include LIB FILE
.lib /home/vlsi/project2020/eda/ngspice-32/scn4m_subm.lib nom

*Temperatures 
.temp 27
*DC VOltage Sources
vdd vdd 0  5
*Parameters
.global vdd gnd

*Include Control Signals
xcn clk csb oeb web pc s_en w_en vdd gnd control_signal
.include control_signal.sp

*Include subcircuit
xi bl blb wl vdd gnd cell_icon
.include cell_icon.sp
*Include sense_amp subckt
xs bl blb dout s_en vdd gnd sense_amp
.include sense_amp.sp
*Include write driver subckt
xw din bl blb w_en vdd gnd write_driver 
.include write_driver.sp

*Precharge transistor
m7 bl  pc vdd vdd p w='2u' l='0.4u'
m8 blb pc vdd vdd p w='2u' l='0.4u'
m9 bl  pc blb vdd p w='2u' l='0.4u'
*Routing capacitance
cbl  bl  gnd 1270f
cblb blb gnd 1270f
cwl  wl  gnd 2550f
*BitLine overlap capacitance 
m10 bl  gnd vdd gnd n w='0.8u' l='0.4u' m='127'
m11 blb gnd vdd gnd n w='0.8u' l='0.4u' m='127'
*WordLine parasitic capacitance
m12 vdd wl gnd gnd n w='0.8u' l='0.4u' m='255'
m13 vdd wl vdd gnd n w='0.8u' l='0.4u' m='255'

*Initial Condition
.nodeset v(xi.q)=0
.nodeset v(xi.qbar)=5

*Data control (CLock Pulse Line)
vclk clk 0 pulse(5 0 20n 1n 1n 25n 50n)
*Data chip select csb
vcsb csb 0 pulse(0 5 20n 1n 1n 25n 50n)
*Sense Amplifier control Signal
vs_en oeb 0 pulse(5 0 40n 1n 1n 5n 100n)
*Access Control
vwl wl 0 pulse(0 5 30n 1n 1n 10n 50n)
*Write Driver Enable & Din
vw_en web 0 pulse(0 5 75n 1n 1n 20n 100n)
vdin din 0 pulse(0 5 75n 1n 1n 20n 200n)


*Transient Analysis
.tran 5p 300n
.control
run
plot v(dout)-6 v(xi.q) v(xi.qbar) v(bl)+6 v(blb)+6 v(din)+12 v(w_en)+18 v(s_en)+24 v(wl)+30 v(clk)+36
.endc

.end

