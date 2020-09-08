SRAM Design 
*Include LIB FILE
.lib /home/vlsi/project2020/eda/ngspice-32/scn4m_subm.lib nom
*Temparatures
.temp 27
*Parameters
.global vdd gnd
*DC VOltage Sources
vdd vdd 0  5
*Include subcircuit
xi bl blb wl vdd gnd cell_icon
.include cell_icon.sp
*Precharge transistor
m7 bl  pc vdd vdd p w='2.0u' l='0.4u'
m8 blb pc vdd vdd p w='2.0u' l='0.4u'
m9 bl  pc blb vdd p w='2.0u' l='0.4u'
* Write Circuitry
m14 bl  w0 gnd gnd n w='2.0u' l='0.4u' 
m15 blb w1 gnd gnd n w='2.0u' l='0.4u' 
*Initial Condition
.nodeset v(xi.q)=0
.nodeset v(xi.qbar)=5
*Data control (Bit Line)
vpc pc 0 dc 0 
*Access Control
vwl wl 0 dc 5
*Write Pulse
vwrite0 w0 0 dc 0
vwrite1 w1 0 dc 5
*Transient Analysis
.dc vwl 0 4 0.01
.control
run
plot xi.q xi.qbar            $ Node values
plot v(wl) v(pc)+6           $ wordline & precharge
plot v(bl) v(blb)            $ Bit Line  data
.endc

.end

