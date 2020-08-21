SRAM Design 
*Include LIB FILE
.lib /home/vlsi/project2020/eda/ngspice-32/scn4m_subm.lib nom
*Temperatures
.temp 27
*Include subcircuit
xi bl blb wl vdd gnd cell_icon
.include cell_icon.sp
*Include sense_amp subckt
xt bl blb dout en vdd gnd sense_amp
.include sense_amp.sp
*Precharge transistor
m7 bl  pc vdd vdd p w='5u' l='0.4u'
m8 blb pc vdd vdd p w='5u' l='0.4u'
*m9 bl  pc blb vdd p w='5u' l='0.4u'
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
*DC VOltage Sources
vdd vdd 0  5
*Parameters
.global vdd gnd
*Initial Condition
.nodeset v(xi.q)=0
.nodeset v(xi.qbar)=5
*Data control (Bit Line)
vpc pc 0 pulse(0 5 20n 1n 1n 40n 80n)
*Access Control
vwl wl 0 pulse(0 5 25n 1n 1n 20n 80n)
*Sense Amplifier control Signal
ven en 0 pulse(0 5 50n 1n 1n 50n 80n) 
*Sense amplifier initial conditions
.nodeset v(dout)=0
*Transient Analysis
.tran 5p 320n
.control
run
plot v(xi.q) v(dout)  v(bl)+6 v(blb)+6 v(wl)+12 v(pc)+18 v(en)+24       

*plot xi.q  xi.qbar v(dout)+10         $ Node values
*plot v(wl) v(pc)+6 v(en)           $ wordline & precharge
*plot v(bl) v(blb)            $ Bit Line  data
.endc

.end

