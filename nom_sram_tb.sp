SRAM Design 
*Include MOS LIB FILE
.lib scn4m_subm.lib nom
*Parameters
.global vdd gnd
*Include subcircuit
xi bl blb wl vdd gnd cell_sram
.include cell_sram.sp
*Precharge transistor
m7 bl b1 vdd vdd p w='0.6u' l='0.4u'
m8 blb b2 vdd vdd p w='0.6u' l='0.4u'
*Capaciotrs
cbl bl gnd 1270f
cblb blb gnd 1270f
cwl wl gnd 2550f
*DC VOltage Sources
vdd vdd 0 dc 5
*Initial Condition
.nodeset v(xi.q)=0
.nodeset v(xi.qbar)=5
*.param q=0 qbar=5
*Data control
vb1 b1 0 pulse(0 5 10ns 1ns 1ns 20ns 40ns)
vb2 b2 0 pulse(0 5 10ns 1ns 1ns 20ns 40ns)
*Access Control
vwl wl 0 pulse(0 5 10ns 1ns 1ns 20ns 40ns)
*Transient Analysis
.tran 5p 100n
.control
run
plot xi.q xi.qbar $ Data Values
plot wl     $ access data
plot bl blb $ bit line data
.endc

.end

