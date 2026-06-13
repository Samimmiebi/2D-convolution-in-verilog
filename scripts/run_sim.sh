#!/bin/bash
# =============================================================================
# Simulation Script for 2D Convolution HLS Design
# Uses Vivado's xvlog/xelab/xsim
# =============================================================================

set -e

# Source Vivado
source /home/sam/files/Vivado/2025.1/Vivado/settings64.sh

# Move to project root
cd "$(dirname "$0")/.."

echo "============================================="
echo "  Step 1: Compiling Verilog sources..."
echo "============================================="

# Compile the HLS design
xvlog "hls_small/conv2d_small.v"

# Compile the testbench
xvlog -sv "tb/tb_main.v"

echo ""
echo "============================================="
echo "  Step 2: Elaborating design..."
echo "============================================="

# Elaborate with tb_main as top
xelab -debug typical -top tb_main -snapshot tb_main_sim

echo ""
echo "============================================="
echo "  Step 3: Running simulation..."
echo "============================================="

# Run simulation
# --tclbatch can be used for waveform generation
xsim tb_main_sim -R -wdb tb_main.wdb

echo ""
echo "============================================="
echo "  Simulation Complete!"
echo "============================================="
