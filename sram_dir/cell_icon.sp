*Subcircuit for SRAM_6T_cell
.subckt cell_icon abl ablb awl avdd agnd
*Inverter 1 
m1 q qbar agnd agnd n w='1.1u' l='0.4u'
m5 q qbar avdd avdd p w='0.60u' l='0.4u'
*Inverter 2
m2 qbar q agnd agnd n w='1.1u' l='0.4u'
m6 qbar q avdd avdd p w='0.60u' l='0.4u'
*Access transistor
m3 q    awl abl  agnd n w='0.65u' l='0.4u'
m4 qbar awl ablb agnd n w='0.65u' l='0.4u'
.ends cell_icon
