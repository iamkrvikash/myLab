SRAM Design 
*Include LIB FILE
.lib /home/vlsi/project2020/eda/ngspice-32/scn4m_subm.lib ss
*Include subcircuit
xi bl blb wl vdd gnd cell_icon
.include cell_icon.sp
*Precharge transistor
m7 bl  pc vdd vdd p w='5.0u' l='0.4u'
m8 blb pc vdd vdd p w='5.0u' l='0.4u'
*m9 bl  pc blb vdd p w='2.0u' l='0.4u'
*Routing capacitance
cbl  bl  gnd 1270f
cblb blb gnd 1270f
cwl  wl  gnd 2550f
*BitLine overlap capacitance 
m10 bl  gnd vdd gnd n w='0.65u' l='0.4u' m='127'
m11 blb gnd vdd gnd n w='0.65u' l='0.4u' m='127'
*WordLine parasitic capacitance
m12 vdd wl gnd gnd n w='0.65u' l='0.4u' m='255'
m13 vdd wl vdd gnd n w='0.65u' l='0.4u' m='255'
*DC VOltage Sources
vdd vdd 0  5
*Parameters
.global vdd gnd
*Temperatures
.temp 27
*Initial Condition
.nodeset v(xi.q)=0
.nodeset v(xi.qbar)=5
*Data control (Bit Line)
vpc pc 0 dc 0
*Access Control
vwl wl 0 dc 5
*Transient Analysis
.dc vwl 0 5 0.01
.control
run
plot xi.q xi.qbar            $ Node values
plot v(wl) v(pc)+6           $ wordline & precharge
plot v(bl) v(blb)            $ Bit Line  data
.endc

.end

