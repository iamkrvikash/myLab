AC TEST
Iin 1 0 AC 1
R1 1 2 100
L1 2 0 1

.control
AC LIN 101 10 10K
pot v(2)  $ real part !
plot mag(v(2))  $ magnitude
plot db(v(2))  $ same as vdb(2)
plot phase(v(2)) $ phase in rad
.endc

.end
