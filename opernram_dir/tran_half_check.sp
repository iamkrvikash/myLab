SRAM Design 
*Include LIB FILE
.lib /home/vlsi/project2020/eda/ngspice-32/scn4m_subm.lib nom

*Temperatures 
.temp 27
*DC VOltage Sources
vdd vdd 0  5
*Parameters
.global vdd gnd

*Include subcircuit
xi bl blb wl vdd gnd cell_icon
.include cell_icon.sp
*Include sense_amp subckt
xt bl blb dout en vdd gnd sense_amp
.include sense_amp.sp
*Include write driver subckt
xd din bl blb enw vdd gnd write_driver 
.include write_driver.sp

**Clock inverter
mclkp pc clk vdd vdd p w='0.6u' l='0.8u'
mclkn pc clk gnd gnd n w='1.6u' l='0.4u'

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
vclk clk 0 pulse(5 0 20n 5n 5n 25n 60n)

*Data control (Bit Line)
*vpc pc 0 pulse(0 5 20n 1n 1n 25n 50n)
*Sense Amplifier control Signal
ven en 0 pulse(5 0 40n 5n 5n 5n 120n)
*Access Control
vwl wl 0 pulse(0 5 25n 5n 5n 10n 60n)
*Write Driver Enable & Din
venw enw 0 pulse(0 5 85n 5n 5n 20n 120n)
vdin din 0 pulse(0 5 85n 5n 5n 20n 240n)


*Transient Analysis
.tran 5p 250n
.control
run
plot v(dout)-6 v(xi.q) v(xi.qbar) v(bl)+6 v(blb)+6 v(din)+12 v(enw)+18 v(en)+24 v(wl)+30 v(clk)+36
*plot v(enw) v(din)+6
.endc

.end

