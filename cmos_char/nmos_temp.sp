***** Spice Netlist for Cell 'nmos_one' *****
.lib '/home/vlsi/projects/project2020/eda/ngspice-32/models/scn4m_subm/scmos_bsim4.lib' ff

************** Module nmos_one **************
m1 vds vgs gnd gnd
+    scmosn l='0.4u' w='1.6u' m='1'

vgs vgs gnd dc 5
vds vds gnd dc 5

.global gnd
.dc temp  -40 125  1
.control
run 
.endc

.probe @m1[vth]

.end

