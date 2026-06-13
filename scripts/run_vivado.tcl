# =============================================================================
# Vivado TCL Script for 2D Convolution HLS Design
# Performs: Synthesis → Implementation → Reports
# Target: Artix-7 xc7a35tcpg236-1
# =============================================================================

# Project settings
set project_name "conv2d_hls"
set project_dir  "./vivado_project"
set src_file     "../hls_small/conv2d_small.v"
set part_name    "xczu3eg-sbva484-1-e"
set top_module   "main"

# Clean previous runs
if {[file exists $project_dir]} {
    file delete -force $project_dir
}

# Create project
create_project $project_name $project_dir -part $part_name -force

# Add source files
add_files -norecurse [glob "../hls_small/conv2d_small.v"]

# Add timing constraints
read_xdc "timing.xdc"

# Set top module
set_property top $top_module [current_fileset]

# Update compile order
update_compile_order -fileset sources_1

# =============================================================================
# Run Synthesis
# =============================================================================
puts "============================================="
puts "  Running Synthesis..."
puts "============================================="

launch_runs synth_1 -jobs 4
wait_on_run synth_1

# Check synthesis status
if {[get_property STATUS [get_runs synth_1]] != "synth_design Complete!"} {
    puts "ERROR: Synthesis failed!"
    # Still generate partial report
}

# Open synthesized design for reports
open_run synth_1

# Generate utilization report
report_utilization -file "${project_dir}/post_synth_utilization.txt"
puts "\n===== POST-SYNTH UTILIZATION REPORT ====="
report_utilization

# =============================================================================
# Run Implementation (for accurate STA)
# =============================================================================
puts "\n============================================="
puts "  Running Implementation..."
puts "============================================="

launch_runs impl_1 -jobs 4
wait_on_run impl_1

if {[get_property STATUS [get_runs impl_1]] != "route_design Complete!"} {
    puts "ERROR: Implementation failed!"
}

open_run impl_1

# Generate timing summary (post-implementation static timing analysis)
report_timing_summary -file "${project_dir}/post_impl_timing_summary.txt"
puts "\n===== POST-IMPLEMENTATION TIMING SUMMARY (STA) ====="
report_timing_summary -max_paths 5

# Detailed timing report
report_timing -sort_by group -max_paths 10 -path_type full -file "${project_dir}/post_impl_timing_paths.txt"

# Generate power estimate
report_power -file "${project_dir}/power_report.txt"

puts "\n============================================="
puts "  Synthesis & Implementation Complete!"
puts "  Reports saved to: $project_dir/"
puts "============================================="

# Close project
close_project
