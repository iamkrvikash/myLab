A Berkeley SPICE3 compatible circuit
*
* This circuit contains only Berkeley SPICE3 Components.
*
* The circuit is am AC coupled transistor amplifier with
* a sinewave input at node "1", a gain of approximately -3.9 
* and output on node "coil".
*
.tran 1e-5 2e-3
*
vcc vcc 0 12.0
vin 1 0 0.0 ac 1.0 sin(0 1 1k)
ccouple 1 base 10uf
rbias1 vcc base 100k
rbias2 base 0 24k
q1 coll base emit generic
rcollector vcc coll 3.9k
remitter emit 0 1k
*
.model generic npn
*
.end   
