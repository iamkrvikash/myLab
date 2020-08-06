SRAM Design 6T
*Include MOS LIB FILE
.lib scn4m_subm.lib nom
*Temperature
*.temp=27
*Parameters
*.global vdd gnd
*Include subcircuit
*xio bl blb wl vdd gnd cell_sram
*.include cell_sram.sp

*Subcircuit for 6T_cell
*.subckt cell_sram abl ablb awl avdd agnd
*Inverter 1 
m1 q qbar gnd gnd n w='3.6u' l='0.4u'
m5 vdd qbar q vdd p w='0.6u' l='0.4u'
*Inverter 2
m2 q qbar gnd gnd n w='3.6u' l='0.4u'
m6 vdd qbar q vdd p w='0.6u' l='0.4u'
*Access transistor
m3 q wl bl gnd n w='0.92u' l='0.4u'
m4 qbar wl blb gnd n w='0.92u' l='0.4u'
*.ends cell_sram
*Precharge transistor
m7 vdd b1 bl vdd p w='0.6u' l='0.4u'
m8 vdd b2 blb vdd p w='0.6u' l='0.4u'
*Capaciotrs
cbl bl gnd 1270f
cblb blb gnd 1270f
cwl wl gnd 2550f
*DC VOltage Sources
vdd vdd 0 dc 5
*Initial Condition
.nodeset v(q)=0
.nodeset v(qbar)=5
.param q=0 qbar=5
*Data control
vb1 b1 0 pulse(0 5 5ns 1ns 1ns 20ns 50ns)
vb2 b2 0 pulse(0 5 5ns 1ns 1ns 20ns 50ns)
*Access Control
vwl wl 0 pulse(0 5 5ns 1ns 1ns 20ns 50ns)
*Transient Analysis
.tran 5p 50n
.control
run
plot q qbar $ Data Values
plot wl     $ access data
plot bl blb $ bit line data
.endc

.end

