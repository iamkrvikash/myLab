*****SNM_Hold state ***********

******Inverter 1*******
M1 q1 qbar1 0 0 n w=1.6u l=0.4u
M5 q1 qbar1 avdd avdd p w=0.6u l=0.8u

******Inverter 2*******
M2 q2 qbar2  0 0 n w=1.6u l=0.4u
M6 q2 qbar2  avdd avdd p w=0.6u l=0.8u

******Including .lib file******
.lib '../scmos_bsim4.lib'nom
.temp 25

******Voltage sources******
v_nqbar1 qbar1 0 5
v_nqbar2 qbar2 0 5
vdd avdd 0 5

******Dc Analysis*****
.dc v_nqbar1 0 5 0.1 v_nqbar2 0 5 0.1

.control
run 
plot  v(q1) vs v(qbar1) v(qbar2) vs v(q2)
.endc
.end
