*Control Signal subckt
.subckt control_signal clk csb oeb web pc s_en w_en vdd gnd

**Clock inverter
mclkp pc clk vdd vdd p w='3.2u' l='0.8u'
mclkn pc clk gnd gnd n w='1.6u' l='0.4u'

****************************************Sense Enable
*sense_nand = nand(oeb,csb,pc)>> s_nand
Ms_3 s_nand oeb o_a gnd n w='1.4u' l='0.4u'
Ms_4 o_a csb c_a  gnd n w='1.4u' l='0.4u'
Ms_5 c_a pc gnd gnd n w='1.4u' l='0.4u'
Ms_6 s_nand oeb vdd vdd p w='1.4u' l='0.4u'
Ms_7 s_nand csb vdd vdd p w='1.4u' l='0.4u'
Ms_8 s_nand pc  vdd vdd p W='1.4u' l='0.4u'

*sense_and = inv(s_nand)>> s_en
Ms_1 s_en s_nand vdd vdd p w='3.2u' l='0.8u'
Ms_2 s_en s_nand gnd gnd n w='1.6u' l='0.4u'

***************************************Write Enable
*write_nand = nand(web,csb,pc)>> w_nand
Mw_3 w_nand web o_d gnd n W=1.4u L=0.4u
Mw_4 o_d csb c_e  gnd n W=1.4u L=0.4u
Mw_5 c_e pc gnd gnd n W=1.4u L=0.4u
Mw_6 w_nand web vdd vdd p W=1.4u L=0.4u
Mw_7 w_nand csb vdd vdd p W=1.4u L=0.4u
Mw_8 w_nand pc  vdd vdd p W=1.4u L=0.4u

*write_and = inv(w_nand)>> w_en
Mw_1 w_en w_nand vdd vdd p W=3.2u L=0.8u
Mw_2 w_en w_nand gnd gnd n W=1.6u L=0.4u

.ends control_signal
