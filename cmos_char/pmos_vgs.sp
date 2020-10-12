***** Spice Netlist for Cell 'pmos_one' *****
.lib '/home/vlsi/projects/project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib' ff
.temp 125

************** Module pmos_one **************
m1 gnd vgs vds vdd
+    scmosp l='0.8u' w='0.6u' m='1'

vgs vgs gnd dc 5
vds vds gnd dc 5
vdd vdd gnd dc 5

.global gnd vdd
.dc vgs -5 5 0.01
.control
run 
*plot  vid#branch^0.5 
.endc

.probe @m1[id]

.end

