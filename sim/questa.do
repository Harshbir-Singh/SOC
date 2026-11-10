transcript on
if {[file exists work]} {vdel -lib work -all}
vlib work

vlog rtl/core/*.v
vlog -sv rtl/third_party/ahb3lite_interconnect/ahb3lite_pkg.sv
vlog -sv rtl/third_party/ahb3lite_interconnect/ahb3lite_interconnect_slave_priority.sv
vlog -sv rtl/third_party/ahb3lite_interconnect/ahb3lite_interconnect_slave_port.sv
vlog -sv rtl/third_party/ahb3lite_interconnect/ahb3lite_interconnect_master_port.sv
vlog -sv rtl/third_party/ahb3lite_interconnect/ahb3lite_interconnect.sv
vlog -sv rtl/bus/rv_ahb_master.sv rtl/bus/ahb_sram.sv
vlog -sv rtl/soc_top.sv sim/tb_soc.sv

vsim -voptargs=+acc work.tb_soc
run -all

