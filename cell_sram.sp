*Subcircuit for 6T_cell
.subckt cell_sram abl ablb awl avdd agnd
*Inverter 1 
m1 q qbar agnd agnd n w='3.6u' l='0.4u'
m5 avdd qbar q avdd p w='0.6u' l='0.4u'
*Inverter 2
m2 q qbar agnd agnd n w='3.6u' l='0.4u'
m6 avdd qbar q avdd p w='0.6u' l='0.4u'
*Access transistor
m3 q awl abl agnd n w='0.92u' l='0.4u'
m4 qbar awl ablb agnd n w='0.92u' l='0.4u'
.ends cell_sram
