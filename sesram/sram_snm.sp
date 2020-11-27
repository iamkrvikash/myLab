*S P I C E C o d e ( G r a p h i c a l T e c h n i q u e )
******Including .lib file******
.lib '/home/vlsi/projects/project2020/eda/ngspice-32/scn4m_subm.lib' nom
.temp 25
*DC VOltage Sources
vdd vdd 0  5
*Parameters
.global vdd  gnd


* when reading, use VDD
vwl wl 0 dc 5
.IC V(bl) = 5
.IC V(blb) = 5

 
*****SNM_Read state ***********

******Inverter 1*******
M1 q qb 0 0 n w=1.6u l=0.4u
M5 q qb vdd vdd p w=0.6u l=0.8u

******Inverter 2*******
M2 qb q 0 0 n w=1.6u l=0.4u
M6 qb q vdd vdd p w=0.6u l=0.8u

******Acess Transistor*****
M3 blb wl qb 0 n w=0.8u l=0.4u
M4 bl wl q  0 n w=0.8u l=0.4u



******Dc Analysis*****

.DC V1 0 5 0.01
.MEASURE DC MAXVD MAX V(VD)
* measure SNM
.MEASURE DC SNM param='1/sqrt(2)*MAXVD'
.END
