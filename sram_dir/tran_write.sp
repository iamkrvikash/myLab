SRAM Design 
*Include LIB FILE
.lib /home/vlsi/project2020/eda/ngspice-32/scn4m_subm.lib nom
*Include subcircuit
xi bl blb wl vdd gnd cell_icon
.include cell_icon.sp
*Precharge transistor
m7 bl  pc vdd vdd p w='2.0u' l='0.4u'
m8 blb pc vdd vdd p w='2.0u' l='0.4u'
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
* Write Circuitry
m14 bl  w0 gnd gnd n w='2.0u' l='0.4u' 
m15 blb w1 gnd gnd n w='2.0u' l='0.4u' 
*DC VOltage Sources
vdd vdd 0  5
*Parameters
.global vdd gnd
*Initial Condition
.nodeset v(xi.q)=0
.nodeset v(xi.qbar)=5
*Data control (Bit Line)
vpc pc 0 pulse(0 5 20n 1n 1n 30n 60n)
*Access Control
vwl wl 0 pulse(0 5 25n 1n 1n 20n 60n)
*Write Pulse
vwrite1 w1 0 pulse(0 5 85n 1n 1n 20n 240n)
vwrite0 w0 0 pulse(0 5 205n 1n 1n 20n 240n)
*Transient Analysis
.tran 5p 300n
.control
run
plot v(w0) v(w1) v(xi.q)+6 v(xi.qbar)+6 v(bl)+12 v(blb)+12  v(wl)+18 v(pc)+24 
*plot xi.q xi.qbar             $ Node values
*plot v(wl) v(pc)+6           $ wordline & precharge
*plot v(bl) v(blb)            $ Bit Line  data
.endc

.end

