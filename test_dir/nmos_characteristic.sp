MOS OUTPUT CHARACTERISTICS
.OPTION NODE NOPAGE
VDS 3 0 
VGS 2 0
M1 1 2 0 0 MOD1 L=4u W=6u AD=10P AS=10P
* vids measures current , we could have used vds
* but it would be negative
VIDS 3 1
.MODEL MOD1 NMOS vtO=-2 NSUB=1.0e15 UO=550
.DC VDS 0 10 0.5 VGS 0 5 1
.END 
