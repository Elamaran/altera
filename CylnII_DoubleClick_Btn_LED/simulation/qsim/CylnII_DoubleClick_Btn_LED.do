onerror {quit -f}
vlib work
vlog -work work CylnII_DoubleClick_Btn_LED.vo
vlog -work work CylnII_DoubleClick_Btn_LED.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.CylnII_DoubleClick_Btn_LED_vlg_vec_tst
vcd file -direction CylnII_DoubleClick_Btn_LED.msim.vcd
vcd add -internal CylnII_DoubleClick_Btn_LED_vlg_vec_tst/*
vcd add -internal CylnII_DoubleClick_Btn_LED_vlg_vec_tst/i1/*
add wave /*
run -all
