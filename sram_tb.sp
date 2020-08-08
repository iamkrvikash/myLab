SRAM Design 
*Include MOS LIB FILE
.lib /home/vlsi/project2020/eda/ngspice-32/scn4m_subm.lib nom
*Parameters
.global vdd gnd
*Include subcircuit
xi bl blb wl vdd gnd cell_sram
.include cell_sram.sp
*Precharge transistor
m7 bl b1  vdd vdd p w='0.6u' l='0.4u'
* in write making m8 as comment
*m8 blb b2 vdd vdd p w='0.6u' l='0.4u'
*Capaciotrs
cbl bl gnd 1270f
cblb blb gnd 1270f
cwl wl gnd 2550f
*DC VOltage Sources
vdd vdd 0 dc 5
*Initial Condition
.nodeset v(xi.q)=0
.nodeset v(xi.qbar)=5
*Data control (read)
vread1 b1 0 pulse(0 5 10n 1n 1n 20n 40n)
*vread2 b2 0 pulse(0 5 10n 1n 1n 20n 40n)
*Data Control (write)
.nodeset v(blb)=0
*Access Control
vwl wl 0 pulse(0 5 30n 1n 1n 20n 40n)
*Transient Analysis
.tran 5p 60n
.control
run
plot xi.q  xi.qbar $ Data Values
plot bl blb        $ access data
plot wl            $ bit line data
*plot b2            $ pre charge (read)
Plot b1            $ pre charge (write)
.endc

.end

