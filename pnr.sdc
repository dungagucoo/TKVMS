#------------------------------------------#
# Design Constraints
#------------------------------------------#

# Clock network
set clk clk
create_clock [get_ports $clk] -name clk -period 25
puts "\[INFO\]: Creating clock {clk} for port $clk with period: 25"

# Clock non-idealities
set_propagated_clock [get_clocks {clk}]
set_clock_uncertainty 0.12 [get_clocks {clk}]
puts "\[INFO\]: Setting clock uncertainty to: 0.12"

# Maximum transition time for the design nets
set_max_transition 0.75 [current_design]
puts "\[INFO\]: Setting maximum transition to: 0.75"

# Maximum fanout
set_max_fanout 16 [current_design]
puts "\[INFO\]: Setting maximum fanout to: 16"

# Timing paths delays derate
set_timing_derate -early [expr {1-0.07}]
set_timing_derate -late [expr {1+0.07}]

# Set input delays (max and min)
set_input_delay -max 5 -clock [get_clocks clk] [get_ports plaintext]
set_input_delay -min 1 -clock [get_clocks clk] [get_ports plaintext]

set_input_delay -max 5 -clock [get_clocks clk] [get_ports key]
set_input_delay -min 1 -clock [get_clocks clk] [get_ports key]

set_input_delay -max 5 -clock [get_clocks clk] [get_ports IV]
set_input_delay -min 1 -clock [get_clocks clk] [get_ports IV]

set_input_delay -max 5 -clock [get_clocks clk] [get_ports load]
set_input_delay -min 1 -clock [get_clocks clk] [get_ports load]

set_input_delay -max 5 -clock [get_clocks clk] [get_ports load_IV]
set_input_delay -min 1 -clock [get_clocks clk] [get_ports load_IV]

# Set output delays
set_output_delay -max 5 -clock [get_clocks clk] [get_ports ciphertext]
set_output_delay -min 1 -clock [get_clocks clk] [get_ports ciphertext]

set_output_delay -max 5 -clock [get_clocks clk] [get_ports load_encrypt]
set_output_delay -min 1 -clock [get_clocks clk] [get_ports load_encrypt]


# Clock source latency
set usr_clk_max_latency 4.57
set usr_clk_min_latency 4.11
set clk_max_latency 5.70
set clk_min_latency 4.40
set_clock_latency -source -max $clk_max_latency [get_clocks {clk}]
set_clock_latency -source -min $clk_min_latency [get_clocks {clk}]
puts "\[INFO\]: Setting clock latency range: $clk_min_latency : $clk_max_latency"

# Clock input Transition
set_input_transition 0.61 [get_ports $clk]


# Set input transitions
set_input_transition -max 0.5 [get_ports plaintext]
set_input_transition -min 0.1 [get_ports plaintext]

set_input_transition -max 0.5 [get_ports key]
set_input_transition -min 0.1 [get_ports key]

set_input_transition -max 0.5 [get_ports IV]
set_input_transition -min 0.1 [get_ports IV]

set_input_transition -max 0.5 [get_ports load]
set_input_transition -min 0.1 [get_ports load]

set_input_transition -max 0.5 [get_ports load_IV]
set_input_transition -min 0.1 [get_ports load_IV]



# Output loads
set_load 0.19 [all_outputs]
