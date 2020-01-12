set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
## JA0
set_property PACKAGE_PIN H1 [get_ports {sonar_trig}]					
    set_property IOSTANDARD LVCMOS33 [get_ports {sonar_trig}]
## JA1
set_property PACKAGE_PIN K2 [get_ports {sonar_echo}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {sonar_echo}]
	
##7 segment display
set_property PACKAGE_PIN W7 [get_ports {segments[0]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {segments[0]}]
set_property PACKAGE_PIN W6 [get_ports {segments[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {segments[1]}]
set_property PACKAGE_PIN U8 [get_ports {segments[2]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {segments[2]}]
set_property PACKAGE_PIN V8 [get_ports {segments[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {segments[3]}]
set_property PACKAGE_PIN U5 [get_ports {segments[4]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {segments[4]}]
set_property PACKAGE_PIN V5 [get_ports {segments[5]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {segments[5]}]
set_property PACKAGE_PIN U7 [get_ports {segments[6]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {segments[6]}]

set_property PACKAGE_PIN U2 [get_ports {anodes[0]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {anodes[0]}]
set_property PACKAGE_PIN U4 [get_ports {anodes[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {anodes[1]}]
set_property PACKAGE_PIN V4 [get_ports {anodes[2]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {anodes[2]}]
set_property PACKAGE_PIN W4 [get_ports {anodes[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {anodes[3]}]

set_property PACKAGE_PIN V17 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property PACKAGE_PIN V16 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property PACKAGE_PIN W16 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property PACKAGE_PIN W17 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
set_property PACKAGE_PIN W15 [get_ports {sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
set_property PACKAGE_PIN V15 [get_ports {sw[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
set_property PACKAGE_PIN W14 [get_ports {sw[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
set_property PACKAGE_PIN W13 [get_ports {sw[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]

set_property PACKAGE_PIN T18 [get_ports {transmit}]
set_property IOSTANDARD LVCMOS33 [get_ports {transmit}]
set_property PACKAGE_PIN U18 [get_ports {reset}]
set_property IOSTANDARD LVCMOS33 [get_ports {reset}]

    ##Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports TxD_debug] 
set_property IOSTANDARD LVCMOS33 [get_ports TxD_debug]
##Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports transmit_debug]
set_property IOSTANDARD LVCMOS33 [get_ports transmit_debug]
##Sch name = JA3
set_property PACKAGE_PIN J2 [get_ports button_debug]
set_property IOSTANDARD LVCMOS33 [get_ports button_debug]
##Sch name = JA4
set_property PACKAGE_PIN G2 [get_ports clk_debug]
set_property IOSTANDARD LVCMOS33 [get_ports clk_debug]

set_property PACKAGE_PIN A18 [get_ports TxD]
set_property IOSTANDARD LVCMOS33 [get_ports TxD]
    
set_property BITSTREAM.STARTUP.STARTUPCLK JTAGCLK [current_design]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]