* Sim INVERTER CIRCUIT
* 23/09/2022

******************************
* Include model files
******************************
*.lib 'E:\Software\Spice\Lecture_Spice\model\CE222.lib' TT
.lib '..\model\CE222.lib' TT

******************************
* Additional options
******************************
.option TEMP=25C

.param pvdd11 = 1.1
.param pvdd = 2.4
*.param pvref = _PVREF_

******************************
* Circuit netlist
******************************

*CMOS inverter
vvdd vdd 0 dc 'pvdd11'
mp vdd in out vdd pmos l=70n w=4u
mn out in 0 0 nmos l=70n w=1u
cload out 0 0.05pf
vin in 0 dc 'pvdd11' pwl(0 0 10ns 0 10.2ns 'pvdd11', 20ns 'pvdd11' 20.2n 0)

vvdd1 vdd1 0 dc 'pvdd11'
mp1 vdd1 in out1 vdd1 pmos l=50n w=8u
mn1 out1 in 0 0 nmos l=50n w=6u
cload1 out1 0 0.05pf

.control
set color0 = white  ;background, a nice color of off-white
set color1 = black ;text and grid almost black
set color2 = blue  ;vector0
set color3 = red  ;vector1
set color4 = rgb:0/0/f  ;vector2  
set xgridwidth=1
set xbrushwidth=2

run
tran 0.01ns 30ns
plot v(in) v(out) v(out1)
plot i(vvdd) i(vvdd1)
meas tran tfall TRIG v(in) VAL='0.5*pvdd11' RISE=1 TARG v(out) VAL='0.5*pvdd11' FALL=1
meas tran trise TRIG v(in) VAL='0.5*pvdd11' FALL=1 TARG v(out) VAL='0.5*pvdd11' RISE=1
meas tran ivdd avg i(vvdd) from=5ns to=25ns
meas tran ivdd1 avg i(vvdd1) from=5ns to=25ns
.endc
*
.end
