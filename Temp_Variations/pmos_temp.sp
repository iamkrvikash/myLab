***** Spice Netlist for Cell 'pmos_one' *****
.lib '/home/vlsi/projects/project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib' ss

************** Module pmos_one **************
m1 gnd vgs vds vdd
+    scmosp l='0.8u' w='0.6u' m='1'

vgs vgs gnd dc 0
vds vds gnd dc 5
vdd vdd gnd dc 5

.global gnd vdd
.dc temp -40 125 1
.control
run 
.endc

.probe @m1[vth]

.end

