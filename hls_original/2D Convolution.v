// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 0.9.7 - Revision 8b59b7ac7b9ab30cd20960921ab47ea5009163f1-main - Date 2024-12-15T13:48:54
// /tmp/.mount_bambu-E9drqC/usr/bin/bambu executed with: /tmp/.mount_bambu-E9drqC/usr/bin/bambu --top-fname=main HLS/HLS-20241213T185059Z-001/HLS/main1.c 
// 
// Send any bug to: panda-info@polimi.it
// ************************************************************************
// The following text holds for all the components tagged with PANDA_LGPLv3.
// They are all part of the BAMBU/PANDA IP LIBRARY.
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 3 of the License, or (at your option) any later version.
// 
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public
// License along with the PandA framework; see the files COPYING.LIB
// If not, see <http://www.gnu.org/licenses/>.
// ************************************************************************

`ifdef __ICARUS__
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VERILATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef MODEL_TECH
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VCS
  `define _SIM_HAVE_CLOG2
`endif
`ifdef NCVERILOG
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_SIMULATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_ISIM
  `define _SIM_HAVE_CLOG2
`endif

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module constant_value(out1);
  parameter BITSIZE_out1=1,
    value=1'b0;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = value;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_SE(clock,
  reset,
  in1,
  wenable,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    if (wenable)
      reg_out1 <= in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_STD(clock,
  reset,
  in1,
  wenable,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    reg_out1 <= in1;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ARRAY_1D_STD_DISTRAM_NN_SDS(clock,
  reset,
  in1,
  in2,
  in3,
  in4,
  out1,
  sel_LOAD,
  sel_STORE,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  Sin_Rdata_ram,
  Sout_Rdata_ram,
  S_data_ram_size,
  Sin_DataRdy,
  Sout_DataRdy,
  proxy_in1,
  proxy_in2,
  proxy_in3,
  proxy_sel_LOAD,
  proxy_sel_STORE,
  proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_in4=1, PORTSIZE_in4=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2,
    BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2,
    BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2,
    BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2,
    BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2,
    BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2,
    BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2,
    BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2,
    MEMORY_INIT_file="array.mem",
    n_elements=1,
    data_size=32,
    address_space_begin=0,
    address_space_rangesize=4,
    BUS_PIPELINED=1,
    PRIVATE_MEMORY=0,
    READ_ONLY_MEMORY=0,
    USE_SPARSE_MEMORY=1,
    ALIGNMENT=32,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2,
    BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  `ifndef _SIM_HAVE_CLOG2
      function integer log2;
        input integer value;
        integer temp_value;
        begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
        end
      endfunction
  `endif
  parameter n_byte_on_databus = ALIGNMENT/8;
  parameter nbit_addr = BITSIZE_in2 > BITSIZE_proxy_in2 ? BITSIZE_in2 : BITSIZE_proxy_in2;
  `ifdef _SIM_HAVE_CLOG2
    parameter nbit_read_addr = n_elements == 1 ? 1 : $clog2(n_elements);
    parameter nbits_byte_offset = n_byte_on_databus<=1 ? 0 : $clog2(n_byte_on_databus);
  `else
    parameter nbit_read_addr = n_elements == 1 ? 1 : log2(n_elements);
    parameter nbits_byte_offset = n_byte_on_databus<=1 ? 0 : log2(n_byte_on_databus);
  `endif
  parameter max_n_writes = PORTSIZE_sel_STORE;
  parameter max_n_reads = PORTSIZE_sel_LOAD;
  parameter max_n_rw = max_n_writes > max_n_reads ? max_n_writes : max_n_reads;
  
  wire [max_n_writes-1:0] bram_write;
  
  wire [nbit_read_addr*max_n_rw-1:0] memory_addr_a;
  wire [nbit_read_addr-1:0] memory_addr_a_0;
  wire [nbit_read_addr-1:0] memory_addr_a_1;
  
  wire [data_size*max_n_writes-1:0] din_value_aggregated;
  wire [data_size*max_n_reads-1:0] dout_a;
  wire [nbit_addr*max_n_rw-1:0] tmp_addr;
  wire [nbit_addr*max_n_rw-1:0] relative_addr;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  integer index2;
  
  reg [data_size-1:0] memory [0:n_elements-1] /* synthesis syn_ramstyle = "no_rw_check" */;
  
  initial
  begin
    $readmemb(MEMORY_INIT_file, memory, 0, n_elements-1);
  end
  
  generate
  genvar ind2;
  for (ind2=0; ind2<max_n_rw; ind2=ind2+1)
    begin : Lind2
      assign tmp_addr[(ind2+1)*nbit_addr-1:ind2*nbit_addr] = (proxy_sel_LOAD[ind2]||proxy_sel_STORE[ind2]) ? proxy_in2[(ind2+1)*BITSIZE_proxy_in2-1:ind2*BITSIZE_proxy_in2] : in2[(ind2+1)*BITSIZE_in2-1:ind2*BITSIZE_in2];
    end
  endgenerate
  
  generate
  genvar i6;
    for (i6=0; i6<max_n_rw; i6=i6+1)
    begin : L6
      if(USE_SPARSE_MEMORY==1)
        assign relative_addr[(i6)*nbit_addr+nbit_addr-1:i6*nbit_addr] = tmp_addr[(i6)*nbit_addr+nbit_addr-1:i6*nbit_addr];
      else
        assign relative_addr[(i6+1)*nbit_addr-1:i6*nbit_addr] = tmp_addr[(i6+1)*nbit_addr-1:i6*nbit_addr]-address_space_begin;
    end
  endgenerate
  
  generate
  genvar i7;
    for (i7=0; i7<max_n_rw; i7=i7+1)
    begin : L7_A
      if (n_elements==1)
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = {nbit_read_addr{1'b0}};
      else
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr];
    end
  endgenerate
  
  generate
  genvar i14;
    for (i14=0; i14<max_n_writes; i14=i14+1)
    begin : L14
      assign din_value_aggregated[(i14+1)*data_size-1:i14*data_size] = proxy_sel_STORE[i14] ? proxy_in1[(i14+1)*BITSIZE_proxy_in1-1:i14*BITSIZE_proxy_in1] : in1[(i14+1)*BITSIZE_in1-1:i14*BITSIZE_in1];
    end
  endgenerate
  
  generate
  genvar i11;
    for (i11=0; i11<max_n_reads; i11=i11+1)
    begin : asynchronous_read
      assign dout_a[data_size*i11+:data_size] = memory[memory_addr_a[nbit_read_addr*i11+:nbit_read_addr]];
    end
  endgenerate
  
  assign memory_addr_a_0 = memory_addr_a[nbit_read_addr*0+:nbit_read_addr];
  assign memory_addr_a_1 = memory_addr_a[nbit_read_addr*1+:nbit_read_addr];
  
  generate if(READ_ONLY_MEMORY==0)
    always @(posedge clock)
    begin
      if(bram_write[0])
        memory[memory_addr_a_0] <= din_value_aggregated[data_size*0+:data_size];
      if(bram_write[1])
        memory[memory_addr_a_1] <= din_value_aggregated[data_size*1+:data_size];
    end
  endgenerate
  
  generate
  genvar i21;
    for (i21=0; i21<max_n_writes; i21=i21+1)
    begin : L21
        assign bram_write[i21] = int_sel_STORE[i21] || proxy_sel_STORE[i21];
    end
  endgenerate
  
  generate
  genvar i20;
    for (i20=0; i20<max_n_reads; i20=i20+1)
    begin : L20
      assign out1[(i20+1)*BITSIZE_out1-1:i20*BITSIZE_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
      assign proxy_out1[(i20+1)*BITSIZE_proxy_out1-1:i20*BITSIZE_proxy_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
    end
  endgenerate
  assign Sout_Rdata_ram =Sin_Rdata_ram;
  assign Sout_DataRdy = Sin_DataRdy;
  assign int_sel_LOAD = sel_LOAD & in4;
  assign int_sel_STORE = sel_STORE & in4;
  
  assign Sout_DataRdy = Sin_DataRdy;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ADDRESS_DECODING_LOGIC_NN(clock,
  reset,
  in1,
  in2,
  in3,
  out1,
  sel_LOAD,
  sel_STORE,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  Sin_Rdata_ram,
  Sout_Rdata_ram,
  S_data_ram_size,
  Sin_DataRdy,
  Sout_DataRdy,
  proxy_in1,
  proxy_in2,
  proxy_in3,
  proxy_sel_LOAD,
  proxy_sel_STORE,
  proxy_out1,
  dout_a,
  dout_b,
  memory_addr_a,
  memory_addr_b,
  din_value_aggregated_swapped,
  be_swapped,
  bram_write);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2,
    BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2,
    BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2,
    BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2,
    BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2,
    BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2,
    BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2,
    BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2,
    BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2,
    address_space_begin=0,
    address_space_rangesize=4,
    BUS_PIPELINED=1,
    BRAM_BITSIZE=32,
    PRIVATE_MEMORY=0,
    USE_SPARSE_MEMORY=1,
    HIGH_LATENCY=0,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2,
    BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2,
    BITSIZE_dout_a=1, PORTSIZE_dout_a=2,
    BITSIZE_dout_b=1, PORTSIZE_dout_b=2,
    BITSIZE_memory_addr_a=1, PORTSIZE_memory_addr_a=2,
    BITSIZE_memory_addr_b=1, PORTSIZE_memory_addr_b=2,
    BITSIZE_din_value_aggregated_swapped=1, PORTSIZE_din_value_aggregated_swapped=2,
    BITSIZE_be_swapped=1, PORTSIZE_be_swapped=2,
    BITSIZE_bram_write=1, PORTSIZE_bram_write=2,
    nbit_read_addr=32,
    n_byte_on_databus=4,
    n_mem_elements=4,
    max_n_reads=2,
    max_n_writes=2,
    max_n_rw=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  input [(PORTSIZE_dout_a*BITSIZE_dout_a)+(-1):0] dout_a;
  input [(PORTSIZE_dout_b*BITSIZE_dout_b)+(-1):0] dout_b;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  output [(PORTSIZE_memory_addr_a*BITSIZE_memory_addr_a)+(-1):0] memory_addr_a;
  output [(PORTSIZE_memory_addr_b*BITSIZE_memory_addr_b)+(-1):0] memory_addr_b;
  output [(PORTSIZE_din_value_aggregated_swapped*BITSIZE_din_value_aggregated_swapped)+(-1):0] din_value_aggregated_swapped;
  output [(PORTSIZE_be_swapped*BITSIZE_be_swapped)+(-1):0] be_swapped;
  output [PORTSIZE_bram_write-1:0] bram_write;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter nbit_addr = BITSIZE_S_addr_ram/*n_bytes ==  1 ? 1 : $clog2(n_bytes)*/;
    parameter nbits_byte_offset = n_byte_on_databus==1 ? 1 : $clog2(n_byte_on_databus);
    parameter nbits_address_space_rangesize = $clog2(address_space_rangesize);
  `else
    parameter nbit_addr = BITSIZE_S_addr_ram/*n_bytes ==  1 ? 1 : log2(n_bytes)*/;
    parameter nbits_address_space_rangesize = log2(address_space_rangesize);
    parameter nbits_byte_offset = n_byte_on_databus==1 ? 1 : log2(n_byte_on_databus);
  `endif
   parameter memory_bitsize = 2*BRAM_BITSIZE;
  
  function [n_byte_on_databus*max_n_writes-1:0] CONV;
    input [n_byte_on_databus*max_n_writes-1:0] po2;
  begin
    case (po2)
      1:CONV=(1<<1)-1;
      2:CONV=(1<<2)-1;
      4:CONV=(1<<4)-1;
      8:CONV=(1<<8)-1;
      16:CONV=(1<<16)-1;
      32:CONV=(1<<32)-1;
      default:CONV=-1;
    endcase
  end
  endfunction
  
  wire [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] tmp_addr;
  wire [n_byte_on_databus*max_n_writes-1:0] conv_in;
  wire [n_byte_on_databus*max_n_writes-1:0] conv_out;
  wire [PORTSIZE_S_addr_ram-1:0] cs;
  wire [PORTSIZE_S_oe_ram-1:0] oe_ram_cs;
  wire [PORTSIZE_S_we_ram-1:0] we_ram_cs;
  wire [nbit_addr*max_n_rw-1:0] relative_addr;
  wire [memory_bitsize*max_n_writes-1:0] din_value_aggregated;
  wire [memory_bitsize*PORTSIZE_S_Wdata_ram-1:0] S_Wdata_ram_int;
  wire [memory_bitsize*max_n_reads-1:0] out1_shifted;
  wire [memory_bitsize*max_n_reads-1:0] dout;
  wire [nbits_byte_offset*max_n_rw-1:0] byte_offset;
  wire [n_byte_on_databus*max_n_writes-1:0] be;
  
  reg [PORTSIZE_S_we_ram-1:0] we_ram_cs_delayed =0;
  reg [PORTSIZE_S_oe_ram-1:0] oe_ram_cs_delayed =0;
  reg [PORTSIZE_S_oe_ram-1:0] oe_ram_cs_delayed_registered =0;
  reg [PORTSIZE_S_oe_ram-1:0] oe_ram_cs_delayed_registered1 =0;
  reg [max_n_reads-1:0] delayed_swapped_bit =0;
  reg [max_n_reads-1:0] delayed_swapped_bit_registered =0;
  reg [max_n_reads-1:0] delayed_swapped_bit_registered1 =0;
  reg [nbits_byte_offset*max_n_reads-1:0] delayed_byte_offset =0;
  reg [nbits_byte_offset*max_n_reads-1:0] delayed_byte_offset_registered =0;
  reg [nbits_byte_offset*max_n_reads-1:0] delayed_byte_offset_registered1 =0;
  
  generate
  genvar ind2;
  for (ind2=0; ind2<PORTSIZE_in2; ind2=ind2+1)
    begin : Lind2
      assign tmp_addr[(ind2+1)*BITSIZE_in2-1:ind2*BITSIZE_in2] = (proxy_sel_LOAD[ind2]||proxy_sel_STORE[ind2]) ? proxy_in2[(ind2+1)*BITSIZE_proxy_in2-1:ind2*BITSIZE_proxy_in2] : in2[(ind2+1)*BITSIZE_in2-1:ind2*BITSIZE_in2];
    end
  endgenerate
  
  generate
  genvar i2;
    for (i2=0;i2<max_n_reads;i2=i2+1)
    begin : L_copy
        assign dout[(memory_bitsize/2)+memory_bitsize*i2-1:memory_bitsize*i2] = delayed_swapped_bit[i2] ? dout_a[(memory_bitsize/2)*(i2+1)-1:(memory_bitsize/2)*i2] : dout_b[(memory_bitsize/2)*(i2+1)-1:(memory_bitsize/2)*i2];
        assign dout[memory_bitsize*(i2+1)-1:memory_bitsize*i2+(memory_bitsize/2)] = delayed_swapped_bit[i2] ? dout_b[(memory_bitsize/2)*(i2+1)-1:(memory_bitsize/2)*i2] : dout_a[(memory_bitsize/2)*(i2+1)-1:(memory_bitsize/2)*i2];
        always @(posedge clock)
        begin
          if(HIGH_LATENCY == 0)
            delayed_swapped_bit[i2] <= !relative_addr[nbits_byte_offset+i2*nbit_addr-1];
          else if(HIGH_LATENCY == 1)
          begin
            delayed_swapped_bit_registered[i2] <= !relative_addr[nbits_byte_offset+i2*nbit_addr-1];
            delayed_swapped_bit[i2] <= delayed_swapped_bit_registered[i2];
          end
          else
          begin
            delayed_swapped_bit_registered1[i2] <= !relative_addr[nbits_byte_offset+i2*nbit_addr-1];
            delayed_swapped_bit_registered[i2] <= delayed_swapped_bit_registered1[i2];
            delayed_swapped_bit[i2] <= delayed_swapped_bit_registered[i2];
          end
        end
    end
  endgenerate
  
  generate
  genvar i3;
    for (i3=0; i3<PORTSIZE_S_addr_ram; i3=i3+1)
    begin : L3
      if(PRIVATE_MEMORY==0 && USE_SPARSE_MEMORY==0)
        assign cs[i3] = (S_addr_ram[(i3+1)*BITSIZE_S_addr_ram-1:i3*BITSIZE_S_addr_ram] >= (address_space_begin)) && (S_addr_ram[(i3+1)*BITSIZE_S_addr_ram-1:i3*BITSIZE_S_addr_ram] < (address_space_begin+address_space_rangesize));
      else if(PRIVATE_MEMORY==0)
        assign cs[i3] = S_addr_ram[(i3+1)*BITSIZE_S_addr_ram-1:i3*BITSIZE_S_addr_ram+nbits_address_space_rangesize] == address_space_begin[nbit_addr-1:nbits_address_space_rangesize];
      else
        assign cs[i3] = 1'b0;
    end
  endgenerate
  
  generate
  genvar i4;
    for (i4=0; i4<PORTSIZE_S_oe_ram; i4=i4+1)
    begin : L4
      assign oe_ram_cs[i4] = S_oe_ram[i4] & cs[i4];
    end
  endgenerate
  
  generate
  genvar i5;
    for (i5=0; i5<PORTSIZE_S_we_ram; i5=i5+1)
    begin : L5
      assign we_ram_cs[i5] = S_we_ram[i5] & cs[i5];
    end
  endgenerate
  
  generate
  genvar i6;
    for (i6=0; i6<max_n_rw; i6=i6+1)
    begin : L6
      if(PRIVATE_MEMORY==0 && USE_SPARSE_MEMORY==0 && i6< PORTSIZE_S_addr_ram)
        assign relative_addr[(i6+1)*nbit_addr-1:i6*nbit_addr] = ((i6 < max_n_writes && (sel_STORE[i6]==1'b1 || proxy_sel_STORE[i6]==1'b1)) || (i6 < max_n_reads && (sel_LOAD[i6]==1'b1 || proxy_sel_LOAD[i6]==1'b1))) ? tmp_addr[(i6+1)*BITSIZE_in2-1:i6*BITSIZE_in2]-address_space_begin: S_addr_ram[(i6+1)*BITSIZE_S_addr_ram-1:i6*BITSIZE_S_addr_ram]-address_space_begin;
      else if(PRIVATE_MEMORY==0 && i6< PORTSIZE_S_addr_ram)
        assign relative_addr[(i6)*nbit_addr+nbits_address_space_rangesize-1:i6*nbit_addr] = ((i6 < max_n_writes && (sel_STORE[i6]==1'b1 || proxy_sel_STORE[i6]==1'b1)) || (i6 < max_n_reads && (sel_LOAD[i6]==1'b1 || proxy_sel_LOAD[i6]==1'b1))) ? tmp_addr[(i6)*BITSIZE_in2+nbits_address_space_rangesize-1:i6*BITSIZE_in2] : S_addr_ram[(i6)*BITSIZE_S_addr_ram+nbits_address_space_rangesize-1:i6*BITSIZE_S_addr_ram];
      else if(USE_SPARSE_MEMORY==1)
        assign relative_addr[(i6)*nbit_addr+nbits_address_space_rangesize-1:i6*nbit_addr] = tmp_addr[(i6)*BITSIZE_in2+nbits_address_space_rangesize-1:i6*BITSIZE_in2];
      else
        assign relative_addr[(i6+1)*nbit_addr-1:i6*nbit_addr] = tmp_addr[(i6+1)*BITSIZE_in2-1:i6*BITSIZE_in2]-address_space_begin;
    end
  endgenerate
  
  generate
  genvar i7;
    for (i7=0; i7<max_n_rw; i7=i7+1)
    begin : L7_A
      if (n_mem_elements==1)
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = {nbit_read_addr{1'b0}};
      else
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = !relative_addr[nbits_byte_offset+i7*nbit_addr-1] ? relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr] : (relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr-1]+ 1'b1) >> 1;
    end
  endgenerate
  
  generate
    for (i7=0; i7<max_n_rw; i7=i7+1)
    begin : L7_B
      if (n_mem_elements==1)
        assign memory_addr_b[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = {nbit_read_addr{1'b0}};
      else
        assign memory_addr_b[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = !relative_addr[nbits_byte_offset+i7*nbit_addr-1] ? (relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr-1] + 1'b1) >> 1 : relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr];
    end
  endgenerate
  
  generate
  genvar i8;
    for (i8=0; i8<max_n_rw; i8=i8+1)
    begin : L8
      if (n_byte_on_databus==2)
        assign byte_offset[(i8+1)*nbits_byte_offset-1:i8*nbits_byte_offset] = {nbits_byte_offset{1'b0}};
      else
        assign byte_offset[(i8+1)*nbits_byte_offset-1:i8*nbits_byte_offset] = {1'b0, relative_addr[nbits_byte_offset+i8*nbit_addr-2:i8*nbit_addr]};
    end
  endgenerate
  
  generate
  genvar i9, i10;
    for (i9=0; i9<max_n_writes; i9=i9+1)
    begin : byte_enable
      if(PRIVATE_MEMORY==0 && i9 < PORTSIZE_S_data_ram_size)
      begin
        assign conv_in[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = proxy_sel_STORE[i9] ? proxy_in3[BITSIZE_proxy_in3+BITSIZE_proxy_in3*i9-1:3+BITSIZE_proxy_in3*i9] : (sel_STORE[i9] ? in3[BITSIZE_in3+BITSIZE_in3*i9-1:3+BITSIZE_in3*i9] : S_data_ram_size[BITSIZE_S_data_ram_size+BITSIZE_S_data_ram_size*i9-1:3+BITSIZE_S_data_ram_size*i9]);
        assign conv_out[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = CONV(conv_in[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus]);
        assign be[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = conv_out[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] << byte_offset[(i9+1)*nbits_byte_offset-1:i9*nbits_byte_offset];
      end
      else
      begin
        assign conv_in[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = proxy_sel_STORE[i9] ? proxy_in3[BITSIZE_proxy_in3+BITSIZE_proxy_in3*i9-1:3+BITSIZE_proxy_in3*i9] : in3[BITSIZE_in3+BITSIZE_in3*i9-1:3+BITSIZE_in3*i9];
        assign conv_out[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = CONV(conv_in[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus]);
        assign be[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = conv_out[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] << byte_offset[(i9+1)*nbits_byte_offset-1:i9*nbits_byte_offset];
      end
    end
  endgenerate
  
  generate
    for (i9=0; i9<max_n_writes; i9=i9+1)
    begin : L9_swapped
      for (i10=0; i10<n_byte_on_databus/2; i10=i10+1)
      begin  : byte_enable_swapped
        assign be_swapped[i10+i9*n_byte_on_databus] = !relative_addr[nbits_byte_offset+i9*nbit_addr-1] ? be[i10+i9*n_byte_on_databus] : be[i10+i9*n_byte_on_databus+n_byte_on_databus/2];
        assign be_swapped[i10+i9*n_byte_on_databus+n_byte_on_databus/2] =  !relative_addr[nbits_byte_offset+i9*nbit_addr-1] ? be[i10+i9*n_byte_on_databus+n_byte_on_databus/2] : be[i10+i9*n_byte_on_databus];
      end
    end
  endgenerate
    
  generate
  genvar i13;
    for (i13=0; i13<PORTSIZE_S_Wdata_ram; i13=i13+1)
    begin : L13
      if (BITSIZE_S_Wdata_ram < memory_bitsize)
        assign S_Wdata_ram_int[memory_bitsize*(i13+1)-1:memory_bitsize*i13] = {{memory_bitsize-BITSIZE_S_Wdata_ram{1'b0}}, S_Wdata_ram[(i13+1)*BITSIZE_S_Wdata_ram-1:BITSIZE_S_Wdata_ram*i13]};
      else
        assign S_Wdata_ram_int[memory_bitsize*(i13+1)-1:memory_bitsize*i13] = S_Wdata_ram[memory_bitsize+BITSIZE_S_Wdata_ram*i13-1:BITSIZE_S_Wdata_ram*i13];
    end
  endgenerate
  
  generate
  genvar i14;
    for (i14=0; i14<max_n_writes; i14=i14+1)
    begin : L14
      if(PRIVATE_MEMORY==0 && i14 < PORTSIZE_S_Wdata_ram)
        assign din_value_aggregated[(i14+1)*memory_bitsize-1:i14*memory_bitsize] = proxy_sel_STORE[i14] ? proxy_in1[(i14+1)*BITSIZE_proxy_in1-1:i14*BITSIZE_proxy_in1] << byte_offset[(i14+1)*nbits_byte_offset-1:i14*nbits_byte_offset]*8 : (sel_STORE[i14] ? in1[(i14+1)*BITSIZE_in1-1:i14*BITSIZE_in1] << byte_offset[(i14+1)*nbits_byte_offset-1:i14*nbits_byte_offset]*8 : S_Wdata_ram_int[memory_bitsize*(i14+1)-1:memory_bitsize*i14] << byte_offset[(i14+1)*nbits_byte_offset-1:i14*nbits_byte_offset]*8);
      else
        assign din_value_aggregated[(i14+1)*memory_bitsize-1:i14*memory_bitsize] = proxy_sel_STORE[i14] ? proxy_in1[(i14+1)*BITSIZE_proxy_in1-1:i14*BITSIZE_proxy_in1] << byte_offset[(i14+1)*nbits_byte_offset-1:i14*nbits_byte_offset]*8 : in1[(i14+1)*BITSIZE_in1-1:i14*BITSIZE_in1] << byte_offset[(i14+1)*nbits_byte_offset-1:i14*nbits_byte_offset]*8;
    end
  endgenerate
  
  generate
    for (i14=0; i14<max_n_writes; i14=i14+1)
    begin : L14_swapped
      assign din_value_aggregated_swapped[(i14)*memory_bitsize+memory_bitsize/2-1:i14*memory_bitsize] = !relative_addr[nbits_byte_offset+i14*nbit_addr-1] ? din_value_aggregated[(i14)*memory_bitsize+memory_bitsize/2-1:i14*memory_bitsize] : din_value_aggregated[(i14+1)*memory_bitsize-1:i14*memory_bitsize+memory_bitsize/2];
      assign din_value_aggregated_swapped[(i14+1)*memory_bitsize-1:i14*memory_bitsize+memory_bitsize/2] = !relative_addr[nbits_byte_offset+i14*nbit_addr-1] ?  din_value_aggregated[(i14+1)*memory_bitsize-1:i14*memory_bitsize+memory_bitsize/2] : din_value_aggregated[(i14)*memory_bitsize+memory_bitsize/2-1:i14*memory_bitsize];
    end
  endgenerate
  
  generate
  genvar i15;
    for (i15=0; i15<max_n_reads; i15=i15+1)
    begin : L15
      assign out1_shifted[(i15+1)*memory_bitsize-1:i15*memory_bitsize] = dout[(i15+1)*memory_bitsize-1:i15*memory_bitsize] >> delayed_byte_offset[(i15+1)*nbits_byte_offset-1:i15*nbits_byte_offset]*8;
    end
  endgenerate
  
  generate
  genvar i20;
    for (i20=0; i20<max_n_reads; i20=i20+1)
    begin : L20
      assign out1[(i20+1)*BITSIZE_out1-1:i20*BITSIZE_out1] = out1_shifted[i20*memory_bitsize+BITSIZE_out1-1:i20*memory_bitsize];
      assign proxy_out1[(i20+1)*BITSIZE_proxy_out1-1:i20*BITSIZE_proxy_out1] = out1_shifted[i20*memory_bitsize+BITSIZE_proxy_out1-1:i20*memory_bitsize];
    end
  endgenerate
  
  generate
  genvar i16;
    for (i16=0; i16<PORTSIZE_S_oe_ram; i16=i16+1)
    begin : L16
      always @(posedge clock )
      begin
        if(reset == 1'b0)
          begin
            oe_ram_cs_delayed[i16] <= 1'b0;
            if(HIGH_LATENCY != 0) oe_ram_cs_delayed_registered[i16] <= 1'b0;
            if(HIGH_LATENCY == 2) oe_ram_cs_delayed_registered1[i16] <= 1'b0;
          end
        else
          if(HIGH_LATENCY == 0)
          begin
            oe_ram_cs_delayed[i16] <= oe_ram_cs[i16] & (!oe_ram_cs_delayed[i16] | BUS_PIPELINED);
          end
          else if(HIGH_LATENCY == 1)
          begin
            oe_ram_cs_delayed_registered[i16] <= oe_ram_cs[i16] & ((!oe_ram_cs_delayed_registered[i16] & !oe_ram_cs_delayed[i16]) | BUS_PIPELINED);
            oe_ram_cs_delayed[i16] <= oe_ram_cs_delayed_registered[i16];
          end
          else
          begin
            oe_ram_cs_delayed_registered1[i16] <= oe_ram_cs[i16] & ((!oe_ram_cs_delayed_registered1[i16] & !oe_ram_cs_delayed_registered[i16] & !oe_ram_cs_delayed[i16]) | BUS_PIPELINED);
            oe_ram_cs_delayed_registered[i16] <= oe_ram_cs_delayed_registered1[i16];
            oe_ram_cs_delayed[i16] <= oe_ram_cs_delayed_registered[i16];
          end
        end
      end
  endgenerate
  
  always @(posedge clock)
  begin
    if(HIGH_LATENCY == 0)
      delayed_byte_offset <= byte_offset[nbits_byte_offset*max_n_reads-1:0];
    else if(HIGH_LATENCY == 1)
    begin
      delayed_byte_offset_registered <= byte_offset[nbits_byte_offset*max_n_reads-1:0];
      delayed_byte_offset <= delayed_byte_offset_registered;
    end
    else
    begin
      delayed_byte_offset_registered1 <= byte_offset[nbits_byte_offset*max_n_reads-1:0];
      delayed_byte_offset_registered <= delayed_byte_offset_registered1;
      delayed_byte_offset <= delayed_byte_offset_registered;
    end
  end
  
  
  generate
  genvar i17;
    for (i17=0; i17<PORTSIZE_S_we_ram; i17=i17+1)
    begin : L17
      always @(posedge clock )
      begin
        if(reset == 1'b0)
          we_ram_cs_delayed[i17] <= 1'b0;
        else
          we_ram_cs_delayed[i17] <= we_ram_cs[i17] & !we_ram_cs_delayed[i17];
      end
    end
  endgenerate
  
  generate
  genvar i18;
    for (i18=0; i18<PORTSIZE_Sout_Rdata_ram; i18=i18+1)
    begin : L18
      if(PRIVATE_MEMORY==1)
        assign Sout_Rdata_ram[(i18+1)*BITSIZE_Sout_Rdata_ram-1:i18*BITSIZE_Sout_Rdata_ram] = Sin_Rdata_ram[(i18+1)*BITSIZE_Sin_Rdata_ram-1:i18*BITSIZE_Sin_Rdata_ram];
      else if (BITSIZE_Sout_Rdata_ram <= memory_bitsize)
        assign Sout_Rdata_ram[(i18+1)*BITSIZE_Sout_Rdata_ram-1:i18*BITSIZE_Sout_Rdata_ram] = oe_ram_cs_delayed[i18] ? out1_shifted[BITSIZE_Sout_Rdata_ram+i18*memory_bitsize-1:i18*memory_bitsize] : Sin_Rdata_ram[(i18+1)*BITSIZE_Sin_Rdata_ram-1:i18*BITSIZE_Sin_Rdata_ram];
      else
        assign Sout_Rdata_ram[(i18+1)*BITSIZE_Sout_Rdata_ram-1:i18*BITSIZE_Sout_Rdata_ram] = oe_ram_cs_delayed[i18] ? {{BITSIZE_S_Wdata_ram-memory_bitsize{1'b0}}, out1_shifted[(i18+1)*memory_bitsize-1:i18*memory_bitsize]} : Sin_Rdata_ram[(i18+1)*BITSIZE_Sin_Rdata_ram-1:i18*BITSIZE_Sin_Rdata_ram];
    end
  endgenerate
  
  generate
  genvar i19;
    for (i19=0; i19<PORTSIZE_Sout_DataRdy; i19=i19+1)
    begin : L19
      if(PRIVATE_MEMORY==0)
        assign Sout_DataRdy[i19] = (i19 < PORTSIZE_S_oe_ram && oe_ram_cs_delayed[i19]) | Sin_DataRdy[i19] | (i19 < PORTSIZE_S_we_ram && we_ram_cs_delayed[i19]);
      else
        assign Sout_DataRdy[i19] = Sin_DataRdy[i19];
    end
  endgenerate
  
  generate
  genvar i21;
    for (i21=0; i21<PORTSIZE_bram_write; i21=i21+1)
    begin : L21
      if(i21 < PORTSIZE_S_we_ram)
        assign bram_write[i21] = (sel_STORE[i21] || proxy_sel_STORE[i21] || we_ram_cs[i21]);
      else
        assign bram_write[i21] = (sel_STORE[i21] || proxy_sel_STORE[i21]);
    end
    endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module BRAM_MEMORY_CORE_SMALL(clock,
  bram_write0,
  bram_write1,
  memory_addr_a,
  memory_addr_b,
  din_value_aggregated,
  be,
  dout_a,
  dout_b);
  parameter BITSIZE_dout_a=1,
    BITSIZE_dout_b=1,
    BITSIZE_memory_addr_a=1,
    BITSIZE_memory_addr_b=1,
    BITSIZE_din_value_aggregated=1,
    BITSIZE_be=1,
    MEMORY_INIT_file="array.mem",
    n_byte_on_databus=4,
    n_mem_elements=4,
    n_bytes=4,
    HIGH_LATENCY=0;
  // IN
  input clock;
  input bram_write0;
  input bram_write1;
  input [BITSIZE_memory_addr_a-1:0] memory_addr_a;
  input [BITSIZE_memory_addr_b-1:0] memory_addr_b;
  input [BITSIZE_din_value_aggregated-1:0] din_value_aggregated;
  input [BITSIZE_be-1:0] be;
  // OUT
  output [BITSIZE_dout_a-1:0] dout_a;
  output [BITSIZE_dout_b-1:0] dout_b;
  
  reg bram_write01 =0;
  reg bram_write11 =0;
  reg [BITSIZE_memory_addr_a-1:0] memory_addr_a1 =0;
  reg [BITSIZE_memory_addr_b-1:0] memory_addr_b1 =0;
  reg [BITSIZE_be-1:0] be1 =0;
  reg [BITSIZE_din_value_aggregated-1:0] din_value_aggregated1 =0;
  reg [(n_byte_on_databus)*8-1:0] dout_a_tmp =0;
  reg [(n_byte_on_databus)*8-1:0] dout_b_tmp =0;
  reg [(n_byte_on_databus)*8-1:0] dout_a_registered =0;
  reg [(n_byte_on_databus)*8-1:0] dout_b_registered =0;
  reg [(n_byte_on_databus)*8-1:0] memory [0:n_mem_elements-1]/* synthesis syn_ramstyle = "no_rw_check" */ ;
  
  generate
    if(HIGH_LATENCY==2)
    begin
      always @ (posedge clock)
      begin
         memory_addr_a1 <= memory_addr_a;
         memory_addr_b1 <= memory_addr_b;
         bram_write01 <= bram_write0;
         bram_write11 <= bram_write1;
         be1 <= be;
         din_value_aggregated1 <= din_value_aggregated;
      end
    end
  endgenerate
  
  assign dout_a = dout_a_tmp;
  assign dout_b = dout_b_tmp;
  initial
  begin
    $readmemb(MEMORY_INIT_file, memory, 0, n_mem_elements-1);
  end
  
  always @(posedge clock)
  begin
    if(HIGH_LATENCY == 0||HIGH_LATENCY == 1)
    begin
      if (bram_write0)
      begin : L11_write
        integer i11;
        for (i11=0; i11<n_byte_on_databus; i11=i11+1)
        begin
          if(be[i11])
            memory[memory_addr_a][i11*8+:8] <= din_value_aggregated[i11*8+:8];
        end
      end
    end
    else
    begin
      if (bram_write01)
      begin : L11_write1
        integer i11;
        for (i11=0; i11<n_byte_on_databus; i11=i11+1)
        begin
          if(be1[i11])
            memory[memory_addr_a1][i11*8+:8] <= din_value_aggregated1[i11*8+:8];
        end
      end
    end
    if(HIGH_LATENCY == 0)
      dout_a_tmp <= memory[memory_addr_a];
    else if(HIGH_LATENCY == 1)
    begin
      dout_a_registered <= memory[memory_addr_a];
      dout_a_tmp <= dout_a_registered;
    end
    else
    begin
      dout_a_registered <= memory[memory_addr_a1];
      dout_a_tmp <= dout_a_registered;
    end
    if(HIGH_LATENCY == 0||HIGH_LATENCY == 1)
    begin
      if (bram_write1)
      begin : L22_write
        integer i22;
        for (i22=0; i22<n_byte_on_databus; i22=i22+1)
        begin
          if(be[i22+n_byte_on_databus])
            memory[memory_addr_b][i22*8+:8] <= din_value_aggregated[(i22+n_byte_on_databus)*8+:8];
        end
      end
    end
    else
    begin
      if (bram_write11)
      begin : L22_write1
        integer i22;
        for (i22=0; i22<n_byte_on_databus; i22=i22+1)
        begin
          if(be1[i22+n_byte_on_databus])
            memory[memory_addr_b1][i22*8+:8] <= din_value_aggregated1[(i22+n_byte_on_databus)*8+:8];
        end
      end
    end
    if(HIGH_LATENCY == 0)
      dout_b_tmp <= memory[memory_addr_b];
    else if(HIGH_LATENCY == 1)
    begin
      dout_b_registered <= memory[memory_addr_b];
      dout_b_tmp <= dout_b_registered;
    end
    else
    begin
      dout_b_registered <= memory[memory_addr_b1];
      dout_b_tmp <= dout_b_registered;
    end
  end

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module TRUE_DUAL_PORT_BYTE_ENABLING_RAM(clock,
  bram_write0,
  bram_write1,
  memory_addr_a,
  memory_addr_b,
  din_value_aggregated,
  be,
  dout_a,
  dout_b);
  parameter BITSIZE_dout_a=1,
    BITSIZE_dout_b=1,
    BITSIZE_memory_addr_a=1,
    BITSIZE_memory_addr_b=1,
    BITSIZE_din_value_aggregated=1,
    BITSIZE_be=1,
    MEMORY_INIT_file="array.mem",
    BRAM_BITSIZE=32,
    n_byte_on_databus=4,
    n_mem_elements=4,
    HIGH_LATENCY=0;
  // IN
  input clock;
  input bram_write0;
  input bram_write1;
  input [BITSIZE_memory_addr_a-1:0] memory_addr_a;
  input [BITSIZE_memory_addr_b-1:0] memory_addr_b;
  input [BITSIZE_din_value_aggregated-1:0] din_value_aggregated;
  input [BITSIZE_be-1:0] be;
  // OUT
  output [BITSIZE_dout_a-1:0] dout_a;
  output [BITSIZE_dout_b-1:0] dout_b;
  
  wire [n_byte_on_databus-1:0] we_a;
  wire [n_byte_on_databus-1:0] we_b;
  reg [n_byte_on_databus-1:0] we_a1 =0;
  reg [n_byte_on_databus-1:0] we_b1 =0;
  reg [BITSIZE_din_value_aggregated-1:0] din_value_aggregated1 =0;
  
  reg [BITSIZE_dout_a-1:0] dout_a =0;
  reg [BITSIZE_dout_a-1:0] dout_a_registered =0;
  reg [BITSIZE_dout_b-1:0] dout_b =0;
  reg [BITSIZE_dout_b-1:0] dout_b_registered =0;
  reg [BITSIZE_memory_addr_a-1:0] memory_addr_a1 =0;
  reg [BITSIZE_memory_addr_b-1:0] memory_addr_b1 =0;
  reg [BRAM_BITSIZE-1:0] memory [0:n_mem_elements-1] /* synthesis syn_ramstyle = "no_rw_check" */;
  
  initial
  begin
    $readmemb(MEMORY_INIT_file, memory, 0, n_mem_elements-1);
  end
  
  always @(posedge clock)
  begin
    if(HIGH_LATENCY==0)
    begin
      dout_a <= memory[memory_addr_a];
    end
    else if(HIGH_LATENCY==1)
    begin
      dout_a_registered <= memory[memory_addr_a];
      dout_a <= dout_a_registered;
    end
    else
    begin
      memory_addr_a1 <= memory_addr_a;
      we_a1 <= we_a;
      din_value_aggregated1 <= din_value_aggregated;
      dout_a_registered <= memory[memory_addr_a1];
      dout_a <= dout_a_registered;
    end
  end
  
  generate
  genvar i11;
    for (i11=0; i11<n_byte_on_databus; i11=i11+1)
    begin : L11_write_a
      always @(posedge clock)
      begin
        if(HIGH_LATENCY==0||HIGH_LATENCY==1)
        begin
          if(we_a[i11])
            memory[memory_addr_a][(i11+1)*8-1:i11*8] <= din_value_aggregated[(i11+1)*8-1:i11*8];
        end
        else
        begin
          if(we_a1[i11])
            memory[memory_addr_a1][(i11+1)*8-1:i11*8] <= din_value_aggregated1[(i11+1)*8-1:i11*8];
        end
      end
    end
  endgenerate
  
    always @(posedge clock)
    begin
      if(HIGH_LATENCY==0)
      begin
        dout_b <= memory[memory_addr_b];
      end
      else if(HIGH_LATENCY==1)
      begin
        dout_b_registered <= memory[memory_addr_b];
        dout_b <= dout_b_registered;
      end
      else
      begin
        memory_addr_b1 <= memory_addr_b;
        we_b1 <= we_b;
        dout_b_registered <= memory[memory_addr_b1];
        dout_b <= dout_b_registered;
      end
    end
    for (i11=0; i11<n_byte_on_databus; i11=i11+1)
    begin : L11_write_b
      always @(posedge clock)
      begin
        if(HIGH_LATENCY==0||HIGH_LATENCY==1)
        begin
          if(we_b[i11])
            memory[memory_addr_b][(i11+1)*8-1:i11*8] <= din_value_aggregated[(i11+1+n_byte_on_databus)*8-1:(i11+n_byte_on_databus)*8];
        end
        else
        begin
          if(we_b1[i11])
            memory[memory_addr_b1][(i11+1)*8-1:i11*8] <= din_value_aggregated1[(i11+1+n_byte_on_databus)*8-1:(i11+n_byte_on_databus)*8];
        end
      end
    end
  
  generate
  genvar i2_a;
    for (i2_a=0; i2_a<n_byte_on_databus; i2_a=i2_a+1)
    begin  : write_enable_a
      assign we_a[i2_a] = (bram_write0) && be[i2_a];
    end
  endgenerate
  
  generate
  genvar i2_b;
    for (i2_b=0; i2_b<n_byte_on_databus; i2_b=i2_b+1)
    begin  : write_enable_b
      assign we_b[i2_b] = (bram_write1) && be[i2_b+n_byte_on_databus];
    end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module BRAM_MEMORY_NN_CORE(clock,
  bram_write,
  memory_addr_a,
  din_value_aggregated_swapped,
  be_swapped,
  dout_a);
  parameter BITSIZE_bram_write=1, PORTSIZE_bram_write=2,
    BITSIZE_dout_a=1, PORTSIZE_dout_a=2,
    BITSIZE_memory_addr_a=1, PORTSIZE_memory_addr_a=2,
    BITSIZE_din_value_aggregated_swapped=1, PORTSIZE_din_value_aggregated_swapped=2,
    BITSIZE_be_swapped=1, PORTSIZE_be_swapped=2,
    MEMORY_INIT_file="array.mem",
    BRAM_BITSIZE=32,
    n_bytes=32,
    n_byte_on_databus=4,
    n_mem_elements=4,
    max_n_reads=2,
    max_n_writes=2,
    memory_offset=16,
    n_byte_on_databus_offset=2,
    HIGH_LATENCY=0;
  // IN
  input clock;
  input [PORTSIZE_bram_write-1:0] bram_write;
  input [(PORTSIZE_memory_addr_a*BITSIZE_memory_addr_a)+(-1):0] memory_addr_a;
  input [(PORTSIZE_din_value_aggregated_swapped*BITSIZE_din_value_aggregated_swapped)+(-1):0] din_value_aggregated_swapped;
  input [(PORTSIZE_be_swapped*BITSIZE_be_swapped)+(-1):0] be_swapped;
  // OUT
  output [(PORTSIZE_dout_a*BITSIZE_dout_a)+(-1):0] dout_a;
  
  generate
  if(n_mem_elements == 1)
  begin
    BRAM_MEMORY_CORE_SMALL #(.BITSIZE_memory_addr_a(BITSIZE_memory_addr_a), .BITSIZE_memory_addr_b(BITSIZE_memory_addr_a), .BITSIZE_din_value_aggregated((n_byte_on_databus)*8), .BITSIZE_be(n_byte_on_databus), .BITSIZE_dout_a((n_byte_on_databus/2)*8), .BITSIZE_dout_b((n_byte_on_databus/2)*8), .MEMORY_INIT_file(MEMORY_INIT_file), .n_byte_on_databus(n_byte_on_databus/2), .n_mem_elements(n_mem_elements), .n_bytes(n_bytes), .HIGH_LATENCY(HIGH_LATENCY)) BRAM_MEMORY_instance_small (.clock(clock), .bram_write0(bram_write[0]), .bram_write1(bram_write[1]), .memory_addr_a(memory_addr_a[BITSIZE_memory_addr_a-1:0]), .memory_addr_b(memory_addr_a[2*BITSIZE_memory_addr_a-1:BITSIZE_memory_addr_a]), .din_value_aggregated({din_value_aggregated_swapped[2*BRAM_BITSIZE+(n_byte_on_databus/2)*8+memory_offset-1:2*BRAM_BITSIZE+memory_offset],din_value_aggregated_swapped[(n_byte_on_databus/2)*8+memory_offset-1:memory_offset]}), .be({be_swapped[n_byte_on_databus+n_byte_on_databus/2+n_byte_on_databus_offset-1:n_byte_on_databus+n_byte_on_databus_offset],be_swapped[n_byte_on_databus/2+n_byte_on_databus_offset-1:n_byte_on_databus_offset]}), .dout_a(dout_a[BRAM_BITSIZE-1:0]), .dout_b(dout_a[2*BRAM_BITSIZE-1:BRAM_BITSIZE]));
  end
  else
  begin
    TRUE_DUAL_PORT_BYTE_ENABLING_RAM #(.BITSIZE_memory_addr_a(BITSIZE_memory_addr_a), .BITSIZE_memory_addr_b(BITSIZE_memory_addr_a), .BITSIZE_din_value_aggregated((n_byte_on_databus)*8), .BITSIZE_be(n_byte_on_databus), .BITSIZE_dout_a((n_byte_on_databus/2)*8), .BITSIZE_dout_b((n_byte_on_databus/2)*8), .MEMORY_INIT_file(MEMORY_INIT_file), .BRAM_BITSIZE(BRAM_BITSIZE), .n_byte_on_databus(n_byte_on_databus/2), .n_mem_elements(n_mem_elements), .HIGH_LATENCY(HIGH_LATENCY)) TRUE_DUAL_PORT_BYTE_ENABLING_RAM_instance (.clock(clock), .bram_write0(bram_write[0]), .bram_write1(bram_write[1]), .memory_addr_a(memory_addr_a[BITSIZE_memory_addr_a-1:0]), .memory_addr_b(memory_addr_a[2*BITSIZE_memory_addr_a-1:BITSIZE_memory_addr_a]), .din_value_aggregated({din_value_aggregated_swapped[2*BRAM_BITSIZE+(n_byte_on_databus/2)*8+memory_offset-1:2*BRAM_BITSIZE+memory_offset],din_value_aggregated_swapped[(n_byte_on_databus/2)*8+memory_offset-1:memory_offset]}), .be({be_swapped[n_byte_on_databus+n_byte_on_databus/2+n_byte_on_databus_offset-1:n_byte_on_databus+n_byte_on_databus_offset],be_swapped[n_byte_on_databus/2+n_byte_on_databus_offset-1:n_byte_on_databus_offset]}), .dout_a(dout_a[BRAM_BITSIZE-1:0]), .dout_b(dout_a[2*BRAM_BITSIZE-1:BRAM_BITSIZE]));
  end
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ARRAY_1D_STD_BRAM_NN_SP(clock,
  reset,
  in1,
  in2,
  in3,
  out1,
  sel_LOAD,
  sel_STORE,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  Sin_Rdata_ram,
  Sout_Rdata_ram,
  S_data_ram_size,
  Sin_DataRdy,
  Sout_DataRdy,
  proxy_in1,
  proxy_in2,
  proxy_in3,
  proxy_sel_LOAD,
  proxy_sel_STORE,
  proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2,
    BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2,
    BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2,
    BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2,
    BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2,
    BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2,
    BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2,
    BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2,
    MEMORY_INIT_file_a="array_a.mem",
    MEMORY_INIT_file_b="array_b.mem",
    n_elements=1,
    data_size=32,
    address_space_begin=0,
    address_space_rangesize=4,
    BUS_PIPELINED=1,
    BRAM_BITSIZE=32,
    PRIVATE_MEMORY=0,
    USE_SPARSE_MEMORY=1,
    HIGH_LATENCY=0,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2,
    BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  parameter n_bytes = (n_elements*data_size)/8;
  parameter memory_bitsize = 2*BRAM_BITSIZE;
  parameter n_byte_on_databus = memory_bitsize/8;
  parameter n_mem_elements = n_bytes/(n_byte_on_databus) + (n_bytes%(n_byte_on_databus) == 0 ? 0 : 1);
  `ifdef _SIM_HAVE_CLOG2
    parameter nbit_read_addr = n_mem_elements == 1 ? 1 : $clog2(n_mem_elements);
  `else
    parameter nbit_read_addr = n_mem_elements == 1 ? 1 : log2(n_mem_elements);
  `endif
  parameter max_n_writes = PORTSIZE_sel_STORE > PORTSIZE_S_we_ram ? PORTSIZE_sel_STORE : PORTSIZE_S_we_ram;
  parameter max_n_reads = PORTSIZE_sel_LOAD > PORTSIZE_S_oe_ram ? PORTSIZE_sel_LOAD : PORTSIZE_S_oe_ram;
  parameter max_n_rw = max_n_writes > max_n_reads ? max_n_writes : max_n_reads;
  
  wire [max_n_writes-1:0] bram_write;
  
  wire [nbit_read_addr*max_n_rw-1:0] memory_addr_a;
  wire [nbit_read_addr*max_n_rw-1:0] memory_addr_b;
  wire [n_byte_on_databus*max_n_writes-1:0] be_swapped;
  
  wire [memory_bitsize*max_n_writes-1:0] din_value_aggregated_swapped;
  wire [(memory_bitsize/2)*max_n_reads-1:0] dout_a;
  wire [(memory_bitsize/2)*max_n_reads-1:0] dout_b;
  
  
  BRAM_MEMORY_NN_CORE #(.PORTSIZE_bram_write(max_n_writes), .BITSIZE_bram_write(1), .BITSIZE_dout_a(memory_bitsize/2), .PORTSIZE_dout_a(max_n_reads), .BITSIZE_memory_addr_a(nbit_read_addr), .PORTSIZE_memory_addr_a(max_n_rw), .BITSIZE_din_value_aggregated_swapped(memory_bitsize), .PORTSIZE_din_value_aggregated_swapped(max_n_writes), .BITSIZE_be_swapped(n_byte_on_databus), .PORTSIZE_be_swapped(max_n_writes), .MEMORY_INIT_file(MEMORY_INIT_file_a), .BRAM_BITSIZE(BRAM_BITSIZE), .n_bytes(n_bytes), .n_byte_on_databus(n_byte_on_databus), .n_mem_elements(n_mem_elements), .max_n_reads(max_n_reads), .max_n_writes(max_n_writes), .memory_offset(0), .n_byte_on_databus_offset(0), .HIGH_LATENCY(HIGH_LATENCY)) BRAM_MEMORY_NN_instance_a(.clock(clock), .bram_write(bram_write), .memory_addr_a(memory_addr_a), .din_value_aggregated_swapped(din_value_aggregated_swapped), .be_swapped(be_swapped), .dout_a(dout_a));
  
  generate
    if (n_bytes > BRAM_BITSIZE/8)
    begin : SECOND_MEMORY
      BRAM_MEMORY_NN_CORE #(.PORTSIZE_bram_write(max_n_writes), .BITSIZE_bram_write(1), .BITSIZE_dout_a((memory_bitsize/2)), .PORTSIZE_dout_a(max_n_reads), .BITSIZE_memory_addr_a(nbit_read_addr), .PORTSIZE_memory_addr_a(max_n_rw), .BITSIZE_din_value_aggregated_swapped(memory_bitsize), .PORTSIZE_din_value_aggregated_swapped(max_n_writes), .BITSIZE_be_swapped(n_byte_on_databus), .PORTSIZE_be_swapped(max_n_writes), .MEMORY_INIT_file(MEMORY_INIT_file_b), .BRAM_BITSIZE(BRAM_BITSIZE), .n_bytes(n_bytes), .n_byte_on_databus(n_byte_on_databus), .n_mem_elements(n_mem_elements), .max_n_reads(max_n_reads), .max_n_writes(max_n_writes), .memory_offset(memory_bitsize/2), .n_byte_on_databus_offset(n_byte_on_databus/2), .HIGH_LATENCY(HIGH_LATENCY)) BRAM_MEMORY_NN_instance_b(.clock(clock), .bram_write(bram_write), .memory_addr_a(memory_addr_b), .din_value_aggregated_swapped(din_value_aggregated_swapped), .be_swapped(be_swapped), .dout_a(dout_b));
    end
  else
    assign dout_b = {(memory_bitsize/2)*max_n_reads{1'b0}};
  endgenerate
  
  ADDRESS_DECODING_LOGIC_NN #(.BITSIZE_in1(BITSIZE_in1), .PORTSIZE_in1(PORTSIZE_in1), .BITSIZE_in2(BITSIZE_in2), .PORTSIZE_in2(PORTSIZE_in2), .BITSIZE_in3(BITSIZE_in3), .PORTSIZE_in3(PORTSIZE_in3), .BITSIZE_sel_LOAD(BITSIZE_sel_LOAD), .PORTSIZE_sel_LOAD(PORTSIZE_sel_LOAD), .BITSIZE_sel_STORE(BITSIZE_sel_STORE), .PORTSIZE_sel_STORE(PORTSIZE_sel_STORE), .BITSIZE_out1(BITSIZE_out1), .PORTSIZE_out1(PORTSIZE_out1), .BITSIZE_S_oe_ram(BITSIZE_S_oe_ram), .PORTSIZE_S_oe_ram(PORTSIZE_S_oe_ram), .BITSIZE_S_we_ram(BITSIZE_S_we_ram), .PORTSIZE_S_we_ram(PORTSIZE_S_we_ram), .BITSIZE_Sin_DataRdy(BITSIZE_Sin_DataRdy), .PORTSIZE_Sin_DataRdy(PORTSIZE_Sin_DataRdy), .BITSIZE_Sout_DataRdy(BITSIZE_Sout_DataRdy), .PORTSIZE_Sout_DataRdy(PORTSIZE_Sout_DataRdy), .BITSIZE_S_addr_ram(BITSIZE_S_addr_ram), .PORTSIZE_S_addr_ram(PORTSIZE_S_addr_ram), .BITSIZE_S_Wdata_ram(BITSIZE_S_Wdata_ram), .PORTSIZE_S_Wdata_ram(PORTSIZE_S_Wdata_ram), .BITSIZE_Sin_Rdata_ram(BITSIZE_Sin_Rdata_ram), .PORTSIZE_Sin_Rdata_ram(PORTSIZE_Sin_Rdata_ram), .BITSIZE_Sout_Rdata_ram(BITSIZE_Sout_Rdata_ram), .PORTSIZE_Sout_Rdata_ram(PORTSIZE_Sout_Rdata_ram), .BITSIZE_S_data_ram_size(BITSIZE_S_data_ram_size), .PORTSIZE_S_data_ram_size(PORTSIZE_S_data_ram_size), .address_space_begin(address_space_begin), .address_space_rangesize(address_space_rangesize), .BUS_PIPELINED(BUS_PIPELINED), .BRAM_BITSIZE(BRAM_BITSIZE), .PRIVATE_MEMORY(PRIVATE_MEMORY), .USE_SPARSE_MEMORY(USE_SPARSE_MEMORY), .HIGH_LATENCY(HIGH_LATENCY), .BITSIZE_proxy_in1(BITSIZE_proxy_in1), .PORTSIZE_proxy_in1(PORTSIZE_proxy_in1), .BITSIZE_proxy_in2(BITSIZE_proxy_in2), .PORTSIZE_proxy_in2(PORTSIZE_proxy_in2), .BITSIZE_proxy_in3(BITSIZE_proxy_in3), .PORTSIZE_proxy_in3(PORTSIZE_proxy_in3), .BITSIZE_proxy_sel_LOAD(BITSIZE_proxy_sel_LOAD), .PORTSIZE_proxy_sel_LOAD(PORTSIZE_proxy_sel_LOAD), .BITSIZE_proxy_sel_STORE(BITSIZE_proxy_sel_STORE), .PORTSIZE_proxy_sel_STORE(PORTSIZE_proxy_sel_STORE), .BITSIZE_proxy_out1(BITSIZE_proxy_out1), .PORTSIZE_proxy_out1(PORTSIZE_proxy_out1), .BITSIZE_dout_a(memory_bitsize/2), .PORTSIZE_dout_a(max_n_reads), .BITSIZE_dout_b(memory_bitsize/2), .PORTSIZE_dout_b(max_n_reads), .BITSIZE_memory_addr_a(nbit_read_addr), .PORTSIZE_memory_addr_a(max_n_rw), .BITSIZE_memory_addr_b(nbit_read_addr), .PORTSIZE_memory_addr_b(max_n_rw), .BITSIZE_din_value_aggregated_swapped(memory_bitsize), .PORTSIZE_din_value_aggregated_swapped(max_n_writes), .BITSIZE_be_swapped(n_byte_on_databus), .PORTSIZE_be_swapped(max_n_writes), .BITSIZE_bram_write(1), .PORTSIZE_bram_write(max_n_writes), .nbit_read_addr(nbit_read_addr), .n_byte_on_databus(n_byte_on_databus), .n_mem_elements(n_mem_elements), .max_n_reads(max_n_reads), .max_n_writes(max_n_writes), .max_n_rw(max_n_rw)) ADDRESS_DECODING_LOGIC_NN_instance (.clock(clock), .reset(reset), .in1(in1), .in2(in2), .in3(in3), .out1(out1), .sel_LOAD(sel_LOAD), .sel_STORE(sel_STORE), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .Sin_Rdata_ram(Sin_Rdata_ram), .Sout_Rdata_ram(Sout_Rdata_ram), .S_data_ram_size(S_data_ram_size), .Sin_DataRdy(Sin_DataRdy), .Sout_DataRdy(Sout_DataRdy), .proxy_in1(proxy_in1), .proxy_in2(proxy_in2), .proxy_in3(proxy_in3), .proxy_sel_LOAD(proxy_sel_LOAD), .proxy_sel_STORE(proxy_sel_STORE), .proxy_out1(proxy_out1), .dout_a(dout_a), .dout_b(dout_b), .memory_addr_a(memory_addr_a), .memory_addr_b(memory_addr_b), .din_value_aggregated_swapped(din_value_aggregated_swapped), .be_swapped(be_swapped), .bram_write(bram_write));
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ARRAY_1D_STD_BRAM_NN(clock,
  reset,
  in1,
  in2,
  in3,
  in4,
  out1,
  sel_LOAD,
  sel_STORE,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  Sin_Rdata_ram,
  Sout_Rdata_ram,
  S_data_ram_size,
  Sin_DataRdy,
  Sout_DataRdy,
  proxy_in1,
  proxy_in2,
  proxy_in3,
  proxy_sel_LOAD,
  proxy_sel_STORE,
  proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_in4=1, PORTSIZE_in4=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2,
    BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2,
    BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2,
    BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2,
    BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2,
    BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2,
    BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2,
    BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2,
    MEMORY_INIT_file_a="array_a.mem",
    MEMORY_INIT_file_b="array_b.mem",
    n_elements=1,
    data_size=32,
    address_space_begin=0,
    address_space_rangesize=4,
    BUS_PIPELINED=1,
    BRAM_BITSIZE=32,
    PRIVATE_MEMORY=0,
    USE_SPARSE_MEMORY=1,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2,
    BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  ARRAY_1D_STD_BRAM_NN_SP #(.BITSIZE_in1(BITSIZE_in1), .PORTSIZE_in1(PORTSIZE_in1), .BITSIZE_in2(BITSIZE_in2), .PORTSIZE_in2(PORTSIZE_in2), .BITSIZE_in3(BITSIZE_in3), .PORTSIZE_in3(PORTSIZE_in3), .BITSIZE_sel_LOAD(BITSIZE_sel_LOAD), .PORTSIZE_sel_LOAD(PORTSIZE_sel_LOAD), .BITSIZE_sel_STORE(BITSIZE_sel_STORE), .PORTSIZE_sel_STORE(PORTSIZE_sel_STORE), .BITSIZE_S_oe_ram(BITSIZE_S_oe_ram), .PORTSIZE_S_oe_ram(PORTSIZE_S_oe_ram), .BITSIZE_S_we_ram(BITSIZE_S_we_ram), .PORTSIZE_S_we_ram(PORTSIZE_S_we_ram), .BITSIZE_out1(BITSIZE_out1), .PORTSIZE_out1(PORTSIZE_out1), .BITSIZE_S_addr_ram(BITSIZE_S_addr_ram), .PORTSIZE_S_addr_ram(PORTSIZE_S_addr_ram), .BITSIZE_S_Wdata_ram(BITSIZE_S_Wdata_ram), .PORTSIZE_S_Wdata_ram(PORTSIZE_S_Wdata_ram), .BITSIZE_Sin_Rdata_ram(BITSIZE_Sin_Rdata_ram), .PORTSIZE_Sin_Rdata_ram(PORTSIZE_Sin_Rdata_ram), .BITSIZE_Sout_Rdata_ram(BITSIZE_Sout_Rdata_ram), .PORTSIZE_Sout_Rdata_ram(PORTSIZE_Sout_Rdata_ram), .BITSIZE_S_data_ram_size(BITSIZE_S_data_ram_size), .PORTSIZE_S_data_ram_size(PORTSIZE_S_data_ram_size), .BITSIZE_Sin_DataRdy(BITSIZE_Sin_DataRdy), .PORTSIZE_Sin_DataRdy(PORTSIZE_Sin_DataRdy), .BITSIZE_Sout_DataRdy(BITSIZE_Sout_DataRdy), .PORTSIZE_Sout_DataRdy(PORTSIZE_Sout_DataRdy), .MEMORY_INIT_file_a(MEMORY_INIT_file_a), .MEMORY_INIT_file_b(MEMORY_INIT_file_b), .n_elements(n_elements), .data_size(data_size), .address_space_begin(address_space_begin), .address_space_rangesize(address_space_rangesize), .BUS_PIPELINED(BUS_PIPELINED), .BRAM_BITSIZE(BRAM_BITSIZE), .PRIVATE_MEMORY(PRIVATE_MEMORY), .USE_SPARSE_MEMORY(USE_SPARSE_MEMORY), .BITSIZE_proxy_in1(BITSIZE_proxy_in1), .PORTSIZE_proxy_in1(PORTSIZE_proxy_in1), .BITSIZE_proxy_in2(BITSIZE_proxy_in2), .PORTSIZE_proxy_in2(PORTSIZE_proxy_in2), .BITSIZE_proxy_in3(BITSIZE_proxy_in3), .PORTSIZE_proxy_in3(PORTSIZE_proxy_in3), .BITSIZE_proxy_sel_LOAD(BITSIZE_proxy_sel_LOAD), .PORTSIZE_proxy_sel_LOAD(PORTSIZE_proxy_sel_LOAD), .BITSIZE_proxy_sel_STORE(BITSIZE_proxy_sel_STORE), .PORTSIZE_proxy_sel_STORE(PORTSIZE_proxy_sel_STORE), .BITSIZE_proxy_out1(BITSIZE_proxy_out1), .PORTSIZE_proxy_out1(PORTSIZE_proxy_out1), .HIGH_LATENCY(0)) ARRAY_1D_STD_BRAM_NN_instance (.out1(out1), .Sout_Rdata_ram(Sout_Rdata_ram), .Sout_DataRdy(Sout_DataRdy), .proxy_out1(proxy_out1), .clock(clock), .reset(reset), .in1(in1), .in2(in2), .in3(in3), .sel_LOAD(sel_LOAD & in4), .sel_STORE(sel_STORE & in4), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .Sin_Rdata_ram(Sin_Rdata_ram), .S_data_ram_size(S_data_ram_size), .Sin_DataRdy(Sin_DataRdy), .proxy_in1(proxy_in1), .proxy_in2(proxy_in2), .proxy_in3(proxy_in3), .proxy_sel_LOAD(proxy_sel_LOAD), .proxy_sel_STORE(proxy_sel_STORE));
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2013-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module DPROXY_CTRLN(in1,
  in2,
  in3,
  in4,
  sel_LOAD,
  sel_STORE,
  out1,
  proxy_in1,
  proxy_in2,
  proxy_in3,
  proxy_sel_LOAD,
  proxy_sel_STORE,
  proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_in4=1, PORTSIZE_in4=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2,
    BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  output [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  output [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  output [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  output [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  generate
  genvar i0;
  for (i0=0; i0<PORTSIZE_out1; i0=i0+1)
    begin : L0
      assign out1[(i0+1)*BITSIZE_out1-1:i0*BITSIZE_out1] = proxy_out1[(i0+1)*BITSIZE_proxy_out1-1:i0*BITSIZE_proxy_out1];
    end
  endgenerate
  generate
  genvar i1;
  for (i1=0; i1<PORTSIZE_in1; i1=i1+1)
    begin : L1
      assign proxy_in1[(i1+1)*BITSIZE_proxy_in1-1:i1*BITSIZE_proxy_in1] = int_sel_STORE[i1] ? in1[(i1+1)*BITSIZE_in1-1:i1*BITSIZE_in1] : 0;
    end
  endgenerate
  generate
  genvar i2;
  for (i2=0; i2<PORTSIZE_in2; i2=i2+1)
    begin : L2
      assign proxy_in2[(i2+1)*BITSIZE_proxy_in2-1:i2*BITSIZE_proxy_in2] = int_sel_LOAD[i2]|int_sel_STORE[i2] ? in2[(i2+1)*BITSIZE_in2-1:i2*BITSIZE_in2] : 0;
    end
  endgenerate
  generate
  genvar i3;
  for (i3=0; i3<PORTSIZE_in3; i3=i3+1)
    begin : L3
      assign proxy_in3[(i3+1)*BITSIZE_proxy_in3-1:i3*BITSIZE_proxy_in3] = int_sel_LOAD[i3]|int_sel_STORE[i3] ? in3[(i3+1)*BITSIZE_in3-1:i3*BITSIZE_in3] : 0;
    end
  endgenerate
  assign int_sel_LOAD = sel_LOAD & in4;
  assign int_sel_STORE = sel_STORE & in4;
  assign proxy_sel_LOAD = int_sel_LOAD;
  assign proxy_sel_STORE = int_sel_STORE;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module addr_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UUdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module read_cond_FU(in1,
  out1);
  parameter BITSIZE_in1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output out1;
  assign out1 = in1 != {BITSIZE_in1{1'b0}};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module BMEMORY_CTRLN(clock,
  in1,
  in2,
  in3,
  in4,
  sel_LOAD,
  sel_STORE,
  out1,
  Min_oe_ram,
  Mout_oe_ram,
  Min_we_ram,
  Mout_we_ram,
  Min_addr_ram,
  Mout_addr_ram,
  M_Rdata_ram,
  Min_Wdata_ram,
  Mout_Wdata_ram,
  Min_data_ram_size,
  Mout_data_ram_size,
  M_DataRdy);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_in4=1, PORTSIZE_in4=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_Min_oe_ram=1, PORTSIZE_Min_oe_ram=2,
    BITSIZE_Min_we_ram=1, PORTSIZE_Min_we_ram=2,
    BITSIZE_Mout_oe_ram=1, PORTSIZE_Mout_oe_ram=2,
    BITSIZE_Mout_we_ram=1, PORTSIZE_Mout_we_ram=2,
    BITSIZE_M_DataRdy=1, PORTSIZE_M_DataRdy=2,
    BITSIZE_Min_addr_ram=1, PORTSIZE_Min_addr_ram=2,
    BITSIZE_Mout_addr_ram=1, PORTSIZE_Mout_addr_ram=2,
    BITSIZE_M_Rdata_ram=8, PORTSIZE_M_Rdata_ram=2,
    BITSIZE_Min_Wdata_ram=8, PORTSIZE_Min_Wdata_ram=2,
    BITSIZE_Mout_Wdata_ram=8, PORTSIZE_Mout_Wdata_ram=2,
    BITSIZE_Min_data_ram_size=1, PORTSIZE_Min_data_ram_size=2,
    BITSIZE_Mout_data_ram_size=1, PORTSIZE_Mout_data_ram_size=2;
  // IN
  input clock;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_Min_oe_ram-1:0] Min_oe_ram;
  input [PORTSIZE_Min_we_ram-1:0] Min_we_ram;
  input [(PORTSIZE_Min_addr_ram*BITSIZE_Min_addr_ram)+(-1):0] Min_addr_ram;
  input [(PORTSIZE_M_Rdata_ram*BITSIZE_M_Rdata_ram)+(-1):0] M_Rdata_ram;
  input [(PORTSIZE_Min_Wdata_ram*BITSIZE_Min_Wdata_ram)+(-1):0] Min_Wdata_ram;
  input [(PORTSIZE_Min_data_ram_size*BITSIZE_Min_data_ram_size)+(-1):0] Min_data_ram_size;
  input [PORTSIZE_M_DataRdy-1:0] M_DataRdy;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [PORTSIZE_Mout_oe_ram-1:0] Mout_oe_ram;
  output [PORTSIZE_Mout_we_ram-1:0] Mout_we_ram;
  output [(PORTSIZE_Mout_addr_ram*BITSIZE_Mout_addr_ram)+(-1):0] Mout_addr_ram;
  output [(PORTSIZE_Mout_Wdata_ram*BITSIZE_Mout_Wdata_ram)+(-1):0] Mout_Wdata_ram;
  output [(PORTSIZE_Mout_data_ram_size*BITSIZE_Mout_data_ram_size)+(-1):0] Mout_data_ram_size;
  
  parameter max_n_writes = PORTSIZE_sel_STORE > PORTSIZE_Mout_we_ram ? PORTSIZE_sel_STORE : PORTSIZE_Mout_we_ram;
  parameter max_n_reads = PORTSIZE_sel_LOAD > PORTSIZE_Mout_oe_ram ? PORTSIZE_sel_STORE : PORTSIZE_Mout_oe_ram;
  parameter max_n_rw = max_n_writes > max_n_reads ? max_n_writes : max_n_reads;
  wire  [(PORTSIZE_in2*BITSIZE_in2)-1:0] tmp_addr;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  assign int_sel_LOAD = sel_LOAD & in4;
  assign int_sel_STORE = sel_STORE & in4;
  assign tmp_addr = in2;
  generate
  genvar i;
    for (i=0; i<max_n_rw; i=i+1)
    begin : L0
      assign Mout_addr_ram[(i+1)*BITSIZE_Mout_addr_ram-1:i*BITSIZE_Mout_addr_ram] = ((i < PORTSIZE_sel_LOAD && int_sel_LOAD[i]) || (i < PORTSIZE_sel_STORE && int_sel_STORE[i])) ? (tmp_addr[(i+1)*BITSIZE_in2-1:i*BITSIZE_in2]) : Min_addr_ram[(i+1)*BITSIZE_Min_addr_ram-1:i*BITSIZE_Min_addr_ram];
    end
    endgenerate
  assign Mout_oe_ram = int_sel_LOAD | Min_oe_ram;
  assign Mout_we_ram = int_sel_STORE | Min_we_ram;
  generate
    for (i=0; i<max_n_reads; i=i+1)
    begin : L1
      assign out1[(i+1)*BITSIZE_out1-1:i*BITSIZE_out1] = M_Rdata_ram[i*BITSIZE_M_Rdata_ram+BITSIZE_out1-1:i*BITSIZE_M_Rdata_ram];
  end
  endgenerate
  generate
    for (i=0; i<max_n_rw; i=i+1)
    begin : L2
      assign Mout_Wdata_ram[(i+1)*BITSIZE_Mout_Wdata_ram-1:i*BITSIZE_Mout_Wdata_ram] = int_sel_STORE[i] ? in1[(i+1)*BITSIZE_in1-1:i*BITSIZE_in1] : Min_Wdata_ram[(i+1)*BITSIZE_Min_Wdata_ram-1:i*BITSIZE_Min_Wdata_ram];
  end
  endgenerate
  generate
    for (i=0; i<max_n_rw; i=i+1)
    begin : L3
      assign Mout_data_ram_size[(i+1)*BITSIZE_Mout_data_ram_size-1:i*BITSIZE_Mout_data_ram_size] = ((i < PORTSIZE_sel_LOAD && int_sel_LOAD[i]) || (i < PORTSIZE_sel_STORE && int_sel_STORE[i])) ? (in3[(i+1)*BITSIZE_in3-1:i*BITSIZE_in3]) : Min_data_ram_size[(i+1)*BITSIZE_Min_data_ram_size-1:i*BITSIZE_Min_data_ram_size];
    end
    endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_eq_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 == in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_ge_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 >= in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_lshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 << in2[arg2_bitsize-1:0];
    else
      assign out1 = in1 << in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_lt_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 < in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_pointer_plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    LSB_PARAMETER=-1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  wire [BITSIZE_out1-1:0] in1_tmp;
  wire [BITSIZE_out1-1:0] in2_tmp;
  assign in1_tmp = in1;
  assign in2_tmp = in2;generate if (BITSIZE_out1 > LSB_PARAMETER) assign out1[BITSIZE_out1-1:LSB_PARAMETER] = (in1_tmp[BITSIZE_out1-1:LSB_PARAMETER] + in2_tmp[BITSIZE_out1-1:LSB_PARAMETER]); else assign out1 = 0; endgenerate
  generate if (LSB_PARAMETER != 0 && BITSIZE_out1 > LSB_PARAMETER) assign out1[LSB_PARAMETER-1:0] = 0; endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2013-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bus_merger(in1,
  out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  function [BITSIZE_out1-1:0] merge;
    input [BITSIZE_in1*PORTSIZE_in1-1:0] m;
    reg [BITSIZE_out1-1:0] res;
    integer i1;
  begin
    res={BITSIZE_in1{1'b0}};
    for(i1 = 0; i1 < PORTSIZE_in1; i1 = i1 + 1)
    begin
      res = res | m[i1*BITSIZE_in1 +:BITSIZE_in1];
    end
    merge = res;
  end
  endfunction
  
  assign out1 = merge(in1);
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module join_signal(in1,
  out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  generate
  genvar i1;
  for (i1=0; i1<PORTSIZE_in1; i1=i1+1)
    begin : L1
      assign out1[(i1+1)*(BITSIZE_out1/PORTSIZE_in1)-1:i1*(BITSIZE_out1/PORTSIZE_in1)] = in1[(i1+1)*BITSIZE_in1-1:i1*BITSIZE_in1];
    end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module split_signal(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1, PORTSIZE_out1=2;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ASSIGN_VECTOR_BOOL_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module MUX_GATE(sel,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input sel;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = sel ? in1 : in2;
endmodule

// Datapath RTL description for __internal_free
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___internal_free(clock,
  reset,
  in_port_ap,
  M_Rdata_ram,
  M_DataRdy,
  proxy_out1_792,
  proxy_in1_792,
  proxy_in2_792,
  proxy_in3_792,
  proxy_sel_LOAD_792,
  proxy_sel_STORE_792,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size,
  fuselector_BMEMORY_CTRLN_41_i0_LOAD,
  fuselector_BMEMORY_CTRLN_41_i0_STORE,
  fuselector_BMEMORY_CTRLN_41_i1_LOAD,
  fuselector_BMEMORY_CTRLN_41_i1_STORE,
  fuselector_DPROXY_CTRLN_0_i0_LOAD,
  fuselector_DPROXY_CTRLN_0_i0_STORE,
  selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2,
  selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0,
  selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0,
  selector_MUX_50_reg_0_0_0_0,
  selector_MUX_55_reg_13_0_0_0,
  selector_MUX_55_reg_13_0_0_1,
  selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0,
  selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1,
  selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2,
  selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0,
  selector_MUX_61_reg_19_0_0_0,
  selector_MUX_66_reg_6_0_0_0,
  selector_MUX_66_reg_6_0_0_1,
  selector_MUX_66_reg_6_0_1_0,
  selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION___internal_free_737_774,
  OUT_CONDITION___internal_free_737_805,
  OUT_CONDITION___internal_free_737_846,
  OUT_CONDITION___internal_free_737_848,
  OUT_CONDITION___internal_free_737_850,
  OUT_CONDITION___internal_free_737_854,
  OUT_CONDITION___internal_free_737_870,
  OUT_CONDITION___internal_free_737_909);
  parameter MEM_var_792_33671=524288;
  // IN
  input clock;
  input reset;
  input [31:0] in_port_ap;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [127:0] proxy_out1_792;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [41:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_41_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_41_i0_STORE;
  input fuselector_BMEMORY_CTRLN_41_i1_LOAD;
  input fuselector_BMEMORY_CTRLN_41_i1_STORE;
  input fuselector_DPROXY_CTRLN_0_i0_LOAD;
  input fuselector_DPROXY_CTRLN_0_i0_STORE;
  input selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1;
  input selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2;
  input selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0;
  input selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0;
  input selector_MUX_50_reg_0_0_0_0;
  input selector_MUX_55_reg_13_0_0_0;
  input selector_MUX_55_reg_13_0_0_1;
  input selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0;
  input selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1;
  input selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2;
  input selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0;
  input selector_MUX_61_reg_19_0_0_0;
  input selector_MUX_66_reg_6_0_0_0;
  input selector_MUX_66_reg_6_0_0_1;
  input selector_MUX_66_reg_6_0_1_0;
  input selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
  input wrenable_reg_15;
  input wrenable_reg_16;
  input wrenable_reg_17;
  input wrenable_reg_18;
  input wrenable_reg_19;
  input wrenable_reg_2;
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [127:0] proxy_in1_792;
  output [41:0] proxy_in2_792;
  output [13:0] proxy_in3_792;
  output [1:0] proxy_sel_LOAD_792;
  output [1:0] proxy_sel_STORE_792;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [41:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  output OUT_CONDITION___internal_free_737_774;
  output OUT_CONDITION___internal_free_737_805;
  output OUT_CONDITION___internal_free_737_846;
  output OUT_CONDITION___internal_free_737_848;
  output OUT_CONDITION___internal_free_737_850;
  output OUT_CONDITION___internal_free_737_854;
  output OUT_CONDITION___internal_free_737_870;
  output OUT_CONDITION___internal_free_737_909;
  // Component and signal declarations
  wire [31:0] null_out_signal_DPROXY_CTRLN_0_i0_out1_1;
  wire [31:0] out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0;
  wire [31:0] out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0;
  wire [31:0] out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0;
  wire [31:0] out_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0;
  wire [20:0] out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0;
  wire [20:0] out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1;
  wire [20:0] out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2;
  wire [20:0] out_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0;
  wire [31:0] out_MUX_50_reg_0_0_0_0;
  wire [31:0] out_MUX_55_reg_13_0_0_0;
  wire [31:0] out_MUX_55_reg_13_0_0_1;
  wire [20:0] out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0;
  wire [20:0] out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1;
  wire [20:0] out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2;
  wire [20:0] out_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0;
  wire [31:0] out_MUX_61_reg_19_0_0_0;
  wire [31:0] out_MUX_66_reg_6_0_0_0;
  wire [31:0] out_MUX_66_reg_6_0_0_1;
  wire [31:0] out_MUX_66_reg_6_0_1_0;
  wire [20:0] out_MUX_9_DPROXY_CTRLN_0_i0_1_0_0;
  wire [20:0] out_UUdata_converter_FU_17_i0_fu___internal_free_737_34033;
  wire [20:0] out_UUdata_converter_FU_18_i0_fu___internal_free_737_34026;
  wire [20:0] out_UUdata_converter_FU_19_i0_fu___internal_free_737_34005;
  wire [20:0] out_UUdata_converter_FU_20_i0_fu___internal_free_737_33991;
  wire [20:0] out_UUdata_converter_FU_24_i0_fu___internal_free_737_34115;
  wire [20:0] out_UUdata_converter_FU_25_i0_fu___internal_free_737_34094;
  wire [20:0] out_UUdata_converter_FU_26_i0_fu___internal_free_737_34137;
  wire [20:0] out_UUdata_converter_FU_27_i0_fu___internal_free_737_34108;
  wire [20:0] out_UUdata_converter_FU_28_i0_fu___internal_free_737_34197;
  wire [20:0] out_UUdata_converter_FU_29_i0_fu___internal_free_737_34179;
  wire [20:0] out_UUdata_converter_FU_30_i0_fu___internal_free_737_34229;
  wire [20:0] out_UUdata_converter_FU_31_i0_fu___internal_free_737_34222;
  wire [20:0] out_UUdata_converter_FU_32_i0_fu___internal_free_737_34259;
  wire [20:0] out_UUdata_converter_FU_33_i0_fu___internal_free_737_34252;
  wire [20:0] out_UUdata_converter_FU_4_i0_fu___internal_free_737_34064;
  wire [20:0] out_UUdata_converter_FU_5_i0_fu___internal_free_737_34056;
  wire [20:0] out_UUdata_converter_FU_6_i0_fu___internal_free_737_34126;
  wire [20:0] out_UUdata_converter_FU_7_i0_fu___internal_free_737_34101;
  wire [20:0] out_UUdata_converter_FU_8_i0_fu___internal_free_737_34186;
  wire [20:0] out_UUdata_converter_FU_9_i0_fu___internal_free_737_34172;
  wire [19:0] out_addr_expr_FU_10_i0_fu___internal_free_737_34248;
  wire [19:0] out_addr_expr_FU_3_i0_fu___internal_free_737_33980;
  wire out_const_0;
  wire [6:0] out_const_1;
  wire out_const_2;
  wire [2:0] out_const_3;
  wire [1:0] out_const_4;
  wire [31:0] out_const_5;
  wire [19:0] out_const_6;
  wire [31:0] out_conv_out_const_6_20_32;
  wire [20:0] out_conv_out_reg_1_reg_1_20_21;
  wire [20:0] out_conv_out_reg_5_reg_5_20_21;
  wire out_read_cond_FU_11_i0_fu___internal_free_737_774;
  wire out_read_cond_FU_14_i0_fu___internal_free_737_805;
  wire out_read_cond_FU_15_i0_fu___internal_free_737_846;
  wire out_read_cond_FU_21_i0_fu___internal_free_737_848;
  wire out_read_cond_FU_22_i0_fu___internal_free_737_850;
  wire out_read_cond_FU_34_i0_fu___internal_free_737_854;
  wire out_read_cond_FU_38_i0_fu___internal_free_737_870;
  wire out_read_cond_FU_40_i0_fu___internal_free_737_909;
  wire [31:0] out_reg_0_reg_0;
  wire [31:0] out_reg_10_reg_10;
  wire [20:0] out_reg_11_reg_11;
  wire [31:0] out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire [20:0] out_reg_14_reg_14;
  wire [20:0] out_reg_15_reg_15;
  wire [20:0] out_reg_16_reg_16;
  wire [20:0] out_reg_17_reg_17;
  wire [20:0] out_reg_18_reg_18;
  wire [31:0] out_reg_19_reg_19;
  wire [19:0] out_reg_1_reg_1;
  wire [20:0] out_reg_2_reg_2;
  wire [20:0] out_reg_3_reg_3;
  wire [20:0] out_reg_4_reg_4;
  wire [19:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire [20:0] out_reg_7_reg_7;
  wire [20:0] out_reg_8_reg_8;
  wire [20:0] out_reg_9_reg_9;
  wire out_ui_eq_expr_FU_32_0_32_42_i0_fu___internal_free_737_34738;
  wire out_ui_eq_expr_FU_32_32_32_43_i0_fu___internal_free_737_34748;
  wire out_ui_eq_expr_FU_32_32_32_43_i1_fu___internal_free_737_34750;
  wire out_ui_ge_expr_FU_32_32_32_44_i0_fu___internal_free_737_34740;
  wire out_ui_ge_expr_FU_32_32_32_44_i1_fu___internal_free_737_34744;
  wire out_ui_ge_expr_FU_32_32_32_44_i2_fu___internal_free_737_34746;
  wire out_ui_ge_expr_FU_32_32_32_44_i3_fu___internal_free_737_34752;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_45_i0_fu___internal_free_737_827;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_45_i1_fu___internal_free_737_868;
  wire out_ui_lt_expr_FU_32_32_32_46_i0_fu___internal_free_737_34742;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_47_i0_fu___internal_free_737_815;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_47_i1_fu___internal_free_737_886;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu___internal_free_737_34060;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i1_fu___internal_free_737_34097;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i2_fu___internal_free_737_34104;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i3_fu___internal_free_737_34182;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_0_32_48_i4_fu___internal_free_737_34225;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu___internal_free_737_34077;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_0_32_49_i1_fu___internal_free_737_34154;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_0_32_49_i2_fu___internal_free_737_34209;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_50_i0_fu___internal_free_737_780;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_51_i1_fu___internal_free_737_869;
  wire [31:0] out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_0;
  wire [31:0] out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1;
  wire [31:0] out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_2;
  wire [31:0] out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_3;
  wire [31:0] out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_4;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [41:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_0;
  wire [127:0] sig_in_bus_mergerproxy_in1_7925_0;
  wire [41:0] sig_in_bus_mergerproxy_in2_7926_0;
  wire [13:0] sig_in_bus_mergerproxy_in3_7927_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD_7928_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE_7929_0;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [41:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_0;
  wire [127:0] sig_in_vector_bus_mergerproxy_in1_7925_0;
  wire [41:0] sig_in_vector_bus_mergerproxy_in2_7926_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in3_7927_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD_7928_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE_7929_0;
  wire [127:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [41:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [13:0] sig_out_bus_mergerMout_data_ram_size2_;
  wire [1:0] sig_out_bus_mergerMout_oe_ram3_;
  wire [1:0] sig_out_bus_mergerMout_we_ram4_;
  wire [127:0] sig_out_bus_mergerproxy_in1_7925_;
  wire [41:0] sig_out_bus_mergerproxy_in2_7926_;
  wire [13:0] sig_out_bus_mergerproxy_in3_7927_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD_7928_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE_7929_;
  
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_0 (.out1(out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_0),
    .in1(out_reg_19_reg_19));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_1 (.out1(out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1),
    .in1(out_reg_13_reg_13));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_2 (.out1(out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_2),
    .in1(out_ui_plus_expr_FU_32_32_32_47_i1_fu___internal_free_737_886));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_3 (.out1(out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_3),
    .in1(out_reg_0_reg_0));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_4 (.out1(out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_4),
    .in1(out_reg_6_reg_6));
  BMEMORY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(21),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_Min_oe_ram(1),
    .PORTSIZE_Min_oe_ram(2),
    .BITSIZE_Min_we_ram(1),
    .PORTSIZE_Min_we_ram(2),
    .BITSIZE_Mout_oe_ram(1),
    .PORTSIZE_Mout_oe_ram(2),
    .BITSIZE_Mout_we_ram(1),
    .PORTSIZE_Mout_we_ram(2),
    .BITSIZE_M_DataRdy(1),
    .PORTSIZE_M_DataRdy(2),
    .BITSIZE_Min_addr_ram(21),
    .PORTSIZE_Min_addr_ram(2),
    .BITSIZE_Mout_addr_ram(21),
    .PORTSIZE_Mout_addr_ram(2),
    .BITSIZE_M_Rdata_ram(64),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(64),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(64),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(7),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(7),
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_41_i0 (.out1({out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0,
      out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0}),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_0),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_0),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_0),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_0),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_0),
    .clock(clock),
    .in1({out_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0,
      out_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0}),
    .in2({out_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0,
      out_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0}),
    .in3({out_const_1,
      out_const_1}),
    .in4({out_const_2,
      out_const_2}),
    .sel_LOAD({fuselector_BMEMORY_CTRLN_41_i1_LOAD,
      fuselector_BMEMORY_CTRLN_41_i0_LOAD}),
    .sel_STORE({fuselector_BMEMORY_CTRLN_41_i1_STORE,
      fuselector_BMEMORY_CTRLN_41_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  DPROXY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(21),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(21),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) DPROXY_CTRLN_0_i0 (.out1({null_out_signal_DPROXY_CTRLN_0_i0_out1_1,
      out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0}),
    .proxy_in1(sig_in_vector_bus_mergerproxy_in1_7925_0),
    .proxy_in2(sig_in_vector_bus_mergerproxy_in2_7926_0),
    .proxy_in3(sig_in_vector_bus_mergerproxy_in3_7927_0),
    .proxy_sel_LOAD(sig_in_vector_bus_mergerproxy_sel_LOAD_7928_0),
    .proxy_sel_STORE(sig_in_vector_bus_mergerproxy_sel_STORE_7929_0),
    .in1({32'b00000000000000000000000000000000,
      out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_4}),
    .in2({21'b000000000000000000000,
      out_MUX_9_DPROXY_CTRLN_0_i0_1_0_0}),
    .in3({7'b0000000,
      out_const_1}),
    .in4({1'b0,
      out_const_2}),
    .sel_LOAD({1'b0,
      fuselector_DPROXY_CTRLN_0_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_DPROXY_CTRLN_0_i0_STORE}),
    .proxy_out1(proxy_out1_792));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_0_BMEMORY_CTRLN_41_i0_0_0_0 (.out1(out_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0),
    .sel(selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0),
    .in1(out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_2),
    .in2(out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_3));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_1_BMEMORY_CTRLN_41_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0),
    .in1(out_reg_16_reg_16),
    .in2(out_reg_15_reg_15));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_1_BMEMORY_CTRLN_41_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1),
    .in1(out_reg_14_reg_14),
    .in2(out_reg_11_reg_11));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_1_BMEMORY_CTRLN_41_i0_1_0_2 (.out1(out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2),
    .sel(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i1_fu___internal_free_737_34097),
    .in2(out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_1_BMEMORY_CTRLN_41_i0_1_1_0 (.out1(out_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1),
    .in2(out_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_41_i1_0_0_0 (.out1(out_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0),
    .sel(selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0),
    .in1(out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_0),
    .in2(out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_50_reg_0_0_0_0 (.out1(out_MUX_50_reg_0_0_0_0),
    .sel(selector_MUX_50_reg_0_0_0_0),
    .in1(out_reg_13_reg_13),
    .in2(out_ui_pointer_plus_expr_FU_32_0_32_50_i0_fu___internal_free_737_780));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_55_reg_13_0_0_0 (.out1(out_MUX_55_reg_13_0_0_0),
    .sel(selector_MUX_55_reg_13_0_0_0),
    .in1(out_reg_12_reg_12),
    .in2(out_reg_10_reg_10));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_55_reg_13_0_0_1 (.out1(out_MUX_55_reg_13_0_0_1),
    .sel(selector_MUX_55_reg_13_0_0_1),
    .in1(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0),
    .in2(out_MUX_55_reg_13_0_0_0));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_5_BMEMORY_CTRLN_41_i1_1_0_0 (.out1(out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0),
    .sel(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0),
    .in1(out_reg_9_reg_9),
    .in2(out_reg_8_reg_8));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_5_BMEMORY_CTRLN_41_i1_1_0_1 (.out1(out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1),
    .sel(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1),
    .in1(out_reg_7_reg_7),
    .in2(out_reg_4_reg_4));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_5_BMEMORY_CTRLN_41_i1_1_0_2 (.out1(out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2),
    .sel(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2),
    .in1(out_reg_18_reg_18),
    .in2(out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_5_BMEMORY_CTRLN_41_i1_1_1_0 (.out1(out_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0),
    .sel(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0),
    .in1(out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1),
    .in2(out_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_61_reg_19_0_0_0 (.out1(out_MUX_61_reg_19_0_0_0),
    .sel(selector_MUX_61_reg_19_0_0_0),
    .in1(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0),
    .in2(out_ui_plus_expr_FU_32_32_32_47_i0_fu___internal_free_737_815));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_66_reg_6_0_0_0 (.out1(out_MUX_66_reg_6_0_0_0),
    .sel(selector_MUX_66_reg_6_0_0_0),
    .in1(out_reg_12_reg_12),
    .in2(out_reg_10_reg_10));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_66_reg_6_0_0_1 (.out1(out_MUX_66_reg_6_0_0_1),
    .sel(selector_MUX_66_reg_6_0_0_1),
    .in1(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0),
    .in2(out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_66_reg_6_0_1_0 (.out1(out_MUX_66_reg_6_0_1_0),
    .sel(selector_MUX_66_reg_6_0_1_0),
    .in1(out_MUX_66_reg_6_0_0_0),
    .in2(out_MUX_66_reg_6_0_0_1));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_9_DPROXY_CTRLN_0_i0_1_0_0 (.out1(out_MUX_9_DPROXY_CTRLN_0_i0_1_0_0),
    .sel(selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0),
    .in1(out_conv_out_reg_5_reg_5_20_21),
    .in2(out_conv_out_reg_1_reg_1_20_21));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_),
    .in1({sig_in_bus_mergerMout_Wdata_ram0_0}));
  bus_merger #(.BITSIZE_in1(42),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(42)) bus_mergerMout_addr_ram1_ (.out1(sig_out_bus_mergerMout_addr_ram1_),
    .in1({sig_in_bus_mergerMout_addr_ram1_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_),
    .in1({sig_in_bus_mergerMout_data_ram_size2_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerMout_oe_ram3_ (.out1(sig_out_bus_mergerMout_oe_ram3_),
    .in1({sig_in_bus_mergerMout_oe_ram3_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerMout_we_ram4_ (.out1(sig_out_bus_mergerMout_we_ram4_),
    .in1({sig_in_bus_mergerMout_we_ram4_0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerproxy_in1_7925_ (.out1(sig_out_bus_mergerproxy_in1_7925_),
    .in1({sig_in_bus_mergerproxy_in1_7925_0}));
  bus_merger #(.BITSIZE_in1(42),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(42)) bus_mergerproxy_in2_7926_ (.out1(sig_out_bus_mergerproxy_in2_7926_),
    .in1({sig_in_bus_mergerproxy_in2_7926_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerproxy_in3_7927_ (.out1(sig_out_bus_mergerproxy_in3_7927_),
    .in1({sig_in_bus_mergerproxy_in3_7927_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD_7928_ (.out1(sig_out_bus_mergerproxy_sel_LOAD_7928_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD_7928_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE_7929_ (.out1(sig_out_bus_mergerproxy_sel_STORE_7929_),
    .in1({sig_in_bus_mergerproxy_sel_STORE_7929_0}));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(20),
    .value(MEM_var_792_33671)) const_6 (.out1(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(32)) conv_out_const_6_20_32 (.out1(out_conv_out_const_6_20_32),
    .in1(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(21)) conv_out_reg_1_reg_1_20_21 (.out1(out_conv_out_reg_1_reg_1_20_21),
    .in1(out_reg_1_reg_1));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(21)) conv_out_reg_5_reg_5_20_21 (.out1(out_conv_out_reg_5_reg_5_20_21),
    .in1(out_reg_5_reg_5));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_free_737_33980 (.out1(out_addr_expr_FU_3_i0_fu___internal_free_737_33980),
    .in1(out_conv_out_const_6_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_free_737_33991 (.out1(out_UUdata_converter_FU_20_i0_fu___internal_free_737_33991),
    .in1(out_UUdata_converter_FU_19_i0_fu___internal_free_737_34005));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_free_737_34005 (.out1(out_UUdata_converter_FU_19_i0_fu___internal_free_737_34005),
    .in1(out_reg_6_reg_6));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_free_737_34026 (.out1(out_UUdata_converter_FU_18_i0_fu___internal_free_737_34026),
    .in1(out_UUdata_converter_FU_17_i0_fu___internal_free_737_34033));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_free_737_34033 (.out1(out_UUdata_converter_FU_17_i0_fu___internal_free_737_34033),
    .in1(out_reg_6_reg_6));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_free_737_34056 (.out1(out_UUdata_converter_FU_5_i0_fu___internal_free_737_34056),
    .in1(out_UUdata_converter_FU_4_i0_fu___internal_free_737_34064));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(3),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu___internal_free_737_34060 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu___internal_free_737_34060),
    .in1(out_reg_2_reg_2),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_free_737_34064 (.out1(out_UUdata_converter_FU_4_i0_fu___internal_free_737_34064),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu___internal_free_737_34077));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu___internal_free_737_34077 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_49_i0_fu___internal_free_737_34077),
    .in1(in_port_ap),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_free_737_34094 (.out1(out_UUdata_converter_FU_25_i0_fu___internal_free_737_34094),
    .in1(out_UUdata_converter_FU_24_i0_fu___internal_free_737_34115));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(3),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu___internal_free_737_34097 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i1_fu___internal_free_737_34097),
    .in1(out_reg_17_reg_17),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_free_737_34101 (.out1(out_UUdata_converter_FU_7_i0_fu___internal_free_737_34101),
    .in1(out_UUdata_converter_FU_6_i0_fu___internal_free_737_34126));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(3),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu___internal_free_737_34104 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i2_fu___internal_free_737_34104),
    .in1(out_reg_3_reg_3),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_free_737_34108 (.out1(out_UUdata_converter_FU_27_i0_fu___internal_free_737_34108),
    .in1(out_UUdata_converter_FU_26_i0_fu___internal_free_737_34137));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_free_737_34115 (.out1(out_UUdata_converter_FU_24_i0_fu___internal_free_737_34115),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_free_737_34126 (.out1(out_UUdata_converter_FU_6_i0_fu___internal_free_737_34126),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_49_i1_fu___internal_free_737_34154));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_free_737_34137 (.out1(out_UUdata_converter_FU_26_i0_fu___internal_free_737_34137),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu___internal_free_737_34154 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_49_i1_fu___internal_free_737_34154),
    .in1(in_port_ap),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_free_737_34172 (.out1(out_UUdata_converter_FU_9_i0_fu___internal_free_737_34172),
    .in1(out_UUdata_converter_FU_8_i0_fu___internal_free_737_34186));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_free_737_34179 (.out1(out_UUdata_converter_FU_29_i0_fu___internal_free_737_34179),
    .in1(out_UUdata_converter_FU_28_i0_fu___internal_free_737_34197));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(3),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu___internal_free_737_34182 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i3_fu___internal_free_737_34182),
    .in1(out_UUdata_converter_FU_29_i0_fu___internal_free_737_34179),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_free_737_34186 (.out1(out_UUdata_converter_FU_8_i0_fu___internal_free_737_34186),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_49_i2_fu___internal_free_737_34209));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_free_737_34197 (.out1(out_UUdata_converter_FU_28_i0_fu___internal_free_737_34197),
    .in1(out_reg_6_reg_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu___internal_free_737_34209 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_49_i2_fu___internal_free_737_34209),
    .in1(in_port_ap),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_free_737_34222 (.out1(out_UUdata_converter_FU_31_i0_fu___internal_free_737_34222),
    .in1(out_UUdata_converter_FU_30_i0_fu___internal_free_737_34229));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(3),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu___internal_free_737_34225 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_48_i4_fu___internal_free_737_34225),
    .in1(out_UUdata_converter_FU_31_i0_fu___internal_free_737_34222),
    .in2(out_const_3));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_free_737_34229 (.out1(out_UUdata_converter_FU_30_i0_fu___internal_free_737_34229),
    .in1(out_reg_6_reg_6));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_free_737_34248 (.out1(out_addr_expr_FU_10_i0_fu___internal_free_737_34248),
    .in1(out_conv_out_const_6_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_free_737_34252 (.out1(out_UUdata_converter_FU_33_i0_fu___internal_free_737_34252),
    .in1(out_UUdata_converter_FU_32_i0_fu___internal_free_737_34259));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_free_737_34259 (.out1(out_UUdata_converter_FU_32_i0_fu___internal_free_737_34259),
    .in1(out_reg_6_reg_6));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___internal_free_737_34738 (.out1(out_ui_eq_expr_FU_32_0_32_42_i0_fu___internal_free_737_34738),
    .in1(in_port_ap),
    .in2(out_const_0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_34740 (.out1(out_ui_ge_expr_FU_32_32_32_44_i0_fu___internal_free_737_34740),
    .in1(out_reg_6_reg_6),
    .in2(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0));
  ui_lt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_34742 (.out1(out_ui_lt_expr_FU_32_32_32_46_i0_fu___internal_free_737_34742),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_12_reg_12));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_34744 (.out1(out_ui_ge_expr_FU_32_32_32_44_i1_fu___internal_free_737_34744),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_0_reg_0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_34746 (.out1(out_ui_ge_expr_FU_32_32_32_44_i2_fu___internal_free_737_34746),
    .in1(out_reg_0_reg_0),
    .in2(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_34748 (.out1(out_ui_eq_expr_FU_32_32_32_43_i0_fu___internal_free_737_34748),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824),
    .in2(out_reg_13_reg_13));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_34750 (.out1(out_ui_eq_expr_FU_32_32_32_43_i1_fu___internal_free_737_34750),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_51_i1_fu___internal_free_737_869),
    .in2(out_reg_0_reg_0));
  ui_ge_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_free_737_34752 (.out1(out_ui_ge_expr_FU_32_32_32_44_i3_fu___internal_free_737_34752),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_10_reg_10));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_774 (.out1(out_read_cond_FU_11_i0_fu___internal_free_737_774),
    .in1(out_ui_eq_expr_FU_32_0_32_42_i0_fu___internal_free_737_34738));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_free_737_780 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_50_i0_fu___internal_free_737_780),
    .in1(in_port_ap),
    .in2(out_const_5));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_805 (.out1(out_read_cond_FU_14_i0_fu___internal_free_737_805),
    .in1(out_ui_ge_expr_FU_32_32_32_44_i0_fu___internal_free_737_34740));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___internal_free_737_815 (.out1(out_ui_plus_expr_FU_32_32_32_47_i0_fu___internal_free_737_815),
    .in1(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0),
    .in2(out_reg_10_reg_10));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_free_737_824 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_51_i0_fu___internal_free_737_824),
    .in1(out_reg_0_reg_0),
    .in2(out_ui_lshift_expr_FU_32_0_32_45_i0_fu___internal_free_737_827));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___internal_free_737_827 (.out1(out_ui_lshift_expr_FU_32_0_32_45_i0_fu___internal_free_737_827),
    .in1(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0),
    .in2(out_const_4));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_846 (.out1(out_read_cond_FU_15_i0_fu___internal_free_737_846),
    .in1(out_ui_lt_expr_FU_32_32_32_46_i0_fu___internal_free_737_34742));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_848 (.out1(out_read_cond_FU_21_i0_fu___internal_free_737_848),
    .in1(out_ui_ge_expr_FU_32_32_32_44_i1_fu___internal_free_737_34744));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_850 (.out1(out_read_cond_FU_22_i0_fu___internal_free_737_850),
    .in1(out_ui_ge_expr_FU_32_32_32_44_i2_fu___internal_free_737_34746));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_854 (.out1(out_read_cond_FU_34_i0_fu___internal_free_737_854),
    .in1(out_ui_eq_expr_FU_32_32_32_43_i0_fu___internal_free_737_34748));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___internal_free_737_868 (.out1(out_ui_lshift_expr_FU_32_0_32_45_i1_fu___internal_free_737_868),
    .in1(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0),
    .in2(out_const_4));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_free_737_869 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_51_i1_fu___internal_free_737_869),
    .in1(out_reg_6_reg_6),
    .in2(out_ui_lshift_expr_FU_32_0_32_45_i1_fu___internal_free_737_868));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_870 (.out1(out_read_cond_FU_38_i0_fu___internal_free_737_870),
    .in1(out_ui_eq_expr_FU_32_32_32_43_i1_fu___internal_free_737_34750));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___internal_free_737_886 (.out1(out_ui_plus_expr_FU_32_32_32_47_i1_fu___internal_free_737_886),
    .in1(out_reg_19_reg_19),
    .in2(out_reg_12_reg_12));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_free_737_909 (.out1(out_read_cond_FU_40_i0_fu___internal_free_737_909),
    .in1(out_ui_ge_expr_FU_32_32_32_44_i3_fu___internal_free_737_34752));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(21),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(42)) join_signalbus_mergerMout_addr_ram1_0 (.out1(sig_in_bus_mergerMout_addr_ram1_0),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_0 (.out1(sig_in_bus_mergerMout_oe_ram3_0),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_0 (.out1(sig_in_bus_mergerMout_we_ram4_0),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in1_7925_0 (.out1(sig_in_bus_mergerproxy_in1_7925_0),
    .in1(sig_in_vector_bus_mergerproxy_in1_7925_0));
  join_signal #(.BITSIZE_in1(21),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(42)) join_signalbus_mergerproxy_in2_7926_0 (.out1(sig_in_bus_mergerproxy_in2_7926_0),
    .in1(sig_in_vector_bus_mergerproxy_in2_7926_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in3_7927_0 (.out1(sig_in_bus_mergerproxy_in3_7927_0),
    .in1(sig_in_vector_bus_mergerproxy_in3_7927_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD_7928_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD_7928_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD_7928_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE_7929_0 (.out1(sig_in_bus_mergerproxy_sel_STORE_7929_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE_7929_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_50_reg_0_0_0_0),
    .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_3_i0_fu___internal_free_737_33980),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_41_i1_BMEMORY_CTRLN_41_i0),
    .wenable(wrenable_reg_10));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_20_i0_fu___internal_free_737_33991),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_41_i0_BMEMORY_CTRLN_41_i0),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_55_reg_13_0_0_1),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i3_fu___internal_free_737_34182),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i4_fu___internal_free_737_34225),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_33_i0_fu___internal_free_737_34252),
    .wenable(wrenable_reg_16));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_25_i0_fu___internal_free_737_34094),
    .wenable(wrenable_reg_17));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_27_i0_fu___internal_free_737_34108),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_61_reg_19_0_0_0),
    .wenable(wrenable_reg_19));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_5_i0_fu___internal_free_737_34056),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_7_i0_fu___internal_free_737_34101),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_9_i0_fu___internal_free_737_34172),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_10_i0_fu___internal_free_737_34248),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_66_reg_6_0_1_0),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i0_fu___internal_free_737_34060),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_48_i2_fu___internal_free_737_34104),
    .wenable(wrenable_reg_8));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_18_i0_fu___internal_free_737_34026),
    .wenable(wrenable_reg_9));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram),
    .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(42),
    .BITSIZE_out1(21),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram),
    .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_data_ram_size2_ (.out1(Mout_data_ram_size),
    .in1(sig_out_bus_mergerMout_data_ram_size2_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_oe_ram3_ (.out1(Mout_oe_ram),
    .in1(sig_out_bus_mergerMout_oe_ram3_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_we_ram4_ (.out1(Mout_we_ram),
    .in1(sig_out_bus_mergerMout_we_ram4_));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in1_7925_ (.out1(proxy_in1_792),
    .in1(sig_out_bus_mergerproxy_in1_7925_));
  split_signal #(.BITSIZE_in1(42),
    .BITSIZE_out1(21),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in2_7926_ (.out1(proxy_in2_792),
    .in1(sig_out_bus_mergerproxy_in2_7926_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in3_7927_ (.out1(proxy_in3_792),
    .in1(sig_out_bus_mergerproxy_in3_7927_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD_7928_ (.out1(proxy_sel_LOAD_792),
    .in1(sig_out_bus_mergerproxy_sel_LOAD_7928_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE_7929_ (.out1(proxy_sel_STORE_792),
    .in1(sig_out_bus_mergerproxy_sel_STORE_7929_));
  // io-signal post fix
  assign OUT_CONDITION___internal_free_737_774 = out_read_cond_FU_11_i0_fu___internal_free_737_774;
  assign OUT_CONDITION___internal_free_737_805 = out_read_cond_FU_14_i0_fu___internal_free_737_805;
  assign OUT_CONDITION___internal_free_737_846 = out_read_cond_FU_15_i0_fu___internal_free_737_846;
  assign OUT_CONDITION___internal_free_737_848 = out_read_cond_FU_21_i0_fu___internal_free_737_848;
  assign OUT_CONDITION___internal_free_737_850 = out_read_cond_FU_22_i0_fu___internal_free_737_850;
  assign OUT_CONDITION___internal_free_737_854 = out_read_cond_FU_34_i0_fu___internal_free_737_854;
  assign OUT_CONDITION___internal_free_737_870 = out_read_cond_FU_38_i0_fu___internal_free_737_870;
  assign OUT_CONDITION___internal_free_737_909 = out_read_cond_FU_40_i0_fu___internal_free_737_909;

endmodule

// FSM based controller description for __internal_free
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___internal_free(done_port,
  fuselector_BMEMORY_CTRLN_41_i0_LOAD,
  fuselector_BMEMORY_CTRLN_41_i0_STORE,
  fuselector_BMEMORY_CTRLN_41_i1_LOAD,
  fuselector_BMEMORY_CTRLN_41_i1_STORE,
  fuselector_DPROXY_CTRLN_0_i0_LOAD,
  fuselector_DPROXY_CTRLN_0_i0_STORE,
  selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2,
  selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0,
  selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0,
  selector_MUX_50_reg_0_0_0_0,
  selector_MUX_55_reg_13_0_0_0,
  selector_MUX_55_reg_13_0_0_1,
  selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0,
  selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1,
  selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2,
  selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0,
  selector_MUX_61_reg_19_0_0_0,
  selector_MUX_66_reg_6_0_0_0,
  selector_MUX_66_reg_6_0_0_1,
  selector_MUX_66_reg_6_0_1_0,
  selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_3,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION___internal_free_737_774,
  OUT_CONDITION___internal_free_737_805,
  OUT_CONDITION___internal_free_737_846,
  OUT_CONDITION___internal_free_737_848,
  OUT_CONDITION___internal_free_737_850,
  OUT_CONDITION___internal_free_737_854,
  OUT_CONDITION___internal_free_737_870,
  OUT_CONDITION___internal_free_737_909,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION___internal_free_737_774;
  input OUT_CONDITION___internal_free_737_805;
  input OUT_CONDITION___internal_free_737_846;
  input OUT_CONDITION___internal_free_737_848;
  input OUT_CONDITION___internal_free_737_850;
  input OUT_CONDITION___internal_free_737_854;
  input OUT_CONDITION___internal_free_737_870;
  input OUT_CONDITION___internal_free_737_909;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_41_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_41_i0_STORE;
  output fuselector_BMEMORY_CTRLN_41_i1_LOAD;
  output fuselector_BMEMORY_CTRLN_41_i1_STORE;
  output fuselector_DPROXY_CTRLN_0_i0_LOAD;
  output fuselector_DPROXY_CTRLN_0_i0_STORE;
  output selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1;
  output selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2;
  output selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0;
  output selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0;
  output selector_MUX_50_reg_0_0_0_0;
  output selector_MUX_55_reg_13_0_0_0;
  output selector_MUX_55_reg_13_0_0_1;
  output selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0;
  output selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1;
  output selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2;
  output selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0;
  output selector_MUX_61_reg_19_0_0_0;
  output selector_MUX_66_reg_6_0_0_0;
  output selector_MUX_66_reg_6_0_0_1;
  output selector_MUX_66_reg_6_0_1_0;
  output selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_15;
  output wrenable_reg_16;
  output wrenable_reg_17;
  output wrenable_reg_18;
  output wrenable_reg_19;
  output wrenable_reg_2;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [19:0] S_0 = 20'b00000000000000000001,
    S_1 = 20'b00000000000000000010,
    S_19 = 20'b10000000000000000000,
    S_2 = 20'b00000000000000000100,
    S_6 = 20'b00000000000001000000,
    S_7 = 20'b00000000000010000000,
    S_8 = 20'b00000000000100000000,
    S_18 = 20'b01000000000000000000,
    S_3 = 20'b00000000000000001000,
    S_4 = 20'b00000000000000010000,
    S_5 = 20'b00000000000000100000,
    S_9 = 20'b00000000001000000000,
    S_10 = 20'b00000000010000000000,
    S_11 = 20'b00000000100000000000,
    S_12 = 20'b00000001000000000000,
    S_13 = 20'b00000010000000000000,
    S_14 = 20'b00000100000000000000,
    S_15 = 20'b00001000000000000000,
    S_16 = 20'b00010000000000000000,
    S_17 = 20'b00100000000000000000;
  reg [19:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_41_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_41_i0_STORE;
  reg fuselector_BMEMORY_CTRLN_41_i1_LOAD;
  reg fuselector_BMEMORY_CTRLN_41_i1_STORE;
  reg fuselector_DPROXY_CTRLN_0_i0_LOAD;
  reg fuselector_DPROXY_CTRLN_0_i0_STORE;
  reg selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1;
  reg selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2;
  reg selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0;
  reg selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0;
  reg selector_MUX_50_reg_0_0_0_0;
  reg selector_MUX_55_reg_13_0_0_0;
  reg selector_MUX_55_reg_13_0_0_1;
  reg selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0;
  reg selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1;
  reg selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2;
  reg selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0;
  reg selector_MUX_61_reg_19_0_0_0;
  reg selector_MUX_66_reg_6_0_0_0;
  reg selector_MUX_66_reg_6_0_0_1;
  reg selector_MUX_66_reg_6_0_1_0;
  reg selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
  reg wrenable_reg_15;
  reg wrenable_reg_16;
  reg wrenable_reg_17;
  reg wrenable_reg_18;
  reg wrenable_reg_19;
  reg wrenable_reg_2;
  reg wrenable_reg_3;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_BMEMORY_CTRLN_41_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_41_i0_STORE = 1'b0;
    fuselector_BMEMORY_CTRLN_41_i1_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_41_i1_STORE = 1'b0;
    fuselector_DPROXY_CTRLN_0_i0_LOAD = 1'b0;
    fuselector_DPROXY_CTRLN_0_i0_STORE = 1'b0;
    selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0 = 1'b0;
    selector_MUX_50_reg_0_0_0_0 = 1'b0;
    selector_MUX_55_reg_13_0_0_0 = 1'b0;
    selector_MUX_55_reg_13_0_0_1 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0 = 1'b0;
    selector_MUX_61_reg_19_0_0_0 = 1'b0;
    selector_MUX_66_reg_6_0_0_0 = 1'b0;
    selector_MUX_66_reg_6_0_0_1 = 1'b0;
    selector_MUX_66_reg_6_0_1_0 = 1'b0;
    selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
    wrenable_reg_15 = 1'b0;
    wrenable_reg_16 = 1'b0;
    wrenable_reg_17 = 1'b0;
    wrenable_reg_18 = 1'b0;
    wrenable_reg_19 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          if (OUT_CONDITION___internal_free_737_774 == 1'b0)
            begin
              _next_state = S_2;
            end
          else
            begin
              _next_state = S_19;
              done_port = 1'b1;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_1 = 1'b0;
              wrenable_reg_2 = 1'b0;
              wrenable_reg_3 = 1'b0;
              wrenable_reg_4 = 1'b0;
              wrenable_reg_5 = 1'b0;
            end
        end
      S_19 :
        begin
          _next_state = S_0;
        end
      S_2 :
        begin
          fuselector_DPROXY_CTRLN_0_i0_LOAD = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          _next_state = S_6;
        end
      S_6 :
        begin
          wrenable_reg_11 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION___internal_free_737_848 == 1'b1)
            begin
              _next_state = S_3;
              wrenable_reg_9 = 1'b0;
            end
          else
            begin
              _next_state = S_7;
              wrenable_reg_11 = 1'b0;
            end
        end
      S_7 :
        begin
          fuselector_BMEMORY_CTRLN_41_i1_LOAD = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0 = 1'b1;
          _next_state = S_8;
        end
      S_8 :
        begin
          selector_MUX_55_reg_13_0_0_1 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_13 = 1'b1;
          if (OUT_CONDITION___internal_free_737_850 == 1'b1)
            begin
              _next_state = S_18;
              selector_MUX_55_reg_13_0_0_1 = 1'b0;
              wrenable_reg_13 = 1'b0;
            end
          else
            begin
              _next_state = S_9;
              wrenable_reg_10 = 1'b0;
            end
        end
      S_18 :
        begin
          selector_MUX_66_reg_6_0_1_0 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_6 = 1'b1;
          if (OUT_CONDITION___internal_free_737_909 == 1'b1)
            begin
              _next_state = S_9;
              selector_MUX_66_reg_6_0_1_0 = 1'b0;
              wrenable_reg_6 = 1'b0;
            end
          else
            begin
              _next_state = S_6;
              wrenable_reg_13 = 1'b0;
            end
        end
      S_3 :
        begin
          fuselector_BMEMORY_CTRLN_41_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          selector_MUX_66_reg_6_0_0_1 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_6 = 1'b1;
          if (OUT_CONDITION___internal_free_737_805 == 1'b1)
            begin
              _next_state = S_5;
              selector_MUX_66_reg_6_0_0_1 = 1'b0;
              wrenable_reg_6 = 1'b0;
            end
          else
            begin
              _next_state = S_6;
              wrenable_reg_12 = 1'b0;
            end
        end
      S_5 :
        begin
          selector_MUX_55_reg_13_0_0_0 = 1'b1;
          selector_MUX_66_reg_6_0_0_0 = 1'b1;
          selector_MUX_66_reg_6_0_1_0 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_6 = 1'b1;
          if (OUT_CONDITION___internal_free_737_846 == 1'b1)
            begin
              _next_state = S_9;
              selector_MUX_66_reg_6_0_0_0 = 1'b0;
              selector_MUX_66_reg_6_0_1_0 = 1'b0;
              wrenable_reg_6 = 1'b0;
            end
          else
            begin
              _next_state = S_6;
              selector_MUX_55_reg_13_0_0_0 = 1'b0;
              wrenable_reg_13 = 1'b0;
            end
        end
      S_9 :
        begin
          fuselector_BMEMORY_CTRLN_41_i1_LOAD = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          selector_MUX_61_reg_19_0_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          if (OUT_CONDITION___internal_free_737_854 == 1'b1)
            begin
              _next_state = S_11;
              selector_MUX_61_reg_19_0_0_0 = 1'b0;
              wrenable_reg_19 = 1'b0;
            end
          else
            begin
              _next_state = S_14;
              wrenable_reg_10 = 1'b0;
              wrenable_reg_17 = 1'b0;
              wrenable_reg_18 = 1'b0;
            end
        end
      S_11 :
        begin
          fuselector_BMEMORY_CTRLN_41_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_41_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2 = 1'b1;
          _next_state = S_12;
        end
      S_12 :
        begin
          wrenable_reg_10 = 1'b1;
          wrenable_reg_19 = 1'b1;
          _next_state = S_13;
        end
      S_13 :
        begin
          fuselector_BMEMORY_CTRLN_41_i1_STORE = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0 = 1'b1;
          wrenable_reg_13 = 1'b1;
          _next_state = S_14;
        end
      S_14 :
        begin
          fuselector_BMEMORY_CTRLN_41_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_41_i1_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0 = 1'b1;
          _next_state = S_15;
        end
      S_15 :
        begin
          wrenable_reg_12 = 1'b1;
          if (OUT_CONDITION___internal_free_737_870 == 1'b1)
            begin
              _next_state = S_16;
            end
          else
            begin
              _next_state = S_17;
              done_port = 1'b1;
              wrenable_reg_12 = 1'b0;
            end
        end
      S_16 :
        begin
          fuselector_BMEMORY_CTRLN_41_i0_STORE = 1'b1;
          selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0 = 1'b1;
          selector_MUX_50_reg_0_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          _next_state = S_17;
          done_port = 1'b1;
        end
      S_17 :
        begin
          fuselector_BMEMORY_CTRLN_41_i0_STORE = 1'b1;
          fuselector_DPROXY_CTRLN_0_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0 = 1'b1;
          selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0 = 1'b1;
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Marco Lattuada <marco.lattuada@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module flipflop_AR(clock,
  reset,
  in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input in1;
  // OUT
  output out1;
  
  reg reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock )
    if (reset == 1'b0)
      reg_out1 <= {BITSIZE_out1{1'b0}};
    else
      reg_out1 <= in1;
endmodule

// Top component for __internal_free
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __internal_free(clock,
  reset,
  start_port,
  done_port,
  ap,
  M_Rdata_ram,
  M_DataRdy,
  proxy_out1_792,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  proxy_in1_792,
  proxy_in2_792,
  proxy_in3_792,
  proxy_sel_LOAD_792,
  proxy_sel_STORE_792,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  parameter MEM_var_792_33671=524288;
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] ap;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [127:0] proxy_out1_792;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [41:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [127:0] proxy_in1_792;
  output [41:0] proxy_in2_792;
  output [13:0] proxy_in3_792;
  output [1:0] proxy_sel_LOAD_792;
  output [1:0] proxy_sel_STORE_792;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [41:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION___internal_free_737_774;
  wire OUT_CONDITION___internal_free_737_805;
  wire OUT_CONDITION___internal_free_737_846;
  wire OUT_CONDITION___internal_free_737_848;
  wire OUT_CONDITION___internal_free_737_850;
  wire OUT_CONDITION___internal_free_737_854;
  wire OUT_CONDITION___internal_free_737_870;
  wire OUT_CONDITION___internal_free_737_909;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_41_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_41_i0_STORE;
  wire fuselector_BMEMORY_CTRLN_41_i1_LOAD;
  wire fuselector_BMEMORY_CTRLN_41_i1_STORE;
  wire fuselector_DPROXY_CTRLN_0_i0_LOAD;
  wire fuselector_DPROXY_CTRLN_0_i0_STORE;
  wire [31:0] in_port_ap_SIGI1;
  wire [31:0] in_port_ap_SIGI2;
  wire selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1;
  wire selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2;
  wire selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0;
  wire selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0;
  wire selector_MUX_50_reg_0_0_0_0;
  wire selector_MUX_55_reg_13_0_0_0;
  wire selector_MUX_55_reg_13_0_0_1;
  wire selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0;
  wire selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1;
  wire selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2;
  wire selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0;
  wire selector_MUX_61_reg_19_0_0_0;
  wire selector_MUX_66_reg_6_0_0_0;
  wire selector_MUX_66_reg_6_0_0_1;
  wire selector_MUX_66_reg_6_0_1_0;
  wire selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_15;
  wire wrenable_reg_16;
  wire wrenable_reg_17;
  wire wrenable_reg_18;
  wire wrenable_reg_19;
  wire wrenable_reg_2;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller___internal_free Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_41_i0_LOAD(fuselector_BMEMORY_CTRLN_41_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_41_i0_STORE(fuselector_BMEMORY_CTRLN_41_i0_STORE),
    .fuselector_BMEMORY_CTRLN_41_i1_LOAD(fuselector_BMEMORY_CTRLN_41_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_41_i1_STORE(fuselector_BMEMORY_CTRLN_41_i1_STORE),
    .fuselector_DPROXY_CTRLN_0_i0_LOAD(fuselector_DPROXY_CTRLN_0_i0_LOAD),
    .fuselector_DPROXY_CTRLN_0_i0_STORE(fuselector_DPROXY_CTRLN_0_i0_STORE),
    .selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0(selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2),
    .selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0),
    .selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0(selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0),
    .selector_MUX_50_reg_0_0_0_0(selector_MUX_50_reg_0_0_0_0),
    .selector_MUX_55_reg_13_0_0_0(selector_MUX_55_reg_13_0_0_0),
    .selector_MUX_55_reg_13_0_0_1(selector_MUX_55_reg_13_0_0_1),
    .selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0),
    .selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1),
    .selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2),
    .selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0),
    .selector_MUX_61_reg_19_0_0_0(selector_MUX_61_reg_19_0_0_0),
    .selector_MUX_66_reg_6_0_0_0(selector_MUX_66_reg_6_0_0_0),
    .selector_MUX_66_reg_6_0_0_1(selector_MUX_66_reg_6_0_0_1),
    .selector_MUX_66_reg_6_0_1_0(selector_MUX_66_reg_6_0_1_0),
    .selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0(selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION___internal_free_737_774(OUT_CONDITION___internal_free_737_774),
    .OUT_CONDITION___internal_free_737_805(OUT_CONDITION___internal_free_737_805),
    .OUT_CONDITION___internal_free_737_846(OUT_CONDITION___internal_free_737_846),
    .OUT_CONDITION___internal_free_737_848(OUT_CONDITION___internal_free_737_848),
    .OUT_CONDITION___internal_free_737_850(OUT_CONDITION___internal_free_737_850),
    .OUT_CONDITION___internal_free_737_854(OUT_CONDITION___internal_free_737_854),
    .OUT_CONDITION___internal_free_737_870(OUT_CONDITION___internal_free_737_870),
    .OUT_CONDITION___internal_free_737_909(OUT_CONDITION___internal_free_737_909),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___internal_free #(.MEM_var_792_33671(MEM_var_792_33671)) Datapath_i (.proxy_in1_792(proxy_in1_792),
    .proxy_in2_792(proxy_in2_792),
    .proxy_in3_792(proxy_in3_792),
    .proxy_sel_LOAD_792(proxy_sel_LOAD_792),
    .proxy_sel_STORE_792(proxy_sel_STORE_792),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION___internal_free_737_774(OUT_CONDITION___internal_free_737_774),
    .OUT_CONDITION___internal_free_737_805(OUT_CONDITION___internal_free_737_805),
    .OUT_CONDITION___internal_free_737_846(OUT_CONDITION___internal_free_737_846),
    .OUT_CONDITION___internal_free_737_848(OUT_CONDITION___internal_free_737_848),
    .OUT_CONDITION___internal_free_737_850(OUT_CONDITION___internal_free_737_850),
    .OUT_CONDITION___internal_free_737_854(OUT_CONDITION___internal_free_737_854),
    .OUT_CONDITION___internal_free_737_870(OUT_CONDITION___internal_free_737_870),
    .OUT_CONDITION___internal_free_737_909(OUT_CONDITION___internal_free_737_909),
    .clock(clock),
    .reset(reset),
    .in_port_ap(in_port_ap_SIGI2),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .proxy_out1_792(proxy_out1_792),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_41_i0_LOAD(fuselector_BMEMORY_CTRLN_41_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_41_i0_STORE(fuselector_BMEMORY_CTRLN_41_i0_STORE),
    .fuselector_BMEMORY_CTRLN_41_i1_LOAD(fuselector_BMEMORY_CTRLN_41_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_41_i1_STORE(fuselector_BMEMORY_CTRLN_41_i1_STORE),
    .fuselector_DPROXY_CTRLN_0_i0_LOAD(fuselector_DPROXY_CTRLN_0_i0_LOAD),
    .fuselector_DPROXY_CTRLN_0_i0_STORE(fuselector_DPROXY_CTRLN_0_i0_STORE),
    .selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0(selector_MUX_0_BMEMORY_CTRLN_41_i0_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_0_2),
    .selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_41_i0_1_1_0),
    .selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0(selector_MUX_4_BMEMORY_CTRLN_41_i1_0_0_0),
    .selector_MUX_50_reg_0_0_0_0(selector_MUX_50_reg_0_0_0_0),
    .selector_MUX_55_reg_13_0_0_0(selector_MUX_55_reg_13_0_0_0),
    .selector_MUX_55_reg_13_0_0_1(selector_MUX_55_reg_13_0_0_1),
    .selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_0),
    .selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_1),
    .selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_0_2),
    .selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0(selector_MUX_5_BMEMORY_CTRLN_41_i1_1_1_0),
    .selector_MUX_61_reg_19_0_0_0(selector_MUX_61_reg_19_0_0_0),
    .selector_MUX_66_reg_6_0_0_0(selector_MUX_66_reg_6_0_0_0),
    .selector_MUX_66_reg_6_0_0_1(selector_MUX_66_reg_6_0_0_1),
    .selector_MUX_66_reg_6_0_1_0(selector_MUX_66_reg_6_0_1_0),
    .selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0(selector_MUX_9_DPROXY_CTRLN_0_i0_1_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) in_port_ap_REG (.out1(in_port_ap_SIGI2),
    .clock(clock),
    .reset(reset),
    .in1(in_port_ap_SIGI1));
  // io-signal post fix
  assign in_port_ap_SIGI1 = ap;
  assign done_port = done_delayed_REG_signal_out;

endmodule

// Proxy wrapper for function: WRAPPED_PROXY_PREF___internal_free
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module WRAPPED_PROXY_PREF___internal_free(clock,
  reset,
  start_port,
  ap,
  M_Rdata_ram,
  M_DataRdy,
  proxy_out1_792,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  PROXY_PREF_start_port,
  PROXY_PREF_ap,
  done_port,
  proxy_in1_792,
  proxy_in2_792,
  proxy_in3_792,
  proxy_sel_LOAD_792,
  proxy_sel_STORE_792,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size,
  PROXY_PREF_done_port,
  sel___internal_free);
  parameter MEM_var_792_33671=524288;
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] ap;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [127:0] proxy_out1_792;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [41:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  input PROXY_PREF_start_port;
  input [31:0] PROXY_PREF_ap;
  input sel___internal_free;
  // OUT
  output done_port;
  output [127:0] proxy_in1_792;
  output [41:0] proxy_in2_792;
  output [13:0] proxy_in3_792;
  output [1:0] proxy_sel_LOAD_792;
  output [1:0] proxy_sel_STORE_792;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [41:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  output PROXY_PREF_done_port;
  // Component and signal declarations
  wire [31:0] muxed_in_ap;
  wire muxed_in_start_port;
  wire proxy_selector____out_sel;
  wire tmp_out_done_port;
  
  __internal_free #(.MEM_var_792_33671(MEM_var_792_33671)) __internal_free_i (.done_port(tmp_out_done_port),
    .proxy_in1_792(proxy_in1_792),
    .proxy_in2_792(proxy_in2_792),
    .proxy_in3_792(proxy_in3_792),
    .proxy_sel_LOAD_792(proxy_sel_LOAD_792),
    .proxy_sel_STORE_792(proxy_sel_STORE_792),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .reset(reset),
    .start_port(muxed_in_start_port),
    .ap(muxed_in_ap),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .proxy_out1_792(proxy_out1_792),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) proxy_mux_____ap (.out1(muxed_in_ap),
    .sel(proxy_selector____out_sel),
    .in1(ap),
    .in2(PROXY_PREF_ap));
  MUX_GATE #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) proxy_mux_____start_port (.out1(muxed_in_start_port),
    .sel(proxy_selector____out_sel),
    .in1(start_port),
    .in2(PROXY_PREF_start_port));
  or or_proxy_selector____or_gate( proxy_selector____out_sel, sel___internal_free);
  // io-signal post fix
  assign done_port = tmp_out_done_port;
  assign PROXY_PREF_done_port = tmp_out_done_port;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IUdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UUconvert_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ASSIGN_UNSIGNED_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2020-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_extract_bit_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output out1;
  assign out1 = (in1 >> in2)&1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lut_expr_FU(in1,
  in2,
  in3,
  in4,
  in5,
  in6,
  in7,
  in8,
  in9,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input in2;
  input in3;
  input in4;
  input in5;
  input in6;
  input in7;
  input in8;
  input in9;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  reg[7:0] cleaned_in0;
  wire [7:0] in0;
  wire[BITSIZE_in1-1:0] shifted_s;
  assign in0 = {in9, in8, in7, in6, in5, in4, in3, in2};
  generate
    genvar i0;
    for (i0=0; i0<8; i0=i0+1)
    begin : L0
          always @(*)
          begin
             if (in0[i0] == 1'b1)
                cleaned_in0[i0] = 1'b1;
             else
                cleaned_in0[i0] = 1'b0;
          end
    end
  endgenerate
  assign shifted_s = in1 >> cleaned_in0;
  assign out1[0] = shifted_s[0];
  generate
     if(BITSIZE_out1 > 1)
       assign out1[BITSIZE_out1-1:1] = 0;
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UIdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UIconvert_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module multi_read_cond_FU(in1,
  out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ne_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_and_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 & in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_ior_concat_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1,
    OFFSET_PARAMETER=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  parameter nbit_out = BITSIZE_out1 > OFFSET_PARAMETER ? BITSIZE_out1 : 1+OFFSET_PARAMETER;
  wire [nbit_out-1:0] tmp_in1;
  wire [OFFSET_PARAMETER-1:0] tmp_in2;
  generate
    if(BITSIZE_in1 >= nbit_out)
      assign tmp_in1=in1[nbit_out-1:0];
    else
      assign tmp_in1={{(nbit_out-BITSIZE_in1){1'b0}},in1};
  endgenerate
  generate
    if(BITSIZE_in2 >= OFFSET_PARAMETER)
      assign tmp_in2=in2[OFFSET_PARAMETER-1:0];
    else
      assign tmp_in2={{(OFFSET_PARAMETER-BITSIZE_in2){1'b0}},in2};
  endgenerate
  assign out1 = {tmp_in1[nbit_out-1:OFFSET_PARAMETER] , tmp_in2};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_ior_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 | in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_cond_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != 0 ? in2 : in3;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_mult_expr_FU(clock,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PIPE_PARAMETER=0;
  // IN
  input clock;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
    if(PIPE_PARAMETER==1)
    begin
      reg signed [BITSIZE_out1-1:0] out1_reg;
      assign out1 = out1_reg;
      always @(posedge clock)
      begin
        out1_reg <= in1 * in2;
      end
    end
    else if(PIPE_PARAMETER>1)
    begin
      reg [BITSIZE_in1-1:0] in1_in;
      reg [BITSIZE_in2-1:0] in2_in;
      wire [BITSIZE_out1-1:0] mult_res;
      reg [BITSIZE_out1-1:0] mul [PIPE_PARAMETER-2:0];
      integer i;
      assign mult_res = in1_in * in2_in;
      always @(posedge clock)
      begin
        in1_in <= in1;
        in2_in <= in2;
        mul[PIPE_PARAMETER-2] <= mult_res;
        for (i=0; i<PIPE_PARAMETER-2; i=i+1)
          mul[i] <= mul[i+1];
      end
      assign out1 = mul[0];
    end
    else
    begin
      assign out1 = in1 * in2;
    end
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_ne_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_rshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 >> (in2[arg2_bitsize-1:0]);
    else
      assign out1 = in1 >> in2;
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_ternary_plus_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2 + in3;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bit_and_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 & in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 <<< in2[arg2_bitsize-1:0];
    else
      assign out1 = in1 <<< in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module rshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 >>> (in2[arg2_bitsize-1:0]);
    else
      assign out1 = in1 >>> in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_not_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = ~in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_xor_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 ^ in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_minus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 - in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_ternary_pm_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2 - in3;
endmodule

// Datapath RTL description for __float_adde11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___float_adde11m52b_1023nih(clock,
  reset,
  in_port_a,
  in_port_b,
  return_port,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_32,
  wrenable_reg_33,
  wrenable_reg_34,
  wrenable_reg_35,
  wrenable_reg_36,
  wrenable_reg_37,
  wrenable_reg_38,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9);
  // IN
  input clock;
  input reset;
  input [63:0] in_port_a;
  input [63:0] in_port_b;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
  input wrenable_reg_15;
  input wrenable_reg_16;
  input wrenable_reg_17;
  input wrenable_reg_18;
  input wrenable_reg_19;
  input wrenable_reg_2;
  input wrenable_reg_20;
  input wrenable_reg_21;
  input wrenable_reg_22;
  input wrenable_reg_23;
  input wrenable_reg_24;
  input wrenable_reg_25;
  input wrenable_reg_26;
  input wrenable_reg_27;
  input wrenable_reg_28;
  input wrenable_reg_29;
  input wrenable_reg_3;
  input wrenable_reg_30;
  input wrenable_reg_31;
  input wrenable_reg_32;
  input wrenable_reg_33;
  input wrenable_reg_34;
  input wrenable_reg_35;
  input wrenable_reg_36;
  input wrenable_reg_37;
  input wrenable_reg_38;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [63:0] return_port;
  // Component and signal declarations
  wire [5:0] out_ASSIGN_UNSIGNED_FU_167_i0_fu___float_adde11m52b_1023nih_34790_38299;
  wire [10:0] out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde11m52b_1023nih_34790_38297;
  wire [55:0] out_IUdata_converter_FU_11_i0_fu___float_adde11m52b_1023nih_34790_34941;
  wire [0:0] out_IUdata_converter_FU_164_i0_fu___float_adde11m52b_1023nih_34790_35673;
  wire [0:0] out_IUdata_converter_FU_165_i0_fu___float_adde11m52b_1023nih_34790_35682;
  wire [0:0] out_IUdata_converter_FU_166_i0_fu___float_adde11m52b_1023nih_34790_35688;
  wire [5:0] out_IUdata_converter_FU_23_i0_fu___float_adde11m52b_1023nih_34790_35231;
  wire [63:0] out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_34790_34868;
  wire signed [1:0] out_UIconvert_expr_FU_10_i0_fu___float_adde11m52b_1023nih_34790_34932;
  wire signed [1:0] out_UIconvert_expr_FU_22_i0_fu___float_adde11m52b_1023nih_34790_35222;
  wire signed [6:0] out_UIconvert_expr_FU_25_i0_fu___float_adde11m52b_1023nih_34790_35243;
  wire signed [1:0] out_UIconvert_expr_FU_2_i0_fu___float_adde11m52b_1023nih_34790_34859;
  wire signed [1:0] out_UIdata_converter_FU_37_i0_fu___float_adde11m52b_1023nih_34790_38241;
  wire signed [1:0] out_UIdata_converter_FU_38_i0_fu___float_adde11m52b_1023nih_34790_38251;
  wire signed [1:0] out_UIdata_converter_FU_81_i0_fu___float_adde11m52b_1023nih_34790_38260;
  wire out_UUdata_converter_FU_120_i0_fu___float_adde11m52b_1023nih_34790_38292;
  wire out_UUdata_converter_FU_124_i0_fu___float_adde11m52b_1023nih_34790_38295;
  wire out_UUdata_converter_FU_14_i0_fu___float_adde11m52b_1023nih_34790_35060;
  wire out_UUdata_converter_FU_15_i0_fu___float_adde11m52b_1023nih_34790_35072;
  wire out_UUdata_converter_FU_196_i0_fu___float_adde11m52b_1023nih_34790_35946;
  wire out_UUdata_converter_FU_208_i0_fu___float_adde11m52b_1023nih_34790_38238;
  wire out_UUdata_converter_FU_211_i0_fu___float_adde11m52b_1023nih_34790_38184;
  wire [5:0] out_UUdata_converter_FU_24_i0_fu___float_adde11m52b_1023nih_34790_35234;
  wire out_UUdata_converter_FU_31_i0_fu___float_adde11m52b_1023nih_34790_35335;
  wire signed [6:0] out_bit_and_expr_FU_0_8_8_213_i0_fu___float_adde11m52b_1023nih_34790_35512;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [5:0] out_const_10;
  wire [6:0] out_const_11;
  wire [6:0] out_const_12;
  wire [6:0] out_const_13;
  wire [5:0] out_const_14;
  wire [5:0] out_const_15;
  wire [6:0] out_const_16;
  wire out_const_17;
  wire [1:0] out_const_18;
  wire [2:0] out_const_19;
  wire [2:0] out_const_2;
  wire [3:0] out_const_20;
  wire [4:0] out_const_21;
  wire [5:0] out_const_22;
  wire [15:0] out_const_23;
  wire [32:0] out_const_24;
  wire [51:0] out_const_25;
  wire [24:0] out_const_26;
  wire [5:0] out_const_27;
  wire [4:0] out_const_28;
  wire [5:0] out_const_29;
  wire [3:0] out_const_3;
  wire [21:0] out_const_30;
  wire [53:0] out_const_31;
  wire [24:0] out_const_32;
  wire [12:0] out_const_33;
  wire [5:0] out_const_34;
  wire [3:0] out_const_35;
  wire [4:0] out_const_36;
  wire [5:0] out_const_37;
  wire [5:0] out_const_38;
  wire [4:0] out_const_39;
  wire [4:0] out_const_4;
  wire [5:0] out_const_40;
  wire [5:0] out_const_41;
  wire [2:0] out_const_42;
  wire [3:0] out_const_43;
  wire [4:0] out_const_44;
  wire [5:0] out_const_45;
  wire [4:0] out_const_46;
  wire [5:0] out_const_47;
  wire [63:0] out_const_48;
  wire [3:0] out_const_49;
  wire [5:0] out_const_5;
  wire [4:0] out_const_50;
  wire [5:0] out_const_51;
  wire [5:0] out_const_52;
  wire [4:0] out_const_53;
  wire [5:0] out_const_54;
  wire [5:0] out_const_55;
  wire [1:0] out_const_56;
  wire [2:0] out_const_57;
  wire [3:0] out_const_58;
  wire [5:0] out_const_59;
  wire [6:0] out_const_6;
  wire [5:0] out_const_60;
  wire [4:0] out_const_61;
  wire [5:0] out_const_62;
  wire [5:0] out_const_63;
  wire [3:0] out_const_64;
  wire [5:0] out_const_65;
  wire [5:0] out_const_66;
  wire [4:0] out_const_67;
  wire [5:0] out_const_68;
  wire [5:0] out_const_69;
  wire [3:0] out_const_7;
  wire [2:0] out_const_70;
  wire [3:0] out_const_71;
  wire [4:0] out_const_72;
  wire [63:0] out_const_73;
  wire [30:0] out_const_74;
  wire [4:0] out_const_75;
  wire [3:0] out_const_76;
  wire [4:0] out_const_77;
  wire [27:0] out_const_78;
  wire [31:0] out_const_79;
  wire [6:0] out_const_8;
  wire [8:0] out_const_80;
  wire [63:0] out_const_81;
  wire [4:0] out_const_82;
  wire [5:0] out_const_83;
  wire [15:0] out_const_84;
  wire [10:0] out_const_85;
  wire [10:0] out_const_86;
  wire [63:0] out_const_87;
  wire [15:0] out_const_88;
  wire [31:0] out_const_89;
  wire [2:0] out_const_9;
  wire [31:0] out_const_90;
  wire [31:0] out_const_91;
  wire [51:0] out_const_92;
  wire [54:0] out_const_93;
  wire [55:0] out_const_94;
  wire [62:0] out_const_95;
  wire [63:0] out_const_96;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_214_i0_fu___float_adde11m52b_1023nih_34790_35225;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_215_i0_fu___float_adde11m52b_1023nih_34790_38245;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_215_i1_fu___float_adde11m52b_1023nih_34790_38254;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_215_i2_fu___float_adde11m52b_1023nih_34790_38263;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_216_i0_fu___float_adde11m52b_1023nih_34790_34862;
  wire signed [63:0] out_lshift_expr_FU_64_0_64_216_i1_fu___float_adde11m52b_1023nih_34790_34935;
  wire out_lut_expr_FU_110_i0_fu___float_adde11m52b_1023nih_34790_40699;
  wire out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_34790_40702;
  wire out_lut_expr_FU_112_i0_fu___float_adde11m52b_1023nih_34790_40705;
  wire out_lut_expr_FU_113_i0_fu___float_adde11m52b_1023nih_34790_40708;
  wire out_lut_expr_FU_114_i0_fu___float_adde11m52b_1023nih_34790_40711;
  wire out_lut_expr_FU_115_i0_fu___float_adde11m52b_1023nih_34790_40714;
  wire out_lut_expr_FU_116_i0_fu___float_adde11m52b_1023nih_34790_40717;
  wire out_lut_expr_FU_117_i0_fu___float_adde11m52b_1023nih_34790_40720;
  wire out_lut_expr_FU_118_i0_fu___float_adde11m52b_1023nih_34790_40724;
  wire out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_34790_37267;
  wire out_lut_expr_FU_123_i0_fu___float_adde11m52b_1023nih_34790_37271;
  wire out_lut_expr_FU_12_i0_fu___float_adde11m52b_1023nih_34790_35019;
  wire out_lut_expr_FU_13_i0_fu___float_adde11m52b_1023nih_34790_35027;
  wire out_lut_expr_FU_153_i0_fu___float_adde11m52b_1023nih_34790_40730;
  wire out_lut_expr_FU_154_i0_fu___float_adde11m52b_1023nih_34790_40733;
  wire out_lut_expr_FU_155_i0_fu___float_adde11m52b_1023nih_34790_40736;
  wire out_lut_expr_FU_156_i0_fu___float_adde11m52b_1023nih_34790_40739;
  wire out_lut_expr_FU_157_i0_fu___float_adde11m52b_1023nih_34790_40742;
  wire out_lut_expr_FU_158_i0_fu___float_adde11m52b_1023nih_34790_40745;
  wire out_lut_expr_FU_159_i0_fu___float_adde11m52b_1023nih_34790_40748;
  wire out_lut_expr_FU_160_i0_fu___float_adde11m52b_1023nih_34790_40751;
  wire out_lut_expr_FU_161_i0_fu___float_adde11m52b_1023nih_34790_40754;
  wire out_lut_expr_FU_162_i0_fu___float_adde11m52b_1023nih_34790_40757;
  wire out_lut_expr_FU_163_i0_fu___float_adde11m52b_1023nih_34790_37275;
  wire out_lut_expr_FU_168_i0_fu___float_adde11m52b_1023nih_34790_40763;
  wire out_lut_expr_FU_169_i0_fu___float_adde11m52b_1023nih_34790_40767;
  wire out_lut_expr_FU_170_i0_fu___float_adde11m52b_1023nih_34790_35885;
  wire out_lut_expr_FU_181_i0_fu___float_adde11m52b_1023nih_34790_40772;
  wire out_lut_expr_FU_182_i0_fu___float_adde11m52b_1023nih_34790_40775;
  wire out_lut_expr_FU_183_i0_fu___float_adde11m52b_1023nih_34790_40778;
  wire out_lut_expr_FU_184_i0_fu___float_adde11m52b_1023nih_34790_40781;
  wire out_lut_expr_FU_185_i0_fu___float_adde11m52b_1023nih_34790_40784;
  wire out_lut_expr_FU_186_i0_fu___float_adde11m52b_1023nih_34790_40787;
  wire out_lut_expr_FU_187_i0_fu___float_adde11m52b_1023nih_34790_40790;
  wire out_lut_expr_FU_188_i0_fu___float_adde11m52b_1023nih_34790_40793;
  wire out_lut_expr_FU_189_i0_fu___float_adde11m52b_1023nih_34790_40796;
  wire out_lut_expr_FU_190_i0_fu___float_adde11m52b_1023nih_34790_40799;
  wire out_lut_expr_FU_191_i0_fu___float_adde11m52b_1023nih_34790_40802;
  wire out_lut_expr_FU_192_i0_fu___float_adde11m52b_1023nih_34790_40805;
  wire out_lut_expr_FU_193_i0_fu___float_adde11m52b_1023nih_34790_40808;
  wire out_lut_expr_FU_194_i0_fu___float_adde11m52b_1023nih_34790_40812;
  wire out_lut_expr_FU_195_i0_fu___float_adde11m52b_1023nih_34790_38444;
  wire out_lut_expr_FU_202_i0_fu___float_adde11m52b_1023nih_34790_40818;
  wire out_lut_expr_FU_203_i0_fu___float_adde11m52b_1023nih_34790_38171;
  wire out_lut_expr_FU_206_i0_fu___float_adde11m52b_1023nih_34790_40823;
  wire out_lut_expr_FU_207_i0_fu___float_adde11m52b_1023nih_34790_38471;
  wire out_lut_expr_FU_209_i0_fu___float_adde11m52b_1023nih_34790_40829;
  wire out_lut_expr_FU_210_i0_fu___float_adde11m52b_1023nih_34790_38479;
  wire out_lut_expr_FU_21_i0_fu___float_adde11m52b_1023nih_34790_35219;
  wire out_lut_expr_FU_30_i0_fu___float_adde11m52b_1023nih_34790_35332;
  wire out_lut_expr_FU_32_i0_fu___float_adde11m52b_1023nih_34790_35956;
  wire out_lut_expr_FU_71_i0_fu___float_adde11m52b_1023nih_34790_40668;
  wire out_lut_expr_FU_72_i0_fu___float_adde11m52b_1023nih_34790_40671;
  wire out_lut_expr_FU_73_i0_fu___float_adde11m52b_1023nih_34790_40674;
  wire out_lut_expr_FU_74_i0_fu___float_adde11m52b_1023nih_34790_40677;
  wire out_lut_expr_FU_75_i0_fu___float_adde11m52b_1023nih_34790_40681;
  wire out_lut_expr_FU_76_i0_fu___float_adde11m52b_1023nih_34790_40684;
  wire out_lut_expr_FU_77_i0_fu___float_adde11m52b_1023nih_34790_40687;
  wire out_lut_expr_FU_78_i0_fu___float_adde11m52b_1023nih_34790_40690;
  wire out_lut_expr_FU_79_i0_fu___float_adde11m52b_1023nih_34790_40693;
  wire out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263;
  wire out_lut_expr_FU_9_i0_fu___float_adde11m52b_1023nih_34790_34929;
  wire [10:0] out_reg_0_reg_0;
  wire [52:0] out_reg_10_reg_10;
  wire [52:0] out_reg_11_reg_11;
  wire [10:0] out_reg_12_reg_12;
  wire out_reg_13_reg_13;
  wire out_reg_14_reg_14;
  wire out_reg_15_reg_15;
  wire out_reg_16_reg_16;
  wire out_reg_17_reg_17;
  wire out_reg_18_reg_18;
  wire out_reg_19_reg_19;
  wire [55:0] out_reg_1_reg_1;
  wire out_reg_20_reg_20;
  wire out_reg_21_reg_21;
  wire out_reg_22_reg_22;
  wire [55:0] out_reg_23_reg_23;
  wire [5:0] out_reg_24_reg_24;
  wire [51:0] out_reg_25_reg_25;
  wire [5:0] out_reg_26_reg_26;
  wire out_reg_27_reg_27;
  wire out_reg_28_reg_28;
  wire out_reg_29_reg_29;
  wire out_reg_2_reg_2;
  wire out_reg_30_reg_30;
  wire out_reg_31_reg_31;
  wire out_reg_32_reg_32;
  wire out_reg_33_reg_33;
  wire out_reg_34_reg_34;
  wire out_reg_35_reg_35;
  wire out_reg_36_reg_36;
  wire out_reg_37_reg_37;
  wire out_reg_38_reg_38;
  wire out_reg_3_reg_3;
  wire [54:0] out_reg_4_reg_4;
  wire [6:0] out_reg_5_reg_5;
  wire [6:0] out_reg_6_reg_6;
  wire out_reg_7_reg_7;
  wire [51:0] out_reg_8_reg_8;
  wire out_reg_9_reg_9;
  wire signed [0:0] out_rshift_expr_FU_32_0_32_217_i0_fu___float_adde11m52b_1023nih_34790_35228;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_218_i0_fu___float_adde11m52b_1023nih_34790_38248;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_218_i1_fu___float_adde11m52b_1023nih_34790_38257;
  wire signed [1:0] out_rshift_expr_FU_32_0_32_218_i2_fu___float_adde11m52b_1023nih_34790_38266;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_219_i0_fu___float_adde11m52b_1023nih_34790_34865;
  wire signed [0:0] out_rshift_expr_FU_64_0_64_219_i1_fu___float_adde11m52b_1023nih_34790_34938;
  wire [10:0] out_ui_bit_and_expr_FU_0_16_16_220_i0_fu___float_adde11m52b_1023nih_34790_34990;
  wire [62:0] out_ui_bit_and_expr_FU_0_64_64_221_i0_fu___float_adde11m52b_1023nih_34790_34846;
  wire [62:0] out_ui_bit_and_expr_FU_0_64_64_221_i1_fu___float_adde11m52b_1023nih_34790_34851;
  wire [51:0] out_ui_bit_and_expr_FU_0_64_64_222_i0_fu___float_adde11m52b_1023nih_34790_34984;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_223_i0_fu___float_adde11m52b_1023nih_34790_34920;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_223_i1_fu___float_adde11m52b_1023nih_34790_35900;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_223_i2_fu___float_adde11m52b_1023nih_34790_35964;
  wire [15:0] out_ui_bit_and_expr_FU_16_0_16_224_i0_fu___float_adde11m52b_1023nih_34790_35380;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_225_i0_fu___float_adde11m52b_1023nih_34790_35352;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_226_i0_fu___float_adde11m52b_1023nih_34790_34908;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_226_i1_fu___float_adde11m52b_1023nih_34790_35911;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_226_i2_fu___float_adde11m52b_1023nih_34790_35979;
  wire [54:0] out_ui_bit_and_expr_FU_64_0_64_227_i0_fu___float_adde11m52b_1023nih_34790_35311;
  wire [55:0] out_ui_bit_and_expr_FU_64_0_64_228_i0_fu___float_adde11m52b_1023nih_34790_35326;
  wire [55:0] out_ui_bit_and_expr_FU_64_0_64_228_i1_fu___float_adde11m52b_1023nih_34790_35341;
  wire [63:0] out_ui_bit_and_expr_FU_64_64_64_229_i0_fu___float_adde11m52b_1023nih_34790_34871;
  wire [63:0] out_ui_bit_and_expr_FU_64_64_64_229_i1_fu___float_adde11m52b_1023nih_34790_34877;
  wire [63:0] out_ui_bit_and_expr_FU_64_64_64_229_i2_fu___float_adde11m52b_1023nih_34790_34883;
  wire [63:0] out_ui_bit_and_expr_FU_64_64_64_229_i3_fu___float_adde11m52b_1023nih_34790_34886;
  wire [52:0] out_ui_bit_and_expr_FU_64_64_64_229_i4_fu___float_adde11m52b_1023nih_34790_35286;
  wire [5:0] out_ui_bit_and_expr_FU_8_0_8_230_i0_fu___float_adde11m52b_1023nih_34790_35057;
  wire [5:0] out_ui_bit_and_expr_FU_8_0_8_231_i0_fu___float_adde11m52b_1023nih_34790_35240;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_232_i0_fu___float_adde11m52b_1023nih_34790_38083;
  wire [55:0] out_ui_bit_ior_concat_expr_FU_233_i0_fu___float_adde11m52b_1023nih_34790_35329;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_234_i0_fu___float_adde11m52b_1023nih_34790_35066;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_235_i0_fu___float_adde11m52b_1023nih_34790_35078;
  wire [62:0] out_ui_bit_ior_expr_FU_0_64_64_236_i0_fu___float_adde11m52b_1023nih_34790_35914;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_237_i0_fu___float_adde11m52b_1023nih_34790_36084;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_238_i0_fu___float_adde11m52b_1023nih_34790_36087;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_239_i0_fu___float_adde11m52b_1023nih_34790_35679;
  wire [5:0] out_ui_bit_ior_expr_FU_0_8_8_240_i0_fu___float_adde11m52b_1023nih_34790_35694;
  wire [5:0] out_ui_bit_ior_expr_FU_0_8_8_241_i0_fu___float_adde11m52b_1023nih_34790_35697;
  wire [5:0] out_ui_bit_ior_expr_FU_0_8_8_242_i0_fu___float_adde11m52b_1023nih_34790_35700;
  wire [62:0] out_ui_bit_ior_expr_FU_64_64_64_243_i0_fu___float_adde11m52b_1023nih_34790_34880;
  wire [62:0] out_ui_bit_ior_expr_FU_64_64_64_243_i1_fu___float_adde11m52b_1023nih_34790_34889;
  wire [51:0] out_ui_bit_ior_expr_FU_64_64_64_243_i2_fu___float_adde11m52b_1023nih_34790_36058;
  wire [5:0] out_ui_bit_ior_expr_FU_8_8_8_244_i0_fu___float_adde11m52b_1023nih_34790_35237;
  wire [63:0] out_ui_bit_not_expr_FU_64_64_245_i0_fu___float_adde11m52b_1023nih_34790_34874;
  wire [54:0] out_ui_bit_not_expr_FU_64_64_245_i1_fu___float_adde11m52b_1023nih_34790_35283;
  wire [55:0] out_ui_bit_xor_expr_FU_64_64_64_246_i0_fu___float_adde11m52b_1023nih_34790_35314;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_247_i0_fu___float_adde11m52b_1023nih_34790_38180;
  wire [10:0] out_ui_cond_expr_FU_16_16_16_16_247_i1_fu___float_adde11m52b_1023nih_34790_38236;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_248_i0_fu___float_adde11m52b_1023nih_34790_38182;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_248_i1_fu___float_adde11m52b_1023nih_34790_38186;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_248_i2_fu___float_adde11m52b_1023nih_34790_38190;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_248_i3_fu___float_adde11m52b_1023nih_34790_38196;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_248_i4_fu___float_adde11m52b_1023nih_34790_38204;
  wire [54:0] out_ui_cond_expr_FU_64_64_64_64_248_i5_fu___float_adde11m52b_1023nih_34790_38214;
  wire [51:0] out_ui_cond_expr_FU_64_64_64_64_248_i6_fu___float_adde11m52b_1023nih_34790_38228;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_249_i0_fu___float_adde11m52b_1023nih_34790_38226;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_249_i1_fu___float_adde11m52b_1023nih_34790_38230;
  wire out_ui_eq_expr_FU_0_16_16_250_i0_fu___float_adde11m52b_1023nih_34790_35005;
  wire out_ui_eq_expr_FU_0_16_16_250_i1_fu___float_adde11m52b_1023nih_34790_35008;
  wire out_ui_eq_expr_FU_16_0_16_251_i0_fu___float_adde11m52b_1023nih_34790_34993;
  wire out_ui_eq_expr_FU_16_0_16_251_i1_fu___float_adde11m52b_1023nih_34790_34996;
  wire out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259;
  wire out_ui_eq_expr_FU_16_0_16_253_i0_fu___float_adde11m52b_1023nih_34790_37301;
  wire out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255;
  wire out_ui_extract_bit_expr_FU_100_i0_fu___float_adde11m52b_1023nih_34790_40074;
  wire out_ui_extract_bit_expr_FU_101_i0_fu___float_adde11m52b_1023nih_34790_40078;
  wire out_ui_extract_bit_expr_FU_102_i0_fu___float_adde11m52b_1023nih_34790_39796;
  wire out_ui_extract_bit_expr_FU_103_i0_fu___float_adde11m52b_1023nih_34790_40301;
  wire out_ui_extract_bit_expr_FU_104_i0_fu___float_adde11m52b_1023nih_34790_40305;
  wire out_ui_extract_bit_expr_FU_105_i0_fu___float_adde11m52b_1023nih_34790_40094;
  wire out_ui_extract_bit_expr_FU_106_i0_fu___float_adde11m52b_1023nih_34790_40309;
  wire out_ui_extract_bit_expr_FU_107_i0_fu___float_adde11m52b_1023nih_34790_40102;
  wire out_ui_extract_bit_expr_FU_108_i0_fu___float_adde11m52b_1023nih_34790_40106;
  wire out_ui_extract_bit_expr_FU_109_i0_fu___float_adde11m52b_1023nih_34790_39823;
  wire out_ui_extract_bit_expr_FU_121_i0_fu___float_adde11m52b_1023nih_34790_38578;
  wire out_ui_extract_bit_expr_FU_122_i0_fu___float_adde11m52b_1023nih_34790_38582;
  wire out_ui_extract_bit_expr_FU_125_i0_fu___float_adde11m52b_1023nih_34790_40648;
  wire out_ui_extract_bit_expr_FU_126_i0_fu___float_adde11m52b_1023nih_34790_40652;
  wire out_ui_extract_bit_expr_FU_127_i0_fu___float_adde11m52b_1023nih_34790_40604;
  wire out_ui_extract_bit_expr_FU_128_i0_fu___float_adde11m52b_1023nih_34790_40656;
  wire out_ui_extract_bit_expr_FU_129_i0_fu___float_adde11m52b_1023nih_34790_40612;
  wire out_ui_extract_bit_expr_FU_130_i0_fu___float_adde11m52b_1023nih_34790_40616;
  wire out_ui_extract_bit_expr_FU_131_i0_fu___float_adde11m52b_1023nih_34790_40495;
  wire out_ui_extract_bit_expr_FU_132_i0_fu___float_adde11m52b_1023nih_34790_40620;
  wire out_ui_extract_bit_expr_FU_133_i0_fu___float_adde11m52b_1023nih_34790_40624;
  wire out_ui_extract_bit_expr_FU_134_i0_fu___float_adde11m52b_1023nih_34790_40510;
  wire out_ui_extract_bit_expr_FU_135_i0_fu___float_adde11m52b_1023nih_34790_40628;
  wire out_ui_extract_bit_expr_FU_136_i0_fu___float_adde11m52b_1023nih_34790_40518;
  wire out_ui_extract_bit_expr_FU_137_i0_fu___float_adde11m52b_1023nih_34790_40522;
  wire out_ui_extract_bit_expr_FU_138_i0_fu___float_adde11m52b_1023nih_34790_40353;
  wire out_ui_extract_bit_expr_FU_139_i0_fu___float_adde11m52b_1023nih_34790_40632;
  wire out_ui_extract_bit_expr_FU_140_i0_fu___float_adde11m52b_1023nih_34790_40636;
  wire out_ui_extract_bit_expr_FU_141_i0_fu___float_adde11m52b_1023nih_34790_40538;
  wire out_ui_extract_bit_expr_FU_142_i0_fu___float_adde11m52b_1023nih_34790_40640;
  wire out_ui_extract_bit_expr_FU_143_i0_fu___float_adde11m52b_1023nih_34790_40546;
  wire out_ui_extract_bit_expr_FU_144_i0_fu___float_adde11m52b_1023nih_34790_40550;
  wire out_ui_extract_bit_expr_FU_145_i0_fu___float_adde11m52b_1023nih_34790_40380;
  wire out_ui_extract_bit_expr_FU_146_i0_fu___float_adde11m52b_1023nih_34790_40554;
  wire out_ui_extract_bit_expr_FU_147_i0_fu___float_adde11m52b_1023nih_34790_40558;
  wire out_ui_extract_bit_expr_FU_148_i0_fu___float_adde11m52b_1023nih_34790_40395;
  wire out_ui_extract_bit_expr_FU_149_i0_fu___float_adde11m52b_1023nih_34790_40562;
  wire out_ui_extract_bit_expr_FU_150_i0_fu___float_adde11m52b_1023nih_34790_40403;
  wire out_ui_extract_bit_expr_FU_151_i0_fu___float_adde11m52b_1023nih_34790_40407;
  wire out_ui_extract_bit_expr_FU_152_i0_fu___float_adde11m52b_1023nih_34790_40179;
  wire out_ui_extract_bit_expr_FU_16_i0_fu___float_adde11m52b_1023nih_34790_38685;
  wire out_ui_extract_bit_expr_FU_171_i0_fu___float_adde11m52b_1023nih_34790_40566;
  wire out_ui_extract_bit_expr_FU_172_i0_fu___float_adde11m52b_1023nih_34790_40421;
  wire out_ui_extract_bit_expr_FU_173_i0_fu___float_adde11m52b_1023nih_34790_40644;
  wire out_ui_extract_bit_expr_FU_174_i0_fu___float_adde11m52b_1023nih_34790_40577;
  wire out_ui_extract_bit_expr_FU_175_i0_fu___float_adde11m52b_1023nih_34790_40581;
  wire out_ui_extract_bit_expr_FU_176_i0_fu___float_adde11m52b_1023nih_34790_40446;
  wire out_ui_extract_bit_expr_FU_177_i0_fu___float_adde11m52b_1023nih_34790_40450;
  wire out_ui_extract_bit_expr_FU_178_i0_fu___float_adde11m52b_1023nih_34790_40585;
  wire out_ui_extract_bit_expr_FU_179_i0_fu___float_adde11m52b_1023nih_34790_40589;
  wire out_ui_extract_bit_expr_FU_17_i0_fu___float_adde11m52b_1023nih_34790_38689;
  wire out_ui_extract_bit_expr_FU_180_i0_fu___float_adde11m52b_1023nih_34790_40468;
  wire out_ui_extract_bit_expr_FU_18_i0_fu___float_adde11m52b_1023nih_34790_38693;
  wire out_ui_extract_bit_expr_FU_197_i0_fu___float_adde11m52b_1023nih_34790_38864;
  wire out_ui_extract_bit_expr_FU_198_i0_fu___float_adde11m52b_1023nih_34790_38867;
  wire out_ui_extract_bit_expr_FU_199_i0_fu___float_adde11m52b_1023nih_34790_38871;
  wire out_ui_extract_bit_expr_FU_19_i0_fu___float_adde11m52b_1023nih_34790_38697;
  wire out_ui_extract_bit_expr_FU_200_i0_fu___float_adde11m52b_1023nih_34790_38874;
  wire out_ui_extract_bit_expr_FU_201_i0_fu___float_adde11m52b_1023nih_34790_38878;
  wire out_ui_extract_bit_expr_FU_204_i0_fu___float_adde11m52b_1023nih_34790_38882;
  wire out_ui_extract_bit_expr_FU_205_i0_fu___float_adde11m52b_1023nih_34790_38885;
  wire out_ui_extract_bit_expr_FU_20_i0_fu___float_adde11m52b_1023nih_34790_38701;
  wire out_ui_extract_bit_expr_FU_26_i0_fu___float_adde11m52b_1023nih_34790_38705;
  wire out_ui_extract_bit_expr_FU_27_i0_fu___float_adde11m52b_1023nih_34790_38708;
  wire out_ui_extract_bit_expr_FU_28_i0_fu___float_adde11m52b_1023nih_34790_38712;
  wire out_ui_extract_bit_expr_FU_29_i0_fu___float_adde11m52b_1023nih_34790_38715;
  wire out_ui_extract_bit_expr_FU_33_i0_fu___float_adde11m52b_1023nih_34790_38719;
  wire out_ui_extract_bit_expr_FU_34_i0_fu___float_adde11m52b_1023nih_34790_38722;
  wire out_ui_extract_bit_expr_FU_35_i0_fu___float_adde11m52b_1023nih_34790_38726;
  wire out_ui_extract_bit_expr_FU_36_i0_fu___float_adde11m52b_1023nih_34790_38729;
  wire out_ui_extract_bit_expr_FU_39_i0_fu___float_adde11m52b_1023nih_34790_39968;
  wire out_ui_extract_bit_expr_FU_40_i0_fu___float_adde11m52b_1023nih_34790_39627;
  wire out_ui_extract_bit_expr_FU_41_i0_fu___float_adde11m52b_1023nih_34790_39631;
  wire out_ui_extract_bit_expr_FU_42_i0_fu___float_adde11m52b_1023nih_34790_39316;
  wire out_ui_extract_bit_expr_FU_43_i0_fu___float_adde11m52b_1023nih_34790_39972;
  wire out_ui_extract_bit_expr_FU_44_i0_fu___float_adde11m52b_1023nih_34790_39639;
  wire out_ui_extract_bit_expr_FU_45_i0_fu___float_adde11m52b_1023nih_34790_39643;
  wire out_ui_extract_bit_expr_FU_46_i0_fu___float_adde11m52b_1023nih_34790_39332;
  wire out_ui_extract_bit_expr_FU_47_i0_fu___float_adde11m52b_1023nih_34790_39976;
  wire out_ui_extract_bit_expr_FU_48_i0_fu___float_adde11m52b_1023nih_34790_39651;
  wire out_ui_extract_bit_expr_FU_49_i0_fu___float_adde11m52b_1023nih_34790_39655;
  wire out_ui_extract_bit_expr_FU_50_i0_fu___float_adde11m52b_1023nih_34790_39348;
  wire out_ui_extract_bit_expr_FU_51_i0_fu___float_adde11m52b_1023nih_34790_39980;
  wire out_ui_extract_bit_expr_FU_52_i0_fu___float_adde11m52b_1023nih_34790_39663;
  wire out_ui_extract_bit_expr_FU_53_i0_fu___float_adde11m52b_1023nih_34790_39667;
  wire out_ui_extract_bit_expr_FU_54_i0_fu___float_adde11m52b_1023nih_34790_39364;
  wire out_ui_extract_bit_expr_FU_55_i0_fu___float_adde11m52b_1023nih_34790_39984;
  wire out_ui_extract_bit_expr_FU_56_i0_fu___float_adde11m52b_1023nih_34790_39675;
  wire out_ui_extract_bit_expr_FU_57_i0_fu___float_adde11m52b_1023nih_34790_39679;
  wire out_ui_extract_bit_expr_FU_58_i0_fu___float_adde11m52b_1023nih_34790_39380;
  wire out_ui_extract_bit_expr_FU_59_i0_fu___float_adde11m52b_1023nih_34790_39988;
  wire out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_34790_38671;
  wire out_ui_extract_bit_expr_FU_60_i0_fu___float_adde11m52b_1023nih_34790_39687;
  wire out_ui_extract_bit_expr_FU_61_i0_fu___float_adde11m52b_1023nih_34790_39691;
  wire out_ui_extract_bit_expr_FU_62_i0_fu___float_adde11m52b_1023nih_34790_39396;
  wire out_ui_extract_bit_expr_FU_63_i0_fu___float_adde11m52b_1023nih_34790_39992;
  wire out_ui_extract_bit_expr_FU_64_i0_fu___float_adde11m52b_1023nih_34790_39699;
  wire out_ui_extract_bit_expr_FU_65_i0_fu___float_adde11m52b_1023nih_34790_39703;
  wire out_ui_extract_bit_expr_FU_66_i0_fu___float_adde11m52b_1023nih_34790_39412;
  wire out_ui_extract_bit_expr_FU_67_i0_fu___float_adde11m52b_1023nih_34790_39996;
  wire out_ui_extract_bit_expr_FU_68_i0_fu___float_adde11m52b_1023nih_34790_39711;
  wire out_ui_extract_bit_expr_FU_69_i0_fu___float_adde11m52b_1023nih_34790_39715;
  wire out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_34790_38674;
  wire out_ui_extract_bit_expr_FU_70_i0_fu___float_adde11m52b_1023nih_34790_39428;
  wire out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_34790_38678;
  wire out_ui_extract_bit_expr_FU_82_i0_fu___float_adde11m52b_1023nih_34790_40265;
  wire out_ui_extract_bit_expr_FU_83_i0_fu___float_adde11m52b_1023nih_34790_40269;
  wire out_ui_extract_bit_expr_FU_84_i0_fu___float_adde11m52b_1023nih_34790_40011;
  wire out_ui_extract_bit_expr_FU_85_i0_fu___float_adde11m52b_1023nih_34790_40273;
  wire out_ui_extract_bit_expr_FU_86_i0_fu___float_adde11m52b_1023nih_34790_40019;
  wire out_ui_extract_bit_expr_FU_87_i0_fu___float_adde11m52b_1023nih_34790_40023;
  wire out_ui_extract_bit_expr_FU_88_i0_fu___float_adde11m52b_1023nih_34790_39742;
  wire out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_34790_40277;
  wire out_ui_extract_bit_expr_FU_8_i0_fu___float_adde11m52b_1023nih_34790_38681;
  wire out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_34790_40281;
  wire out_ui_extract_bit_expr_FU_91_i0_fu___float_adde11m52b_1023nih_34790_40039;
  wire out_ui_extract_bit_expr_FU_92_i0_fu___float_adde11m52b_1023nih_34790_40285;
  wire out_ui_extract_bit_expr_FU_93_i0_fu___float_adde11m52b_1023nih_34790_40047;
  wire out_ui_extract_bit_expr_FU_94_i0_fu___float_adde11m52b_1023nih_34790_40051;
  wire out_ui_extract_bit_expr_FU_95_i0_fu___float_adde11m52b_1023nih_34790_39769;
  wire out_ui_extract_bit_expr_FU_96_i0_fu___float_adde11m52b_1023nih_34790_40289;
  wire out_ui_extract_bit_expr_FU_97_i0_fu___float_adde11m52b_1023nih_34790_40293;
  wire out_ui_extract_bit_expr_FU_98_i0_fu___float_adde11m52b_1023nih_34790_40066;
  wire out_ui_extract_bit_expr_FU_99_i0_fu___float_adde11m52b_1023nih_34790_40297;
  wire [54:0] out_ui_lshift_expr_FU_0_64_64_255_i0_fu___float_adde11m52b_1023nih_34790_35280;
  wire [52:0] out_ui_lshift_expr_FU_64_0_64_256_i0_fu___float_adde11m52b_1023nih_34790_35063;
  wire [52:0] out_ui_lshift_expr_FU_64_0_64_256_i1_fu___float_adde11m52b_1023nih_34790_35075;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_256_i2_fu___float_adde11m52b_1023nih_34790_35897;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_256_i3_fu___float_adde11m52b_1023nih_34790_36081;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_257_i0_fu___float_adde11m52b_1023nih_34790_35069;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_257_i1_fu___float_adde11m52b_1023nih_34790_35081;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_258_i0_fu___float_adde11m52b_1023nih_34790_35368;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_259_i0_fu___float_adde11m52b_1023nih_34790_35396;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_260_i0_fu___float_adde11m52b_1023nih_34790_35426;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_261_i0_fu___float_adde11m52b_1023nih_34790_35472;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_262_i0_fu___float_adde11m52b_1023nih_34790_35548;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_263_i0_fu___float_adde11m52b_1023nih_34790_35604;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_264_i0_fu___float_adde11m52b_1023nih_34790_36055;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_265_i0_fu___float_adde11m52b_1023nih_34790_38060;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_265_i1_fu___float_adde11m52b_1023nih_34790_39540;
  wire [55:0] out_ui_lshift_expr_FU_64_0_64_266_i0_fu___float_adde11m52b_1023nih_34790_38079;
  wire [62:0] out_ui_lshift_expr_FU_64_0_64_267_i0_fu___float_adde11m52b_1023nih_34790_38282;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_268_i0_fu___float_adde11m52b_1023nih_34790_38289;
  wire [52:0] out_ui_lshift_expr_FU_64_0_64_269_i0_fu___float_adde11m52b_1023nih_34790_39883;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_270_i0_fu___float_adde11m52b_1023nih_34790_35676;
  wire [4:0] out_ui_lshift_expr_FU_8_0_8_271_i0_fu___float_adde11m52b_1023nih_34790_35685;
  wire [5:0] out_ui_lshift_expr_FU_8_0_8_272_i0_fu___float_adde11m52b_1023nih_34790_35691;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_273_i0_fu___float_adde11m52b_1023nih_34790_38270;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_274_i0_fu___float_adde11m52b_1023nih_34790_38274;
  wire out_ui_lt_expr_FU_16_16_16_275_i0_fu___float_adde11m52b_1023nih_34790_35708;
  wire out_ui_lt_expr_FU_64_64_64_276_i0_fu___float_adde11m52b_1023nih_34790_34856;
  wire [10:0] out_ui_minus_expr_FU_16_16_16_277_i0_fu___float_adde11m52b_1023nih_34790_35052;
  wire out_ui_ne_expr_FU_64_0_64_278_i0_fu___float_adde11m52b_1023nih_34790_34999;
  wire out_ui_ne_expr_FU_64_0_64_278_i1_fu___float_adde11m52b_1023nih_34790_35002;
  wire out_ui_ne_expr_FU_64_0_64_279_i0_fu___float_adde11m52b_1023nih_34790_35289;
  wire [55:0] out_ui_plus_expr_FU_64_64_64_280_i0_fu___float_adde11m52b_1023nih_34790_35338;
  wire [62:0] out_ui_plus_expr_FU_64_64_64_280_i1_fu___float_adde11m52b_1023nih_34790_35949;
  wire [53:0] out_ui_plus_expr_FU_64_64_64_280_i2_fu___float_adde11m52b_1023nih_34790_38076;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_281_i0_fu___float_adde11m52b_1023nih_34790_34911;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_281_i1_fu___float_adde11m52b_1023nih_34790_34987;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_281_i2_fu___float_adde11m52b_1023nih_34790_35961;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_282_i0_fu___float_adde11m52b_1023nih_34790_35349;
  wire [15:0] out_ui_rshift_expr_FU_64_0_64_283_i0_fu___float_adde11m52b_1023nih_34790_35377;
  wire [51:0] out_ui_rshift_expr_FU_64_0_64_284_i0_fu___float_adde11m52b_1023nih_34790_35908;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_285_i0_fu___float_adde11m52b_1023nih_34790_38052;
  wire [53:0] out_ui_rshift_expr_FU_64_0_64_285_i1_fu___float_adde11m52b_1023nih_34790_38070;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_285_i2_fu___float_adde11m52b_1023nih_34790_38074;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_286_i0_fu___float_adde11m52b_1023nih_34790_38056;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_286_i1_fu___float_adde11m52b_1023nih_34790_38063;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_286_i2_fu___float_adde11m52b_1023nih_34790_39533;
  wire [52:0] out_ui_rshift_expr_FU_64_0_64_286_i3_fu___float_adde11m52b_1023nih_34790_39536;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_287_i0_fu___float_adde11m52b_1023nih_34790_38278;
  wire [51:0] out_ui_rshift_expr_FU_64_0_64_288_i0_fu___float_adde11m52b_1023nih_34790_39876;
  wire [51:0] out_ui_rshift_expr_FU_64_0_64_288_i1_fu___float_adde11m52b_1023nih_34790_39879;
  wire [54:0] out_ui_rshift_expr_FU_64_64_64_289_i0_fu___float_adde11m52b_1023nih_34790_35299;
  wire [1:0] out_ui_rshift_expr_FU_64_64_64_289_i1_fu___float_adde11m52b_1023nih_34790_35515;
  wire [10:0] out_ui_ternary_pm_expr_FU_16_0_16_16_290_i0_fu___float_adde11m52b_1023nih_34790_35903;
  
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011000)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110011)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110100)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110110)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011110)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b011111)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0111111)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b010)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10000)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100000)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1000000000000000)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(33),
    .value(33'b100000000000000000000000000000000)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1000000000000000100000000000000010001000100010000000)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(25),
    .value(25'b1000000010000000101000101)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100001)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10001)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100010)) const_29 (.out1(out_const_29));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0100)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(22),
    .value(22'b1000100000010100100111)) const_30 (.out1(out_const_30));
  constant_value #(.BITSIZE_out1(54),
    .value(54'b100010000001010010011100000000000000000000000000000000)) const_31 (.out1(out_const_31));
  constant_value #(.BITSIZE_out1(25),
    .value(25'b1000100010000000000000000)) const_32 (.out1(out_const_32));
  constant_value #(.BITSIZE_out1(13),
    .value(13'b1000100011110)) const_33 (.out1(out_const_33));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100011)) const_34 (.out1(out_const_34));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1001)) const_35 (.out1(out_const_35));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10010)) const_36 (.out1(out_const_36));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100100)) const_37 (.out1(out_const_37));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100101)) const_38 (.out1(out_const_38));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10011)) const_39 (.out1(out_const_39));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01000)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100110)) const_40 (.out1(out_const_40));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100111)) const_41 (.out1(out_const_41));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b101)) const_42 (.out1(out_const_42));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1010)) const_43 (.out1(out_const_43));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10100)) const_44 (.out1(out_const_44));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101001)) const_45 (.out1(out_const_45));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10101)) const_46 (.out1(out_const_46));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101011)) const_47 (.out1(out_const_47));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1010110010101100101011001010110011111111000011111111000000000000)) const_48 (.out1(out_const_48));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1011)) const_49 (.out1(out_const_49));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b010000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10110)) const_50 (.out1(out_const_50));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101100)) const_51 (.out1(out_const_51));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101101)) const_52 (.out1(out_const_52));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10111)) const_53 (.out1(out_const_53));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101110)) const_54 (.out1(out_const_54));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101111)) const_55 (.out1(out_const_55));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_56 (.out1(out_const_56));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b110)) const_57 (.out1(out_const_57));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1100)) const_58 (.out1(out_const_58));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110000)) const_59 (.out1(out_const_59));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110001)) const_60 (.out1(out_const_60));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11001)) const_61 (.out1(out_const_61));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110010)) const_62 (.out1(out_const_62));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110011)) const_63 (.out1(out_const_63));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1101)) const_64 (.out1(out_const_64));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110100)) const_65 (.out1(out_const_65));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110101)) const_66 (.out1(out_const_66));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11011)) const_67 (.out1(out_const_67));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110110)) const_68 (.out1(out_const_68));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110111)) const_69 (.out1(out_const_69));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0101)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_70 (.out1(out_const_70));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1110)) const_71 (.out1(out_const_71));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11100)) const_72 (.out1(out_const_72));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1110010010100000010001000000000011100100111001001110010011100100)) const_73 (.out1(out_const_73));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1110011010100010110001001000000)) const_74 (.out1(out_const_74));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11101)) const_75 (.out1(out_const_75));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1111)) const_76 (.out1(out_const_76));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11110)) const_77 (.out1(out_const_77));
  constant_value #(.BITSIZE_out1(28),
    .value(28'b1111000011100000111100001111)) const_78 (.out1(out_const_78));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11110000111100011111000011110000)) const_79 (.out1(out_const_79));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0101000)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(9),
    .value(9'b111101111)) const_80 (.out1(out_const_80));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111011110110011110101011001000111100110101000101100010010000000)) const_81 (.out1(out_const_81));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11111)) const_82 (.out1(out_const_82));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111111)) const_83 (.out1(out_const_83));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1111111000010000)) const_84 (.out1(out_const_84));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11111111110)) const_85 (.out1(out_const_85));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11111111111)) const_86 (.out1(out_const_86));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111110000000100010001000011111111111100001110111011100000)) const_87 (.out1(out_const_87));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1111111111111111)) const_88 (.out1(out_const_88));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111110110010100000)) const_89 (.out1(out_const_89));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b011)) const_9 (.out1(out_const_9));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111110)) const_90 (.out1(out_const_90));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111111)) const_91 (.out1(out_const_91));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1111111111111111111111111111111111111111111111111111)) const_92 (.out1(out_const_92));
  constant_value #(.BITSIZE_out1(55),
    .value(55'b1111111111111111111111111111111111111111111111111111111)) const_93 (.out1(out_const_93));
  constant_value #(.BITSIZE_out1(56),
    .value(56'b11111111111111111111111111111111111111111111111111111111)) const_94 (.out1(out_const_94));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b111111111111111111111111111111111111111111111111111111111111111)) const_95 (.out1(out_const_95));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111111111111111111111111111111111111111111111111111)) const_96 (.out1(out_const_96));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_34790_34846 (.out1(out_ui_bit_and_expr_FU_0_64_64_221_i0_fu___float_adde11m52b_1023nih_34790_34846),
    .in1(out_const_95),
    .in2(in_port_a));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_34790_34851 (.out1(out_ui_bit_and_expr_FU_0_64_64_221_i1_fu___float_adde11m52b_1023nih_34790_34851),
    .in1(out_const_95),
    .in2(in_port_b));
  ui_lt_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(63),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_34856 (.out1(out_ui_lt_expr_FU_64_64_64_276_i0_fu___float_adde11m52b_1023nih_34790_34856),
    .in1(out_ui_bit_and_expr_FU_0_64_64_221_i0_fu___float_adde11m52b_1023nih_34790_34846),
    .in2(out_ui_bit_and_expr_FU_0_64_64_221_i1_fu___float_adde11m52b_1023nih_34790_34851));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_34790_34859 (.out1(out_UIconvert_expr_FU_2_i0_fu___float_adde11m52b_1023nih_34790_34859),
    .in1(out_ui_lt_expr_FU_64_64_64_276_i0_fu___float_adde11m52b_1023nih_34790_34856));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_34862 (.out1(out_lshift_expr_FU_64_0_64_216_i0_fu___float_adde11m52b_1023nih_34790_34862),
    .in1(out_UIconvert_expr_FU_2_i0_fu___float_adde11m52b_1023nih_34790_34859),
    .in2(out_const_16));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_34865 (.out1(out_rshift_expr_FU_64_0_64_219_i0_fu___float_adde11m52b_1023nih_34790_34865),
    .in1(out_lshift_expr_FU_64_0_64_216_i0_fu___float_adde11m52b_1023nih_34790_34862),
    .in2(out_const_16));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_34790_34868 (.out1(out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_34790_34868),
    .in1(out_rshift_expr_FU_64_0_64_219_i0_fu___float_adde11m52b_1023nih_34790_34865));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_34790_34871 (.out1(out_ui_bit_and_expr_FU_64_64_64_229_i0_fu___float_adde11m52b_1023nih_34790_34871),
    .in1(out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_34790_34868),
    .in2(in_port_b));
  ui_bit_not_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_34790_34874 (.out1(out_ui_bit_not_expr_FU_64_64_245_i0_fu___float_adde11m52b_1023nih_34790_34874),
    .in1(out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_34790_34868));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_34790_34877 (.out1(out_ui_bit_and_expr_FU_64_64_64_229_i1_fu___float_adde11m52b_1023nih_34790_34877),
    .in1(out_ui_bit_not_expr_FU_64_64_245_i0_fu___float_adde11m52b_1023nih_34790_34874),
    .in2(in_port_a));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_34790_34880 (.out1(out_ui_bit_ior_expr_FU_64_64_64_243_i0_fu___float_adde11m52b_1023nih_34790_34880),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i1_fu___float_adde11m52b_1023nih_34790_34877),
    .in2(out_ui_bit_and_expr_FU_64_64_64_229_i0_fu___float_adde11m52b_1023nih_34790_34871));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_34790_34883 (.out1(out_ui_bit_and_expr_FU_64_64_64_229_i2_fu___float_adde11m52b_1023nih_34790_34883),
    .in1(out_IUdata_converter_FU_3_i0_fu___float_adde11m52b_1023nih_34790_34868),
    .in2(in_port_a));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_34790_34886 (.out1(out_ui_bit_and_expr_FU_64_64_64_229_i3_fu___float_adde11m52b_1023nih_34790_34886),
    .in1(out_ui_bit_not_expr_FU_64_64_245_i0_fu___float_adde11m52b_1023nih_34790_34874),
    .in2(in_port_b));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_34790_34889 (.out1(out_ui_bit_ior_expr_FU_64_64_64_243_i1_fu___float_adde11m52b_1023nih_34790_34889),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i3_fu___float_adde11m52b_1023nih_34790_34886),
    .in2(out_ui_bit_and_expr_FU_64_64_64_229_i2_fu___float_adde11m52b_1023nih_34790_34883));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_34790_34908 (.out1(out_ui_bit_and_expr_FU_64_0_64_226_i0_fu___float_adde11m52b_1023nih_34790_34908),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_243_i0_fu___float_adde11m52b_1023nih_34790_34880),
    .in2(out_const_92));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_34911 (.out1(out_ui_rshift_expr_FU_64_0_64_281_i0_fu___float_adde11m52b_1023nih_34790_34911),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_243_i0_fu___float_adde11m52b_1023nih_34790_34880),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_34790_34920 (.out1(out_ui_bit_and_expr_FU_16_0_16_223_i0_fu___float_adde11m52b_1023nih_34790_34920),
    .in1(out_ui_rshift_expr_FU_64_0_64_281_i0_fu___float_adde11m52b_1023nih_34790_34911),
    .in2(out_const_86));
  lut_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_34929 (.out1(out_lut_expr_FU_9_i0_fu___float_adde11m52b_1023nih_34790_34929),
    .in1(out_const_33),
    .in2(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_34790_38671),
    .in3(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_34790_38674),
    .in4(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_34790_38678),
    .in5(out_ui_extract_bit_expr_FU_8_i0_fu___float_adde11m52b_1023nih_34790_38681),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_34790_34932 (.out1(out_UIconvert_expr_FU_10_i0_fu___float_adde11m52b_1023nih_34790_34932),
    .in1(out_lut_expr_FU_9_i0_fu___float_adde11m52b_1023nih_34790_34929));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_34935 (.out1(out_lshift_expr_FU_64_0_64_216_i1_fu___float_adde11m52b_1023nih_34790_34935),
    .in1(out_UIconvert_expr_FU_10_i0_fu___float_adde11m52b_1023nih_34790_34932),
    .in2(out_const_16));
  rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(1),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_34938 (.out1(out_rshift_expr_FU_64_0_64_219_i1_fu___float_adde11m52b_1023nih_34790_34938),
    .in1(out_lshift_expr_FU_64_0_64_216_i1_fu___float_adde11m52b_1023nih_34790_34935),
    .in2(out_const_16));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_34790_34941 (.out1(out_IUdata_converter_FU_11_i0_fu___float_adde11m52b_1023nih_34790_34941),
    .in1(out_rshift_expr_FU_64_0_64_219_i1_fu___float_adde11m52b_1023nih_34790_34938));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(63),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_34790_34984 (.out1(out_ui_bit_and_expr_FU_0_64_64_222_i0_fu___float_adde11m52b_1023nih_34790_34984),
    .in1(out_const_92),
    .in2(out_ui_bit_ior_expr_FU_64_64_64_243_i1_fu___float_adde11m52b_1023nih_34790_34889));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_34987 (.out1(out_ui_rshift_expr_FU_64_0_64_281_i1_fu___float_adde11m52b_1023nih_34790_34987),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_243_i1_fu___float_adde11m52b_1023nih_34790_34889),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_34790_34990 (.out1(out_ui_bit_and_expr_FU_0_16_16_220_i0_fu___float_adde11m52b_1023nih_34790_34990),
    .in1(out_const_86),
    .in2(out_ui_rshift_expr_FU_64_0_64_281_i1_fu___float_adde11m52b_1023nih_34790_34987));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_34993 (.out1(out_ui_eq_expr_FU_16_0_16_251_i0_fu___float_adde11m52b_1023nih_34790_34993),
    .in1(out_ui_bit_and_expr_FU_16_0_16_223_i0_fu___float_adde11m52b_1023nih_34790_34920),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_34996 (.out1(out_ui_eq_expr_FU_16_0_16_251_i1_fu___float_adde11m52b_1023nih_34790_34996),
    .in1(out_ui_bit_and_expr_FU_0_16_16_220_i0_fu___float_adde11m52b_1023nih_34790_34990),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_34999 (.out1(out_ui_ne_expr_FU_64_0_64_278_i0_fu___float_adde11m52b_1023nih_34790_34999),
    .in1(out_ui_bit_and_expr_FU_64_0_64_226_i0_fu___float_adde11m52b_1023nih_34790_34908),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35002 (.out1(out_ui_ne_expr_FU_64_0_64_278_i1_fu___float_adde11m52b_1023nih_34790_35002),
    .in1(out_ui_bit_and_expr_FU_0_64_64_222_i0_fu___float_adde11m52b_1023nih_34790_34984),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35005 (.out1(out_ui_eq_expr_FU_0_16_16_250_i0_fu___float_adde11m52b_1023nih_34790_35005),
    .in1(out_const_86),
    .in2(out_ui_bit_and_expr_FU_16_0_16_223_i0_fu___float_adde11m52b_1023nih_34790_34920));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35008 (.out1(out_ui_eq_expr_FU_0_16_16_250_i1_fu___float_adde11m52b_1023nih_34790_35008),
    .in1(out_const_86),
    .in2(out_ui_bit_and_expr_FU_0_16_16_220_i0_fu___float_adde11m52b_1023nih_34790_34990));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35019 (.out1(out_lut_expr_FU_12_i0_fu___float_adde11m52b_1023nih_34790_35019),
    .in1(out_const_17),
    .in2(out_ui_eq_expr_FU_16_0_16_251_i0_fu___float_adde11m52b_1023nih_34790_34993),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35027 (.out1(out_lut_expr_FU_13_i0_fu___float_adde11m52b_1023nih_34790_35027),
    .in1(out_const_17),
    .in2(out_ui_eq_expr_FU_16_0_16_251_i1_fu___float_adde11m52b_1023nih_34790_34996),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_minus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_34790_35052 (.out1(out_ui_minus_expr_FU_16_16_16_277_i0_fu___float_adde11m52b_1023nih_34790_35052),
    .in1(out_ui_bit_and_expr_FU_16_0_16_223_i0_fu___float_adde11m52b_1023nih_34790_34920),
    .in2(out_ui_bit_and_expr_FU_0_16_16_220_i0_fu___float_adde11m52b_1023nih_34790_34990));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_34790_35057 (.out1(out_ui_bit_and_expr_FU_8_0_8_230_i0_fu___float_adde11m52b_1023nih_34790_35057),
    .in1(out_ui_minus_expr_FU_16_16_16_277_i0_fu___float_adde11m52b_1023nih_34790_35052),
    .in2(out_const_86));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35060 (.out1(out_UUdata_converter_FU_14_i0_fu___float_adde11m52b_1023nih_34790_35060),
    .in1(out_lut_expr_FU_12_i0_fu___float_adde11m52b_1023nih_34790_35019));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35063 (.out1(out_ui_lshift_expr_FU_64_0_64_256_i0_fu___float_adde11m52b_1023nih_34790_35063),
    .in1(out_UUdata_converter_FU_14_i0_fu___float_adde11m52b_1023nih_34790_35060),
    .in2(out_const_12));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu___float_adde11m52b_1023nih_34790_35066 (.out1(out_ui_bit_ior_expr_FU_0_64_64_234_i0_fu___float_adde11m52b_1023nih_34790_35066),
    .in1(out_ui_lshift_expr_FU_64_0_64_256_i0_fu___float_adde11m52b_1023nih_34790_35063),
    .in2(out_ui_bit_and_expr_FU_64_0_64_226_i0_fu___float_adde11m52b_1023nih_34790_34908));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(3),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35069 (.out1(out_ui_lshift_expr_FU_64_0_64_257_i0_fu___float_adde11m52b_1023nih_34790_35069),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_234_i0_fu___float_adde11m52b_1023nih_34790_35066),
    .in2(out_const_2));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35072 (.out1(out_UUdata_converter_FU_15_i0_fu___float_adde11m52b_1023nih_34790_35072),
    .in1(out_lut_expr_FU_13_i0_fu___float_adde11m52b_1023nih_34790_35027));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35075 (.out1(out_ui_lshift_expr_FU_64_0_64_256_i1_fu___float_adde11m52b_1023nih_34790_35075),
    .in1(out_UUdata_converter_FU_15_i0_fu___float_adde11m52b_1023nih_34790_35072),
    .in2(out_const_12));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu___float_adde11m52b_1023nih_34790_35078 (.out1(out_ui_bit_ior_expr_FU_0_64_64_235_i0_fu___float_adde11m52b_1023nih_34790_35078),
    .in1(out_ui_lshift_expr_FU_64_0_64_256_i1_fu___float_adde11m52b_1023nih_34790_35075),
    .in2(out_ui_bit_and_expr_FU_0_64_64_222_i0_fu___float_adde11m52b_1023nih_34790_34984));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(3),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35081 (.out1(out_ui_lshift_expr_FU_64_0_64_257_i1_fu___float_adde11m52b_1023nih_34790_35081),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_235_i0_fu___float_adde11m52b_1023nih_34790_35078),
    .in2(out_const_2));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35219 (.out1(out_lut_expr_FU_21_i0_fu___float_adde11m52b_1023nih_34790_35219),
    .in1(out_const_90),
    .in2(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde11m52b_1023nih_34790_38685),
    .in3(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde11m52b_1023nih_34790_38689),
    .in4(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde11m52b_1023nih_34790_38693),
    .in5(out_ui_extract_bit_expr_FU_19_i0_fu___float_adde11m52b_1023nih_34790_38697),
    .in6(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde11m52b_1023nih_34790_38701),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_34790_35222 (.out1(out_UIconvert_expr_FU_22_i0_fu___float_adde11m52b_1023nih_34790_35222),
    .in1(out_lut_expr_FU_21_i0_fu___float_adde11m52b_1023nih_34790_35219));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_34790_35225 (.out1(out_lshift_expr_FU_32_0_32_214_i0_fu___float_adde11m52b_1023nih_34790_35225),
    .in1(out_UIconvert_expr_FU_22_i0_fu___float_adde11m52b_1023nih_34790_35222),
    .in2(out_const_15));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_34790_35228 (.out1(out_rshift_expr_FU_32_0_32_217_i0_fu___float_adde11m52b_1023nih_34790_35228),
    .in1(out_lshift_expr_FU_32_0_32_214_i0_fu___float_adde11m52b_1023nih_34790_35225),
    .in2(out_const_15));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_34790_35231 (.out1(out_IUdata_converter_FU_23_i0_fu___float_adde11m52b_1023nih_34790_35231),
    .in1(out_rshift_expr_FU_32_0_32_217_i0_fu___float_adde11m52b_1023nih_34790_35228));
  UUdata_converter_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_34790_35234 (.out1(out_UUdata_converter_FU_24_i0_fu___float_adde11m52b_1023nih_34790_35234),
    .in1(out_IUdata_converter_FU_23_i0_fu___float_adde11m52b_1023nih_34790_35231));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_34790_35237 (.out1(out_ui_bit_ior_expr_FU_8_8_8_244_i0_fu___float_adde11m52b_1023nih_34790_35237),
    .in1(out_UUdata_converter_FU_24_i0_fu___float_adde11m52b_1023nih_34790_35234),
    .in2(out_ui_bit_and_expr_FU_8_0_8_230_i0_fu___float_adde11m52b_1023nih_34790_35057));
  ui_bit_and_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_34790_35240 (.out1(out_ui_bit_and_expr_FU_8_0_8_231_i0_fu___float_adde11m52b_1023nih_34790_35240),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_244_i0_fu___float_adde11m52b_1023nih_34790_35237),
    .in2(out_const_83));
  UIconvert_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(7)) fu___float_adde11m52b_1023nih_34790_35243 (.out1(out_UIconvert_expr_FU_25_i0_fu___float_adde11m52b_1023nih_34790_35243),
    .in1(out_ui_bit_and_expr_FU_8_0_8_231_i0_fu___float_adde11m52b_1023nih_34790_35240));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35280 (.out1(out_ui_lshift_expr_FU_0_64_64_255_i0_fu___float_adde11m52b_1023nih_34790_35280),
    .in1(out_const_96),
    .in2(out_UIconvert_expr_FU_25_i0_fu___float_adde11m52b_1023nih_34790_35243));
  ui_bit_not_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_out1(55)) fu___float_adde11m52b_1023nih_34790_35283 (.out1(out_ui_bit_not_expr_FU_64_64_245_i1_fu___float_adde11m52b_1023nih_34790_35283),
    .in1(out_ui_lshift_expr_FU_0_64_64_255_i0_fu___float_adde11m52b_1023nih_34790_35280));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu___float_adde11m52b_1023nih_34790_35286 (.out1(out_ui_bit_and_expr_FU_64_64_64_229_i4_fu___float_adde11m52b_1023nih_34790_35286),
    .in1(out_ui_rshift_expr_FU_64_0_64_285_i0_fu___float_adde11m52b_1023nih_34790_38052),
    .in2(out_ui_rshift_expr_FU_64_0_64_286_i0_fu___float_adde11m52b_1023nih_34790_38056));
  ui_ne_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35289 (.out1(out_ui_ne_expr_FU_64_0_64_279_i0_fu___float_adde11m52b_1023nih_34790_35289),
    .in1(out_reg_10_reg_10),
    .in2(out_const_0));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(7),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35299 (.out1(out_ui_rshift_expr_FU_64_64_64_289_i0_fu___float_adde11m52b_1023nih_34790_35299),
    .in1(out_reg_4_reg_4),
    .in2(out_reg_5_reg_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(55),
    .BITSIZE_out1(55)) fu___float_adde11m52b_1023nih_34790_35311 (.out1(out_ui_bit_and_expr_FU_64_0_64_227_i0_fu___float_adde11m52b_1023nih_34790_35311),
    .in1(out_ui_rshift_expr_FU_64_64_64_289_i0_fu___float_adde11m52b_1023nih_34790_35299),
    .in2(out_const_93));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_34790_35314 (.out1(out_ui_bit_xor_expr_FU_64_64_64_246_i0_fu___float_adde11m52b_1023nih_34790_35314),
    .in1(out_ui_bit_and_expr_FU_64_0_64_227_i0_fu___float_adde11m52b_1023nih_34790_35311),
    .in2(out_reg_1_reg_1));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_34790_35326 (.out1(out_ui_bit_and_expr_FU_64_0_64_228_i0_fu___float_adde11m52b_1023nih_34790_35326),
    .in1(out_ui_bit_xor_expr_FU_64_64_64_246_i0_fu___float_adde11m52b_1023nih_34790_35314),
    .in2(out_const_94));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(56),
    .OFFSET_PARAMETER(2)) fu___float_adde11m52b_1023nih_34790_35329 (.out1(out_ui_bit_ior_concat_expr_FU_233_i0_fu___float_adde11m52b_1023nih_34790_35329),
    .in1(out_ui_lshift_expr_FU_64_0_64_266_i0_fu___float_adde11m52b_1023nih_34790_38079),
    .in2(out_ui_bit_and_expr_FU_8_0_8_232_i0_fu___float_adde11m52b_1023nih_34790_38083),
    .in3(out_const_18));
  lut_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35332 (.out1(out_lut_expr_FU_30_i0_fu___float_adde11m52b_1023nih_34790_35332),
    .in1(out_const_33),
    .in2(out_reg_13_reg_13),
    .in3(out_reg_14_reg_14),
    .in4(out_reg_15_reg_15),
    .in5(out_reg_16_reg_16),
    .in6(out_ui_ne_expr_FU_64_0_64_279_i0_fu___float_adde11m52b_1023nih_34790_35289),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35335 (.out1(out_UUdata_converter_FU_31_i0_fu___float_adde11m52b_1023nih_34790_35335),
    .in1(out_lut_expr_FU_30_i0_fu___float_adde11m52b_1023nih_34790_35332));
  ui_plus_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_34790_35338 (.out1(out_ui_plus_expr_FU_64_64_64_280_i0_fu___float_adde11m52b_1023nih_34790_35338),
    .in1(out_ui_bit_ior_concat_expr_FU_233_i0_fu___float_adde11m52b_1023nih_34790_35329),
    .in2(out_UUdata_converter_FU_31_i0_fu___float_adde11m52b_1023nih_34790_35335));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(56),
    .BITSIZE_out1(56)) fu___float_adde11m52b_1023nih_34790_35341 (.out1(out_ui_bit_and_expr_FU_64_0_64_228_i1_fu___float_adde11m52b_1023nih_34790_35341),
    .in1(out_reg_23_reg_23),
    .in2(out_const_94));
  ui_rshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35349 (.out1(out_ui_rshift_expr_FU_64_0_64_282_i0_fu___float_adde11m52b_1023nih_34790_35349),
    .in1(out_ui_bit_and_expr_FU_64_0_64_228_i1_fu___float_adde11m52b_1023nih_34790_35341),
    .in2(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu___float_adde11m52b_1023nih_34790_35352 (.out1(out_ui_bit_and_expr_FU_32_0_32_225_i0_fu___float_adde11m52b_1023nih_34790_35352),
    .in1(out_ui_rshift_expr_FU_64_0_64_282_i0_fu___float_adde11m52b_1023nih_34790_35349),
    .in2(out_const_91));
  ui_lshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35368 (.out1(out_ui_lshift_expr_FU_64_0_64_258_i0_fu___float_adde11m52b_1023nih_34790_35368),
    .in1(out_ui_bit_and_expr_FU_64_0_64_228_i1_fu___float_adde11m52b_1023nih_34790_35341),
    .in2(out_const_6));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(16),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35377 (.out1(out_ui_rshift_expr_FU_64_0_64_283_i0_fu___float_adde11m52b_1023nih_34790_35377),
    .in1(out_ui_cond_expr_FU_64_64_64_64_248_i1_fu___float_adde11m52b_1023nih_34790_38186),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(16),
    .BITSIZE_out1(16)) fu___float_adde11m52b_1023nih_34790_35380 (.out1(out_ui_bit_and_expr_FU_16_0_16_224_i0_fu___float_adde11m52b_1023nih_34790_35380),
    .in1(out_ui_rshift_expr_FU_64_0_64_283_i0_fu___float_adde11m52b_1023nih_34790_35377),
    .in2(out_const_88));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35396 (.out1(out_ui_lshift_expr_FU_64_0_64_259_i0_fu___float_adde11m52b_1023nih_34790_35396),
    .in1(out_ui_cond_expr_FU_64_64_64_64_248_i1_fu___float_adde11m52b_1023nih_34790_38186),
    .in2(out_const_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35426 (.out1(out_ui_lshift_expr_FU_64_0_64_260_i0_fu___float_adde11m52b_1023nih_34790_35426),
    .in1(out_ui_cond_expr_FU_64_64_64_64_248_i2_fu___float_adde11m52b_1023nih_34790_38190),
    .in2(out_const_4));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(4),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35472 (.out1(out_ui_lshift_expr_FU_64_0_64_261_i0_fu___float_adde11m52b_1023nih_34790_35472),
    .in1(out_ui_cond_expr_FU_64_64_64_64_248_i3_fu___float_adde11m52b_1023nih_34790_38196),
    .in2(out_const_3));
  bit_and_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_in2(7),
    .BITSIZE_out1(7)) fu___float_adde11m52b_1023nih_34790_35512 (.out1(out_bit_and_expr_FU_0_8_8_213_i0_fu___float_adde11m52b_1023nih_34790_35512),
    .in1(out_const_13),
    .in2(out_const_16));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35515 (.out1(out_ui_rshift_expr_FU_64_64_64_289_i1_fu___float_adde11m52b_1023nih_34790_35515),
    .in1(out_ui_cond_expr_FU_64_64_64_64_248_i4_fu___float_adde11m52b_1023nih_34790_38204),
    .in2(out_reg_6_reg_6));
  ui_lshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(3),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35548 (.out1(out_ui_lshift_expr_FU_64_0_64_262_i0_fu___float_adde11m52b_1023nih_34790_35548),
    .in1(out_ui_cond_expr_FU_64_64_64_64_248_i4_fu___float_adde11m52b_1023nih_34790_38204),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35604 (.out1(out_ui_lshift_expr_FU_64_0_64_263_i0_fu___float_adde11m52b_1023nih_34790_35604),
    .in1(out_ui_cond_expr_FU_64_64_64_64_248_i5_fu___float_adde11m52b_1023nih_34790_38214),
    .in2(out_const_1));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35673 (.out1(out_IUdata_converter_FU_164_i0_fu___float_adde11m52b_1023nih_34790_35673),
    .in1(out_rshift_expr_FU_32_0_32_218_i2_fu___float_adde11m52b_1023nih_34790_38266));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35676 (.out1(out_ui_lshift_expr_FU_8_0_8_270_i0_fu___float_adde11m52b_1023nih_34790_35676),
    .in1(out_IUdata_converter_FU_164_i0_fu___float_adde11m52b_1023nih_34790_35673),
    .in2(out_const_9));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu___float_adde11m52b_1023nih_34790_35679 (.out1(out_ui_bit_ior_expr_FU_0_8_8_239_i0_fu___float_adde11m52b_1023nih_34790_35679),
    .in1(out_ui_lshift_expr_FU_8_0_8_273_i0_fu___float_adde11m52b_1023nih_34790_38270),
    .in2(out_ui_lshift_expr_FU_8_0_8_270_i0_fu___float_adde11m52b_1023nih_34790_35676));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35682 (.out1(out_IUdata_converter_FU_165_i0_fu___float_adde11m52b_1023nih_34790_35682),
    .in1(out_rshift_expr_FU_32_0_32_218_i1_fu___float_adde11m52b_1023nih_34790_38257));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(5),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35685 (.out1(out_ui_lshift_expr_FU_8_0_8_271_i0_fu___float_adde11m52b_1023nih_34790_35685),
    .in1(out_IUdata_converter_FU_165_i0_fu___float_adde11m52b_1023nih_34790_35682),
    .in2(out_const_3));
  IUdata_converter_FU #(.BITSIZE_in1(2),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35688 (.out1(out_IUdata_converter_FU_166_i0_fu___float_adde11m52b_1023nih_34790_35688),
    .in1(out_rshift_expr_FU_32_0_32_218_i0_fu___float_adde11m52b_1023nih_34790_38248));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(6),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35691 (.out1(out_ui_lshift_expr_FU_8_0_8_272_i0_fu___float_adde11m52b_1023nih_34790_35691),
    .in1(out_IUdata_converter_FU_166_i0_fu___float_adde11m52b_1023nih_34790_35688),
    .in2(out_const_7));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_in2(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_34790_35694 (.out1(out_ui_bit_ior_expr_FU_0_8_8_240_i0_fu___float_adde11m52b_1023nih_34790_35694),
    .in1(out_ui_lshift_expr_FU_8_0_8_271_i0_fu___float_adde11m52b_1023nih_34790_35685),
    .in2(out_ui_lshift_expr_FU_8_0_8_272_i0_fu___float_adde11m52b_1023nih_34790_35691));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(4),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_34790_35697 (.out1(out_ui_bit_ior_expr_FU_0_8_8_241_i0_fu___float_adde11m52b_1023nih_34790_35697),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_240_i0_fu___float_adde11m52b_1023nih_34790_35694),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_239_i0_fu___float_adde11m52b_1023nih_34790_35679));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(2),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_34790_35700 (.out1(out_ui_bit_ior_expr_FU_0_8_8_242_i0_fu___float_adde11m52b_1023nih_34790_35700),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_241_i0_fu___float_adde11m52b_1023nih_34790_35697),
    .in2(out_ui_cond_expr_FU_8_8_8_8_249_i1_fu___float_adde11m52b_1023nih_34790_38230));
  ui_lt_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(6),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35708 (.out1(out_ui_lt_expr_FU_16_16_16_275_i0_fu___float_adde11m52b_1023nih_34790_35708),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_24_reg_24));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35885 (.out1(out_lut_expr_FU_170_i0_fu___float_adde11m52b_1023nih_34790_35885),
    .in1(out_const_79),
    .in2(out_reg_27_reg_27),
    .in3(out_reg_28_reg_28),
    .in4(out_ui_lt_expr_FU_16_16_16_275_i0_fu___float_adde11m52b_1023nih_34790_35708),
    .in5(out_reg_30_reg_30),
    .in6(out_reg_31_reg_31),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(7),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35897 (.out1(out_ui_lshift_expr_FU_64_0_64_256_i2_fu___float_adde11m52b_1023nih_34790_35897),
    .in1(out_ui_bit_and_expr_FU_16_0_16_223_i1_fu___float_adde11m52b_1023nih_34790_35900),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_34790_35900 (.out1(out_ui_bit_and_expr_FU_16_0_16_223_i1_fu___float_adde11m52b_1023nih_34790_35900),
    .in1(out_ui_ternary_pm_expr_FU_16_0_16_16_290_i0_fu___float_adde11m52b_1023nih_34790_35903),
    .in2(out_const_86));
  ui_ternary_pm_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_in3(6),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_34790_35903 (.out1(out_ui_ternary_pm_expr_FU_16_0_16_16_290_i0_fu___float_adde11m52b_1023nih_34790_35903),
    .in1(out_reg_12_reg_12),
    .in2(out_const_17),
    .in3(out_reg_26_reg_26));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(3),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35908 (.out1(out_ui_rshift_expr_FU_64_0_64_284_i0_fu___float_adde11m52b_1023nih_34790_35908),
    .in1(out_ui_lshift_expr_FU_64_0_64_265_i1_fu___float_adde11m52b_1023nih_34790_39540),
    .in2(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_34790_35911 (.out1(out_ui_bit_and_expr_FU_64_0_64_226_i1_fu___float_adde11m52b_1023nih_34790_35911),
    .in1(out_ui_rshift_expr_FU_64_0_64_284_i0_fu___float_adde11m52b_1023nih_34790_35908),
    .in2(out_const_92));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_34790_35914 (.out1(out_ui_bit_ior_expr_FU_0_64_64_236_i0_fu___float_adde11m52b_1023nih_34790_35914),
    .in1(out_reg_25_reg_25),
    .in2(out_ui_lshift_expr_FU_64_0_64_267_i0_fu___float_adde11m52b_1023nih_34790_38282));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35946 (.out1(out_UUdata_converter_FU_196_i0_fu___float_adde11m52b_1023nih_34790_35946),
    .in1(out_lut_expr_FU_195_i0_fu___float_adde11m52b_1023nih_34790_38444));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu___float_adde11m52b_1023nih_34790_35949 (.out1(out_ui_plus_expr_FU_64_64_64_280_i1_fu___float_adde11m52b_1023nih_34790_35949),
    .in1(out_UUdata_converter_FU_196_i0_fu___float_adde11m52b_1023nih_34790_35946),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_236_i0_fu___float_adde11m52b_1023nih_34790_35914));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_35956 (.out1(out_lut_expr_FU_32_i0_fu___float_adde11m52b_1023nih_34790_35956),
    .in1(out_const_71),
    .in2(out_ui_eq_expr_FU_0_16_16_250_i1_fu___float_adde11m52b_1023nih_34790_35008),
    .in3(out_ui_eq_expr_FU_0_16_16_250_i0_fu___float_adde11m52b_1023nih_34790_35005),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_35961 (.out1(out_ui_rshift_expr_FU_64_0_64_281_i2_fu___float_adde11m52b_1023nih_34790_35961),
    .in1(out_ui_plus_expr_FU_64_64_64_280_i1_fu___float_adde11m52b_1023nih_34790_35949),
    .in2(out_const_12));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_34790_35964 (.out1(out_ui_bit_and_expr_FU_16_0_16_223_i2_fu___float_adde11m52b_1023nih_34790_35964),
    .in1(out_ui_rshift_expr_FU_64_0_64_281_i2_fu___float_adde11m52b_1023nih_34790_35961),
    .in2(out_const_86));
  ui_bit_and_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_34790_35979 (.out1(out_ui_bit_and_expr_FU_64_0_64_226_i2_fu___float_adde11m52b_1023nih_34790_35979),
    .in1(out_ui_plus_expr_FU_64_64_64_280_i1_fu___float_adde11m52b_1023nih_34790_35949),
    .in2(out_const_92));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_36055 (.out1(out_ui_lshift_expr_FU_64_0_64_264_i0_fu___float_adde11m52b_1023nih_34790_36055),
    .in1(out_UUdata_converter_FU_211_i0_fu___float_adde11m52b_1023nih_34790_38184),
    .in2(out_const_11));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_34790_36058 (.out1(out_ui_bit_ior_expr_FU_64_64_64_243_i2_fu___float_adde11m52b_1023nih_34790_36058),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_cond_expr_FU_64_64_64_64_248_i0_fu___float_adde11m52b_1023nih_34790_38182));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(7),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_36081 (.out1(out_ui_lshift_expr_FU_64_0_64_256_i3_fu___float_adde11m52b_1023nih_34790_36081),
    .in1(out_ui_cond_expr_FU_16_16_16_16_247_i0_fu___float_adde11m52b_1023nih_34790_38180),
    .in2(out_const_12));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(52),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_34790_36084 (.out1(out_ui_bit_ior_expr_FU_0_64_64_237_i0_fu___float_adde11m52b_1023nih_34790_36084),
    .in1(out_ui_lshift_expr_FU_64_0_64_268_i0_fu___float_adde11m52b_1023nih_34790_38289),
    .in2(out_ui_bit_ior_expr_FU_64_64_64_243_i2_fu___float_adde11m52b_1023nih_34790_36058));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(63),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_34790_36087 (.out1(out_ui_bit_ior_expr_FU_0_64_64_238_i0_fu___float_adde11m52b_1023nih_34790_36087),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_237_i0_fu___float_adde11m52b_1023nih_34790_36084),
    .in2(out_ui_lshift_expr_FU_64_0_64_256_i3_fu___float_adde11m52b_1023nih_34790_36081));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_37255 (.out1(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in1(out_ui_bit_and_expr_FU_32_0_32_225_i0_fu___float_adde11m52b_1023nih_34790_35352),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_37259 (.out1(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in1(out_ui_bit_and_expr_FU_16_0_16_224_i0_fu___float_adde11m52b_1023nih_34790_35380),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_37263 (.out1(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263),
    .in1(out_const_24),
    .in2(out_lut_expr_FU_71_i0_fu___float_adde11m52b_1023nih_34790_40668),
    .in3(out_lut_expr_FU_72_i0_fu___float_adde11m52b_1023nih_34790_40671),
    .in4(out_lut_expr_FU_73_i0_fu___float_adde11m52b_1023nih_34790_40674),
    .in5(out_lut_expr_FU_74_i0_fu___float_adde11m52b_1023nih_34790_40677),
    .in6(out_lut_expr_FU_75_i0_fu___float_adde11m52b_1023nih_34790_40681),
    .in7(out_lut_expr_FU_79_i0_fu___float_adde11m52b_1023nih_34790_40693),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_37267 (.out1(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_34790_37267),
    .in1(out_const_31),
    .in2(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263),
    .in3(out_lut_expr_FU_110_i0_fu___float_adde11m52b_1023nih_34790_40699),
    .in4(out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_34790_40702),
    .in5(out_lut_expr_FU_112_i0_fu___float_adde11m52b_1023nih_34790_40705),
    .in6(out_lut_expr_FU_113_i0_fu___float_adde11m52b_1023nih_34790_40708),
    .in7(out_lut_expr_FU_118_i0_fu___float_adde11m52b_1023nih_34790_40724),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_37271 (.out1(out_lut_expr_FU_123_i0_fu___float_adde11m52b_1023nih_34790_37271),
    .in1(out_const_17),
    .in2(out_ui_extract_bit_expr_FU_121_i0_fu___float_adde11m52b_1023nih_34790_38578),
    .in3(out_ui_extract_bit_expr_FU_122_i0_fu___float_adde11m52b_1023nih_34790_38582),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(9),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_37275 (.out1(out_lut_expr_FU_163_i0_fu___float_adde11m52b_1023nih_34790_37275),
    .in1(out_const_80),
    .in2(out_ui_extract_bit_expr_FU_121_i0_fu___float_adde11m52b_1023nih_34790_38578),
    .in3(out_ui_extract_bit_expr_FU_122_i0_fu___float_adde11m52b_1023nih_34790_38582),
    .in4(out_lut_expr_FU_157_i0_fu___float_adde11m52b_1023nih_34790_40742),
    .in5(out_lut_expr_FU_162_i0_fu___float_adde11m52b_1023nih_34790_40757),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_37301 (.out1(out_ui_eq_expr_FU_16_0_16_253_i0_fu___float_adde11m52b_1023nih_34790_37301),
    .in1(out_ui_bit_and_expr_FU_16_0_16_223_i0_fu___float_adde11m52b_1023nih_34790_34920),
    .in2(out_const_85));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_38052 (.out1(out_ui_rshift_expr_FU_64_0_64_285_i0_fu___float_adde11m52b_1023nih_34790_38052),
    .in1(out_ui_bit_not_expr_FU_64_64_245_i1_fu___float_adde11m52b_1023nih_34790_35283),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_38056 (.out1(out_ui_rshift_expr_FU_64_0_64_286_i0_fu___float_adde11m52b_1023nih_34790_38056),
    .in1(out_ui_lshift_expr_FU_64_0_64_257_i1_fu___float_adde11m52b_1023nih_34790_35081),
    .in2(out_const_18));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_38060 (.out1(out_ui_lshift_expr_FU_64_0_64_265_i0_fu___float_adde11m52b_1023nih_34790_38060),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i4_fu___float_adde11m52b_1023nih_34790_35286),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_38063 (.out1(out_ui_rshift_expr_FU_64_0_64_286_i1_fu___float_adde11m52b_1023nih_34790_38063),
    .in1(out_ui_lshift_expr_FU_64_0_64_265_i0_fu___float_adde11m52b_1023nih_34790_38060),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_out1(54),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_38070 (.out1(out_ui_rshift_expr_FU_64_0_64_285_i1_fu___float_adde11m52b_1023nih_34790_38070),
    .in1(out_ui_bit_and_expr_FU_64_0_64_228_i0_fu___float_adde11m52b_1023nih_34790_35326),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_38074 (.out1(out_ui_rshift_expr_FU_64_0_64_285_i2_fu___float_adde11m52b_1023nih_34790_38074),
    .in1(out_ui_lshift_expr_FU_64_0_64_257_i0_fu___float_adde11m52b_1023nih_34790_35069),
    .in2(out_const_18));
  ui_plus_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(53),
    .BITSIZE_out1(54)) fu___float_adde11m52b_1023nih_34790_38076 (.out1(out_ui_plus_expr_FU_64_64_64_280_i2_fu___float_adde11m52b_1023nih_34790_38076),
    .in1(out_ui_rshift_expr_FU_64_0_64_285_i1_fu___float_adde11m52b_1023nih_34790_38070),
    .in2(out_reg_11_reg_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(2),
    .BITSIZE_out1(56),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_38079 (.out1(out_ui_lshift_expr_FU_64_0_64_266_i0_fu___float_adde11m52b_1023nih_34790_38079),
    .in1(out_ui_plus_expr_FU_64_64_64_280_i2_fu___float_adde11m52b_1023nih_34790_38076),
    .in2(out_const_18));
  ui_bit_and_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_34790_38083 (.out1(out_ui_bit_and_expr_FU_8_0_8_232_i0_fu___float_adde11m52b_1023nih_34790_38083),
    .in1(out_ui_bit_and_expr_FU_64_0_64_228_i0_fu___float_adde11m52b_1023nih_34790_35326),
    .in2(out_const_56));
  lut_expr_FU #(.BITSIZE_in1(25),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_38171 (.out1(out_lut_expr_FU_203_i0_fu___float_adde11m52b_1023nih_34790_38171),
    .in1(out_const_32),
    .in2(out_reg_3_reg_3),
    .in3(out_reg_2_reg_2),
    .in4(out_reg_29_reg_29),
    .in5(out_reg_9_reg_9),
    .in6(out_lut_expr_FU_202_i0_fu___float_adde11m52b_1023nih_34790_40818),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(11),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_34790_38180 (.out1(out_ui_cond_expr_FU_16_16_16_16_247_i0_fu___float_adde11m52b_1023nih_34790_38180),
    .in1(out_reg_7_reg_7),
    .in2(out_const_86),
    .in3(out_ui_bit_and_expr_FU_16_0_16_223_i2_fu___float_adde11m52b_1023nih_34790_35964));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(1),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_34790_38182 (.out1(out_ui_cond_expr_FU_64_64_64_64_248_i0_fu___float_adde11m52b_1023nih_34790_38182),
    .in1(out_lut_expr_FU_203_i0_fu___float_adde11m52b_1023nih_34790_38171),
    .in2(out_ui_bit_and_expr_FU_64_0_64_226_i2_fu___float_adde11m52b_1023nih_34790_35979),
    .in3(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_38184 (.out1(out_UUdata_converter_FU_211_i0_fu___float_adde11m52b_1023nih_34790_38184),
    .in1(out_lut_expr_FU_210_i0_fu___float_adde11m52b_1023nih_34790_38479));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(56),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_34790_38186 (.out1(out_ui_cond_expr_FU_64_64_64_64_248_i1_fu___float_adde11m52b_1023nih_34790_38186),
    .in1(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in2(out_ui_lshift_expr_FU_64_0_64_258_i0_fu___float_adde11m52b_1023nih_34790_35368),
    .in3(out_ui_bit_and_expr_FU_64_0_64_228_i1_fu___float_adde11m52b_1023nih_34790_35341));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_34790_38190 (.out1(out_ui_cond_expr_FU_64_64_64_64_248_i2_fu___float_adde11m52b_1023nih_34790_38190),
    .in1(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in2(out_ui_lshift_expr_FU_64_0_64_259_i0_fu___float_adde11m52b_1023nih_34790_35396),
    .in3(out_ui_cond_expr_FU_64_64_64_64_248_i1_fu___float_adde11m52b_1023nih_34790_38186));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_34790_38196 (.out1(out_ui_cond_expr_FU_64_64_64_64_248_i3_fu___float_adde11m52b_1023nih_34790_38196),
    .in1(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263),
    .in2(out_ui_lshift_expr_FU_64_0_64_260_i0_fu___float_adde11m52b_1023nih_34790_35426),
    .in3(out_ui_cond_expr_FU_64_64_64_64_248_i2_fu___float_adde11m52b_1023nih_34790_38190));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu___float_adde11m52b_1023nih_34790_38204 (.out1(out_ui_cond_expr_FU_64_64_64_64_248_i4_fu___float_adde11m52b_1023nih_34790_38204),
    .in1(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_34790_37267),
    .in2(out_ui_lshift_expr_FU_64_0_64_261_i0_fu___float_adde11m52b_1023nih_34790_35472),
    .in3(out_ui_cond_expr_FU_64_64_64_64_248_i3_fu___float_adde11m52b_1023nih_34790_38196));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(55),
    .BITSIZE_in3(64),
    .BITSIZE_out1(55)) fu___float_adde11m52b_1023nih_34790_38214 (.out1(out_ui_cond_expr_FU_64_64_64_64_248_i5_fu___float_adde11m52b_1023nih_34790_38214),
    .in1(out_lut_expr_FU_123_i0_fu___float_adde11m52b_1023nih_34790_37271),
    .in2(out_ui_lshift_expr_FU_64_0_64_262_i0_fu___float_adde11m52b_1023nih_34790_35548),
    .in3(out_ui_cond_expr_FU_64_64_64_64_248_i4_fu___float_adde11m52b_1023nih_34790_38204));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_34790_38226 (.out1(out_ui_cond_expr_FU_8_8_8_8_249_i0_fu___float_adde11m52b_1023nih_34790_38226),
    .in1(out_lut_expr_FU_123_i0_fu___float_adde11m52b_1023nih_34790_37271),
    .in2(out_const_56),
    .in3(out_const_17));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(52),
    .BITSIZE_in3(52),
    .BITSIZE_out1(52)) fu___float_adde11m52b_1023nih_34790_38228 (.out1(out_ui_cond_expr_FU_64_64_64_64_248_i6_fu___float_adde11m52b_1023nih_34790_38228),
    .in1(out_lut_expr_FU_163_i0_fu___float_adde11m52b_1023nih_34790_37275),
    .in2(out_ui_rshift_expr_FU_64_0_64_288_i0_fu___float_adde11m52b_1023nih_34790_39876),
    .in3(out_ui_rshift_expr_FU_64_0_64_288_i1_fu___float_adde11m52b_1023nih_34790_39879));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_34790_38230 (.out1(out_ui_cond_expr_FU_8_8_8_8_249_i1_fu___float_adde11m52b_1023nih_34790_38230),
    .in1(out_lut_expr_FU_163_i0_fu___float_adde11m52b_1023nih_34790_37275),
    .in2(out_ui_cond_expr_FU_8_8_8_8_249_i0_fu___float_adde11m52b_1023nih_34790_38226),
    .in3(out_ui_lshift_expr_FU_8_0_8_274_i0_fu___float_adde11m52b_1023nih_34790_38274));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_34790_38236 (.out1(out_ui_cond_expr_FU_16_16_16_16_247_i1_fu___float_adde11m52b_1023nih_34790_38236),
    .in1(out_lut_expr_FU_170_i0_fu___float_adde11m52b_1023nih_34790_35885),
    .in2(out_const_0),
    .in3(out_ui_rshift_expr_FU_64_0_64_287_i0_fu___float_adde11m52b_1023nih_34790_38278));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_38238 (.out1(out_UUdata_converter_FU_208_i0_fu___float_adde11m52b_1023nih_34790_38238),
    .in1(out_lut_expr_FU_207_i0_fu___float_adde11m52b_1023nih_34790_38471));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_34790_38241 (.out1(out_UIdata_converter_FU_37_i0_fu___float_adde11m52b_1023nih_34790_38241),
    .in1(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_34790_38245 (.out1(out_lshift_expr_FU_32_0_32_215_i0_fu___float_adde11m52b_1023nih_34790_38245),
    .in1(out_UIdata_converter_FU_37_i0_fu___float_adde11m52b_1023nih_34790_38241),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_34790_38248 (.out1(out_rshift_expr_FU_32_0_32_218_i0_fu___float_adde11m52b_1023nih_34790_38248),
    .in1(out_lshift_expr_FU_32_0_32_215_i0_fu___float_adde11m52b_1023nih_34790_38245),
    .in2(out_const_14));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_34790_38251 (.out1(out_UIdata_converter_FU_38_i0_fu___float_adde11m52b_1023nih_34790_38251),
    .in1(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_34790_38254 (.out1(out_lshift_expr_FU_32_0_32_215_i1_fu___float_adde11m52b_1023nih_34790_38254),
    .in1(out_UIdata_converter_FU_38_i0_fu___float_adde11m52b_1023nih_34790_38251),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_34790_38257 (.out1(out_rshift_expr_FU_32_0_32_218_i1_fu___float_adde11m52b_1023nih_34790_38257),
    .in1(out_lshift_expr_FU_32_0_32_215_i1_fu___float_adde11m52b_1023nih_34790_38254),
    .in2(out_const_14));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu___float_adde11m52b_1023nih_34790_38260 (.out1(out_UIdata_converter_FU_81_i0_fu___float_adde11m52b_1023nih_34790_38260),
    .in1(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263));
  lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_34790_38263 (.out1(out_lshift_expr_FU_32_0_32_215_i2_fu___float_adde11m52b_1023nih_34790_38263),
    .in1(out_UIdata_converter_FU_81_i0_fu___float_adde11m52b_1023nih_34790_38260),
    .in2(out_const_14));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(2),
    .PRECISION(32)) fu___float_adde11m52b_1023nih_34790_38266 (.out1(out_rshift_expr_FU_32_0_32_218_i2_fu___float_adde11m52b_1023nih_34790_38266),
    .in1(out_lshift_expr_FU_32_0_32_215_i2_fu___float_adde11m52b_1023nih_34790_38263),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_38270 (.out1(out_ui_lshift_expr_FU_8_0_8_273_i0_fu___float_adde11m52b_1023nih_34790_38270),
    .in1(out_UUdata_converter_FU_120_i0_fu___float_adde11m52b_1023nih_34790_38292),
    .in2(out_const_18));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_38274 (.out1(out_ui_lshift_expr_FU_8_0_8_274_i0_fu___float_adde11m52b_1023nih_34790_38274),
    .in1(out_UUdata_converter_FU_124_i0_fu___float_adde11m52b_1023nih_34790_38295),
    .in2(out_const_17));
  ui_rshift_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(6),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_38278 (.out1(out_ui_rshift_expr_FU_64_0_64_287_i0_fu___float_adde11m52b_1023nih_34790_38278),
    .in1(out_ui_lshift_expr_FU_64_0_64_256_i2_fu___float_adde11m52b_1023nih_34790_35897),
    .in2(out_const_65));
  ui_lshift_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(6),
    .BITSIZE_out1(63),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_38282 (.out1(out_ui_lshift_expr_FU_64_0_64_267_i0_fu___float_adde11m52b_1023nih_34790_38282),
    .in1(out_ui_cond_expr_FU_16_16_16_16_247_i1_fu___float_adde11m52b_1023nih_34790_38236),
    .in2(out_const_65));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_38289 (.out1(out_ui_lshift_expr_FU_64_0_64_268_i0_fu___float_adde11m52b_1023nih_34790_38289),
    .in1(out_UUdata_converter_FU_208_i0_fu___float_adde11m52b_1023nih_34790_38238),
    .in2(out_const_83));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_38292 (.out1(out_UUdata_converter_FU_120_i0_fu___float_adde11m52b_1023nih_34790_38292),
    .in1(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_34790_37267));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_38295 (.out1(out_UUdata_converter_FU_124_i0_fu___float_adde11m52b_1023nih_34790_38295),
    .in1(out_lut_expr_FU_123_i0_fu___float_adde11m52b_1023nih_34790_37271));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu___float_adde11m52b_1023nih_34790_38297 (.out1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde11m52b_1023nih_34790_38297),
    .in1(out_ui_bit_and_expr_FU_16_0_16_223_i0_fu___float_adde11m52b_1023nih_34790_34920));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) fu___float_adde11m52b_1023nih_34790_38299 (.out1(out_ASSIGN_UNSIGNED_FU_167_i0_fu___float_adde11m52b_1023nih_34790_38299),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_242_i0_fu___float_adde11m52b_1023nih_34790_35700));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_38444 (.out1(out_lut_expr_FU_195_i0_fu___float_adde11m52b_1023nih_34790_38444),
    .in1(out_const_73),
    .in2(out_reg_30_reg_30),
    .in3(out_reg_32_reg_32),
    .in4(out_reg_33_reg_33),
    .in5(out_reg_34_reg_34),
    .in6(out_reg_35_reg_35),
    .in7(out_lut_expr_FU_194_i0_fu___float_adde11m52b_1023nih_34790_40812),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_38471 (.out1(out_lut_expr_FU_207_i0_fu___float_adde11m52b_1023nih_34790_38471),
    .in1(out_const_87),
    .in2(out_reg_17_reg_17),
    .in3(out_reg_18_reg_18),
    .in4(out_reg_19_reg_19),
    .in5(out_reg_20_reg_20),
    .in6(out_lut_expr_FU_202_i0_fu___float_adde11m52b_1023nih_34790_40818),
    .in7(out_reg_21_reg_21),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_38479 (.out1(out_lut_expr_FU_210_i0_fu___float_adde11m52b_1023nih_34790_38479),
    .in1(out_const_89),
    .in2(out_ui_eq_expr_FU_0_16_16_250_i1_fu___float_adde11m52b_1023nih_34790_35008),
    .in3(out_ui_eq_expr_FU_0_16_16_250_i0_fu___float_adde11m52b_1023nih_34790_35005),
    .in4(out_ui_ne_expr_FU_64_0_64_278_i1_fu___float_adde11m52b_1023nih_34790_35002),
    .in5(out_ui_ne_expr_FU_64_0_64_278_i0_fu___float_adde11m52b_1023nih_34790_34999),
    .in6(out_lut_expr_FU_209_i0_fu___float_adde11m52b_1023nih_34790_40829),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_34790_38578 (.out1(out_ui_extract_bit_expr_FU_121_i0_fu___float_adde11m52b_1023nih_34790_38578),
    .in1(out_ui_rshift_expr_FU_64_64_64_289_i1_fu___float_adde11m52b_1023nih_34790_35515),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_34790_38582 (.out1(out_ui_extract_bit_expr_FU_122_i0_fu___float_adde11m52b_1023nih_34790_38582),
    .in1(out_ui_rshift_expr_FU_64_64_64_289_i1_fu___float_adde11m52b_1023nih_34790_35515),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38671 (.out1(out_ui_extract_bit_expr_FU_5_i0_fu___float_adde11m52b_1023nih_34790_38671),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i1_fu___float_adde11m52b_1023nih_34790_34877),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38674 (.out1(out_ui_extract_bit_expr_FU_6_i0_fu___float_adde11m52b_1023nih_34790_38674),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i0_fu___float_adde11m52b_1023nih_34790_34871),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38678 (.out1(out_ui_extract_bit_expr_FU_7_i0_fu___float_adde11m52b_1023nih_34790_38678),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i3_fu___float_adde11m52b_1023nih_34790_34886),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38681 (.out1(out_ui_extract_bit_expr_FU_8_i0_fu___float_adde11m52b_1023nih_34790_38681),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i2_fu___float_adde11m52b_1023nih_34790_34883),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_34790_38685 (.out1(out_ui_extract_bit_expr_FU_16_i0_fu___float_adde11m52b_1023nih_34790_38685),
    .in1(out_ui_minus_expr_FU_16_16_16_277_i0_fu___float_adde11m52b_1023nih_34790_35052),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_34790_38689 (.out1(out_ui_extract_bit_expr_FU_17_i0_fu___float_adde11m52b_1023nih_34790_38689),
    .in1(out_ui_minus_expr_FU_16_16_16_277_i0_fu___float_adde11m52b_1023nih_34790_35052),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_34790_38693 (.out1(out_ui_extract_bit_expr_FU_18_i0_fu___float_adde11m52b_1023nih_34790_38693),
    .in1(out_ui_minus_expr_FU_16_16_16_277_i0_fu___float_adde11m52b_1023nih_34790_35052),
    .in2(out_const_20));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_34790_38697 (.out1(out_ui_extract_bit_expr_FU_19_i0_fu___float_adde11m52b_1023nih_34790_38697),
    .in1(out_ui_minus_expr_FU_16_16_16_277_i0_fu___float_adde11m52b_1023nih_34790_35052),
    .in2(out_const_35));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_34790_38701 (.out1(out_ui_extract_bit_expr_FU_20_i0_fu___float_adde11m52b_1023nih_34790_38701),
    .in1(out_ui_minus_expr_FU_16_16_16_277_i0_fu___float_adde11m52b_1023nih_34790_35052),
    .in2(out_const_43));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38705 (.out1(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde11m52b_1023nih_34790_38705),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i1_fu___float_adde11m52b_1023nih_34790_34877),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38708 (.out1(out_ui_extract_bit_expr_FU_27_i0_fu___float_adde11m52b_1023nih_34790_38708),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i0_fu___float_adde11m52b_1023nih_34790_34871),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38712 (.out1(out_ui_extract_bit_expr_FU_28_i0_fu___float_adde11m52b_1023nih_34790_38712),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i3_fu___float_adde11m52b_1023nih_34790_34886),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38715 (.out1(out_ui_extract_bit_expr_FU_29_i0_fu___float_adde11m52b_1023nih_34790_38715),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i2_fu___float_adde11m52b_1023nih_34790_34883),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38719 (.out1(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde11m52b_1023nih_34790_38719),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i1_fu___float_adde11m52b_1023nih_34790_34877),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38722 (.out1(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde11m52b_1023nih_34790_38722),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i0_fu___float_adde11m52b_1023nih_34790_34871),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38726 (.out1(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde11m52b_1023nih_34790_38726),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i3_fu___float_adde11m52b_1023nih_34790_34886),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38729 (.out1(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde11m52b_1023nih_34790_38729),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i2_fu___float_adde11m52b_1023nih_34790_34883),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38864 (.out1(out_ui_extract_bit_expr_FU_197_i0_fu___float_adde11m52b_1023nih_34790_38864),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i1_fu___float_adde11m52b_1023nih_34790_34877),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38867 (.out1(out_ui_extract_bit_expr_FU_198_i0_fu___float_adde11m52b_1023nih_34790_38867),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i0_fu___float_adde11m52b_1023nih_34790_34871),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38871 (.out1(out_ui_extract_bit_expr_FU_199_i0_fu___float_adde11m52b_1023nih_34790_38871),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i3_fu___float_adde11m52b_1023nih_34790_34886),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38874 (.out1(out_ui_extract_bit_expr_FU_200_i0_fu___float_adde11m52b_1023nih_34790_38874),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i2_fu___float_adde11m52b_1023nih_34790_34883),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38878 (.out1(out_ui_extract_bit_expr_FU_201_i0_fu___float_adde11m52b_1023nih_34790_38878),
    .in1(out_reg_23_reg_23),
    .in2(out_const_69));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38882 (.out1(out_ui_extract_bit_expr_FU_204_i0_fu___float_adde11m52b_1023nih_34790_38882),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i1_fu___float_adde11m52b_1023nih_34790_34877),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_38885 (.out1(out_ui_extract_bit_expr_FU_205_i0_fu___float_adde11m52b_1023nih_34790_38885),
    .in1(out_ui_bit_and_expr_FU_64_64_64_229_i0_fu___float_adde11m52b_1023nih_34790_34871),
    .in2(out_const_83));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39316 (.out1(out_ui_extract_bit_expr_FU_42_i0_fu___float_adde11m52b_1023nih_34790_39316),
    .in1(out_reg_23_reg_23),
    .in2(out_const_59));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39332 (.out1(out_ui_extract_bit_expr_FU_46_i0_fu___float_adde11m52b_1023nih_34790_39332),
    .in1(out_reg_23_reg_23),
    .in2(out_const_60));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39348 (.out1(out_ui_extract_bit_expr_FU_50_i0_fu___float_adde11m52b_1023nih_34790_39348),
    .in1(out_reg_23_reg_23),
    .in2(out_const_62));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39364 (.out1(out_ui_extract_bit_expr_FU_54_i0_fu___float_adde11m52b_1023nih_34790_39364),
    .in1(out_reg_23_reg_23),
    .in2(out_const_63));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39380 (.out1(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde11m52b_1023nih_34790_39380),
    .in1(out_reg_23_reg_23),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39396 (.out1(out_ui_extract_bit_expr_FU_62_i0_fu___float_adde11m52b_1023nih_34790_39396),
    .in1(out_reg_23_reg_23),
    .in2(out_const_66));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39412 (.out1(out_ui_extract_bit_expr_FU_66_i0_fu___float_adde11m52b_1023nih_34790_39412),
    .in1(out_reg_23_reg_23),
    .in2(out_const_68));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39428 (.out1(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde11m52b_1023nih_34790_39428),
    .in1(out_reg_23_reg_23),
    .in2(out_const_69));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_39533 (.out1(out_ui_rshift_expr_FU_64_0_64_286_i2_fu___float_adde11m52b_1023nih_34790_39533),
    .in1(out_ui_lshift_expr_FU_64_0_64_263_i0_fu___float_adde11m52b_1023nih_34790_35604),
    .in2(out_const_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_39536 (.out1(out_ui_rshift_expr_FU_64_0_64_286_i3_fu___float_adde11m52b_1023nih_34790_39536),
    .in1(out_ui_cond_expr_FU_64_64_64_64_248_i5_fu___float_adde11m52b_1023nih_34790_38214),
    .in2(out_const_18));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_39540 (.out1(out_ui_lshift_expr_FU_64_0_64_265_i1_fu___float_adde11m52b_1023nih_34790_39540),
    .in1(out_ui_lshift_expr_FU_64_0_64_269_i0_fu___float_adde11m52b_1023nih_34790_39883),
    .in2(out_const_18));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39627 (.out1(out_ui_extract_bit_expr_FU_40_i0_fu___float_adde11m52b_1023nih_34790_39627),
    .in1(out_reg_23_reg_23),
    .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_39631 (.out1(out_ui_extract_bit_expr_FU_41_i0_fu___float_adde11m52b_1023nih_34790_39631),
    .in1(out_reg_23_reg_23),
    .in2(out_const_21));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39639 (.out1(out_ui_extract_bit_expr_FU_44_i0_fu___float_adde11m52b_1023nih_34790_39639),
    .in1(out_reg_23_reg_23),
    .in2(out_const_27));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_39643 (.out1(out_ui_extract_bit_expr_FU_45_i0_fu___float_adde11m52b_1023nih_34790_39643),
    .in1(out_reg_23_reg_23),
    .in2(out_const_28));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39651 (.out1(out_ui_extract_bit_expr_FU_48_i0_fu___float_adde11m52b_1023nih_34790_39651),
    .in1(out_reg_23_reg_23),
    .in2(out_const_29));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_39655 (.out1(out_ui_extract_bit_expr_FU_49_i0_fu___float_adde11m52b_1023nih_34790_39655),
    .in1(out_reg_23_reg_23),
    .in2(out_const_36));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39663 (.out1(out_ui_extract_bit_expr_FU_52_i0_fu___float_adde11m52b_1023nih_34790_39663),
    .in1(out_reg_23_reg_23),
    .in2(out_const_34));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_39667 (.out1(out_ui_extract_bit_expr_FU_53_i0_fu___float_adde11m52b_1023nih_34790_39667),
    .in1(out_reg_23_reg_23),
    .in2(out_const_39));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39675 (.out1(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde11m52b_1023nih_34790_39675),
    .in1(out_reg_23_reg_23),
    .in2(out_const_37));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_39679 (.out1(out_ui_extract_bit_expr_FU_57_i0_fu___float_adde11m52b_1023nih_34790_39679),
    .in1(out_reg_23_reg_23),
    .in2(out_const_44));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39687 (.out1(out_ui_extract_bit_expr_FU_60_i0_fu___float_adde11m52b_1023nih_34790_39687),
    .in1(out_reg_23_reg_23),
    .in2(out_const_38));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_39691 (.out1(out_ui_extract_bit_expr_FU_61_i0_fu___float_adde11m52b_1023nih_34790_39691),
    .in1(out_reg_23_reg_23),
    .in2(out_const_46));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39699 (.out1(out_ui_extract_bit_expr_FU_64_i0_fu___float_adde11m52b_1023nih_34790_39699),
    .in1(out_reg_23_reg_23),
    .in2(out_const_40));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_39703 (.out1(out_ui_extract_bit_expr_FU_65_i0_fu___float_adde11m52b_1023nih_34790_39703),
    .in1(out_reg_23_reg_23),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39711 (.out1(out_ui_extract_bit_expr_FU_68_i0_fu___float_adde11m52b_1023nih_34790_39711),
    .in1(out_reg_23_reg_23),
    .in2(out_const_41));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_39715 (.out1(out_ui_extract_bit_expr_FU_69_i0_fu___float_adde11m52b_1023nih_34790_39715),
    .in1(out_reg_23_reg_23),
    .in2(out_const_53));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39742 (.out1(out_ui_extract_bit_expr_FU_88_i0_fu___float_adde11m52b_1023nih_34790_39742),
    .in1(out_reg_23_reg_23),
    .in2(out_const_65));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39769 (.out1(out_ui_extract_bit_expr_FU_95_i0_fu___float_adde11m52b_1023nih_34790_39769),
    .in1(out_reg_23_reg_23),
    .in2(out_const_66));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39796 (.out1(out_ui_extract_bit_expr_FU_102_i0_fu___float_adde11m52b_1023nih_34790_39796),
    .in1(out_reg_23_reg_23),
    .in2(out_const_68));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_39823 (.out1(out_ui_extract_bit_expr_FU_109_i0_fu___float_adde11m52b_1023nih_34790_39823),
    .in1(out_reg_23_reg_23),
    .in2(out_const_69));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_39876 (.out1(out_ui_rshift_expr_FU_64_0_64_288_i0_fu___float_adde11m52b_1023nih_34790_39876),
    .in1(out_ui_rshift_expr_FU_64_0_64_286_i2_fu___float_adde11m52b_1023nih_34790_39533),
    .in2(out_const_17));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_39879 (.out1(out_ui_rshift_expr_FU_64_0_64_288_i1_fu___float_adde11m52b_1023nih_34790_39879),
    .in1(out_ui_rshift_expr_FU_64_0_64_286_i3_fu___float_adde11m52b_1023nih_34790_39536),
    .in2(out_const_17));
  ui_lshift_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(53),
    .PRECISION(64)) fu___float_adde11m52b_1023nih_34790_39883 (.out1(out_ui_lshift_expr_FU_64_0_64_269_i0_fu___float_adde11m52b_1023nih_34790_39883),
    .in1(out_ui_cond_expr_FU_64_64_64_64_248_i6_fu___float_adde11m52b_1023nih_34790_38228),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_34790_39968 (.out1(out_ui_extract_bit_expr_FU_39_i0_fu___float_adde11m52b_1023nih_34790_39968),
    .in1(out_reg_23_reg_23),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_34790_39972 (.out1(out_ui_extract_bit_expr_FU_43_i0_fu___float_adde11m52b_1023nih_34790_39972),
    .in1(out_reg_23_reg_23),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu___float_adde11m52b_1023nih_34790_39976 (.out1(out_ui_extract_bit_expr_FU_47_i0_fu___float_adde11m52b_1023nih_34790_39976),
    .in1(out_reg_23_reg_23),
    .in2(out_const_18));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu___float_adde11m52b_1023nih_34790_39980 (.out1(out_ui_extract_bit_expr_FU_51_i0_fu___float_adde11m52b_1023nih_34790_39980),
    .in1(out_reg_23_reg_23),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_34790_39984 (.out1(out_ui_extract_bit_expr_FU_55_i0_fu___float_adde11m52b_1023nih_34790_39984),
    .in1(out_reg_23_reg_23),
    .in2(out_const_19));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_34790_39988 (.out1(out_ui_extract_bit_expr_FU_59_i0_fu___float_adde11m52b_1023nih_34790_39988),
    .in1(out_reg_23_reg_23),
    .in2(out_const_42));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_34790_39992 (.out1(out_ui_extract_bit_expr_FU_63_i0_fu___float_adde11m52b_1023nih_34790_39992),
    .in1(out_reg_23_reg_23),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_34790_39996 (.out1(out_ui_extract_bit_expr_FU_67_i0_fu___float_adde11m52b_1023nih_34790_39996),
    .in1(out_reg_23_reg_23),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40011 (.out1(out_ui_extract_bit_expr_FU_84_i0_fu___float_adde11m52b_1023nih_34790_40011),
    .in1(out_reg_23_reg_23),
    .in2(out_const_51));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40019 (.out1(out_ui_extract_bit_expr_FU_86_i0_fu___float_adde11m52b_1023nih_34790_40019),
    .in1(out_reg_23_reg_23),
    .in2(out_const_37));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_40023 (.out1(out_ui_extract_bit_expr_FU_87_i0_fu___float_adde11m52b_1023nih_34790_40023),
    .in1(out_reg_23_reg_23),
    .in2(out_const_44));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40039 (.out1(out_ui_extract_bit_expr_FU_91_i0_fu___float_adde11m52b_1023nih_34790_40039),
    .in1(out_reg_23_reg_23),
    .in2(out_const_52));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40047 (.out1(out_ui_extract_bit_expr_FU_93_i0_fu___float_adde11m52b_1023nih_34790_40047),
    .in1(out_reg_23_reg_23),
    .in2(out_const_38));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_40051 (.out1(out_ui_extract_bit_expr_FU_94_i0_fu___float_adde11m52b_1023nih_34790_40051),
    .in1(out_reg_23_reg_23),
    .in2(out_const_46));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40066 (.out1(out_ui_extract_bit_expr_FU_98_i0_fu___float_adde11m52b_1023nih_34790_40066),
    .in1(out_reg_23_reg_23),
    .in2(out_const_54));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40074 (.out1(out_ui_extract_bit_expr_FU_100_i0_fu___float_adde11m52b_1023nih_34790_40074),
    .in1(out_reg_23_reg_23),
    .in2(out_const_40));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_40078 (.out1(out_ui_extract_bit_expr_FU_101_i0_fu___float_adde11m52b_1023nih_34790_40078),
    .in1(out_reg_23_reg_23),
    .in2(out_const_50));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40094 (.out1(out_ui_extract_bit_expr_FU_105_i0_fu___float_adde11m52b_1023nih_34790_40094),
    .in1(out_reg_23_reg_23),
    .in2(out_const_55));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40102 (.out1(out_ui_extract_bit_expr_FU_107_i0_fu___float_adde11m52b_1023nih_34790_40102),
    .in1(out_reg_23_reg_23),
    .in2(out_const_41));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_40106 (.out1(out_ui_extract_bit_expr_FU_108_i0_fu___float_adde11m52b_1023nih_34790_40106),
    .in1(out_reg_23_reg_23),
    .in2(out_const_53));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40179 (.out1(out_ui_extract_bit_expr_FU_152_i0_fu___float_adde11m52b_1023nih_34790_40179),
    .in1(out_reg_23_reg_23),
    .in2(out_const_69));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_40265 (.out1(out_ui_extract_bit_expr_FU_82_i0_fu___float_adde11m52b_1023nih_34790_40265),
    .in1(out_reg_23_reg_23),
    .in2(out_const_72));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_34790_40269 (.out1(out_ui_extract_bit_expr_FU_83_i0_fu___float_adde11m52b_1023nih_34790_40269),
    .in1(out_reg_23_reg_23),
    .in2(out_const_58));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_34790_40273 (.out1(out_ui_extract_bit_expr_FU_85_i0_fu___float_adde11m52b_1023nih_34790_40273),
    .in1(out_reg_23_reg_23),
    .in2(out_const_19));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_40277 (.out1(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_34790_40277),
    .in1(out_reg_23_reg_23),
    .in2(out_const_75));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_34790_40281 (.out1(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_34790_40281),
    .in1(out_reg_23_reg_23),
    .in2(out_const_64));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_34790_40285 (.out1(out_ui_extract_bit_expr_FU_92_i0_fu___float_adde11m52b_1023nih_34790_40285),
    .in1(out_reg_23_reg_23),
    .in2(out_const_42));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_40289 (.out1(out_ui_extract_bit_expr_FU_96_i0_fu___float_adde11m52b_1023nih_34790_40289),
    .in1(out_reg_23_reg_23),
    .in2(out_const_77));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_34790_40293 (.out1(out_ui_extract_bit_expr_FU_97_i0_fu___float_adde11m52b_1023nih_34790_40293),
    .in1(out_reg_23_reg_23),
    .in2(out_const_71));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_34790_40297 (.out1(out_ui_extract_bit_expr_FU_99_i0_fu___float_adde11m52b_1023nih_34790_40297),
    .in1(out_reg_23_reg_23),
    .in2(out_const_57));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_40301 (.out1(out_ui_extract_bit_expr_FU_103_i0_fu___float_adde11m52b_1023nih_34790_40301),
    .in1(out_reg_23_reg_23),
    .in2(out_const_82));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_34790_40305 (.out1(out_ui_extract_bit_expr_FU_104_i0_fu___float_adde11m52b_1023nih_34790_40305),
    .in1(out_reg_23_reg_23),
    .in2(out_const_76));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_34790_40309 (.out1(out_ui_extract_bit_expr_FU_106_i0_fu___float_adde11m52b_1023nih_34790_40309),
    .in1(out_reg_23_reg_23),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40353 (.out1(out_ui_extract_bit_expr_FU_138_i0_fu___float_adde11m52b_1023nih_34790_40353),
    .in1(out_reg_23_reg_23),
    .in2(out_const_66));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40380 (.out1(out_ui_extract_bit_expr_FU_145_i0_fu___float_adde11m52b_1023nih_34790_40380),
    .in1(out_reg_23_reg_23),
    .in2(out_const_63));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40395 (.out1(out_ui_extract_bit_expr_FU_148_i0_fu___float_adde11m52b_1023nih_34790_40395),
    .in1(out_reg_23_reg_23),
    .in2(out_const_55));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40403 (.out1(out_ui_extract_bit_expr_FU_150_i0_fu___float_adde11m52b_1023nih_34790_40403),
    .in1(out_reg_23_reg_23),
    .in2(out_const_41));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_40407 (.out1(out_ui_extract_bit_expr_FU_151_i0_fu___float_adde11m52b_1023nih_34790_40407),
    .in1(out_reg_23_reg_23),
    .in2(out_const_53));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_34790_40421 (.out1(out_ui_extract_bit_expr_FU_172_i0_fu___float_adde11m52b_1023nih_34790_40421),
    .in1(out_reg_23_reg_23),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu___float_adde11m52b_1023nih_34790_40446 (.out1(out_ui_extract_bit_expr_FU_176_i0_fu___float_adde11m52b_1023nih_34790_40446),
    .in1(out_reg_23_reg_23),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_34790_40450 (.out1(out_ui_extract_bit_expr_FU_177_i0_fu___float_adde11m52b_1023nih_34790_40450),
    .in1(out_reg_23_reg_23),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu___float_adde11m52b_1023nih_34790_40468 (.out1(out_ui_extract_bit_expr_FU_180_i0_fu___float_adde11m52b_1023nih_34790_40468),
    .in1(out_reg_23_reg_23),
    .in2(out_const_18));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40495 (.out1(out_ui_extract_bit_expr_FU_131_i0_fu___float_adde11m52b_1023nih_34790_40495),
    .in1(out_reg_23_reg_23),
    .in2(out_const_60));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40510 (.out1(out_ui_extract_bit_expr_FU_134_i0_fu___float_adde11m52b_1023nih_34790_40510),
    .in1(out_reg_23_reg_23),
    .in2(out_const_52));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40518 (.out1(out_ui_extract_bit_expr_FU_136_i0_fu___float_adde11m52b_1023nih_34790_40518),
    .in1(out_reg_23_reg_23),
    .in2(out_const_38));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_40522 (.out1(out_ui_extract_bit_expr_FU_137_i0_fu___float_adde11m52b_1023nih_34790_40522),
    .in1(out_reg_23_reg_23),
    .in2(out_const_46));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40538 (.out1(out_ui_extract_bit_expr_FU_141_i0_fu___float_adde11m52b_1023nih_34790_40538),
    .in1(out_reg_23_reg_23),
    .in2(out_const_47));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40546 (.out1(out_ui_extract_bit_expr_FU_143_i0_fu___float_adde11m52b_1023nih_34790_40546),
    .in1(out_reg_23_reg_23),
    .in2(out_const_34));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_40550 (.out1(out_ui_extract_bit_expr_FU_144_i0_fu___float_adde11m52b_1023nih_34790_40550),
    .in1(out_reg_23_reg_23),
    .in2(out_const_39));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_40554 (.out1(out_ui_extract_bit_expr_FU_146_i0_fu___float_adde11m52b_1023nih_34790_40554),
    .in1(out_reg_23_reg_23),
    .in2(out_const_82));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_34790_40558 (.out1(out_ui_extract_bit_expr_FU_147_i0_fu___float_adde11m52b_1023nih_34790_40558),
    .in1(out_reg_23_reg_23),
    .in2(out_const_76));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_34790_40562 (.out1(out_ui_extract_bit_expr_FU_149_i0_fu___float_adde11m52b_1023nih_34790_40562),
    .in1(out_reg_23_reg_23),
    .in2(out_const_70));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_34790_40566 (.out1(out_ui_extract_bit_expr_FU_171_i0_fu___float_adde11m52b_1023nih_34790_40566),
    .in1(out_reg_23_reg_23),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu___float_adde11m52b_1023nih_34790_40577 (.out1(out_ui_extract_bit_expr_FU_174_i0_fu___float_adde11m52b_1023nih_34790_40577),
    .in1(out_reg_23_reg_23),
    .in2(out_const_18));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_34790_40581 (.out1(out_ui_extract_bit_expr_FU_175_i0_fu___float_adde11m52b_1023nih_34790_40581),
    .in1(out_reg_23_reg_23),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_34790_40585 (.out1(out_ui_extract_bit_expr_FU_178_i0_fu___float_adde11m52b_1023nih_34790_40585),
    .in1(out_reg_23_reg_23),
    .in2(out_const_17));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_34790_40589 (.out1(out_ui_extract_bit_expr_FU_179_i0_fu___float_adde11m52b_1023nih_34790_40589),
    .in1(out_reg_23_reg_23),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40604 (.out1(out_ui_extract_bit_expr_FU_127_i0_fu___float_adde11m52b_1023nih_34790_40604),
    .in1(out_reg_23_reg_23),
    .in2(out_const_45));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(6)) fu___float_adde11m52b_1023nih_34790_40612 (.out1(out_ui_extract_bit_expr_FU_129_i0_fu___float_adde11m52b_1023nih_34790_40612),
    .in1(out_reg_23_reg_23),
    .in2(out_const_27));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_40616 (.out1(out_ui_extract_bit_expr_FU_130_i0_fu___float_adde11m52b_1023nih_34790_40616),
    .in1(out_reg_23_reg_23),
    .in2(out_const_28));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_40620 (.out1(out_ui_extract_bit_expr_FU_132_i0_fu___float_adde11m52b_1023nih_34790_40620),
    .in1(out_reg_23_reg_23),
    .in2(out_const_75));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_34790_40624 (.out1(out_ui_extract_bit_expr_FU_133_i0_fu___float_adde11m52b_1023nih_34790_40624),
    .in1(out_reg_23_reg_23),
    .in2(out_const_64));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(3)) fu___float_adde11m52b_1023nih_34790_40628 (.out1(out_ui_extract_bit_expr_FU_135_i0_fu___float_adde11m52b_1023nih_34790_40628),
    .in1(out_reg_23_reg_23),
    .in2(out_const_42));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_40632 (.out1(out_ui_extract_bit_expr_FU_139_i0_fu___float_adde11m52b_1023nih_34790_40632),
    .in1(out_reg_23_reg_23),
    .in2(out_const_67));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_34790_40636 (.out1(out_ui_extract_bit_expr_FU_140_i0_fu___float_adde11m52b_1023nih_34790_40636),
    .in1(out_reg_23_reg_23),
    .in2(out_const_49));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(2)) fu___float_adde11m52b_1023nih_34790_40640 (.out1(out_ui_extract_bit_expr_FU_142_i0_fu___float_adde11m52b_1023nih_34790_40640),
    .in1(out_reg_23_reg_23),
    .in2(out_const_56));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_34790_40644 (.out1(out_ui_extract_bit_expr_FU_173_i0_fu___float_adde11m52b_1023nih_34790_40644),
    .in1(out_reg_23_reg_23),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(5)) fu___float_adde11m52b_1023nih_34790_40648 (.out1(out_ui_extract_bit_expr_FU_125_i0_fu___float_adde11m52b_1023nih_34790_40648),
    .in1(out_reg_23_reg_23),
    .in2(out_const_61));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(4)) fu___float_adde11m52b_1023nih_34790_40652 (.out1(out_ui_extract_bit_expr_FU_126_i0_fu___float_adde11m52b_1023nih_34790_40652),
    .in1(out_reg_23_reg_23),
    .in2(out_const_35));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(1)) fu___float_adde11m52b_1023nih_34790_40656 (.out1(out_ui_extract_bit_expr_FU_128_i0_fu___float_adde11m52b_1023nih_34790_40656),
    .in1(out_reg_23_reg_23),
    .in2(out_const_17));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40668 (.out1(out_lut_expr_FU_71_i0_fu___float_adde11m52b_1023nih_34790_40668),
    .in1(out_const_81),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_55_i0_fu___float_adde11m52b_1023nih_34790_39984),
    .in5(out_ui_extract_bit_expr_FU_56_i0_fu___float_adde11m52b_1023nih_34790_39675),
    .in6(out_ui_extract_bit_expr_FU_57_i0_fu___float_adde11m52b_1023nih_34790_39679),
    .in7(out_ui_extract_bit_expr_FU_58_i0_fu___float_adde11m52b_1023nih_34790_39380),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40671 (.out1(out_lut_expr_FU_72_i0_fu___float_adde11m52b_1023nih_34790_40671),
    .in1(out_const_81),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_59_i0_fu___float_adde11m52b_1023nih_34790_39988),
    .in5(out_ui_extract_bit_expr_FU_60_i0_fu___float_adde11m52b_1023nih_34790_39687),
    .in6(out_ui_extract_bit_expr_FU_61_i0_fu___float_adde11m52b_1023nih_34790_39691),
    .in7(out_ui_extract_bit_expr_FU_62_i0_fu___float_adde11m52b_1023nih_34790_39396),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40674 (.out1(out_lut_expr_FU_73_i0_fu___float_adde11m52b_1023nih_34790_40674),
    .in1(out_const_81),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_63_i0_fu___float_adde11m52b_1023nih_34790_39992),
    .in5(out_ui_extract_bit_expr_FU_64_i0_fu___float_adde11m52b_1023nih_34790_39699),
    .in6(out_ui_extract_bit_expr_FU_65_i0_fu___float_adde11m52b_1023nih_34790_39703),
    .in7(out_ui_extract_bit_expr_FU_66_i0_fu___float_adde11m52b_1023nih_34790_39412),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40677 (.out1(out_lut_expr_FU_74_i0_fu___float_adde11m52b_1023nih_34790_40677),
    .in1(out_const_81),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_67_i0_fu___float_adde11m52b_1023nih_34790_39996),
    .in5(out_ui_extract_bit_expr_FU_68_i0_fu___float_adde11m52b_1023nih_34790_39711),
    .in6(out_ui_extract_bit_expr_FU_69_i0_fu___float_adde11m52b_1023nih_34790_39715),
    .in7(out_ui_extract_bit_expr_FU_70_i0_fu___float_adde11m52b_1023nih_34790_39428),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40681 (.out1(out_lut_expr_FU_75_i0_fu___float_adde11m52b_1023nih_34790_40681),
    .in1(out_const_48),
    .in2(out_ui_extract_bit_expr_FU_39_i0_fu___float_adde11m52b_1023nih_34790_39968),
    .in3(out_ui_extract_bit_expr_FU_40_i0_fu___float_adde11m52b_1023nih_34790_39627),
    .in4(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in5(out_ui_extract_bit_expr_FU_41_i0_fu___float_adde11m52b_1023nih_34790_39631),
    .in6(out_ui_extract_bit_expr_FU_42_i0_fu___float_adde11m52b_1023nih_34790_39316),
    .in7(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40684 (.out1(out_lut_expr_FU_76_i0_fu___float_adde11m52b_1023nih_34790_40684),
    .in1(out_const_81),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_43_i0_fu___float_adde11m52b_1023nih_34790_39972),
    .in5(out_ui_extract_bit_expr_FU_44_i0_fu___float_adde11m52b_1023nih_34790_39639),
    .in6(out_ui_extract_bit_expr_FU_45_i0_fu___float_adde11m52b_1023nih_34790_39643),
    .in7(out_ui_extract_bit_expr_FU_46_i0_fu___float_adde11m52b_1023nih_34790_39332),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40687 (.out1(out_lut_expr_FU_77_i0_fu___float_adde11m52b_1023nih_34790_40687),
    .in1(out_const_81),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_47_i0_fu___float_adde11m52b_1023nih_34790_39976),
    .in5(out_ui_extract_bit_expr_FU_48_i0_fu___float_adde11m52b_1023nih_34790_39651),
    .in6(out_ui_extract_bit_expr_FU_49_i0_fu___float_adde11m52b_1023nih_34790_39655),
    .in7(out_ui_extract_bit_expr_FU_50_i0_fu___float_adde11m52b_1023nih_34790_39348),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40690 (.out1(out_lut_expr_FU_78_i0_fu___float_adde11m52b_1023nih_34790_40690),
    .in1(out_const_81),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_51_i0_fu___float_adde11m52b_1023nih_34790_39980),
    .in5(out_ui_extract_bit_expr_FU_52_i0_fu___float_adde11m52b_1023nih_34790_39663),
    .in6(out_ui_extract_bit_expr_FU_53_i0_fu___float_adde11m52b_1023nih_34790_39667),
    .in7(out_ui_extract_bit_expr_FU_54_i0_fu___float_adde11m52b_1023nih_34790_39364),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40693 (.out1(out_lut_expr_FU_79_i0_fu___float_adde11m52b_1023nih_34790_40693),
    .in1(out_const_17),
    .in2(out_lut_expr_FU_76_i0_fu___float_adde11m52b_1023nih_34790_40684),
    .in3(out_lut_expr_FU_77_i0_fu___float_adde11m52b_1023nih_34790_40687),
    .in4(out_lut_expr_FU_78_i0_fu___float_adde11m52b_1023nih_34790_40690),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40699 (.out1(out_lut_expr_FU_110_i0_fu___float_adde11m52b_1023nih_34790_40699),
    .in1(out_const_74),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_82_i0_fu___float_adde11m52b_1023nih_34790_40265),
    .in5(out_ui_extract_bit_expr_FU_83_i0_fu___float_adde11m52b_1023nih_34790_40269),
    .in6(out_ui_extract_bit_expr_FU_84_i0_fu___float_adde11m52b_1023nih_34790_40011),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40702 (.out1(out_lut_expr_FU_111_i0_fu___float_adde11m52b_1023nih_34790_40702),
    .in1(out_const_81),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_85_i0_fu___float_adde11m52b_1023nih_34790_40273),
    .in5(out_ui_extract_bit_expr_FU_86_i0_fu___float_adde11m52b_1023nih_34790_40019),
    .in6(out_ui_extract_bit_expr_FU_87_i0_fu___float_adde11m52b_1023nih_34790_40023),
    .in7(out_ui_extract_bit_expr_FU_88_i0_fu___float_adde11m52b_1023nih_34790_39742),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40705 (.out1(out_lut_expr_FU_112_i0_fu___float_adde11m52b_1023nih_34790_40705),
    .in1(out_const_74),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_89_i0_fu___float_adde11m52b_1023nih_34790_40277),
    .in5(out_ui_extract_bit_expr_FU_90_i0_fu___float_adde11m52b_1023nih_34790_40281),
    .in6(out_ui_extract_bit_expr_FU_91_i0_fu___float_adde11m52b_1023nih_34790_40039),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40708 (.out1(out_lut_expr_FU_113_i0_fu___float_adde11m52b_1023nih_34790_40708),
    .in1(out_const_81),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_92_i0_fu___float_adde11m52b_1023nih_34790_40285),
    .in5(out_ui_extract_bit_expr_FU_93_i0_fu___float_adde11m52b_1023nih_34790_40047),
    .in6(out_ui_extract_bit_expr_FU_94_i0_fu___float_adde11m52b_1023nih_34790_40051),
    .in7(out_ui_extract_bit_expr_FU_95_i0_fu___float_adde11m52b_1023nih_34790_39769),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40711 (.out1(out_lut_expr_FU_114_i0_fu___float_adde11m52b_1023nih_34790_40711),
    .in1(out_const_74),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_96_i0_fu___float_adde11m52b_1023nih_34790_40289),
    .in5(out_ui_extract_bit_expr_FU_97_i0_fu___float_adde11m52b_1023nih_34790_40293),
    .in6(out_ui_extract_bit_expr_FU_98_i0_fu___float_adde11m52b_1023nih_34790_40066),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40714 (.out1(out_lut_expr_FU_115_i0_fu___float_adde11m52b_1023nih_34790_40714),
    .in1(out_const_81),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_99_i0_fu___float_adde11m52b_1023nih_34790_40297),
    .in5(out_ui_extract_bit_expr_FU_100_i0_fu___float_adde11m52b_1023nih_34790_40074),
    .in6(out_ui_extract_bit_expr_FU_101_i0_fu___float_adde11m52b_1023nih_34790_40078),
    .in7(out_ui_extract_bit_expr_FU_102_i0_fu___float_adde11m52b_1023nih_34790_39796),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40717 (.out1(out_lut_expr_FU_116_i0_fu___float_adde11m52b_1023nih_34790_40717),
    .in1(out_const_74),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_103_i0_fu___float_adde11m52b_1023nih_34790_40301),
    .in5(out_ui_extract_bit_expr_FU_104_i0_fu___float_adde11m52b_1023nih_34790_40305),
    .in6(out_ui_extract_bit_expr_FU_105_i0_fu___float_adde11m52b_1023nih_34790_40094),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40720 (.out1(out_lut_expr_FU_117_i0_fu___float_adde11m52b_1023nih_34790_40720),
    .in1(out_const_81),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_106_i0_fu___float_adde11m52b_1023nih_34790_40309),
    .in5(out_ui_extract_bit_expr_FU_107_i0_fu___float_adde11m52b_1023nih_34790_40102),
    .in6(out_ui_extract_bit_expr_FU_108_i0_fu___float_adde11m52b_1023nih_34790_40106),
    .in7(out_ui_extract_bit_expr_FU_109_i0_fu___float_adde11m52b_1023nih_34790_39823),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(22),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40724 (.out1(out_lut_expr_FU_118_i0_fu___float_adde11m52b_1023nih_34790_40724),
    .in1(out_const_30),
    .in2(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263),
    .in3(out_lut_expr_FU_114_i0_fu___float_adde11m52b_1023nih_34790_40711),
    .in4(out_lut_expr_FU_115_i0_fu___float_adde11m52b_1023nih_34790_40714),
    .in5(out_lut_expr_FU_116_i0_fu___float_adde11m52b_1023nih_34790_40717),
    .in6(out_lut_expr_FU_117_i0_fu___float_adde11m52b_1023nih_34790_40720),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40730 (.out1(out_lut_expr_FU_153_i0_fu___float_adde11m52b_1023nih_34790_40730),
    .in1(out_const_74),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_125_i0_fu___float_adde11m52b_1023nih_34790_40648),
    .in5(out_ui_extract_bit_expr_FU_126_i0_fu___float_adde11m52b_1023nih_34790_40652),
    .in6(out_ui_extract_bit_expr_FU_127_i0_fu___float_adde11m52b_1023nih_34790_40604),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40733 (.out1(out_lut_expr_FU_154_i0_fu___float_adde11m52b_1023nih_34790_40733),
    .in1(out_const_81),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_128_i0_fu___float_adde11m52b_1023nih_34790_40656),
    .in5(out_ui_extract_bit_expr_FU_129_i0_fu___float_adde11m52b_1023nih_34790_40612),
    .in6(out_ui_extract_bit_expr_FU_130_i0_fu___float_adde11m52b_1023nih_34790_40616),
    .in7(out_ui_extract_bit_expr_FU_131_i0_fu___float_adde11m52b_1023nih_34790_40495),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40736 (.out1(out_lut_expr_FU_155_i0_fu___float_adde11m52b_1023nih_34790_40736),
    .in1(out_const_74),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_132_i0_fu___float_adde11m52b_1023nih_34790_40620),
    .in5(out_ui_extract_bit_expr_FU_133_i0_fu___float_adde11m52b_1023nih_34790_40624),
    .in6(out_ui_extract_bit_expr_FU_134_i0_fu___float_adde11m52b_1023nih_34790_40510),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40739 (.out1(out_lut_expr_FU_156_i0_fu___float_adde11m52b_1023nih_34790_40739),
    .in1(out_const_81),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_135_i0_fu___float_adde11m52b_1023nih_34790_40628),
    .in5(out_ui_extract_bit_expr_FU_136_i0_fu___float_adde11m52b_1023nih_34790_40518),
    .in6(out_ui_extract_bit_expr_FU_137_i0_fu___float_adde11m52b_1023nih_34790_40522),
    .in7(out_ui_extract_bit_expr_FU_138_i0_fu___float_adde11m52b_1023nih_34790_40353),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40742 (.out1(out_lut_expr_FU_157_i0_fu___float_adde11m52b_1023nih_34790_40742),
    .in1(out_const_81),
    .in2(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263),
    .in3(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_34790_37267),
    .in4(out_lut_expr_FU_153_i0_fu___float_adde11m52b_1023nih_34790_40730),
    .in5(out_lut_expr_FU_154_i0_fu___float_adde11m52b_1023nih_34790_40733),
    .in6(out_lut_expr_FU_155_i0_fu___float_adde11m52b_1023nih_34790_40736),
    .in7(out_lut_expr_FU_156_i0_fu___float_adde11m52b_1023nih_34790_40739),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40745 (.out1(out_lut_expr_FU_158_i0_fu___float_adde11m52b_1023nih_34790_40745),
    .in1(out_const_74),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_139_i0_fu___float_adde11m52b_1023nih_34790_40632),
    .in5(out_ui_extract_bit_expr_FU_140_i0_fu___float_adde11m52b_1023nih_34790_40636),
    .in6(out_ui_extract_bit_expr_FU_141_i0_fu___float_adde11m52b_1023nih_34790_40538),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40748 (.out1(out_lut_expr_FU_159_i0_fu___float_adde11m52b_1023nih_34790_40748),
    .in1(out_const_81),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_142_i0_fu___float_adde11m52b_1023nih_34790_40640),
    .in5(out_ui_extract_bit_expr_FU_143_i0_fu___float_adde11m52b_1023nih_34790_40546),
    .in6(out_ui_extract_bit_expr_FU_144_i0_fu___float_adde11m52b_1023nih_34790_40550),
    .in7(out_ui_extract_bit_expr_FU_145_i0_fu___float_adde11m52b_1023nih_34790_40380),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40751 (.out1(out_lut_expr_FU_160_i0_fu___float_adde11m52b_1023nih_34790_40751),
    .in1(out_const_74),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_146_i0_fu___float_adde11m52b_1023nih_34790_40554),
    .in5(out_ui_extract_bit_expr_FU_147_i0_fu___float_adde11m52b_1023nih_34790_40558),
    .in6(out_ui_extract_bit_expr_FU_148_i0_fu___float_adde11m52b_1023nih_34790_40395),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40754 (.out1(out_lut_expr_FU_161_i0_fu___float_adde11m52b_1023nih_34790_40754),
    .in1(out_const_81),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_149_i0_fu___float_adde11m52b_1023nih_34790_40562),
    .in5(out_ui_extract_bit_expr_FU_150_i0_fu___float_adde11m52b_1023nih_34790_40403),
    .in6(out_ui_extract_bit_expr_FU_151_i0_fu___float_adde11m52b_1023nih_34790_40407),
    .in7(out_ui_extract_bit_expr_FU_152_i0_fu___float_adde11m52b_1023nih_34790_40179),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40757 (.out1(out_lut_expr_FU_162_i0_fu___float_adde11m52b_1023nih_34790_40757),
    .in1(out_const_81),
    .in2(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263),
    .in3(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_34790_37267),
    .in4(out_lut_expr_FU_158_i0_fu___float_adde11m52b_1023nih_34790_40745),
    .in5(out_lut_expr_FU_159_i0_fu___float_adde11m52b_1023nih_34790_40748),
    .in6(out_lut_expr_FU_160_i0_fu___float_adde11m52b_1023nih_34790_40751),
    .in7(out_lut_expr_FU_161_i0_fu___float_adde11m52b_1023nih_34790_40754),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40763 (.out1(out_lut_expr_FU_168_i0_fu___float_adde11m52b_1023nih_34790_40763),
    .in1(out_const_84),
    .in2(out_ui_extract_bit_expr_FU_121_i0_fu___float_adde11m52b_1023nih_34790_38578),
    .in3(out_ui_extract_bit_expr_FU_122_i0_fu___float_adde11m52b_1023nih_34790_38582),
    .in4(out_lut_expr_FU_157_i0_fu___float_adde11m52b_1023nih_34790_40742),
    .in5(out_lut_expr_FU_162_i0_fu___float_adde11m52b_1023nih_34790_40757),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40767 (.out1(out_lut_expr_FU_169_i0_fu___float_adde11m52b_1023nih_34790_40767),
    .in1(out_const_23),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263),
    .in5(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_34790_37267),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40772 (.out1(out_lut_expr_FU_181_i0_fu___float_adde11m52b_1023nih_34790_40772),
    .in1(out_const_21),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_178_i0_fu___float_adde11m52b_1023nih_34790_40585),
    .in5(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263),
    .in6(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_34790_37267),
    .in7(out_lut_expr_FU_123_i0_fu___float_adde11m52b_1023nih_34790_37271),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40775 (.out1(out_lut_expr_FU_182_i0_fu___float_adde11m52b_1023nih_34790_40775),
    .in1(out_const_21),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_179_i0_fu___float_adde11m52b_1023nih_34790_40589),
    .in5(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263),
    .in6(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_34790_37267),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40778 (.out1(out_lut_expr_FU_183_i0_fu___float_adde11m52b_1023nih_34790_40778),
    .in1(out_const_21),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_180_i0_fu___float_adde11m52b_1023nih_34790_40468),
    .in5(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263),
    .in6(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_34790_37267),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40781 (.out1(out_lut_expr_FU_184_i0_fu___float_adde11m52b_1023nih_34790_40781),
    .in1(out_const_84),
    .in2(out_ui_extract_bit_expr_FU_121_i0_fu___float_adde11m52b_1023nih_34790_38578),
    .in3(out_ui_extract_bit_expr_FU_122_i0_fu___float_adde11m52b_1023nih_34790_38582),
    .in4(out_lut_expr_FU_182_i0_fu___float_adde11m52b_1023nih_34790_40775),
    .in5(out_lut_expr_FU_183_i0_fu___float_adde11m52b_1023nih_34790_40778),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40784 (.out1(out_lut_expr_FU_185_i0_fu___float_adde11m52b_1023nih_34790_40784),
    .in1(out_const_21),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_171_i0_fu___float_adde11m52b_1023nih_34790_40566),
    .in5(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263),
    .in6(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_34790_37267),
    .in7(out_lut_expr_FU_123_i0_fu___float_adde11m52b_1023nih_34790_37271),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40787 (.out1(out_lut_expr_FU_186_i0_fu___float_adde11m52b_1023nih_34790_40787),
    .in1(out_const_21),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_172_i0_fu___float_adde11m52b_1023nih_34790_40421),
    .in5(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263),
    .in6(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_34790_37267),
    .in7(out_lut_expr_FU_123_i0_fu___float_adde11m52b_1023nih_34790_37271),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40790 (.out1(out_lut_expr_FU_187_i0_fu___float_adde11m52b_1023nih_34790_40790),
    .in1(out_const_21),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_173_i0_fu___float_adde11m52b_1023nih_34790_40644),
    .in5(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263),
    .in6(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_34790_37267),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40793 (.out1(out_lut_expr_FU_188_i0_fu___float_adde11m52b_1023nih_34790_40793),
    .in1(out_const_21),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_174_i0_fu___float_adde11m52b_1023nih_34790_40577),
    .in5(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263),
    .in6(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_34790_37267),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40796 (.out1(out_lut_expr_FU_189_i0_fu___float_adde11m52b_1023nih_34790_40796),
    .in1(out_const_84),
    .in2(out_ui_extract_bit_expr_FU_121_i0_fu___float_adde11m52b_1023nih_34790_38578),
    .in3(out_ui_extract_bit_expr_FU_122_i0_fu___float_adde11m52b_1023nih_34790_38582),
    .in4(out_lut_expr_FU_187_i0_fu___float_adde11m52b_1023nih_34790_40790),
    .in5(out_lut_expr_FU_188_i0_fu___float_adde11m52b_1023nih_34790_40793),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40799 (.out1(out_lut_expr_FU_190_i0_fu___float_adde11m52b_1023nih_34790_40799),
    .in1(out_const_21),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_175_i0_fu___float_adde11m52b_1023nih_34790_40581),
    .in5(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263),
    .in6(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_34790_37267),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40802 (.out1(out_lut_expr_FU_191_i0_fu___float_adde11m52b_1023nih_34790_40802),
    .in1(out_const_21),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_176_i0_fu___float_adde11m52b_1023nih_34790_40446),
    .in5(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263),
    .in6(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_34790_37267),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40805 (.out1(out_lut_expr_FU_192_i0_fu___float_adde11m52b_1023nih_34790_40805),
    .in1(out_const_84),
    .in2(out_ui_extract_bit_expr_FU_121_i0_fu___float_adde11m52b_1023nih_34790_38578),
    .in3(out_ui_extract_bit_expr_FU_122_i0_fu___float_adde11m52b_1023nih_34790_38582),
    .in4(out_lut_expr_FU_190_i0_fu___float_adde11m52b_1023nih_34790_40799),
    .in5(out_lut_expr_FU_191_i0_fu___float_adde11m52b_1023nih_34790_40802),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40808 (.out1(out_lut_expr_FU_193_i0_fu___float_adde11m52b_1023nih_34790_40808),
    .in1(out_const_21),
    .in2(out_ui_eq_expr_FU_32_0_32_254_i0_fu___float_adde11m52b_1023nih_34790_37255),
    .in3(out_ui_eq_expr_FU_16_0_16_252_i0_fu___float_adde11m52b_1023nih_34790_37259),
    .in4(out_ui_extract_bit_expr_FU_177_i0_fu___float_adde11m52b_1023nih_34790_40450),
    .in5(out_lut_expr_FU_80_i0_fu___float_adde11m52b_1023nih_34790_37263),
    .in6(out_lut_expr_FU_119_i0_fu___float_adde11m52b_1023nih_34790_37267),
    .in7(out_lut_expr_FU_123_i0_fu___float_adde11m52b_1023nih_34790_37271),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(25),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40812 (.out1(out_lut_expr_FU_194_i0_fu___float_adde11m52b_1023nih_34790_40812),
    .in1(out_const_26),
    .in2(out_reg_22_reg_22),
    .in3(out_reg_30_reg_30),
    .in4(out_reg_36_reg_36),
    .in5(out_reg_37_reg_37),
    .in6(out_reg_38_reg_38),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(28),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40818 (.out1(out_lut_expr_FU_202_i0_fu___float_adde11m52b_1023nih_34790_40818),
    .in1(out_const_78),
    .in2(out_reg_27_reg_27),
    .in3(out_reg_28_reg_28),
    .in4(out_ui_lt_expr_FU_16_16_16_275_i0_fu___float_adde11m52b_1023nih_34790_35708),
    .in5(out_reg_30_reg_30),
    .in6(out_reg_31_reg_31),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40823 (.out1(out_lut_expr_FU_206_i0_fu___float_adde11m52b_1023nih_34790_40823),
    .in1(out_const_17),
    .in2(out_ui_extract_bit_expr_FU_199_i0_fu___float_adde11m52b_1023nih_34790_38871),
    .in3(out_ui_extract_bit_expr_FU_200_i0_fu___float_adde11m52b_1023nih_34790_38874),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_out1(1)) fu___float_adde11m52b_1023nih_34790_40829 (.out1(out_lut_expr_FU_209_i0_fu___float_adde11m52b_1023nih_34790_40829),
    .in1(out_const_25),
    .in2(out_ui_eq_expr_FU_0_16_16_250_i1_fu___float_adde11m52b_1023nih_34790_35008),
    .in3(out_ui_eq_expr_FU_0_16_16_250_i0_fu___float_adde11m52b_1023nih_34790_35005),
    .in4(out_ui_extract_bit_expr_FU_33_i0_fu___float_adde11m52b_1023nih_34790_38719),
    .in5(out_ui_extract_bit_expr_FU_34_i0_fu___float_adde11m52b_1023nih_34790_38722),
    .in6(out_ui_extract_bit_expr_FU_35_i0_fu___float_adde11m52b_1023nih_34790_38726),
    .in7(out_ui_extract_bit_expr_FU_36_i0_fu___float_adde11m52b_1023nih_34790_38729),
    .in8(1'b0),
    .in9(1'b0));
  register_SE #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_16_0_16_223_i0_fu___float_adde11m52b_1023nih_34790_34920),
    .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(56),
    .BITSIZE_out1(56)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_IUdata_converter_FU_11_i0_fu___float_adde11m52b_1023nih_34790_34941),
    .wenable(wrenable_reg_1));
  register_STD #(.BITSIZE_in1(53),
    .BITSIZE_out1(53)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_286_i1_fu___float_adde11m52b_1023nih_34790_38063),
    .wenable(wrenable_reg_10));
  register_STD #(.BITSIZE_in1(53),
    .BITSIZE_out1(53)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_285_i2_fu___float_adde11m52b_1023nih_34790_38074),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_4_i0_fu___float_adde11m52b_1023nih_34790_38297),
    .wenable(wrenable_reg_12));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_26_i0_fu___float_adde11m52b_1023nih_34790_38705),
    .wenable(wrenable_reg_13));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_27_i0_fu___float_adde11m52b_1023nih_34790_38708),
    .wenable(wrenable_reg_14));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_28_i0_fu___float_adde11m52b_1023nih_34790_38712),
    .wenable(wrenable_reg_15));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_29_i0_fu___float_adde11m52b_1023nih_34790_38715),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_197_i0_fu___float_adde11m52b_1023nih_34790_38864),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_198_i0_fu___float_adde11m52b_1023nih_34790_38867),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_204_i0_fu___float_adde11m52b_1023nih_34790_38882),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_0_16_16_250_i0_fu___float_adde11m52b_1023nih_34790_35005),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_205_i0_fu___float_adde11m52b_1023nih_34790_38885),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_206_i0_fu___float_adde11m52b_1023nih_34790_40823),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_64_0_64_279_i0_fu___float_adde11m52b_1023nih_34790_35289),
    .wenable(wrenable_reg_22));
  register_STD #(.BITSIZE_in1(56),
    .BITSIZE_out1(56)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_64_64_64_280_i0_fu___float_adde11m52b_1023nih_34790_35338),
    .wenable(wrenable_reg_23));
  register_STD #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_242_i0_fu___float_adde11m52b_1023nih_34790_35700),
    .wenable(wrenable_reg_24));
  register_STD #(.BITSIZE_in1(52),
    .BITSIZE_out1(52)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_64_0_64_226_i1_fu___float_adde11m52b_1023nih_34790_35911),
    .wenable(wrenable_reg_25));
  register_STD #(.BITSIZE_in1(6),
    .BITSIZE_out1(6)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_167_i0_fu___float_adde11m52b_1023nih_34790_38299),
    .wenable(wrenable_reg_26));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_121_i0_fu___float_adde11m52b_1023nih_34790_38578),
    .wenable(wrenable_reg_27));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_122_i0_fu___float_adde11m52b_1023nih_34790_38582),
    .wenable(wrenable_reg_28));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_201_i0_fu___float_adde11m52b_1023nih_34790_38878),
    .wenable(wrenable_reg_29));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_0_16_16_250_i1_fu___float_adde11m52b_1023nih_34790_35008),
    .wenable(wrenable_reg_3));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_168_i0_fu___float_adde11m52b_1023nih_34790_40763),
    .wenable(wrenable_reg_30));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_169_i0_fu___float_adde11m52b_1023nih_34790_40767),
    .wenable(wrenable_reg_31));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_181_i0_fu___float_adde11m52b_1023nih_34790_40772),
    .wenable(wrenable_reg_32));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_184_i0_fu___float_adde11m52b_1023nih_34790_40781),
    .wenable(wrenable_reg_33));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_185_i0_fu___float_adde11m52b_1023nih_34790_40784),
    .wenable(wrenable_reg_34));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_186_i0_fu___float_adde11m52b_1023nih_34790_40787),
    .wenable(wrenable_reg_35));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_189_i0_fu___float_adde11m52b_1023nih_34790_40796),
    .wenable(wrenable_reg_36));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_192_i0_fu___float_adde11m52b_1023nih_34790_40805),
    .wenable(wrenable_reg_37));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_38 (.out1(out_reg_38_reg_38),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_193_i0_fu___float_adde11m52b_1023nih_34790_40808),
    .wenable(wrenable_reg_38));
  register_STD #(.BITSIZE_in1(55),
    .BITSIZE_out1(55)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_257_i1_fu___float_adde11m52b_1023nih_34790_35081),
    .wenable(wrenable_reg_4));
  register_STD #(.BITSIZE_in1(7),
    .BITSIZE_out1(7)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_UIconvert_expr_FU_25_i0_fu___float_adde11m52b_1023nih_34790_35243),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(7),
    .BITSIZE_out1(7)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_bit_and_expr_FU_0_8_8_213_i0_fu___float_adde11m52b_1023nih_34790_35512),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_32_i0_fu___float_adde11m52b_1023nih_34790_35956),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(52),
    .BITSIZE_out1(52)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_264_i0_fu___float_adde11m52b_1023nih_34790_36055),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_eq_expr_FU_16_0_16_253_i0_fu___float_adde11m52b_1023nih_34790_37301),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_ui_bit_ior_expr_FU_0_64_64_238_i0_fu___float_adde11m52b_1023nih_34790_36087;

endmodule

// FSM based controller description for __float_adde11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___float_adde11m52b_1023nih(done_port,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_32,
  wrenable_reg_33,
  wrenable_reg_34,
  wrenable_reg_35,
  wrenable_reg_36,
  wrenable_reg_37,
  wrenable_reg_38,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  clock,
  reset,
  start_port);
  // IN
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_15;
  output wrenable_reg_16;
  output wrenable_reg_17;
  output wrenable_reg_18;
  output wrenable_reg_19;
  output wrenable_reg_2;
  output wrenable_reg_20;
  output wrenable_reg_21;
  output wrenable_reg_22;
  output wrenable_reg_23;
  output wrenable_reg_24;
  output wrenable_reg_25;
  output wrenable_reg_26;
  output wrenable_reg_27;
  output wrenable_reg_28;
  output wrenable_reg_29;
  output wrenable_reg_3;
  output wrenable_reg_30;
  output wrenable_reg_31;
  output wrenable_reg_32;
  output wrenable_reg_33;
  output wrenable_reg_34;
  output wrenable_reg_35;
  output wrenable_reg_36;
  output wrenable_reg_37;
  output wrenable_reg_38;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [4:0] S_0 = 5'b00001,
    S_1 = 5'b00010,
    S_2 = 5'b00100,
    S_3 = 5'b01000,
    S_4 = 5'b10000;
  reg [4:0] _present_state=S_0, _next_state;
  reg done_port;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
  reg wrenable_reg_15;
  reg wrenable_reg_16;
  reg wrenable_reg_17;
  reg wrenable_reg_18;
  reg wrenable_reg_19;
  reg wrenable_reg_2;
  reg wrenable_reg_20;
  reg wrenable_reg_21;
  reg wrenable_reg_22;
  reg wrenable_reg_23;
  reg wrenable_reg_24;
  reg wrenable_reg_25;
  reg wrenable_reg_26;
  reg wrenable_reg_27;
  reg wrenable_reg_28;
  reg wrenable_reg_29;
  reg wrenable_reg_3;
  reg wrenable_reg_30;
  reg wrenable_reg_31;
  reg wrenable_reg_32;
  reg wrenable_reg_33;
  reg wrenable_reg_34;
  reg wrenable_reg_35;
  reg wrenable_reg_36;
  reg wrenable_reg_37;
  reg wrenable_reg_38;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
    wrenable_reg_15 = 1'b0;
    wrenable_reg_16 = 1'b0;
    wrenable_reg_17 = 1'b0;
    wrenable_reg_18 = 1'b0;
    wrenable_reg_19 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_20 = 1'b0;
    wrenable_reg_21 = 1'b0;
    wrenable_reg_22 = 1'b0;
    wrenable_reg_23 = 1'b0;
    wrenable_reg_24 = 1'b0;
    wrenable_reg_25 = 1'b0;
    wrenable_reg_26 = 1'b0;
    wrenable_reg_27 = 1'b0;
    wrenable_reg_28 = 1'b0;
    wrenable_reg_29 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_30 = 1'b0;
    wrenable_reg_31 = 1'b0;
    wrenable_reg_32 = 1'b0;
    wrenable_reg_33 = 1'b0;
    wrenable_reg_34 = 1'b0;
    wrenable_reg_35 = 1'b0;
    wrenable_reg_36 = 1'b0;
    wrenable_reg_37 = 1'b0;
    wrenable_reg_38 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_29 = 1'b1;
          wrenable_reg_30 = 1'b1;
          wrenable_reg_31 = 1'b1;
          wrenable_reg_32 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_37 = 1'b1;
          wrenable_reg_38 = 1'b1;
          _next_state = S_4;
          done_port = 1'b1;
        end
      S_4 :
        begin
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// Top component for __float_adde11m52b_1023nih
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __float_adde11m52b_1023nih(clock,
  reset,
  start_port,
  done_port,
  a,
  b,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  input [63:0] a;
  input [63:0] b;
  // OUT
  output done_port;
  output [63:0] return_port;
  // Component and signal declarations
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire [63:0] in_port_a_SIGI1;
  wire [63:0] in_port_a_SIGI2;
  wire [63:0] in_port_b_SIGI1;
  wire [63:0] in_port_b_SIGI2;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_15;
  wire wrenable_reg_16;
  wire wrenable_reg_17;
  wire wrenable_reg_18;
  wire wrenable_reg_19;
  wire wrenable_reg_2;
  wire wrenable_reg_20;
  wire wrenable_reg_21;
  wire wrenable_reg_22;
  wire wrenable_reg_23;
  wire wrenable_reg_24;
  wire wrenable_reg_25;
  wire wrenable_reg_26;
  wire wrenable_reg_27;
  wire wrenable_reg_28;
  wire wrenable_reg_29;
  wire wrenable_reg_3;
  wire wrenable_reg_30;
  wire wrenable_reg_31;
  wire wrenable_reg_32;
  wire wrenable_reg_33;
  wire wrenable_reg_34;
  wire wrenable_reg_35;
  wire wrenable_reg_36;
  wire wrenable_reg_37;
  wire wrenable_reg_38;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller___float_adde11m52b_1023nih Controller_i (.done_port(done_delayed_REG_signal_in),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_32(wrenable_reg_32),
    .wrenable_reg_33(wrenable_reg_33),
    .wrenable_reg_34(wrenable_reg_34),
    .wrenable_reg_35(wrenable_reg_35),
    .wrenable_reg_36(wrenable_reg_36),
    .wrenable_reg_37(wrenable_reg_37),
    .wrenable_reg_38(wrenable_reg_38),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___float_adde11m52b_1023nih Datapath_i (.return_port(return_port),
    .clock(clock),
    .reset(reset),
    .in_port_a(in_port_a_SIGI2),
    .in_port_b(in_port_b_SIGI2),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_32(wrenable_reg_32),
    .wrenable_reg_33(wrenable_reg_33),
    .wrenable_reg_34(wrenable_reg_34),
    .wrenable_reg_35(wrenable_reg_35),
    .wrenable_reg_36(wrenable_reg_36),
    .wrenable_reg_37(wrenable_reg_37),
    .wrenable_reg_38(wrenable_reg_38),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) in_port_a_REG (.out1(in_port_a_SIGI2),
    .clock(clock),
    .reset(reset),
    .in1(in_port_a_SIGI1));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) in_port_b_REG (.out1(in_port_b_SIGI2),
    .clock(clock),
    .reset(reset),
    .in1(in_port_b_SIGI1));
  // io-signal post fix
  assign in_port_a_SIGI1 = a;
  assign in_port_b_SIGI1 = b;
  assign done_port = done_delayed_REG_signal_out;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2013-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module PROXY_CTRLN(in1,
  in2,
  in3,
  in4,
  sel_LOAD,
  sel_STORE,
  out1,
  proxy_in1,
  proxy_in2,
  proxy_in3,
  proxy_sel_LOAD,
  proxy_sel_STORE,
  proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_in4=1, PORTSIZE_in4=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2,
    BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  output [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  output [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  output [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  output [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  assign int_sel_STORE = sel_STORE & in4;
  assign int_sel_LOAD = sel_LOAD & in4;
  generate
  genvar i0;
  for (i0=0; i0<PORTSIZE_out1; i0=i0+1)
    begin : L0
      assign out1[(i0+1)*BITSIZE_out1-1:i0*BITSIZE_out1] = proxy_out1[(i0+1)*BITSIZE_proxy_out1-1:i0*BITSIZE_proxy_out1];
    end
  endgenerate
  generate
  genvar i1;
  for (i1=0; i1<PORTSIZE_in1; i1=i1+1)
    begin : L1
      assign proxy_in1[(i1+1)*BITSIZE_proxy_in1-1:i1*BITSIZE_proxy_in1] = int_sel_STORE[i1] ? in1[(i1+1)*BITSIZE_in1-1:i1*BITSIZE_in1] : 0;
    end
  endgenerate
  generate
  genvar i2;
  for (i2=0; i2<PORTSIZE_in2; i2=i2+1)
    begin : L2
      assign proxy_in2[(i2+1)*BITSIZE_proxy_in2-1:i2*BITSIZE_proxy_in2] = int_sel_LOAD[i2]|int_sel_STORE[i2] ? in2[(i2+1)*BITSIZE_in2-1:i2*BITSIZE_in2] : 0;
    end
  endgenerate
  generate
  genvar i3;
  for (i3=0; i3<PORTSIZE_in3; i3=i3+1)
    begin : L3
      assign proxy_in3[(i3+1)*BITSIZE_proxy_in3-1:i3*BITSIZE_proxy_in3] = int_sel_LOAD[i3]|int_sel_STORE[i3] ? in3[(i3+1)*BITSIZE_in3-1:i3*BITSIZE_in3] : 0;
    end
  endgenerate
  assign proxy_sel_LOAD = int_sel_LOAD;
  assign proxy_sel_STORE = int_sel_STORE;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_le_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 <= in2;
endmodule

// Proxy module for function: PROXY_PREF___internal_free
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module PROXY_PREF___internal_free(start_port,
  ap,
  done_port,
  PROXY_PREF_start_port,
  PROXY_PREF_ap,
  PROXY_PREF_done_port,
  sel___internal_free);
  // IN
  input start_port;
  input [31:0] ap;
  input PROXY_PREF_done_port;
  input sel___internal_free;
  // OUT
  output done_port;
  output PROXY_PREF_start_port;
  output [31:0] PROXY_PREF_ap;
  assign PROXY_PREF_start_port = start_port;
  assign PROXY_PREF_ap = sel___internal_free ? ap : 0;
  assign done_port = PROXY_PREF_done_port;
endmodule

// Datapath RTL description for __internal_malloc
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath___internal_malloc(clock,
  reset,
  in_port_nbytes,
  return_port,
  M_Rdata_ram,
  M_DataRdy,
  proxy_out1_792,
  proxy_in1_792,
  proxy_in2_792,
  proxy_in3_792,
  proxy_sel_LOAD_792,
  proxy_sel_STORE_792,
  proxy_out1_796,
  proxy_in1_796,
  proxy_in2_796,
  proxy_in3_796,
  proxy_sel_LOAD_796,
  proxy_sel_STORE_796,
  proxy_out1_992,
  proxy_in1_992,
  proxy_in2_992,
  proxy_in3_992,
  proxy_sel_LOAD_992,
  proxy_sel_STORE_992,
  proxy_out1_1020,
  proxy_in1_1020,
  proxy_in2_1020,
  proxy_in3_1020,
  proxy_sel_LOAD_1020,
  proxy_sel_STORE_1020,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size,
  PROXY_PREF_done_port___internal_free,
  PROXY_PREF_start_port___internal_free,
  PROXY_PREF_ap___internal_free,
  fuselector_BMEMORY_CTRLN_72_i0_LOAD,
  fuselector_BMEMORY_CTRLN_72_i0_STORE,
  fuselector_DPROXY_CTRLN_0_i0_LOAD,
  fuselector_DPROXY_CTRLN_0_i0_STORE,
  fuselector_DPROXY_CTRLN_2_i0_LOAD,
  fuselector_DPROXY_CTRLN_2_i0_STORE,
  selector_IN_UNBOUNDED___internal_malloc_738_1067,
  selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_0,
  selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_1,
  selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_2,
  selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_3,
  selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_0,
  selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_1,
  selector_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0,
  selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0,
  selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0,
  selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1,
  selector_MUX_65_gimple_return_FU_47_i0_0_0_0,
  selector_MUX_73_reg_1_0_0_0,
  selector_MUX_74_reg_10_0_0_0,
  selector_MUX_74_reg_10_0_0_1,
  selector_MUX_75_reg_11_0_0_0,
  selector_MUX_75_reg_11_0_0_1,
  selector_MUX_81_reg_17_0_0_0,
  selector_MUX_88_reg_23_0_0_0,
  selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0,
  fuselector_PROXY_CTRLN_1_i0_LOAD,
  fuselector_PROXY_CTRLN_1_i0_STORE,
  fuselector_PROXY_CTRLN_1_i1_LOAD,
  fuselector_PROXY_CTRLN_1_i1_STORE,
  fuselector_PROXY_CTRLN_3_i0_LOAD,
  fuselector_PROXY_CTRLN_3_i0_STORE,
  fuselector_PROXY_PREF___internal_free_90_i0___internal_free,
  fuselector_PROXY_PREF___internal_free_90_i0_PROXY_PREF___internal_free,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION___internal_malloc_738_1150,
  OUT_CONDITION___internal_malloc_738_1152,
  OUT_CONDITION___internal_malloc_738_1155,
  OUT_CONDITION___internal_malloc_738_921,
  OUT_CONDITION___internal_malloc_738_951,
  OUT_CONDITION___internal_malloc_738_975,
  OUT_UNBOUNDED___internal_malloc_738_1067);
  parameter MEM_var_1020_33671=1048576,
    MEM_var_792_33671=524288,
    MEM_var_796_33671=524288,
    MEM_var_992_33671=524288;
  // IN
  input clock;
  input reset;
  input [31:0] in_port_nbytes;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [127:0] proxy_out1_792;
  input [127:0] proxy_out1_796;
  input [127:0] proxy_out1_992;
  input [127:0] proxy_out1_1020;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [41:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  input PROXY_PREF_done_port___internal_free;
  input fuselector_BMEMORY_CTRLN_72_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_72_i0_STORE;
  input fuselector_DPROXY_CTRLN_0_i0_LOAD;
  input fuselector_DPROXY_CTRLN_0_i0_STORE;
  input fuselector_DPROXY_CTRLN_2_i0_LOAD;
  input fuselector_DPROXY_CTRLN_2_i0_STORE;
  input selector_IN_UNBOUNDED___internal_malloc_738_1067;
  input selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_0;
  input selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_1;
  input selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_1;
  input selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_2;
  input selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_3;
  input selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_0;
  input selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_1;
  input selector_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0;
  input selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0;
  input selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0;
  input selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1;
  input selector_MUX_65_gimple_return_FU_47_i0_0_0_0;
  input selector_MUX_73_reg_1_0_0_0;
  input selector_MUX_74_reg_10_0_0_0;
  input selector_MUX_74_reg_10_0_0_1;
  input selector_MUX_75_reg_11_0_0_0;
  input selector_MUX_75_reg_11_0_0_1;
  input selector_MUX_81_reg_17_0_0_0;
  input selector_MUX_88_reg_23_0_0_0;
  input selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0;
  input fuselector_PROXY_CTRLN_1_i0_LOAD;
  input fuselector_PROXY_CTRLN_1_i0_STORE;
  input fuselector_PROXY_CTRLN_1_i1_LOAD;
  input fuselector_PROXY_CTRLN_1_i1_STORE;
  input fuselector_PROXY_CTRLN_3_i0_LOAD;
  input fuselector_PROXY_CTRLN_3_i0_STORE;
  input fuselector_PROXY_PREF___internal_free_90_i0___internal_free;
  input fuselector_PROXY_PREF___internal_free_90_i0_PROXY_PREF___internal_free;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
  input wrenable_reg_15;
  input wrenable_reg_16;
  input wrenable_reg_17;
  input wrenable_reg_18;
  input wrenable_reg_19;
  input wrenable_reg_2;
  input wrenable_reg_20;
  input wrenable_reg_21;
  input wrenable_reg_22;
  input wrenable_reg_23;
  input wrenable_reg_24;
  input wrenable_reg_25;
  input wrenable_reg_26;
  input wrenable_reg_27;
  input wrenable_reg_28;
  input wrenable_reg_29;
  input wrenable_reg_3;
  input wrenable_reg_30;
  input wrenable_reg_31;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [31:0] return_port;
  output [127:0] proxy_in1_792;
  output [41:0] proxy_in2_792;
  output [13:0] proxy_in3_792;
  output [1:0] proxy_sel_LOAD_792;
  output [1:0] proxy_sel_STORE_792;
  output [127:0] proxy_in1_796;
  output [41:0] proxy_in2_796;
  output [13:0] proxy_in3_796;
  output [1:0] proxy_sel_LOAD_796;
  output [1:0] proxy_sel_STORE_796;
  output [127:0] proxy_in1_992;
  output [41:0] proxy_in2_992;
  output [13:0] proxy_in3_992;
  output [1:0] proxy_sel_LOAD_992;
  output [1:0] proxy_sel_STORE_992;
  output [127:0] proxy_in1_1020;
  output [41:0] proxy_in2_1020;
  output [13:0] proxy_in3_1020;
  output [1:0] proxy_sel_LOAD_1020;
  output [1:0] proxy_sel_STORE_1020;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [41:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  output PROXY_PREF_start_port___internal_free;
  output [31:0] PROXY_PREF_ap___internal_free;
  output OUT_CONDITION___internal_malloc_738_1150;
  output OUT_CONDITION___internal_malloc_738_1152;
  output OUT_CONDITION___internal_malloc_738_1155;
  output OUT_CONDITION___internal_malloc_738_921;
  output OUT_CONDITION___internal_malloc_738_951;
  output OUT_CONDITION___internal_malloc_738_975;
  output OUT_UNBOUNDED___internal_malloc_738_1067;
  // Component and signal declarations
  wire [31:0] null_out_signal_BMEMORY_CTRLN_72_i0_out1_1;
  wire [31:0] null_out_signal_DPROXY_CTRLN_0_i0_out1_1;
  wire [31:0] null_out_signal_DPROXY_CTRLN_2_i0_out1_1;
  wire [31:0] null_out_signal_PROXY_CTRLN_1_i0_out1_0;
  wire [31:0] null_out_signal_PROXY_CTRLN_1_i0_out1_1;
  wire [7:0] null_out_signal_PROXY_CTRLN_3_i0_out1_0;
  wire [7:0] null_out_signal_PROXY_CTRLN_3_i0_out1_1;
  wire [31:0] out_BMEMORY_CTRLN_72_i0_BMEMORY_CTRLN_72_i0;
  wire [31:0] out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0;
  wire [31:0] out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0;
  wire [31:0] out_MUX_0_BMEMORY_CTRLN_72_i0_0_0_0;
  wire [31:0] out_MUX_0_BMEMORY_CTRLN_72_i0_0_0_1;
  wire [20:0] out_MUX_1_BMEMORY_CTRLN_72_i0_1_0_0;
  wire [20:0] out_MUX_1_BMEMORY_CTRLN_72_i0_1_0_1;
  wire [20:0] out_MUX_1_BMEMORY_CTRLN_72_i0_1_0_2;
  wire [20:0] out_MUX_1_BMEMORY_CTRLN_72_i0_1_0_3;
  wire [20:0] out_MUX_1_BMEMORY_CTRLN_72_i0_1_1_0;
  wire [20:0] out_MUX_1_BMEMORY_CTRLN_72_i0_1_1_1;
  wire [20:0] out_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0;
  wire [31:0] out_MUX_4_DPROXY_CTRLN_0_i0_0_0_0;
  wire [20:0] out_MUX_5_DPROXY_CTRLN_0_i0_1_0_0;
  wire [20:0] out_MUX_5_DPROXY_CTRLN_0_i0_1_0_1;
  wire [31:0] out_MUX_65_gimple_return_FU_47_i0_0_0_0;
  wire [31:0] out_MUX_73_reg_1_0_0_0;
  wire [31:0] out_MUX_74_reg_10_0_0_0;
  wire [31:0] out_MUX_74_reg_10_0_0_1;
  wire [31:0] out_MUX_75_reg_11_0_0_0;
  wire [31:0] out_MUX_75_reg_11_0_0_1;
  wire [31:0] out_MUX_81_reg_17_0_0_0;
  wire [31:0] out_MUX_88_reg_23_0_0_0;
  wire [20:0] out_MUX_9_DPROXY_CTRLN_2_i0_1_0_0;
  wire [19:0] out_UUdata_converter_FU_10_i0_fu___internal_malloc_738_34366;
  wire [19:0] out_UUdata_converter_FU_11_i0_fu___internal_malloc_738_34350;
  wire [19:0] out_UUdata_converter_FU_14_i0_fu___internal_malloc_738_34377;
  wire [19:0] out_UUdata_converter_FU_15_i0_fu___internal_malloc_738_34359;
  wire [20:0] out_UUdata_converter_FU_18_i0_fu___internal_malloc_738_34306;
  wire [20:0] out_UUdata_converter_FU_19_i0_fu___internal_malloc_738_34292;
  wire [20:0] out_UUdata_converter_FU_25_i0_fu___internal_malloc_738_34317;
  wire [20:0] out_UUdata_converter_FU_26_i0_fu___internal_malloc_738_34299;
  wire [20:0] out_UUdata_converter_FU_37_i0_fu___internal_malloc_738_34471;
  wire [20:0] out_UUdata_converter_FU_38_i0_fu___internal_malloc_738_34457;
  wire [20:0] out_UUdata_converter_FU_39_i0_fu___internal_malloc_738_34418;
  wire [20:0] out_UUdata_converter_FU_40_i0_fu___internal_malloc_738_34404;
  wire [20:0] out_UUdata_converter_FU_41_i0_fu___internal_malloc_738_34429;
  wire [20:0] out_UUdata_converter_FU_42_i0_fu___internal_malloc_738_34411;
  wire [20:0] out_UUdata_converter_FU_45_i0_fu___internal_malloc_738_34482;
  wire [20:0] out_UUdata_converter_FU_46_i0_fu___internal_malloc_738_34464;
  wire [20:0] out_UUdata_converter_FU_59_i0_fu___internal_malloc_738_34570;
  wire [20:0] out_UUdata_converter_FU_60_i0_fu___internal_malloc_738_34556;
  wire [20:0] out_UUdata_converter_FU_64_i0_fu___internal_malloc_738_34533;
  wire [20:0] out_UUdata_converter_FU_65_i0_fu___internal_malloc_738_34526;
  wire [20:0] out_UUdata_converter_FU_69_i0_fu___internal_malloc_738_34581;
  wire [20:0] out_UUdata_converter_FU_70_i0_fu___internal_malloc_738_34563;
  wire [20:0] out_addr_expr_FU_12_i0_fu___internal_malloc_738_34356;
  wire [19:0] out_addr_expr_FU_13_i0_fu___internal_malloc_738_34392;
  wire [20:0] out_addr_expr_FU_16_i0_fu___internal_malloc_738_34274;
  wire [20:0] out_addr_expr_FU_17_i0_fu___internal_malloc_738_34277;
  wire [19:0] out_addr_expr_FU_20_i0_fu___internal_malloc_738_34510;
  wire [20:0] out_addr_expr_FU_21_i0_fu___internal_malloc_738_34515;
  wire [19:0] out_addr_expr_FU_22_i0_fu___internal_malloc_738_34522;
  wire [19:0] out_addr_expr_FU_23_i0_fu___internal_malloc_738_34501;
  wire [19:0] out_addr_expr_FU_6_i0_fu___internal_malloc_738_34280;
  wire [19:0] out_addr_expr_FU_7_i0_fu___internal_malloc_738_34336;
  wire [20:0] out_addr_expr_FU_8_i0_fu___internal_malloc_738_34347;
  wire [19:0] out_addr_expr_FU_9_i0_fu___internal_malloc_738_34388;
  wire out_const_0;
  wire [31:0] out_const_1;
  wire [2:0] out_const_10;
  wire [19:0] out_const_11;
  wire [20:0] out_const_12;
  wire [19:0] out_const_13;
  wire [6:0] out_const_2;
  wire [2:0] out_const_3;
  wire out_const_4;
  wire [2:0] out_const_5;
  wire [3:0] out_const_6;
  wire [20:0] out_const_7;
  wire [1:0] out_const_8;
  wire [18:0] out_const_9;
  wire [23:0] out_conv_in_port_nbytes_32_24;
  wire [31:0] out_conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_34274_21_32;
  wire [31:0] out_conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_34277_21_32;
  wire [20:0] out_conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_34280_20_21;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [31:0] out_conv_out_const_11_20_32;
  wire [31:0] out_conv_out_const_12_21_32;
  wire [31:0] out_conv_out_const_13_20_32;
  wire [31:0] out_conv_out_const_7_21_32;
  wire [31:0] out_conv_out_reg_0_reg_0_21_32;
  wire [20:0] out_conv_out_reg_10_reg_10_32_21;
  wire [20:0] out_conv_out_reg_11_reg_11_32_21;
  wire [20:0] out_conv_out_reg_12_reg_12_20_21;
  wire [31:0] out_conv_out_reg_13_reg_13_21_32;
  wire [20:0] out_conv_out_reg_14_reg_14_20_21;
  wire [31:0] out_conv_out_reg_15_reg_15_21_32;
  wire [20:0] out_conv_out_reg_16_reg_16_20_21;
  wire [20:0] out_conv_out_reg_3_reg_3_20_21;
  wire [20:0] out_conv_out_reg_4_reg_4_20_21;
  wire [20:0] out_conv_out_reg_6_reg_6_20_21;
  wire [31:0] out_conv_out_u_assign_conn_obj_1_ASSIGN_UNSIGNED_FU_u_assign_0_21_32;
  wire [31:0] out_conv_out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_1_21_32;
  wire out_read_cond_FU_24_i0_fu___internal_malloc_738_921;
  wire out_read_cond_FU_27_i0_fu___internal_malloc_738_951;
  wire out_read_cond_FU_43_i0_fu___internal_malloc_738_975;
  wire out_read_cond_FU_61_i0_fu___internal_malloc_738_1150;
  wire out_read_cond_FU_63_i0_fu___internal_malloc_738_1152;
  wire out_read_cond_FU_71_i0_fu___internal_malloc_738_1155;
  wire [20:0] out_reg_0_reg_0;
  wire [31:0] out_reg_10_reg_10;
  wire [31:0] out_reg_11_reg_11;
  wire [19:0] out_reg_12_reg_12;
  wire [20:0] out_reg_13_reg_13;
  wire [19:0] out_reg_14_reg_14;
  wire [20:0] out_reg_15_reg_15;
  wire [19:0] out_reg_16_reg_16;
  wire [31:0] out_reg_17_reg_17;
  wire [20:0] out_reg_18_reg_18;
  wire [31:0] out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire [31:0] out_reg_20_reg_20;
  wire [31:0] out_reg_21_reg_21;
  wire [20:0] out_reg_22_reg_22;
  wire [31:0] out_reg_23_reg_23;
  wire [31:0] out_reg_24_reg_24;
  wire [31:0] out_reg_25_reg_25;
  wire [31:0] out_reg_26_reg_26;
  wire [20:0] out_reg_27_reg_27;
  wire [31:0] out_reg_28_reg_28;
  wire [20:0] out_reg_29_reg_29;
  wire [20:0] out_reg_2_reg_2;
  wire [20:0] out_reg_30_reg_30;
  wire [20:0] out_reg_31_reg_31;
  wire [19:0] out_reg_3_reg_3;
  wire [19:0] out_reg_4_reg_4;
  wire [20:0] out_reg_5_reg_5;
  wire [19:0] out_reg_6_reg_6;
  wire [20:0] out_reg_7_reg_7;
  wire [31:0] out_reg_8_reg_8;
  wire [20:0] out_reg_9_reg_9;
  wire [20:0] out_u_assign_conn_obj_1_ASSIGN_UNSIGNED_FU_u_assign_0;
  wire [20:0] out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_1;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_73_i0_fu___internal_malloc_738_37536;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_74_i0_fu___internal_malloc_738_1063;
  wire out_ui_eq_expr_FU_32_0_32_75_i0_fu___internal_malloc_738_34754;
  wire out_ui_eq_expr_FU_32_32_32_76_i0_fu___internal_malloc_738_34758;
  wire out_ui_eq_expr_FU_32_32_32_76_i1_fu___internal_malloc_738_34762;
  wire out_ui_le_expr_FU_32_0_32_77_i0_fu___internal_malloc_738_34764;
  wire out_ui_le_expr_FU_32_32_32_78_i0_fu___internal_malloc_738_34756;
  wire out_ui_le_expr_FU_32_32_32_78_i1_fu___internal_malloc_738_34766;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_79_i0_fu___internal_malloc_738_1006;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_79_i1_fu___internal_malloc_738_37520;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_80_i0_fu___internal_malloc_738_1129;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_80_i1_fu___internal_malloc_738_37510;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_80_i2_fu___internal_malloc_738_37532;
  wire [31:0] out_ui_minus_expr_FU_32_32_32_81_i0_fu___internal_malloc_738_1121;
  wire [20:0] out_ui_plus_expr_FU_32_0_32_82_i0_fu___internal_malloc_738_919;
  wire [28:0] out_ui_plus_expr_FU_32_32_32_83_i0_fu___internal_malloc_738_37529;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_84_i0_fu___internal_malloc_738_1079;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_84_i1_fu___internal_malloc_738_1139;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_0_32_85_i0_fu___internal_malloc_738_34302;
  wire [19:0] out_ui_pointer_plus_expr_FU_32_0_32_85_i1_fu___internal_malloc_738_34362;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_0_32_85_i2_fu___internal_malloc_738_34460;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_0_32_85_i3_fu___internal_malloc_738_34467;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_0_32_85_i4_fu___internal_malloc_738_34529;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_0_32_85_i5_fu___internal_malloc_738_34566;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_86_i0_fu___internal_malloc_738_1076;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_86_i1_fu___internal_malloc_738_1126;
  wire [20:0] out_ui_rshift_expr_FU_32_0_32_87_i0_fu___internal_malloc_738_37503;
  wire [20:0] out_ui_rshift_expr_FU_32_0_32_87_i1_fu___internal_malloc_738_37523;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_87_i2_fu___internal_malloc_738_37526;
  wire [20:0] out_ui_rshift_expr_FU_32_0_32_88_i0_fu___internal_malloc_738_37516;
  wire [20:0] out_ui_rshift_expr_FU_32_0_32_89_i0_fu___internal_malloc_738_918;
  wire [31:0] out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_2;
  wire [31:0] out_vb_assign_conn_obj_10_ASSIGN_VECTOR_BOOL_FU_vb_assign_3;
  wire [31:0] out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_4;
  wire [31:0] out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_5;
  wire [31:0] out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_6;
  wire [31:0] out_vb_assign_conn_obj_5_ASSIGN_VECTOR_BOOL_FU_vb_assign_7;
  wire [31:0] out_vb_assign_conn_obj_6_ASSIGN_VECTOR_BOOL_FU_vb_assign_8;
  wire [31:0] out_vb_assign_conn_obj_7_ASSIGN_VECTOR_BOOL_FU_vb_assign_9;
  wire [31:0] out_vb_assign_conn_obj_9_ASSIGN_VECTOR_BOOL_FU_vb_assign_10;
  wire s_done_fu___internal_malloc_738_1067;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [41:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_0;
  wire [31:0] sig_in_bus_mergerPROXY_PREF_ap___internal_free5_0;
  wire sig_in_bus_mergerPROXY_PREF_start_port___internal_free6_0;
  wire [127:0] sig_in_bus_mergerproxy_in1_10207_0;
  wire [127:0] sig_in_bus_mergerproxy_in1_7928_0;
  wire [127:0] sig_in_bus_mergerproxy_in1_7969_0;
  wire [127:0] sig_in_bus_mergerproxy_in1_99210_0;
  wire [41:0] sig_in_bus_mergerproxy_in2_102011_0;
  wire [41:0] sig_in_bus_mergerproxy_in2_79212_0;
  wire [41:0] sig_in_bus_mergerproxy_in2_79613_0;
  wire [41:0] sig_in_bus_mergerproxy_in2_99214_0;
  wire [13:0] sig_in_bus_mergerproxy_in3_102015_0;
  wire [13:0] sig_in_bus_mergerproxy_in3_79216_0;
  wire [13:0] sig_in_bus_mergerproxy_in3_79617_0;
  wire [13:0] sig_in_bus_mergerproxy_in3_99218_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD_102019_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD_79220_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD_79621_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD_99222_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE_102023_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE_79224_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE_79625_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE_99226_0;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [41:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_0;
  wire [127:0] sig_in_vector_bus_mergerproxy_in1_10207_0;
  wire [127:0] sig_in_vector_bus_mergerproxy_in1_7928_0;
  wire [127:0] sig_in_vector_bus_mergerproxy_in1_7969_0;
  wire [127:0] sig_in_vector_bus_mergerproxy_in1_99210_0;
  wire [41:0] sig_in_vector_bus_mergerproxy_in2_102011_0;
  wire [41:0] sig_in_vector_bus_mergerproxy_in2_79212_0;
  wire [41:0] sig_in_vector_bus_mergerproxy_in2_79613_0;
  wire [41:0] sig_in_vector_bus_mergerproxy_in2_99214_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in3_102015_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in3_79216_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in3_79617_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in3_99218_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD_102019_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD_79220_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD_79621_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD_99222_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE_102023_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE_79224_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE_79625_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE_99226_0;
  wire [127:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [41:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [13:0] sig_out_bus_mergerMout_data_ram_size2_;
  wire [1:0] sig_out_bus_mergerMout_oe_ram3_;
  wire [1:0] sig_out_bus_mergerMout_we_ram4_;
  wire [31:0] sig_out_bus_mergerPROXY_PREF_ap___internal_free5_;
  wire sig_out_bus_mergerPROXY_PREF_start_port___internal_free6_;
  wire [127:0] sig_out_bus_mergerproxy_in1_10207_;
  wire [127:0] sig_out_bus_mergerproxy_in1_7928_;
  wire [127:0] sig_out_bus_mergerproxy_in1_7969_;
  wire [127:0] sig_out_bus_mergerproxy_in1_99210_;
  wire [41:0] sig_out_bus_mergerproxy_in2_102011_;
  wire [41:0] sig_out_bus_mergerproxy_in2_79212_;
  wire [41:0] sig_out_bus_mergerproxy_in2_79613_;
  wire [41:0] sig_out_bus_mergerproxy_in2_99214_;
  wire [13:0] sig_out_bus_mergerproxy_in3_102015_;
  wire [13:0] sig_out_bus_mergerproxy_in3_79216_;
  wire [13:0] sig_out_bus_mergerproxy_in3_79617_;
  wire [13:0] sig_out_bus_mergerproxy_in3_99218_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD_102019_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD_79220_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD_79621_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD_99222_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE_102023_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE_79224_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE_79625_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE_99226_;
  
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) ASSIGN_UNSIGNED_FU_u_assign_0 (.out1(out_u_assign_conn_obj_1_ASSIGN_UNSIGNED_FU_u_assign_0),
    .in1(out_conv_out_reg_10_reg_10_32_21));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) ASSIGN_UNSIGNED_FU_u_assign_1 (.out1(out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_1),
    .in1(out_conv_out_reg_11_reg_11_32_21));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_10 (.out1(out_vb_assign_conn_obj_9_ASSIGN_VECTOR_BOOL_FU_vb_assign_10),
    .in1(out_conv_out_reg_0_reg_0_21_32));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_2 (.out1(out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_2),
    .in1(out_conv_out_reg_13_reg_13_21_32));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_3 (.out1(out_vb_assign_conn_obj_10_ASSIGN_VECTOR_BOOL_FU_vb_assign_3),
    .in1(out_reg_19_reg_19));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_4 (.out1(out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_4),
    .in1(out_conv_out_reg_15_reg_15_21_32));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_5 (.out1(out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_5),
    .in1(out_const_1));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_6 (.out1(out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_6),
    .in1(out_reg_25_reg_25));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_7 (.out1(out_vb_assign_conn_obj_5_ASSIGN_VECTOR_BOOL_FU_vb_assign_7),
    .in1(out_reg_8_reg_8));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_8 (.out1(out_vb_assign_conn_obj_6_ASSIGN_VECTOR_BOOL_FU_vb_assign_8),
    .in1(out_conv_out_reg_0_reg_0_21_32));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_9 (.out1(out_vb_assign_conn_obj_7_ASSIGN_VECTOR_BOOL_FU_vb_assign_9),
    .in1(out_reg_1_reg_1));
  BMEMORY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(21),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_Min_oe_ram(1),
    .PORTSIZE_Min_oe_ram(2),
    .BITSIZE_Min_we_ram(1),
    .PORTSIZE_Min_we_ram(2),
    .BITSIZE_Mout_oe_ram(1),
    .PORTSIZE_Mout_oe_ram(2),
    .BITSIZE_Mout_we_ram(1),
    .PORTSIZE_Mout_we_ram(2),
    .BITSIZE_M_DataRdy(1),
    .PORTSIZE_M_DataRdy(2),
    .BITSIZE_Min_addr_ram(21),
    .PORTSIZE_Min_addr_ram(2),
    .BITSIZE_Mout_addr_ram(21),
    .PORTSIZE_Mout_addr_ram(2),
    .BITSIZE_M_Rdata_ram(64),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(64),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(64),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(7),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(7),
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_72_i0 (.out1({null_out_signal_BMEMORY_CTRLN_72_i0_out1_1,
      out_BMEMORY_CTRLN_72_i0_BMEMORY_CTRLN_72_i0}),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_0),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_0),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_0),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_0),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_0),
    .clock(clock),
    .in1({32'b00000000000000000000000000000000,
      out_MUX_0_BMEMORY_CTRLN_72_i0_0_0_1}),
    .in2({21'b000000000000000000000,
      out_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0}),
    .in3({7'b0000000,
      out_const_2}),
    .in4({1'b0,
      out_const_4}),
    .sel_LOAD({1'b0,
      fuselector_BMEMORY_CTRLN_72_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_BMEMORY_CTRLN_72_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  DPROXY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(21),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(21),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) DPROXY_CTRLN_0_i0 (.out1({null_out_signal_DPROXY_CTRLN_0_i0_out1_1,
      out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0}),
    .proxy_in1(sig_in_vector_bus_mergerproxy_in1_7928_0),
    .proxy_in2(sig_in_vector_bus_mergerproxy_in2_79212_0),
    .proxy_in3(sig_in_vector_bus_mergerproxy_in3_79216_0),
    .proxy_sel_LOAD(sig_in_vector_bus_mergerproxy_sel_LOAD_79220_0),
    .proxy_sel_STORE(sig_in_vector_bus_mergerproxy_sel_STORE_79224_0),
    .in1({32'b00000000000000000000000000000000,
      out_MUX_4_DPROXY_CTRLN_0_i0_0_0_0}),
    .in2({21'b000000000000000000000,
      out_MUX_5_DPROXY_CTRLN_0_i0_1_0_1}),
    .in3({7'b0000000,
      out_const_2}),
    .in4({1'b0,
      out_const_4}),
    .sel_LOAD({1'b0,
      fuselector_DPROXY_CTRLN_0_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_DPROXY_CTRLN_0_i0_STORE}),
    .proxy_out1(proxy_out1_792));
  DPROXY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(21),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(21),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) DPROXY_CTRLN_2_i0 (.out1({null_out_signal_DPROXY_CTRLN_2_i0_out1_1,
      out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0}),
    .proxy_in1(sig_in_vector_bus_mergerproxy_in1_99210_0),
    .proxy_in2(sig_in_vector_bus_mergerproxy_in2_99214_0),
    .proxy_in3(sig_in_vector_bus_mergerproxy_in3_99218_0),
    .proxy_sel_LOAD(sig_in_vector_bus_mergerproxy_sel_LOAD_99222_0),
    .proxy_sel_STORE(sig_in_vector_bus_mergerproxy_sel_STORE_99226_0),
    .in1({32'b00000000000000000000000000000000,
      out_vb_assign_conn_obj_10_ASSIGN_VECTOR_BOOL_FU_vb_assign_3}),
    .in2({21'b000000000000000000000,
      out_MUX_9_DPROXY_CTRLN_2_i0_1_0_0}),
    .in3({7'b0000000,
      out_const_2}),
    .in4({1'b0,
      out_const_4}),
    .sel_LOAD({1'b0,
      fuselector_DPROXY_CTRLN_2_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_DPROXY_CTRLN_2_i0_STORE}),
    .proxy_out1(proxy_out1_992));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_0_BMEMORY_CTRLN_72_i0_0_0_0 (.out1(out_MUX_0_BMEMORY_CTRLN_72_i0_0_0_0),
    .sel(selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_0),
    .in1(out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_6),
    .in2(out_vb_assign_conn_obj_5_ASSIGN_VECTOR_BOOL_FU_vb_assign_7));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_0_BMEMORY_CTRLN_72_i0_0_0_1 (.out1(out_MUX_0_BMEMORY_CTRLN_72_i0_0_0_1),
    .sel(selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_1),
    .in1(out_vb_assign_conn_obj_6_ASSIGN_VECTOR_BOOL_FU_vb_assign_8),
    .in2(out_MUX_0_BMEMORY_CTRLN_72_i0_0_0_0));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_1_BMEMORY_CTRLN_72_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_72_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_0),
    .in1(out_reg_9_reg_9),
    .in2(out_reg_31_reg_31));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_1_BMEMORY_CTRLN_72_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_72_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_1),
    .in1(out_reg_30_reg_30),
    .in2(out_reg_29_reg_29));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_1_BMEMORY_CTRLN_72_i0_1_0_2 (.out1(out_MUX_1_BMEMORY_CTRLN_72_i0_1_0_2),
    .sel(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_2),
    .in1(out_reg_27_reg_27),
    .in2(out_reg_22_reg_22));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_1_BMEMORY_CTRLN_72_i0_1_0_3 (.out1(out_MUX_1_BMEMORY_CTRLN_72_i0_1_0_3),
    .sel(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_3),
    .in1(out_reg_2_reg_2),
    .in2(out_reg_18_reg_18));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_1_BMEMORY_CTRLN_72_i0_1_1_0 (.out1(out_MUX_1_BMEMORY_CTRLN_72_i0_1_1_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_72_i0_1_0_0),
    .in2(out_MUX_1_BMEMORY_CTRLN_72_i0_1_0_1));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_1_BMEMORY_CTRLN_72_i0_1_1_1 (.out1(out_MUX_1_BMEMORY_CTRLN_72_i0_1_1_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_1),
    .in1(out_MUX_1_BMEMORY_CTRLN_72_i0_1_0_2),
    .in2(out_MUX_1_BMEMORY_CTRLN_72_i0_1_0_3));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_1_BMEMORY_CTRLN_72_i0_1_2_0 (.out1(out_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_72_i0_1_1_0),
    .in2(out_MUX_1_BMEMORY_CTRLN_72_i0_1_1_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_DPROXY_CTRLN_0_i0_0_0_0 (.out1(out_MUX_4_DPROXY_CTRLN_0_i0_0_0_0),
    .sel(selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0),
    .in1(out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_2),
    .in2(out_vb_assign_conn_obj_7_ASSIGN_VECTOR_BOOL_FU_vb_assign_9));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_5_DPROXY_CTRLN_0_i0_1_0_0 (.out1(out_MUX_5_DPROXY_CTRLN_0_i0_1_0_0),
    .sel(selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0),
    .in1(out_conv_out_reg_3_reg_3_20_21),
    .in2(out_conv_out_reg_12_reg_12_20_21));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_5_DPROXY_CTRLN_0_i0_1_0_1 (.out1(out_MUX_5_DPROXY_CTRLN_0_i0_1_0_1),
    .sel(selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1),
    .in1(out_conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_34280_20_21),
    .in2(out_MUX_5_DPROXY_CTRLN_0_i0_1_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_65_gimple_return_FU_47_i0_0_0_0 (.out1(out_MUX_65_gimple_return_FU_47_i0_0_0_0),
    .sel(selector_MUX_65_gimple_return_FU_47_i0_0_0_0),
    .in1(out_conv_out_const_0_1_32),
    .in2(out_ui_pointer_plus_expr_FU_32_0_32_84_i1_fu___internal_malloc_738_1139));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_73_reg_1_0_0_0 (.out1(out_MUX_73_reg_1_0_0_0),
    .sel(selector_MUX_73_reg_1_0_0_0),
    .in1(out_reg_17_reg_17),
    .in2(out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_74_reg_10_0_0_0 (.out1(out_MUX_74_reg_10_0_0_0),
    .sel(selector_MUX_74_reg_10_0_0_0),
    .in1(out_reg_1_reg_1),
    .in2(out_conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_34274_21_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_74_reg_10_0_0_1 (.out1(out_MUX_74_reg_10_0_0_1),
    .sel(selector_MUX_74_reg_10_0_0_1),
    .in1(out_conv_out_u_assign_conn_obj_1_ASSIGN_UNSIGNED_FU_u_assign_0_21_32),
    .in2(out_MUX_74_reg_10_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_75_reg_11_0_0_0 (.out1(out_MUX_75_reg_11_0_0_0),
    .sel(selector_MUX_75_reg_11_0_0_0),
    .in1(out_reg_8_reg_8),
    .in2(out_conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_34277_21_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_75_reg_11_0_0_1 (.out1(out_MUX_75_reg_11_0_0_1),
    .sel(selector_MUX_75_reg_11_0_0_1),
    .in1(out_conv_out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_1_21_32),
    .in2(out_MUX_75_reg_11_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_81_reg_17_0_0_0 (.out1(out_MUX_81_reg_17_0_0_0),
    .sel(selector_MUX_81_reg_17_0_0_0),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_11_reg_11));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_88_reg_23_0_0_0 (.out1(out_MUX_88_reg_23_0_0_0),
    .sel(selector_MUX_88_reg_23_0_0_0),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_28_reg_28));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_9_DPROXY_CTRLN_2_i0_1_0_0 (.out1(out_MUX_9_DPROXY_CTRLN_2_i0_1_0_0),
    .sel(selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0),
    .in1(out_conv_out_reg_6_reg_6_20_21),
    .in2(out_conv_out_reg_4_reg_4_20_21));
  PROXY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(21),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(21),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) PROXY_CTRLN_1_i0 (.out1({null_out_signal_PROXY_CTRLN_1_i0_out1_1,
      null_out_signal_PROXY_CTRLN_1_i0_out1_0}),
    .proxy_in1(sig_in_vector_bus_mergerproxy_in1_7969_0),
    .proxy_in2(sig_in_vector_bus_mergerproxy_in2_79613_0),
    .proxy_in3(sig_in_vector_bus_mergerproxy_in3_79617_0),
    .proxy_sel_LOAD(sig_in_vector_bus_mergerproxy_sel_LOAD_79621_0),
    .proxy_sel_STORE(sig_in_vector_bus_mergerproxy_sel_STORE_79625_0),
    .in1({out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_5,
      out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_4}),
    .in2({out_conv_out_reg_16_reg_16_20_21,
      out_conv_out_reg_14_reg_14_20_21}),
    .in3({out_const_2,
      out_const_2}),
    .in4({out_const_4,
      out_const_4}),
    .sel_LOAD({fuselector_PROXY_CTRLN_1_i1_LOAD,
      fuselector_PROXY_CTRLN_1_i0_LOAD}),
    .sel_STORE({fuselector_PROXY_CTRLN_1_i1_STORE,
      fuselector_PROXY_CTRLN_1_i0_STORE}),
    .proxy_out1(proxy_out1_796));
  PROXY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(21),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(21),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) PROXY_CTRLN_3_i0 (.out1({null_out_signal_PROXY_CTRLN_3_i0_out1_1,
      null_out_signal_PROXY_CTRLN_3_i0_out1_0}),
    .proxy_in1(sig_in_vector_bus_mergerproxy_in1_10207_0),
    .proxy_in2(sig_in_vector_bus_mergerproxy_in2_102011_0),
    .proxy_in3(sig_in_vector_bus_mergerproxy_in3_102015_0),
    .proxy_sel_LOAD(sig_in_vector_bus_mergerproxy_sel_LOAD_102019_0),
    .proxy_sel_STORE(sig_in_vector_bus_mergerproxy_sel_STORE_102023_0),
    .in1({32'b00000000000000000000000000000000,
      out_vb_assign_conn_obj_9_ASSIGN_VECTOR_BOOL_FU_vb_assign_10}),
    .in2({21'b000000000000000000000,
      out_ui_pointer_plus_expr_FU_32_0_32_85_i4_fu___internal_malloc_738_34529}),
    .in3({7'b0000000,
      out_const_2}),
    .in4({1'b0,
      out_const_4}),
    .sel_LOAD({1'b0,
      fuselector_PROXY_CTRLN_3_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_PROXY_CTRLN_3_i0_STORE}),
    .proxy_out1(proxy_out1_1020));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_),
    .in1({sig_in_bus_mergerMout_Wdata_ram0_0}));
  bus_merger #(.BITSIZE_in1(42),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(42)) bus_mergerMout_addr_ram1_ (.out1(sig_out_bus_mergerMout_addr_ram1_),
    .in1({sig_in_bus_mergerMout_addr_ram1_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_),
    .in1({sig_in_bus_mergerMout_data_ram_size2_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerMout_oe_ram3_ (.out1(sig_out_bus_mergerMout_oe_ram3_),
    .in1({sig_in_bus_mergerMout_oe_ram3_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerMout_we_ram4_ (.out1(sig_out_bus_mergerMout_we_ram4_),
    .in1({sig_in_bus_mergerMout_we_ram4_0}));
  bus_merger #(.BITSIZE_in1(32),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(32)) bus_mergerPROXY_PREF_ap___internal_free5_ (.out1(sig_out_bus_mergerPROXY_PREF_ap___internal_free5_),
    .in1({sig_in_bus_mergerPROXY_PREF_ap___internal_free5_0}));
  bus_merger #(.BITSIZE_in1(1),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(1)) bus_mergerPROXY_PREF_start_port___internal_free6_ (.out1(sig_out_bus_mergerPROXY_PREF_start_port___internal_free6_),
    .in1({sig_in_bus_mergerPROXY_PREF_start_port___internal_free6_0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerproxy_in1_10207_ (.out1(sig_out_bus_mergerproxy_in1_10207_),
    .in1({sig_in_bus_mergerproxy_in1_10207_0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerproxy_in1_7928_ (.out1(sig_out_bus_mergerproxy_in1_7928_),
    .in1({sig_in_bus_mergerproxy_in1_7928_0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerproxy_in1_7969_ (.out1(sig_out_bus_mergerproxy_in1_7969_),
    .in1({sig_in_bus_mergerproxy_in1_7969_0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerproxy_in1_99210_ (.out1(sig_out_bus_mergerproxy_in1_99210_),
    .in1({sig_in_bus_mergerproxy_in1_99210_0}));
  bus_merger #(.BITSIZE_in1(42),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(42)) bus_mergerproxy_in2_102011_ (.out1(sig_out_bus_mergerproxy_in2_102011_),
    .in1({sig_in_bus_mergerproxy_in2_102011_0}));
  bus_merger #(.BITSIZE_in1(42),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(42)) bus_mergerproxy_in2_79212_ (.out1(sig_out_bus_mergerproxy_in2_79212_),
    .in1({sig_in_bus_mergerproxy_in2_79212_0}));
  bus_merger #(.BITSIZE_in1(42),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(42)) bus_mergerproxy_in2_79613_ (.out1(sig_out_bus_mergerproxy_in2_79613_),
    .in1({sig_in_bus_mergerproxy_in2_79613_0}));
  bus_merger #(.BITSIZE_in1(42),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(42)) bus_mergerproxy_in2_99214_ (.out1(sig_out_bus_mergerproxy_in2_99214_),
    .in1({sig_in_bus_mergerproxy_in2_99214_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerproxy_in3_102015_ (.out1(sig_out_bus_mergerproxy_in3_102015_),
    .in1({sig_in_bus_mergerproxy_in3_102015_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerproxy_in3_79216_ (.out1(sig_out_bus_mergerproxy_in3_79216_),
    .in1({sig_in_bus_mergerproxy_in3_79216_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerproxy_in3_79617_ (.out1(sig_out_bus_mergerproxy_in3_79617_),
    .in1({sig_in_bus_mergerproxy_in3_79617_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerproxy_in3_99218_ (.out1(sig_out_bus_mergerproxy_in3_99218_),
    .in1({sig_in_bus_mergerproxy_in3_99218_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD_102019_ (.out1(sig_out_bus_mergerproxy_sel_LOAD_102019_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD_102019_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD_79220_ (.out1(sig_out_bus_mergerproxy_sel_LOAD_79220_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD_79220_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD_79621_ (.out1(sig_out_bus_mergerproxy_sel_LOAD_79621_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD_79621_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD_99222_ (.out1(sig_out_bus_mergerproxy_sel_LOAD_99222_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD_99222_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE_102023_ (.out1(sig_out_bus_mergerproxy_sel_STORE_102023_),
    .in1({sig_in_bus_mergerproxy_sel_STORE_102023_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE_79224_ (.out1(sig_out_bus_mergerproxy_sel_STORE_79224_),
    .in1({sig_in_bus_mergerproxy_sel_STORE_79224_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE_79625_ (.out1(sig_out_bus_mergerproxy_sel_STORE_79625_),
    .in1({sig_in_bus_mergerproxy_sel_STORE_79625_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE_99226_ (.out1(sig_out_bus_mergerproxy_sel_STORE_99226_),
    .in1({sig_in_bus_mergerproxy_sel_STORE_99226_0}));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b00000000000000000000000000000000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(20),
    .value(MEM_var_792_33671)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(21),
    .value(MEM_var_796_33671)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(20),
    .value(MEM_var_992_33671)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b011)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(21),
    .value(MEM_var_1020_33671)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(19),
    .value(19'b1100000000000000000)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(24)) conv_in_port_nbytes_32_24 (.out1(out_conv_in_port_nbytes_32_24),
    .in1(in_port_nbytes));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(32)) conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_34274_21_32 (.out1(out_conv_out_addr_expr_FU_16_i0_fu___internal_malloc_738_34274_21_32),
    .in1(out_addr_expr_FU_16_i0_fu___internal_malloc_738_34274));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(32)) conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_34277_21_32 (.out1(out_conv_out_addr_expr_FU_17_i0_fu___internal_malloc_738_34277_21_32),
    .in1(out_addr_expr_FU_17_i0_fu___internal_malloc_738_34277));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(21)) conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_34280_20_21 (.out1(out_conv_out_addr_expr_FU_6_i0_fu___internal_malloc_738_34280_20_21),
    .in1(out_addr_expr_FU_6_i0_fu___internal_malloc_738_34280));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(32)) conv_out_const_11_20_32 (.out1(out_conv_out_const_11_20_32),
    .in1(out_const_11));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(32)) conv_out_const_12_21_32 (.out1(out_conv_out_const_12_21_32),
    .in1(out_const_12));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(32)) conv_out_const_13_20_32 (.out1(out_conv_out_const_13_20_32),
    .in1(out_const_13));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(32)) conv_out_const_7_21_32 (.out1(out_conv_out_const_7_21_32),
    .in1(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(32)) conv_out_reg_0_reg_0_21_32 (.out1(out_conv_out_reg_0_reg_0_21_32),
    .in1(out_reg_0_reg_0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) conv_out_reg_10_reg_10_32_21 (.out1(out_conv_out_reg_10_reg_10_32_21),
    .in1(out_reg_10_reg_10));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) conv_out_reg_11_reg_11_32_21 (.out1(out_conv_out_reg_11_reg_11_32_21),
    .in1(out_reg_11_reg_11));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(21)) conv_out_reg_12_reg_12_20_21 (.out1(out_conv_out_reg_12_reg_12_20_21),
    .in1(out_reg_12_reg_12));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(32)) conv_out_reg_13_reg_13_21_32 (.out1(out_conv_out_reg_13_reg_13_21_32),
    .in1(out_reg_13_reg_13));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(21)) conv_out_reg_14_reg_14_20_21 (.out1(out_conv_out_reg_14_reg_14_20_21),
    .in1(out_reg_14_reg_14));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(32)) conv_out_reg_15_reg_15_21_32 (.out1(out_conv_out_reg_15_reg_15_21_32),
    .in1(out_reg_15_reg_15));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(21)) conv_out_reg_16_reg_16_20_21 (.out1(out_conv_out_reg_16_reg_16_20_21),
    .in1(out_reg_16_reg_16));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(21)) conv_out_reg_3_reg_3_20_21 (.out1(out_conv_out_reg_3_reg_3_20_21),
    .in1(out_reg_3_reg_3));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(21)) conv_out_reg_4_reg_4_20_21 (.out1(out_conv_out_reg_4_reg_4_20_21),
    .in1(out_reg_4_reg_4));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(21)) conv_out_reg_6_reg_6_20_21 (.out1(out_conv_out_reg_6_reg_6_20_21),
    .in1(out_reg_6_reg_6));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(32)) conv_out_u_assign_conn_obj_1_ASSIGN_UNSIGNED_FU_u_assign_0_21_32 (.out1(out_conv_out_u_assign_conn_obj_1_ASSIGN_UNSIGNED_FU_u_assign_0_21_32),
    .in1(out_u_assign_conn_obj_1_ASSIGN_UNSIGNED_FU_u_assign_0));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(32)) conv_out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_1_21_32 (.out1(out_conv_out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_1_21_32),
    .in1(out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_1));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(32)) fu___internal_malloc_738_1006 (.out1(out_ui_lshift_expr_FU_32_0_32_79_i0_fu___internal_malloc_738_1006),
    .in1(out_ui_plus_expr_FU_32_0_32_82_i0_fu___internal_malloc_738_919),
    .in2(out_const_8));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu___internal_malloc_738_1063 (.out1(out_ui_bit_ior_concat_expr_FU_74_i0_fu___internal_malloc_738_1063),
    .in1(out_ui_lshift_expr_FU_32_0_32_80_i2_fu___internal_malloc_738_37532),
    .in2(out_ui_bit_and_expr_FU_8_0_8_73_i0_fu___internal_malloc_738_37536),
    .in3(out_const_8));
  PROXY_PREF___internal_free fu___internal_malloc_738_1067 (.done_port(s_done_fu___internal_malloc_738_1067),
    .PROXY_PREF_start_port(sig_in_bus_mergerPROXY_PREF_start_port___internal_free6_0),
    .PROXY_PREF_ap(sig_in_bus_mergerPROXY_PREF_ap___internal_free5_0),
    .start_port(selector_IN_UNBOUNDED___internal_malloc_738_1067),
    .ap(out_reg_21_reg_21),
    .PROXY_PREF_done_port(PROXY_PREF_done_port___internal_free),
    .sel___internal_free(fuselector_PROXY_PREF___internal_free_90_i0___internal_free));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_1076 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_86_i0_fu___internal_malloc_738_1076),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_20_reg_20));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_1079 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_84_i0_fu___internal_malloc_738_1079),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_86_i0_fu___internal_malloc_738_1076),
    .in2(out_const_6));
  ui_minus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(21),
    .BITSIZE_out1(32)) fu___internal_malloc_738_1121 (.out1(out_ui_minus_expr_FU_32_32_32_81_i0_fu___internal_malloc_738_1121),
    .in1(out_reg_24_reg_24),
    .in2(out_reg_0_reg_0));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_1126 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_86_i1_fu___internal_malloc_738_1126),
    .in1(out_reg_23_reg_23),
    .in2(out_reg_26_reg_26));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___internal_malloc_738_1129 (.out1(out_ui_lshift_expr_FU_32_0_32_80_i0_fu___internal_malloc_738_1129),
    .in1(out_ui_minus_expr_FU_32_32_32_81_i0_fu___internal_malloc_738_1121),
    .in2(out_const_8));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_1139 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_84_i1_fu___internal_malloc_738_1139),
    .in1(out_reg_23_reg_23),
    .in2(out_const_6));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_1150 (.out1(out_read_cond_FU_61_i0_fu___internal_malloc_738_1150),
    .in1(out_ui_eq_expr_FU_32_32_32_76_i1_fu___internal_malloc_738_34762));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_1152 (.out1(out_read_cond_FU_63_i0_fu___internal_malloc_738_1152),
    .in1(out_ui_le_expr_FU_32_0_32_77_i0_fu___internal_malloc_738_34764));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_1155 (.out1(out_read_cond_FU_71_i0_fu___internal_malloc_738_1155),
    .in1(out_ui_le_expr_FU_32_32_32_78_i1_fu___internal_malloc_738_34766));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34274 (.out1(out_addr_expr_FU_16_i0_fu___internal_malloc_738_34274),
    .in1(out_conv_out_const_12_21_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34277 (.out1(out_addr_expr_FU_17_i0_fu___internal_malloc_738_34277),
    .in1(out_conv_out_const_12_21_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_34280 (.out1(out_addr_expr_FU_6_i0_fu___internal_malloc_738_34280),
    .in1(out_conv_out_const_11_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34292 (.out1(out_UUdata_converter_FU_19_i0_fu___internal_malloc_738_34292),
    .in1(out_UUdata_converter_FU_18_i0_fu___internal_malloc_738_34306));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34299 (.out1(out_UUdata_converter_FU_26_i0_fu___internal_malloc_738_34299),
    .in1(out_UUdata_converter_FU_25_i0_fu___internal_malloc_738_34317));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(3),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_34302 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_85_i0_fu___internal_malloc_738_34302),
    .in1(out_UUdata_converter_FU_26_i0_fu___internal_malloc_738_34299),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34306 (.out1(out_UUdata_converter_FU_18_i0_fu___internal_malloc_738_34306),
    .in1(out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34317 (.out1(out_UUdata_converter_FU_25_i0_fu___internal_malloc_738_34317),
    .in1(out_BMEMORY_CTRLN_72_i0_BMEMORY_CTRLN_72_i0));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_34336 (.out1(out_addr_expr_FU_7_i0_fu___internal_malloc_738_34336),
    .in1(out_conv_out_const_11_20_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34347 (.out1(out_addr_expr_FU_8_i0_fu___internal_malloc_738_34347),
    .in1(out_conv_out_const_12_21_32));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_34350 (.out1(out_UUdata_converter_FU_11_i0_fu___internal_malloc_738_34350),
    .in1(out_UUdata_converter_FU_10_i0_fu___internal_malloc_738_34366));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34356 (.out1(out_addr_expr_FU_12_i0_fu___internal_malloc_738_34356),
    .in1(out_conv_out_const_12_21_32));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_34359 (.out1(out_UUdata_converter_FU_15_i0_fu___internal_malloc_738_34359),
    .in1(out_UUdata_converter_FU_14_i0_fu___internal_malloc_738_34377));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(20),
    .BITSIZE_in2(3),
    .BITSIZE_out1(20),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_34362 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_85_i1_fu___internal_malloc_738_34362),
    .in1(out_UUdata_converter_FU_15_i0_fu___internal_malloc_738_34359),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_34366 (.out1(out_UUdata_converter_FU_10_i0_fu___internal_malloc_738_34366),
    .in1(out_addr_expr_FU_9_i0_fu___internal_malloc_738_34388));
  UUdata_converter_FU #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) fu___internal_malloc_738_34377 (.out1(out_UUdata_converter_FU_14_i0_fu___internal_malloc_738_34377),
    .in1(out_addr_expr_FU_13_i0_fu___internal_malloc_738_34392));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_34388 (.out1(out_addr_expr_FU_9_i0_fu___internal_malloc_738_34388),
    .in1(out_conv_out_const_12_21_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_34392 (.out1(out_addr_expr_FU_13_i0_fu___internal_malloc_738_34392),
    .in1(out_conv_out_const_12_21_32));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34404 (.out1(out_UUdata_converter_FU_40_i0_fu___internal_malloc_738_34404),
    .in1(out_UUdata_converter_FU_39_i0_fu___internal_malloc_738_34418));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34411 (.out1(out_UUdata_converter_FU_42_i0_fu___internal_malloc_738_34411),
    .in1(out_UUdata_converter_FU_41_i0_fu___internal_malloc_738_34429));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34418 (.out1(out_UUdata_converter_FU_39_i0_fu___internal_malloc_738_34418),
    .in1(out_reg_23_reg_23));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34429 (.out1(out_UUdata_converter_FU_41_i0_fu___internal_malloc_738_34429),
    .in1(out_reg_1_reg_1));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34457 (.out1(out_UUdata_converter_FU_38_i0_fu___internal_malloc_738_34457),
    .in1(out_UUdata_converter_FU_37_i0_fu___internal_malloc_738_34471));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(3),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_34460 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_85_i2_fu___internal_malloc_738_34460),
    .in1(out_UUdata_converter_FU_38_i0_fu___internal_malloc_738_34457),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34464 (.out1(out_UUdata_converter_FU_46_i0_fu___internal_malloc_738_34464),
    .in1(out_UUdata_converter_FU_45_i0_fu___internal_malloc_738_34482));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(3),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_34467 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_85_i3_fu___internal_malloc_738_34467),
    .in1(out_UUdata_converter_FU_46_i0_fu___internal_malloc_738_34464),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34471 (.out1(out_UUdata_converter_FU_37_i0_fu___internal_malloc_738_34471),
    .in1(out_reg_23_reg_23));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34482 (.out1(out_UUdata_converter_FU_45_i0_fu___internal_malloc_738_34482),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_86_i1_fu___internal_malloc_738_1126));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_34501 (.out1(out_addr_expr_FU_23_i0_fu___internal_malloc_738_34501),
    .in1(out_conv_out_const_11_20_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_34510 (.out1(out_addr_expr_FU_20_i0_fu___internal_malloc_738_34510),
    .in1(out_conv_out_const_13_20_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34515 (.out1(out_addr_expr_FU_21_i0_fu___internal_malloc_738_34515),
    .in1(out_conv_out_const_7_21_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(20)) fu___internal_malloc_738_34522 (.out1(out_addr_expr_FU_22_i0_fu___internal_malloc_738_34522),
    .in1(out_conv_out_const_13_20_32));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34526 (.out1(out_UUdata_converter_FU_65_i0_fu___internal_malloc_738_34526),
    .in1(out_UUdata_converter_FU_64_i0_fu___internal_malloc_738_34533));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(3),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_34529 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_85_i4_fu___internal_malloc_738_34529),
    .in1(out_UUdata_converter_FU_65_i0_fu___internal_malloc_738_34526),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34533 (.out1(out_UUdata_converter_FU_64_i0_fu___internal_malloc_738_34533),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_86_i0_fu___internal_malloc_738_1076));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34556 (.out1(out_UUdata_converter_FU_60_i0_fu___internal_malloc_738_34556),
    .in1(out_UUdata_converter_FU_59_i0_fu___internal_malloc_738_34570));
  UUdata_converter_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34563 (.out1(out_UUdata_converter_FU_70_i0_fu___internal_malloc_738_34563),
    .in1(out_UUdata_converter_FU_69_i0_fu___internal_malloc_738_34581));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(3),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu___internal_malloc_738_34566 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_85_i5_fu___internal_malloc_738_34566),
    .in1(out_UUdata_converter_FU_70_i0_fu___internal_malloc_738_34563),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34570 (.out1(out_UUdata_converter_FU_59_i0_fu___internal_malloc_738_34570),
    .in1(out_reg_17_reg_17));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu___internal_malloc_738_34581 (.out1(out_UUdata_converter_FU_69_i0_fu___internal_malloc_738_34581),
    .in1(out_BMEMORY_CTRLN_72_i0_BMEMORY_CTRLN_72_i0));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu___internal_malloc_738_34754 (.out1(out_ui_eq_expr_FU_32_0_32_75_i0_fu___internal_malloc_738_34754),
    .in1(out_DPROXY_CTRLN_0_i0_DPROXY_CTRLN_0_i0),
    .in2(out_const_0));
  ui_le_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_34756 (.out1(out_ui_le_expr_FU_32_32_32_78_i0_fu___internal_malloc_738_34756),
    .in1(out_reg_0_reg_0),
    .in2(out_BMEMORY_CTRLN_72_i0_BMEMORY_CTRLN_72_i0));
  ui_eq_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_34758 (.out1(out_ui_eq_expr_FU_32_32_32_76_i0_fu___internal_malloc_738_34758),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_24_reg_24));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_34762 (.out1(out_ui_eq_expr_FU_32_32_32_76_i1_fu___internal_malloc_738_34762),
    .in1(out_reg_10_reg_10),
    .in2(out_reg_17_reg_17));
  ui_le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(19),
    .BITSIZE_out1(1)) fu___internal_malloc_738_34764 (.out1(out_ui_le_expr_FU_32_0_32_77_i0_fu___internal_malloc_738_34764),
    .in1(out_ui_bit_ior_concat_expr_FU_74_i0_fu___internal_malloc_738_1063),
    .in2(out_const_9));
  ui_le_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu___internal_malloc_738_34766 (.out1(out_ui_le_expr_FU_32_32_32_78_i1_fu___internal_malloc_738_34766),
    .in1(out_reg_0_reg_0),
    .in2(out_BMEMORY_CTRLN_72_i0_BMEMORY_CTRLN_72_i0));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(2),
    .BITSIZE_out1(21),
    .PRECISION(32)) fu___internal_malloc_738_37503 (.out1(out_ui_rshift_expr_FU_32_0_32_87_i0_fu___internal_malloc_738_37503),
    .in1(out_conv_in_port_nbytes_32_24),
    .in2(out_const_8));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(32)) fu___internal_malloc_738_37510 (.out1(out_ui_lshift_expr_FU_32_0_32_80_i1_fu___internal_malloc_738_37510),
    .in1(out_ui_rshift_expr_FU_32_0_32_87_i0_fu___internal_malloc_738_37503),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(2),
    .BITSIZE_out1(21),
    .PRECISION(32)) fu___internal_malloc_738_37516 (.out1(out_ui_rshift_expr_FU_32_0_32_88_i0_fu___internal_malloc_738_37516),
    .in1(out_ui_lshift_expr_FU_32_0_32_79_i0_fu___internal_malloc_738_1006),
    .in2(out_const_8));
  ui_lshift_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(2),
    .BITSIZE_out1(24),
    .PRECISION(32)) fu___internal_malloc_738_37520 (.out1(out_ui_lshift_expr_FU_32_0_32_79_i1_fu___internal_malloc_738_37520),
    .in1(out_ui_rshift_expr_FU_32_0_32_88_i0_fu___internal_malloc_738_37516),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(2),
    .BITSIZE_out1(21),
    .PRECISION(32)) fu___internal_malloc_738_37523 (.out1(out_ui_rshift_expr_FU_32_0_32_87_i1_fu___internal_malloc_738_37523),
    .in1(out_ui_lshift_expr_FU_32_0_32_79_i1_fu___internal_malloc_738_37520),
    .in2(out_const_8));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu___internal_malloc_738_37526 (.out1(out_ui_rshift_expr_FU_32_0_32_87_i2_fu___internal_malloc_738_37526),
    .in1(out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0),
    .in2(out_const_8));
  ui_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(29),
    .BITSIZE_out1(29)) fu___internal_malloc_738_37529 (.out1(out_ui_plus_expr_FU_32_32_32_83_i0_fu___internal_malloc_738_37529),
    .in1(out_reg_7_reg_7),
    .in2(out_ui_rshift_expr_FU_32_0_32_87_i2_fu___internal_malloc_738_37526));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu___internal_malloc_738_37532 (.out1(out_ui_lshift_expr_FU_32_0_32_80_i2_fu___internal_malloc_738_37532),
    .in1(out_ui_plus_expr_FU_32_32_32_83_i0_fu___internal_malloc_738_37529),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu___internal_malloc_738_37536 (.out1(out_ui_bit_and_expr_FU_8_0_8_73_i0_fu___internal_malloc_738_37536),
    .in1(out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0),
    .in2(out_const_10));
  ui_rshift_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(3),
    .BITSIZE_out1(21),
    .PRECISION(32)) fu___internal_malloc_738_918 (.out1(out_ui_rshift_expr_FU_32_0_32_89_i0_fu___internal_malloc_738_918),
    .in1(out_ui_lshift_expr_FU_32_0_32_80_i1_fu___internal_malloc_738_37510),
    .in2(out_const_3));
  ui_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(1),
    .BITSIZE_out1(21)) fu___internal_malloc_738_919 (.out1(out_ui_plus_expr_FU_32_0_32_82_i0_fu___internal_malloc_738_919),
    .in1(out_ui_rshift_expr_FU_32_0_32_89_i0_fu___internal_malloc_738_918),
    .in2(out_const_4));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_921 (.out1(out_read_cond_FU_24_i0_fu___internal_malloc_738_921),
    .in1(out_ui_eq_expr_FU_32_0_32_75_i0_fu___internal_malloc_738_34754));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_951 (.out1(out_read_cond_FU_27_i0_fu___internal_malloc_738_951),
    .in1(out_ui_le_expr_FU_32_32_32_78_i0_fu___internal_malloc_738_34756));
  read_cond_FU #(.BITSIZE_in1(1)) fu___internal_malloc_738_975 (.out1(out_read_cond_FU_43_i0_fu___internal_malloc_738_975),
    .in1(out_ui_eq_expr_FU_32_32_32_76_i0_fu___internal_malloc_738_34758));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(21),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(42)) join_signalbus_mergerMout_addr_ram1_0 (.out1(sig_in_bus_mergerMout_addr_ram1_0),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_0 (.out1(sig_in_bus_mergerMout_oe_ram3_0),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_0 (.out1(sig_in_bus_mergerMout_we_ram4_0),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in1_10207_0 (.out1(sig_in_bus_mergerproxy_in1_10207_0),
    .in1(sig_in_vector_bus_mergerproxy_in1_10207_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in1_7928_0 (.out1(sig_in_bus_mergerproxy_in1_7928_0),
    .in1(sig_in_vector_bus_mergerproxy_in1_7928_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in1_7969_0 (.out1(sig_in_bus_mergerproxy_in1_7969_0),
    .in1(sig_in_vector_bus_mergerproxy_in1_7969_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in1_99210_0 (.out1(sig_in_bus_mergerproxy_in1_99210_0),
    .in1(sig_in_vector_bus_mergerproxy_in1_99210_0));
  join_signal #(.BITSIZE_in1(21),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(42)) join_signalbus_mergerproxy_in2_102011_0 (.out1(sig_in_bus_mergerproxy_in2_102011_0),
    .in1(sig_in_vector_bus_mergerproxy_in2_102011_0));
  join_signal #(.BITSIZE_in1(21),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(42)) join_signalbus_mergerproxy_in2_79212_0 (.out1(sig_in_bus_mergerproxy_in2_79212_0),
    .in1(sig_in_vector_bus_mergerproxy_in2_79212_0));
  join_signal #(.BITSIZE_in1(21),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(42)) join_signalbus_mergerproxy_in2_79613_0 (.out1(sig_in_bus_mergerproxy_in2_79613_0),
    .in1(sig_in_vector_bus_mergerproxy_in2_79613_0));
  join_signal #(.BITSIZE_in1(21),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(42)) join_signalbus_mergerproxy_in2_99214_0 (.out1(sig_in_bus_mergerproxy_in2_99214_0),
    .in1(sig_in_vector_bus_mergerproxy_in2_99214_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in3_102015_0 (.out1(sig_in_bus_mergerproxy_in3_102015_0),
    .in1(sig_in_vector_bus_mergerproxy_in3_102015_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in3_79216_0 (.out1(sig_in_bus_mergerproxy_in3_79216_0),
    .in1(sig_in_vector_bus_mergerproxy_in3_79216_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in3_79617_0 (.out1(sig_in_bus_mergerproxy_in3_79617_0),
    .in1(sig_in_vector_bus_mergerproxy_in3_79617_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in3_99218_0 (.out1(sig_in_bus_mergerproxy_in3_99218_0),
    .in1(sig_in_vector_bus_mergerproxy_in3_99218_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD_102019_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD_102019_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD_102019_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD_79220_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD_79220_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD_79220_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD_79621_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD_79621_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD_79621_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD_99222_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD_99222_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD_99222_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE_102023_0 (.out1(sig_in_bus_mergerproxy_sel_STORE_102023_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE_102023_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE_79224_0 (.out1(sig_in_bus_mergerproxy_sel_STORE_79224_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE_79224_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE_79625_0 (.out1(sig_in_bus_mergerproxy_sel_STORE_79625_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE_79625_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE_99226_0 (.out1(sig_in_bus_mergerproxy_sel_STORE_99226_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE_99226_0));
  register_SE #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_plus_expr_FU_32_0_32_82_i0_fu___internal_malloc_738_919),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_73_reg_1_0_0_0),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_74_reg_10_0_0_1),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_75_reg_11_0_0_1),
    .wenable(wrenable_reg_11));
  register_STD #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_7_i0_fu___internal_malloc_738_34336),
    .wenable(wrenable_reg_12));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_8_i0_fu___internal_malloc_738_34347),
    .wenable(wrenable_reg_13));
  register_STD #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_11_i0_fu___internal_malloc_738_34350),
    .wenable(wrenable_reg_14));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_12_i0_fu___internal_malloc_738_34356),
    .wenable(wrenable_reg_15));
  register_STD #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_85_i1_fu___internal_malloc_738_34362),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_81_reg_17_0_0_0),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_60_i0_fu___internal_malloc_738_34556),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_74_i0_fu___internal_malloc_738_1063),
    .wenable(wrenable_reg_19));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_19_i0_fu___internal_malloc_738_34292),
    .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_84_i0_fu___internal_malloc_738_1079),
    .wenable(wrenable_reg_21));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_85_i5_fu___internal_malloc_738_34566),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_88_reg_23_0_0_0),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_72_i0_BMEMORY_CTRLN_72_i0),
    .wenable(wrenable_reg_24));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_minus_expr_FU_32_32_32_81_i0_fu___internal_malloc_738_1121),
    .wenable(wrenable_reg_25));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_80_i0_fu___internal_malloc_738_1129),
    .wenable(wrenable_reg_26));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_85_i2_fu___internal_malloc_738_34460),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_86_i1_fu___internal_malloc_738_1126),
    .wenable(wrenable_reg_28));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_85_i3_fu___internal_malloc_738_34467),
    .wenable(wrenable_reg_29));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_23_i0_fu___internal_malloc_738_34501),
    .wenable(wrenable_reg_3));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_40_i0_fu___internal_malloc_738_34404),
    .wenable(wrenable_reg_30));
  register_SE #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_42_i0_fu___internal_malloc_738_34411),
    .wenable(wrenable_reg_31));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_20_i0_fu___internal_malloc_738_34510),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_21_i0_fu___internal_malloc_738_34515),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(20),
    .BITSIZE_out1(20)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_22_i0_fu___internal_malloc_738_34522),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_87_i1_fu___internal_malloc_738_37523),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_72_i0_BMEMORY_CTRLN_72_i0),
    .wenable(wrenable_reg_8));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_85_i0_fu___internal_malloc_738_34302),
    .wenable(wrenable_reg_9));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram),
    .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(42),
    .BITSIZE_out1(21),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram),
    .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_data_ram_size2_ (.out1(Mout_data_ram_size),
    .in1(sig_out_bus_mergerMout_data_ram_size2_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_oe_ram3_ (.out1(Mout_oe_ram),
    .in1(sig_out_bus_mergerMout_oe_ram3_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_we_ram4_ (.out1(Mout_we_ram),
    .in1(sig_out_bus_mergerMout_we_ram4_));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in1_10207_ (.out1(proxy_in1_1020),
    .in1(sig_out_bus_mergerproxy_in1_10207_));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in1_7928_ (.out1(proxy_in1_792),
    .in1(sig_out_bus_mergerproxy_in1_7928_));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in1_7969_ (.out1(proxy_in1_796),
    .in1(sig_out_bus_mergerproxy_in1_7969_));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in1_99210_ (.out1(proxy_in1_992),
    .in1(sig_out_bus_mergerproxy_in1_99210_));
  split_signal #(.BITSIZE_in1(42),
    .BITSIZE_out1(21),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in2_102011_ (.out1(proxy_in2_1020),
    .in1(sig_out_bus_mergerproxy_in2_102011_));
  split_signal #(.BITSIZE_in1(42),
    .BITSIZE_out1(21),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in2_79212_ (.out1(proxy_in2_792),
    .in1(sig_out_bus_mergerproxy_in2_79212_));
  split_signal #(.BITSIZE_in1(42),
    .BITSIZE_out1(21),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in2_79613_ (.out1(proxy_in2_796),
    .in1(sig_out_bus_mergerproxy_in2_79613_));
  split_signal #(.BITSIZE_in1(42),
    .BITSIZE_out1(21),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in2_99214_ (.out1(proxy_in2_992),
    .in1(sig_out_bus_mergerproxy_in2_99214_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in3_102015_ (.out1(proxy_in3_1020),
    .in1(sig_out_bus_mergerproxy_in3_102015_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in3_79216_ (.out1(proxy_in3_792),
    .in1(sig_out_bus_mergerproxy_in3_79216_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in3_79617_ (.out1(proxy_in3_796),
    .in1(sig_out_bus_mergerproxy_in3_79617_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in3_99218_ (.out1(proxy_in3_992),
    .in1(sig_out_bus_mergerproxy_in3_99218_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD_102019_ (.out1(proxy_sel_LOAD_1020),
    .in1(sig_out_bus_mergerproxy_sel_LOAD_102019_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD_79220_ (.out1(proxy_sel_LOAD_792),
    .in1(sig_out_bus_mergerproxy_sel_LOAD_79220_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD_79621_ (.out1(proxy_sel_LOAD_796),
    .in1(sig_out_bus_mergerproxy_sel_LOAD_79621_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD_99222_ (.out1(proxy_sel_LOAD_992),
    .in1(sig_out_bus_mergerproxy_sel_LOAD_99222_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE_102023_ (.out1(proxy_sel_STORE_1020),
    .in1(sig_out_bus_mergerproxy_sel_STORE_102023_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE_79224_ (.out1(proxy_sel_STORE_792),
    .in1(sig_out_bus_mergerproxy_sel_STORE_79224_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE_79625_ (.out1(proxy_sel_STORE_796),
    .in1(sig_out_bus_mergerproxy_sel_STORE_79625_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE_99226_ (.out1(proxy_sel_STORE_992),
    .in1(sig_out_bus_mergerproxy_sel_STORE_99226_));
  // io-signal post fix
  assign return_port = out_MUX_65_gimple_return_FU_47_i0_0_0_0;
  assign PROXY_PREF_start_port___internal_free = sig_out_bus_mergerPROXY_PREF_start_port___internal_free6_;
  assign PROXY_PREF_ap___internal_free = sig_out_bus_mergerPROXY_PREF_ap___internal_free5_;
  assign OUT_CONDITION___internal_malloc_738_1150 = out_read_cond_FU_61_i0_fu___internal_malloc_738_1150;
  assign OUT_CONDITION___internal_malloc_738_1152 = out_read_cond_FU_63_i0_fu___internal_malloc_738_1152;
  assign OUT_CONDITION___internal_malloc_738_1155 = out_read_cond_FU_71_i0_fu___internal_malloc_738_1155;
  assign OUT_CONDITION___internal_malloc_738_921 = out_read_cond_FU_24_i0_fu___internal_malloc_738_921;
  assign OUT_CONDITION___internal_malloc_738_951 = out_read_cond_FU_27_i0_fu___internal_malloc_738_951;
  assign OUT_CONDITION___internal_malloc_738_975 = out_read_cond_FU_43_i0_fu___internal_malloc_738_975;
  assign OUT_UNBOUNDED___internal_malloc_738_1067 = s_done_fu___internal_malloc_738_1067;

endmodule

// FSM based controller description for __internal_malloc
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller___internal_malloc(done_port,
  fuselector_BMEMORY_CTRLN_72_i0_LOAD,
  fuselector_BMEMORY_CTRLN_72_i0_STORE,
  fuselector_DPROXY_CTRLN_0_i0_LOAD,
  fuselector_DPROXY_CTRLN_0_i0_STORE,
  fuselector_DPROXY_CTRLN_2_i0_LOAD,
  fuselector_DPROXY_CTRLN_2_i0_STORE,
  selector_IN_UNBOUNDED___internal_malloc_738_1067,
  selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_0,
  selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_1,
  selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_2,
  selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_3,
  selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_0,
  selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_1,
  selector_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0,
  selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0,
  selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0,
  selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1,
  selector_MUX_65_gimple_return_FU_47_i0_0_0_0,
  selector_MUX_73_reg_1_0_0_0,
  selector_MUX_74_reg_10_0_0_0,
  selector_MUX_74_reg_10_0_0_1,
  selector_MUX_75_reg_11_0_0_0,
  selector_MUX_75_reg_11_0_0_1,
  selector_MUX_81_reg_17_0_0_0,
  selector_MUX_88_reg_23_0_0_0,
  selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0,
  fuselector_PROXY_CTRLN_1_i0_LOAD,
  fuselector_PROXY_CTRLN_1_i0_STORE,
  fuselector_PROXY_CTRLN_1_i1_LOAD,
  fuselector_PROXY_CTRLN_1_i1_STORE,
  fuselector_PROXY_CTRLN_3_i0_LOAD,
  fuselector_PROXY_CTRLN_3_i0_STORE,
  fuselector_PROXY_PREF___internal_free_90_i0___internal_free,
  fuselector_PROXY_PREF___internal_free_90_i0_PROXY_PREF___internal_free,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION___internal_malloc_738_1150,
  OUT_CONDITION___internal_malloc_738_1152,
  OUT_CONDITION___internal_malloc_738_1155,
  OUT_CONDITION___internal_malloc_738_921,
  OUT_CONDITION___internal_malloc_738_951,
  OUT_CONDITION___internal_malloc_738_975,
  OUT_UNBOUNDED___internal_malloc_738_1067,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION___internal_malloc_738_1150;
  input OUT_CONDITION___internal_malloc_738_1152;
  input OUT_CONDITION___internal_malloc_738_1155;
  input OUT_CONDITION___internal_malloc_738_921;
  input OUT_CONDITION___internal_malloc_738_951;
  input OUT_CONDITION___internal_malloc_738_975;
  input OUT_UNBOUNDED___internal_malloc_738_1067;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_72_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_72_i0_STORE;
  output fuselector_DPROXY_CTRLN_0_i0_LOAD;
  output fuselector_DPROXY_CTRLN_0_i0_STORE;
  output fuselector_DPROXY_CTRLN_2_i0_LOAD;
  output fuselector_DPROXY_CTRLN_2_i0_STORE;
  output selector_IN_UNBOUNDED___internal_malloc_738_1067;
  output selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_0;
  output selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_1;
  output selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_1;
  output selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_2;
  output selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_3;
  output selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_0;
  output selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_1;
  output selector_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0;
  output selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0;
  output selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0;
  output selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1;
  output selector_MUX_65_gimple_return_FU_47_i0_0_0_0;
  output selector_MUX_73_reg_1_0_0_0;
  output selector_MUX_74_reg_10_0_0_0;
  output selector_MUX_74_reg_10_0_0_1;
  output selector_MUX_75_reg_11_0_0_0;
  output selector_MUX_75_reg_11_0_0_1;
  output selector_MUX_81_reg_17_0_0_0;
  output selector_MUX_88_reg_23_0_0_0;
  output selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0;
  output fuselector_PROXY_CTRLN_1_i0_LOAD;
  output fuselector_PROXY_CTRLN_1_i0_STORE;
  output fuselector_PROXY_CTRLN_1_i1_LOAD;
  output fuselector_PROXY_CTRLN_1_i1_STORE;
  output fuselector_PROXY_CTRLN_3_i0_LOAD;
  output fuselector_PROXY_CTRLN_3_i0_STORE;
  output fuselector_PROXY_PREF___internal_free_90_i0___internal_free;
  output fuselector_PROXY_PREF___internal_free_90_i0_PROXY_PREF___internal_free;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_15;
  output wrenable_reg_16;
  output wrenable_reg_17;
  output wrenable_reg_18;
  output wrenable_reg_19;
  output wrenable_reg_2;
  output wrenable_reg_20;
  output wrenable_reg_21;
  output wrenable_reg_22;
  output wrenable_reg_23;
  output wrenable_reg_24;
  output wrenable_reg_25;
  output wrenable_reg_26;
  output wrenable_reg_27;
  output wrenable_reg_28;
  output wrenable_reg_29;
  output wrenable_reg_3;
  output wrenable_reg_30;
  output wrenable_reg_31;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [25:0] S_0 = 26'b00000000000000000000000001,
    S_1 = 26'b00000000000000000000000010,
    S_2 = 26'b00000000000000000000000100,
    S_3 = 26'b00000000000000000000001000,
    S_4 = 26'b00000000000000000000010000,
    S_5 = 26'b00000000000000000000100000,
    S_6 = 26'b00000000000000000001000000,
    S_14 = 26'b00000000000100000000000000,
    S_15 = 26'b00000000001000000000000000,
    S_16 = 26'b00000000010000000000000000,
    S_25 = 26'b10000000000000000000000000,
    S_17 = 26'b00000000100000000000000000,
    S_18 = 26'b00000001000000000000000000,
    S_19 = 26'b00000010000000000000000000,
    S_20 = 26'b00000100000000000000000000,
    S_21 = 26'b00001000000000000000000000,
    S_22 = 26'b00010000000000000000000000,
    S_23 = 26'b00100000000000000000000000,
    S_24 = 26'b01000000000000000000000000,
    S_7 = 26'b00000000000000000010000000,
    S_11 = 26'b00000000000000100000000000,
    S_12 = 26'b00000000000001000000000000,
    S_8 = 26'b00000000000000000100000000,
    S_9 = 26'b00000000000000001000000000,
    S_10 = 26'b00000000000000010000000000,
    S_13 = 26'b00000000000010000000000000;
  reg [25:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_72_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_72_i0_STORE;
  reg fuselector_DPROXY_CTRLN_0_i0_LOAD;
  reg fuselector_DPROXY_CTRLN_0_i0_STORE;
  reg fuselector_DPROXY_CTRLN_2_i0_LOAD;
  reg fuselector_DPROXY_CTRLN_2_i0_STORE;
  reg selector_IN_UNBOUNDED___internal_malloc_738_1067;
  reg selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_0;
  reg selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_1;
  reg selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_1;
  reg selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_2;
  reg selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_3;
  reg selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_0;
  reg selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_1;
  reg selector_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0;
  reg selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0;
  reg selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0;
  reg selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1;
  reg selector_MUX_65_gimple_return_FU_47_i0_0_0_0;
  reg selector_MUX_73_reg_1_0_0_0;
  reg selector_MUX_74_reg_10_0_0_0;
  reg selector_MUX_74_reg_10_0_0_1;
  reg selector_MUX_75_reg_11_0_0_0;
  reg selector_MUX_75_reg_11_0_0_1;
  reg selector_MUX_81_reg_17_0_0_0;
  reg selector_MUX_88_reg_23_0_0_0;
  reg selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0;
  reg fuselector_PROXY_CTRLN_1_i0_LOAD;
  reg fuselector_PROXY_CTRLN_1_i0_STORE;
  reg fuselector_PROXY_CTRLN_1_i1_LOAD;
  reg fuselector_PROXY_CTRLN_1_i1_STORE;
  reg fuselector_PROXY_CTRLN_3_i0_LOAD;
  reg fuselector_PROXY_CTRLN_3_i0_STORE;
  reg fuselector_PROXY_PREF___internal_free_90_i0___internal_free;
  reg fuselector_PROXY_PREF___internal_free_90_i0_PROXY_PREF___internal_free;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
  reg wrenable_reg_15;
  reg wrenable_reg_16;
  reg wrenable_reg_17;
  reg wrenable_reg_18;
  reg wrenable_reg_19;
  reg wrenable_reg_2;
  reg wrenable_reg_20;
  reg wrenable_reg_21;
  reg wrenable_reg_22;
  reg wrenable_reg_23;
  reg wrenable_reg_24;
  reg wrenable_reg_25;
  reg wrenable_reg_26;
  reg wrenable_reg_27;
  reg wrenable_reg_28;
  reg wrenable_reg_29;
  reg wrenable_reg_3;
  reg wrenable_reg_30;
  reg wrenable_reg_31;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_BMEMORY_CTRLN_72_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_72_i0_STORE = 1'b0;
    fuselector_DPROXY_CTRLN_0_i0_LOAD = 1'b0;
    fuselector_DPROXY_CTRLN_0_i0_STORE = 1'b0;
    fuselector_DPROXY_CTRLN_2_i0_LOAD = 1'b0;
    fuselector_DPROXY_CTRLN_2_i0_STORE = 1'b0;
    selector_IN_UNBOUNDED___internal_malloc_738_1067 = 1'b0;
    selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_0 = 1'b0;
    selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_2 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_3 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0 = 1'b0;
    selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0 = 1'b0;
    selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0 = 1'b0;
    selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1 = 1'b0;
    selector_MUX_65_gimple_return_FU_47_i0_0_0_0 = 1'b0;
    selector_MUX_73_reg_1_0_0_0 = 1'b0;
    selector_MUX_74_reg_10_0_0_0 = 1'b0;
    selector_MUX_74_reg_10_0_0_1 = 1'b0;
    selector_MUX_75_reg_11_0_0_0 = 1'b0;
    selector_MUX_75_reg_11_0_0_1 = 1'b0;
    selector_MUX_81_reg_17_0_0_0 = 1'b0;
    selector_MUX_88_reg_23_0_0_0 = 1'b0;
    selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0 = 1'b0;
    fuselector_PROXY_CTRLN_1_i0_LOAD = 1'b0;
    fuselector_PROXY_CTRLN_1_i0_STORE = 1'b0;
    fuselector_PROXY_CTRLN_1_i1_LOAD = 1'b0;
    fuselector_PROXY_CTRLN_1_i1_STORE = 1'b0;
    fuselector_PROXY_CTRLN_3_i0_LOAD = 1'b0;
    fuselector_PROXY_CTRLN_3_i0_STORE = 1'b0;
    fuselector_PROXY_PREF___internal_free_90_i0___internal_free = 1'b0;
    fuselector_PROXY_PREF___internal_free_90_i0_PROXY_PREF___internal_free = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
    wrenable_reg_15 = 1'b0;
    wrenable_reg_16 = 1'b0;
    wrenable_reg_17 = 1'b0;
    wrenable_reg_18 = 1'b0;
    wrenable_reg_19 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_20 = 1'b0;
    wrenable_reg_21 = 1'b0;
    wrenable_reg_22 = 1'b0;
    wrenable_reg_23 = 1'b0;
    wrenable_reg_24 = 1'b0;
    wrenable_reg_25 = 1'b0;
    wrenable_reg_26 = 1'b0;
    wrenable_reg_27 = 1'b0;
    wrenable_reg_28 = 1'b0;
    wrenable_reg_29 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_30 = 1'b0;
    wrenable_reg_31 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          fuselector_DPROXY_CTRLN_0_i0_LOAD = 1'b1;
          selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          if (OUT_CONDITION___internal_malloc_738_921 == 1'b1)
            begin
              _next_state = S_6;
              wrenable_reg_1 = 1'b0;
              wrenable_reg_2 = 1'b0;
            end
          else
            begin
              _next_state = S_2;
              wrenable_reg_10 = 1'b0;
              wrenable_reg_11 = 1'b0;
              wrenable_reg_12 = 1'b0;
              wrenable_reg_13 = 1'b0;
              wrenable_reg_14 = 1'b0;
              wrenable_reg_15 = 1'b0;
              wrenable_reg_16 = 1'b0;
            end
        end
      S_2 :
        begin
          fuselector_BMEMORY_CTRLN_72_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_3 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          fuselector_BMEMORY_CTRLN_72_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0 = 1'b1;
          _next_state = S_5;
        end
      S_5 :
        begin
          selector_MUX_74_reg_10_0_0_0 = 1'b1;
          selector_MUX_75_reg_11_0_0_0 = 1'b1;
          selector_MUX_88_reg_23_0_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          if (OUT_CONDITION___internal_malloc_738_951 == 1'b1)
            begin
              _next_state = S_7;
              selector_MUX_74_reg_10_0_0_0 = 1'b0;
              selector_MUX_75_reg_11_0_0_0 = 1'b0;
              wrenable_reg_10 = 1'b0;
              wrenable_reg_11 = 1'b0;
            end
          else
            begin
              _next_state = S_14;
              selector_MUX_88_reg_23_0_0_0 = 1'b0;
              wrenable_reg_23 = 1'b0;
              wrenable_reg_24 = 1'b0;
            end
        end
      S_6 :
        begin
          fuselector_DPROXY_CTRLN_0_i0_STORE = 1'b1;
          selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0 = 1'b1;
          selector_MUX_74_reg_10_0_0_1 = 1'b1;
          selector_MUX_75_reg_11_0_0_1 = 1'b1;
          fuselector_PROXY_CTRLN_1_i0_STORE = 1'b1;
          fuselector_PROXY_CTRLN_1_i1_STORE = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          _next_state = S_14;
        end
      S_14 :
        begin
          wrenable_reg_17 = 1'b1;
          _next_state = S_15;
        end
      S_15 :
        begin
          wrenable_reg_18 = 1'b1;
          if (OUT_CONDITION___internal_malloc_738_1150 == 1'b1)
            begin
              _next_state = S_16;
            end
          else
            begin
              _next_state = S_21;
            end
        end
      S_16 :
        begin
          fuselector_DPROXY_CTRLN_2_i0_LOAD = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_20 = 1'b1;
          if (OUT_CONDITION___internal_malloc_738_1152 == 1'b1)
            begin
              _next_state = S_17;
            end
          else
            begin
              _next_state = S_25;
              done_port = 1'b1;
              wrenable_reg_19 = 1'b0;
              wrenable_reg_20 = 1'b0;
            end
        end
      S_25 :
        begin
          selector_MUX_65_gimple_return_FU_47_i0_0_0_0 = 1'b1;
          _next_state = S_0;
        end
      S_17 :
        begin
          fuselector_PROXY_CTRLN_3_i0_STORE = 1'b1;
          wrenable_reg_21 = 1'b1;
          _next_state = S_18;
        end
      S_18 :
        begin
          selector_IN_UNBOUNDED___internal_malloc_738_1067 = 1'b1;
          fuselector_PROXY_PREF___internal_free_90_i0___internal_free = 1'b1;
          if (OUT_UNBOUNDED___internal_malloc_738_1067 == 1'b0)
            begin
              _next_state = S_19;
            end
          else
            begin
              _next_state = S_20;
            end
        end
      S_19 :
        begin
          fuselector_PROXY_PREF___internal_free_90_i0___internal_free = 1'b1;
          if (OUT_UNBOUNDED___internal_malloc_738_1067 == 1'b0)
            begin
              _next_state = S_19;
            end
          else
            begin
              _next_state = S_20;
            end
        end
      S_20 :
        begin
          fuselector_DPROXY_CTRLN_2_i0_STORE = 1'b1;
          selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0 = 1'b1;
          _next_state = S_21;
        end
      S_21 :
        begin
          fuselector_BMEMORY_CTRLN_72_i0_LOAD = 1'b1;
          _next_state = S_22;
        end
      S_22 :
        begin
          wrenable_reg_22 = 1'b1;
          wrenable_reg_8 = 1'b1;
          _next_state = S_23;
        end
      S_23 :
        begin
          fuselector_BMEMORY_CTRLN_72_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_1 = 1'b1;
          _next_state = S_24;
        end
      S_24 :
        begin
          selector_MUX_73_reg_1_0_0_0 = 1'b1;
          selector_MUX_81_reg_17_0_0_0 = 1'b1;
          selector_MUX_88_reg_23_0_0_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          if (OUT_CONDITION___internal_malloc_738_1155 == 1'b1)
            begin
              _next_state = S_7;
              selector_MUX_81_reg_17_0_0_0 = 1'b0;
              wrenable_reg_17 = 1'b0;
            end
          else
            begin
              _next_state = S_15;
              selector_MUX_73_reg_1_0_0_0 = 1'b0;
              selector_MUX_88_reg_23_0_0_0 = 1'b0;
              wrenable_reg_1 = 1'b0;
              wrenable_reg_23 = 1'b0;
              wrenable_reg_24 = 1'b0;
            end
        end
      S_7 :
        begin
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_30 = 1'b1;
          wrenable_reg_31 = 1'b1;
          if (OUT_CONDITION___internal_malloc_738_975 == 1'b1)
            begin
              _next_state = S_8;
              wrenable_reg_25 = 1'b0;
              wrenable_reg_26 = 1'b0;
              wrenable_reg_27 = 1'b0;
            end
          else
            begin
              _next_state = S_11;
              wrenable_reg_30 = 1'b0;
              wrenable_reg_31 = 1'b0;
            end
        end
      S_11 :
        begin
          fuselector_BMEMORY_CTRLN_72_i0_STORE = 1'b1;
          selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_2 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_1 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_29 = 1'b1;
          _next_state = S_12;
        end
      S_12 :
        begin
          fuselector_BMEMORY_CTRLN_72_i0_STORE = 1'b1;
          selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_1 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0 = 1'b1;
          wrenable_reg_23 = 1'b1;
          _next_state = S_13;
          done_port = 1'b1;
        end
      S_8 :
        begin
          fuselector_BMEMORY_CTRLN_72_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_1 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0 = 1'b1;
          _next_state = S_9;
        end
      S_9 :
        begin
          wrenable_reg_8 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          fuselector_BMEMORY_CTRLN_72_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0 = 1'b1;
          _next_state = S_13;
          done_port = 1'b1;
        end
      S_13 :
        begin
          fuselector_DPROXY_CTRLN_0_i0_STORE = 1'b1;
          selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0 = 1'b1;
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// Top component for __internal_malloc
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module __internal_malloc(clock,
  reset,
  start_port,
  done_port,
  nbytes,
  return_port,
  M_Rdata_ram,
  M_DataRdy,
  proxy_out1_792,
  proxy_out1_796,
  proxy_out1_992,
  proxy_out1_1020,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  PROXY_PREF_done_port___internal_free,
  proxy_in1_792,
  proxy_in2_792,
  proxy_in3_792,
  proxy_sel_LOAD_792,
  proxy_sel_STORE_792,
  proxy_in1_796,
  proxy_in2_796,
  proxy_in3_796,
  proxy_sel_LOAD_796,
  proxy_sel_STORE_796,
  proxy_in1_992,
  proxy_in2_992,
  proxy_in3_992,
  proxy_sel_LOAD_992,
  proxy_sel_STORE_992,
  proxy_in1_1020,
  proxy_in2_1020,
  proxy_in3_1020,
  proxy_sel_LOAD_1020,
  proxy_sel_STORE_1020,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size,
  PROXY_PREF_start_port___internal_free,
  PROXY_PREF_ap___internal_free);
  parameter MEM_var_1020_33671=1048576,
    MEM_var_792_33671=524288,
    MEM_var_796_33671=524288,
    MEM_var_992_33671=524288;
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] nbytes;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [127:0] proxy_out1_792;
  input [127:0] proxy_out1_796;
  input [127:0] proxy_out1_992;
  input [127:0] proxy_out1_1020;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [41:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  input PROXY_PREF_done_port___internal_free;
  // OUT
  output done_port;
  output [31:0] return_port;
  output [127:0] proxy_in1_792;
  output [41:0] proxy_in2_792;
  output [13:0] proxy_in3_792;
  output [1:0] proxy_sel_LOAD_792;
  output [1:0] proxy_sel_STORE_792;
  output [127:0] proxy_in1_796;
  output [41:0] proxy_in2_796;
  output [13:0] proxy_in3_796;
  output [1:0] proxy_sel_LOAD_796;
  output [1:0] proxy_sel_STORE_796;
  output [127:0] proxy_in1_992;
  output [41:0] proxy_in2_992;
  output [13:0] proxy_in3_992;
  output [1:0] proxy_sel_LOAD_992;
  output [1:0] proxy_sel_STORE_992;
  output [127:0] proxy_in1_1020;
  output [41:0] proxy_in2_1020;
  output [13:0] proxy_in3_1020;
  output [1:0] proxy_sel_LOAD_1020;
  output [1:0] proxy_sel_STORE_1020;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [41:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  output PROXY_PREF_start_port___internal_free;
  output [31:0] PROXY_PREF_ap___internal_free;
  // Component and signal declarations
  wire OUT_CONDITION___internal_malloc_738_1150;
  wire OUT_CONDITION___internal_malloc_738_1152;
  wire OUT_CONDITION___internal_malloc_738_1155;
  wire OUT_CONDITION___internal_malloc_738_921;
  wire OUT_CONDITION___internal_malloc_738_951;
  wire OUT_CONDITION___internal_malloc_738_975;
  wire OUT_UNBOUNDED___internal_malloc_738_1067;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_72_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_72_i0_STORE;
  wire fuselector_DPROXY_CTRLN_0_i0_LOAD;
  wire fuselector_DPROXY_CTRLN_0_i0_STORE;
  wire fuselector_DPROXY_CTRLN_2_i0_LOAD;
  wire fuselector_DPROXY_CTRLN_2_i0_STORE;
  wire fuselector_PROXY_CTRLN_1_i0_LOAD;
  wire fuselector_PROXY_CTRLN_1_i0_STORE;
  wire fuselector_PROXY_CTRLN_1_i1_LOAD;
  wire fuselector_PROXY_CTRLN_1_i1_STORE;
  wire fuselector_PROXY_CTRLN_3_i0_LOAD;
  wire fuselector_PROXY_CTRLN_3_i0_STORE;
  wire fuselector_PROXY_PREF___internal_free_90_i0_PROXY_PREF___internal_free;
  wire fuselector_PROXY_PREF___internal_free_90_i0___internal_free;
  wire [31:0] in_port_nbytes_SIGI1;
  wire [31:0] in_port_nbytes_SIGI2;
  wire selector_IN_UNBOUNDED___internal_malloc_738_1067;
  wire selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_0;
  wire selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_1;
  wire selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_1;
  wire selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_2;
  wire selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_3;
  wire selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_0;
  wire selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_1;
  wire selector_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0;
  wire selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0;
  wire selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0;
  wire selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1;
  wire selector_MUX_65_gimple_return_FU_47_i0_0_0_0;
  wire selector_MUX_73_reg_1_0_0_0;
  wire selector_MUX_74_reg_10_0_0_0;
  wire selector_MUX_74_reg_10_0_0_1;
  wire selector_MUX_75_reg_11_0_0_0;
  wire selector_MUX_75_reg_11_0_0_1;
  wire selector_MUX_81_reg_17_0_0_0;
  wire selector_MUX_88_reg_23_0_0_0;
  wire selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_15;
  wire wrenable_reg_16;
  wire wrenable_reg_17;
  wire wrenable_reg_18;
  wire wrenable_reg_19;
  wire wrenable_reg_2;
  wire wrenable_reg_20;
  wire wrenable_reg_21;
  wire wrenable_reg_22;
  wire wrenable_reg_23;
  wire wrenable_reg_24;
  wire wrenable_reg_25;
  wire wrenable_reg_26;
  wire wrenable_reg_27;
  wire wrenable_reg_28;
  wire wrenable_reg_29;
  wire wrenable_reg_3;
  wire wrenable_reg_30;
  wire wrenable_reg_31;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller___internal_malloc Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_72_i0_LOAD(fuselector_BMEMORY_CTRLN_72_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_72_i0_STORE(fuselector_BMEMORY_CTRLN_72_i0_STORE),
    .fuselector_DPROXY_CTRLN_0_i0_LOAD(fuselector_DPROXY_CTRLN_0_i0_LOAD),
    .fuselector_DPROXY_CTRLN_0_i0_STORE(fuselector_DPROXY_CTRLN_0_i0_STORE),
    .fuselector_DPROXY_CTRLN_2_i0_LOAD(fuselector_DPROXY_CTRLN_2_i0_LOAD),
    .fuselector_DPROXY_CTRLN_2_i0_STORE(fuselector_DPROXY_CTRLN_2_i0_STORE),
    .selector_IN_UNBOUNDED___internal_malloc_738_1067(selector_IN_UNBOUNDED___internal_malloc_738_1067),
    .selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_0(selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_0),
    .selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_1(selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_2(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_2),
    .selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_3(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_3),
    .selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_0),
    .selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_1(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_1),
    .selector_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0),
    .selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0(selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0),
    .selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0(selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0),
    .selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1(selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1),
    .selector_MUX_65_gimple_return_FU_47_i0_0_0_0(selector_MUX_65_gimple_return_FU_47_i0_0_0_0),
    .selector_MUX_73_reg_1_0_0_0(selector_MUX_73_reg_1_0_0_0),
    .selector_MUX_74_reg_10_0_0_0(selector_MUX_74_reg_10_0_0_0),
    .selector_MUX_74_reg_10_0_0_1(selector_MUX_74_reg_10_0_0_1),
    .selector_MUX_75_reg_11_0_0_0(selector_MUX_75_reg_11_0_0_0),
    .selector_MUX_75_reg_11_0_0_1(selector_MUX_75_reg_11_0_0_1),
    .selector_MUX_81_reg_17_0_0_0(selector_MUX_81_reg_17_0_0_0),
    .selector_MUX_88_reg_23_0_0_0(selector_MUX_88_reg_23_0_0_0),
    .selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0(selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0),
    .fuselector_PROXY_CTRLN_1_i0_LOAD(fuselector_PROXY_CTRLN_1_i0_LOAD),
    .fuselector_PROXY_CTRLN_1_i0_STORE(fuselector_PROXY_CTRLN_1_i0_STORE),
    .fuselector_PROXY_CTRLN_1_i1_LOAD(fuselector_PROXY_CTRLN_1_i1_LOAD),
    .fuselector_PROXY_CTRLN_1_i1_STORE(fuselector_PROXY_CTRLN_1_i1_STORE),
    .fuselector_PROXY_CTRLN_3_i0_LOAD(fuselector_PROXY_CTRLN_3_i0_LOAD),
    .fuselector_PROXY_CTRLN_3_i0_STORE(fuselector_PROXY_CTRLN_3_i0_STORE),
    .fuselector_PROXY_PREF___internal_free_90_i0___internal_free(fuselector_PROXY_PREF___internal_free_90_i0___internal_free),
    .fuselector_PROXY_PREF___internal_free_90_i0_PROXY_PREF___internal_free(fuselector_PROXY_PREF___internal_free_90_i0_PROXY_PREF___internal_free),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION___internal_malloc_738_1150(OUT_CONDITION___internal_malloc_738_1150),
    .OUT_CONDITION___internal_malloc_738_1152(OUT_CONDITION___internal_malloc_738_1152),
    .OUT_CONDITION___internal_malloc_738_1155(OUT_CONDITION___internal_malloc_738_1155),
    .OUT_CONDITION___internal_malloc_738_921(OUT_CONDITION___internal_malloc_738_921),
    .OUT_CONDITION___internal_malloc_738_951(OUT_CONDITION___internal_malloc_738_951),
    .OUT_CONDITION___internal_malloc_738_975(OUT_CONDITION___internal_malloc_738_975),
    .OUT_UNBOUNDED___internal_malloc_738_1067(OUT_UNBOUNDED___internal_malloc_738_1067),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath___internal_malloc #(.MEM_var_1020_33671(MEM_var_1020_33671),
    .MEM_var_792_33671(MEM_var_792_33671),
    .MEM_var_796_33671(MEM_var_796_33671),
    .MEM_var_992_33671(MEM_var_992_33671)) Datapath_i (.return_port(return_port),
    .proxy_in1_792(proxy_in1_792),
    .proxy_in2_792(proxy_in2_792),
    .proxy_in3_792(proxy_in3_792),
    .proxy_sel_LOAD_792(proxy_sel_LOAD_792),
    .proxy_sel_STORE_792(proxy_sel_STORE_792),
    .proxy_in1_796(proxy_in1_796),
    .proxy_in2_796(proxy_in2_796),
    .proxy_in3_796(proxy_in3_796),
    .proxy_sel_LOAD_796(proxy_sel_LOAD_796),
    .proxy_sel_STORE_796(proxy_sel_STORE_796),
    .proxy_in1_992(proxy_in1_992),
    .proxy_in2_992(proxy_in2_992),
    .proxy_in3_992(proxy_in3_992),
    .proxy_sel_LOAD_992(proxy_sel_LOAD_992),
    .proxy_sel_STORE_992(proxy_sel_STORE_992),
    .proxy_in1_1020(proxy_in1_1020),
    .proxy_in2_1020(proxy_in2_1020),
    .proxy_in3_1020(proxy_in3_1020),
    .proxy_sel_LOAD_1020(proxy_sel_LOAD_1020),
    .proxy_sel_STORE_1020(proxy_sel_STORE_1020),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .PROXY_PREF_start_port___internal_free(PROXY_PREF_start_port___internal_free),
    .PROXY_PREF_ap___internal_free(PROXY_PREF_ap___internal_free),
    .OUT_CONDITION___internal_malloc_738_1150(OUT_CONDITION___internal_malloc_738_1150),
    .OUT_CONDITION___internal_malloc_738_1152(OUT_CONDITION___internal_malloc_738_1152),
    .OUT_CONDITION___internal_malloc_738_1155(OUT_CONDITION___internal_malloc_738_1155),
    .OUT_CONDITION___internal_malloc_738_921(OUT_CONDITION___internal_malloc_738_921),
    .OUT_CONDITION___internal_malloc_738_951(OUT_CONDITION___internal_malloc_738_951),
    .OUT_CONDITION___internal_malloc_738_975(OUT_CONDITION___internal_malloc_738_975),
    .OUT_UNBOUNDED___internal_malloc_738_1067(OUT_UNBOUNDED___internal_malloc_738_1067),
    .clock(clock),
    .reset(reset),
    .in_port_nbytes(in_port_nbytes_SIGI2),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .proxy_out1_792(proxy_out1_792),
    .proxy_out1_796(proxy_out1_796),
    .proxy_out1_992(proxy_out1_992),
    .proxy_out1_1020(proxy_out1_1020),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .PROXY_PREF_done_port___internal_free(PROXY_PREF_done_port___internal_free),
    .fuselector_BMEMORY_CTRLN_72_i0_LOAD(fuselector_BMEMORY_CTRLN_72_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_72_i0_STORE(fuselector_BMEMORY_CTRLN_72_i0_STORE),
    .fuselector_DPROXY_CTRLN_0_i0_LOAD(fuselector_DPROXY_CTRLN_0_i0_LOAD),
    .fuselector_DPROXY_CTRLN_0_i0_STORE(fuselector_DPROXY_CTRLN_0_i0_STORE),
    .fuselector_DPROXY_CTRLN_2_i0_LOAD(fuselector_DPROXY_CTRLN_2_i0_LOAD),
    .fuselector_DPROXY_CTRLN_2_i0_STORE(fuselector_DPROXY_CTRLN_2_i0_STORE),
    .selector_IN_UNBOUNDED___internal_malloc_738_1067(selector_IN_UNBOUNDED___internal_malloc_738_1067),
    .selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_0(selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_0),
    .selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_1(selector_MUX_0_BMEMORY_CTRLN_72_i0_0_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_2(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_2),
    .selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_3(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_0_3),
    .selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_0),
    .selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_1(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_1_1),
    .selector_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0(selector_MUX_1_BMEMORY_CTRLN_72_i0_1_2_0),
    .selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0(selector_MUX_4_DPROXY_CTRLN_0_i0_0_0_0),
    .selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0(selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_0),
    .selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1(selector_MUX_5_DPROXY_CTRLN_0_i0_1_0_1),
    .selector_MUX_65_gimple_return_FU_47_i0_0_0_0(selector_MUX_65_gimple_return_FU_47_i0_0_0_0),
    .selector_MUX_73_reg_1_0_0_0(selector_MUX_73_reg_1_0_0_0),
    .selector_MUX_74_reg_10_0_0_0(selector_MUX_74_reg_10_0_0_0),
    .selector_MUX_74_reg_10_0_0_1(selector_MUX_74_reg_10_0_0_1),
    .selector_MUX_75_reg_11_0_0_0(selector_MUX_75_reg_11_0_0_0),
    .selector_MUX_75_reg_11_0_0_1(selector_MUX_75_reg_11_0_0_1),
    .selector_MUX_81_reg_17_0_0_0(selector_MUX_81_reg_17_0_0_0),
    .selector_MUX_88_reg_23_0_0_0(selector_MUX_88_reg_23_0_0_0),
    .selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0(selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0),
    .fuselector_PROXY_CTRLN_1_i0_LOAD(fuselector_PROXY_CTRLN_1_i0_LOAD),
    .fuselector_PROXY_CTRLN_1_i0_STORE(fuselector_PROXY_CTRLN_1_i0_STORE),
    .fuselector_PROXY_CTRLN_1_i1_LOAD(fuselector_PROXY_CTRLN_1_i1_LOAD),
    .fuselector_PROXY_CTRLN_1_i1_STORE(fuselector_PROXY_CTRLN_1_i1_STORE),
    .fuselector_PROXY_CTRLN_3_i0_LOAD(fuselector_PROXY_CTRLN_3_i0_LOAD),
    .fuselector_PROXY_CTRLN_3_i0_STORE(fuselector_PROXY_CTRLN_3_i0_STORE),
    .fuselector_PROXY_PREF___internal_free_90_i0___internal_free(fuselector_PROXY_PREF___internal_free_90_i0___internal_free),
    .fuselector_PROXY_PREF___internal_free_90_i0_PROXY_PREF___internal_free(fuselector_PROXY_PREF___internal_free_90_i0_PROXY_PREF___internal_free),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) in_port_nbytes_REG (.out1(in_port_nbytes_SIGI2),
    .clock(clock),
    .reset(reset),
    .in1(in_port_nbytes_SIGI1));
  // io-signal post fix
  assign in_port_nbytes_SIGI1 = nbytes;
  assign done_port = done_delayed_REG_signal_out;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ASSIGN_SIGNED_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IIdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  end
  endgenerate
endmodule

// Datapath RTL description for main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_main(clock,
  reset,
  return_port,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  S_data_ram_size,
  M_Rdata_ram,
  M_DataRdy,
  Sin_Rdata_ram,
  Sin_DataRdy,
  Sout_Rdata_ram,
  Sout_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size,
  fuselector_BMEMORY_CTRLN_114_i0_LOAD,
  fuselector_BMEMORY_CTRLN_114_i0_STORE,
  fuselector_BMEMORY_CTRLN_114_i1_LOAD,
  fuselector_BMEMORY_CTRLN_114_i1_STORE,
  selector_IN_UNBOUNDED_main_33671_33686,
  selector_IN_UNBOUNDED_main_33671_33687,
  selector_IN_UNBOUNDED_main_33671_33688,
  selector_IN_UNBOUNDED_main_33671_33746,
  selector_IN_UNBOUNDED_main_33671_33830,
  selector_IN_UNBOUNDED_main_33671_33936,
  selector_IN_UNBOUNDED_main_33671_33941,
  selector_IN_UNBOUNDED_main_33671_33943,
  selector_MUX_10_BMEMORY_CTRLN_114_i1_0_0_0,
  selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_0,
  selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_1,
  selector_MUX_185_reg_12_0_0_0,
  selector_MUX_186_reg_13_0_0_0,
  selector_MUX_187_reg_14_0_0_0,
  selector_MUX_192_reg_19_0_0_0,
  selector_MUX_193_reg_2_0_0_0,
  selector_MUX_194_reg_20_0_0_0,
  selector_MUX_195_reg_21_0_0_0,
  selector_MUX_199_reg_25_0_0_0,
  selector_MUX_237_reg_6_0_0_0,
  selector_MUX_248_reg_7_0_0_0,
  selector_MUX_250_reg_8_0_0_0,
  selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0,
  selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1,
  selector_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0,
  selector_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0,
  selector_MUX_50___internal_malloc_198_i0_0_0_0,
  selector_MUX_50___internal_malloc_198_i0_0_0_1,
  selector_MUX_6_BMEMORY_CTRLN_114_i0_0_0_0,
  selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_0,
  selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_1,
  fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free,
  fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0_WRAPPED_PROXY_PREF___internal_free,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_32,
  wrenable_reg_33,
  wrenable_reg_34,
  wrenable_reg_35,
  wrenable_reg_36,
  wrenable_reg_37,
  wrenable_reg_38,
  wrenable_reg_39,
  wrenable_reg_4,
  wrenable_reg_40,
  wrenable_reg_41,
  wrenable_reg_42,
  wrenable_reg_43,
  wrenable_reg_44,
  wrenable_reg_45,
  wrenable_reg_46,
  wrenable_reg_47,
  wrenable_reg_48,
  wrenable_reg_49,
  wrenable_reg_5,
  wrenable_reg_50,
  wrenable_reg_51,
  wrenable_reg_52,
  wrenable_reg_53,
  wrenable_reg_54,
  wrenable_reg_55,
  wrenable_reg_56,
  wrenable_reg_57,
  wrenable_reg_58,
  wrenable_reg_59,
  wrenable_reg_6,
  wrenable_reg_60,
  wrenable_reg_61,
  wrenable_reg_62,
  wrenable_reg_63,
  wrenable_reg_64,
  wrenable_reg_65,
  wrenable_reg_66,
  wrenable_reg_67,
  wrenable_reg_68,
  wrenable_reg_69,
  wrenable_reg_7,
  wrenable_reg_70,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_main_33671_33748,
  OUT_CONDITION_main_33671_33783,
  OUT_CONDITION_main_33671_33811,
  OUT_CONDITION_main_33671_33832,
  OUT_CONDITION_main_33671_33962,
  OUT_MULTIIF_main_33671_42333,
  OUT_UNBOUNDED_main_33671_33686,
  OUT_UNBOUNDED_main_33671_33687,
  OUT_UNBOUNDED_main_33671_33688,
  OUT_UNBOUNDED_main_33671_33746,
  OUT_UNBOUNDED_main_33671_33830,
  OUT_UNBOUNDED_main_33671_33936,
  OUT_UNBOUNDED_main_33671_33941,
  OUT_UNBOUNDED_main_33671_33943);
  parameter MEM_var_1020_33671=1048576,
    MEM_var_792_33671=524288,
    MEM_var_796_33671=524288,
    MEM_var_992_33671=524288;
  // IN
  input clock;
  input reset;
  input [1:0] S_oe_ram;
  input [1:0] S_we_ram;
  input [41:0] S_addr_ram;
  input [127:0] S_Wdata_ram;
  input [13:0] S_data_ram_size;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [127:0] Sin_Rdata_ram;
  input [1:0] Sin_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [41:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_114_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_114_i0_STORE;
  input fuselector_BMEMORY_CTRLN_114_i1_LOAD;
  input fuselector_BMEMORY_CTRLN_114_i1_STORE;
  input selector_IN_UNBOUNDED_main_33671_33686;
  input selector_IN_UNBOUNDED_main_33671_33687;
  input selector_IN_UNBOUNDED_main_33671_33688;
  input selector_IN_UNBOUNDED_main_33671_33746;
  input selector_IN_UNBOUNDED_main_33671_33830;
  input selector_IN_UNBOUNDED_main_33671_33936;
  input selector_IN_UNBOUNDED_main_33671_33941;
  input selector_IN_UNBOUNDED_main_33671_33943;
  input selector_MUX_10_BMEMORY_CTRLN_114_i1_0_0_0;
  input selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_0;
  input selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_1;
  input selector_MUX_185_reg_12_0_0_0;
  input selector_MUX_186_reg_13_0_0_0;
  input selector_MUX_187_reg_14_0_0_0;
  input selector_MUX_192_reg_19_0_0_0;
  input selector_MUX_193_reg_2_0_0_0;
  input selector_MUX_194_reg_20_0_0_0;
  input selector_MUX_195_reg_21_0_0_0;
  input selector_MUX_199_reg_25_0_0_0;
  input selector_MUX_237_reg_6_0_0_0;
  input selector_MUX_248_reg_7_0_0_0;
  input selector_MUX_250_reg_8_0_0_0;
  input selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0;
  input selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1;
  input selector_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0;
  input selector_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0;
  input selector_MUX_50___internal_malloc_198_i0_0_0_0;
  input selector_MUX_50___internal_malloc_198_i0_0_0_1;
  input selector_MUX_6_BMEMORY_CTRLN_114_i0_0_0_0;
  input selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_0;
  input selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_1;
  input fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free;
  input fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0_WRAPPED_PROXY_PREF___internal_free;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
  input wrenable_reg_15;
  input wrenable_reg_16;
  input wrenable_reg_17;
  input wrenable_reg_18;
  input wrenable_reg_19;
  input wrenable_reg_2;
  input wrenable_reg_20;
  input wrenable_reg_21;
  input wrenable_reg_22;
  input wrenable_reg_23;
  input wrenable_reg_24;
  input wrenable_reg_25;
  input wrenable_reg_26;
  input wrenable_reg_27;
  input wrenable_reg_28;
  input wrenable_reg_29;
  input wrenable_reg_3;
  input wrenable_reg_30;
  input wrenable_reg_31;
  input wrenable_reg_32;
  input wrenable_reg_33;
  input wrenable_reg_34;
  input wrenable_reg_35;
  input wrenable_reg_36;
  input wrenable_reg_37;
  input wrenable_reg_38;
  input wrenable_reg_39;
  input wrenable_reg_4;
  input wrenable_reg_40;
  input wrenable_reg_41;
  input wrenable_reg_42;
  input wrenable_reg_43;
  input wrenable_reg_44;
  input wrenable_reg_45;
  input wrenable_reg_46;
  input wrenable_reg_47;
  input wrenable_reg_48;
  input wrenable_reg_49;
  input wrenable_reg_5;
  input wrenable_reg_50;
  input wrenable_reg_51;
  input wrenable_reg_52;
  input wrenable_reg_53;
  input wrenable_reg_54;
  input wrenable_reg_55;
  input wrenable_reg_56;
  input wrenable_reg_57;
  input wrenable_reg_58;
  input wrenable_reg_59;
  input wrenable_reg_6;
  input wrenable_reg_60;
  input wrenable_reg_61;
  input wrenable_reg_62;
  input wrenable_reg_63;
  input wrenable_reg_64;
  input wrenable_reg_65;
  input wrenable_reg_66;
  input wrenable_reg_67;
  input wrenable_reg_68;
  input wrenable_reg_69;
  input wrenable_reg_7;
  input wrenable_reg_70;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output signed [31:0] return_port;
  output [127:0] Sout_Rdata_ram;
  output [1:0] Sout_DataRdy;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [41:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  output OUT_CONDITION_main_33671_33748;
  output OUT_CONDITION_main_33671_33783;
  output OUT_CONDITION_main_33671_33811;
  output OUT_CONDITION_main_33671_33832;
  output OUT_CONDITION_main_33671_33962;
  output [1:0] OUT_MULTIIF_main_33671_42333;
  output OUT_UNBOUNDED_main_33671_33686;
  output OUT_UNBOUNDED_main_33671_33687;
  output OUT_UNBOUNDED_main_33671_33688;
  output OUT_UNBOUNDED_main_33671_33746;
  output OUT_UNBOUNDED_main_33671_33830;
  output OUT_UNBOUNDED_main_33671_33936;
  output OUT_UNBOUNDED_main_33671_33941;
  output OUT_UNBOUNDED_main_33671_33943;
  // Component and signal declarations
  wire PROXY_PREF_done_port___internal_free;
  wire [7:0] null_out_signal_array_1020_0_out1_0;
  wire [7:0] null_out_signal_array_1020_0_out1_1;
  wire null_out_signal_array_792_0_Sout_DataRdy_0;
  wire null_out_signal_array_792_0_Sout_DataRdy_1;
  wire [63:0] null_out_signal_array_792_0_Sout_Rdata_ram_0;
  wire [63:0] null_out_signal_array_792_0_Sout_Rdata_ram_1;
  wire [31:0] null_out_signal_array_792_0_out1_0;
  wire [31:0] null_out_signal_array_792_0_out1_1;
  wire [31:0] null_out_signal_array_796_0_out1_0;
  wire [31:0] null_out_signal_array_796_0_out1_1;
  wire null_out_signal_array_992_0_Sout_DataRdy_0;
  wire null_out_signal_array_992_0_Sout_DataRdy_1;
  wire [63:0] null_out_signal_array_992_0_Sout_Rdata_ram_0;
  wire [63:0] null_out_signal_array_992_0_Sout_Rdata_ram_1;
  wire [31:0] null_out_signal_array_992_0_out1_0;
  wire [31:0] null_out_signal_array_992_0_out1_1;
  wire [10:0] out_ASSIGN_UNSIGNED_FU_32_i0_fu_main_33671_42828;
  wire [10:0] out_ASSIGN_UNSIGNED_FU_34_i0_fu_main_33671_42830;
  wire [20:0] out_ASSIGN_UNSIGNED_FU_39_i0_fu_main_33671_42832;
  wire [31:0] out_ASSIGN_UNSIGNED_FU_40_i0_fu_main_33671_42834;
  wire [20:0] out_ASSIGN_UNSIGNED_FU_41_i0_fu_main_33671_42836;
  wire [31:0] out_ASSIGN_UNSIGNED_FU_42_i0_fu_main_33671_42838;
  wire [63:0] out_BMEMORY_CTRLN_114_i0_BMEMORY_CTRLN_114_i0;
  wire [63:0] out_BMEMORY_CTRLN_114_i1_BMEMORY_CTRLN_114_i0;
  wire [17:0] out_IUdata_converter_FU_30_i0_fu_main_33671_33825;
  wire [63:0] out_MUX_10_BMEMORY_CTRLN_114_i1_0_0_0;
  wire [20:0] out_MUX_11_BMEMORY_CTRLN_114_i1_1_0_0;
  wire [20:0] out_MUX_11_BMEMORY_CTRLN_114_i1_1_0_1;
  wire [31:0] out_MUX_185_reg_12_0_0_0;
  wire [31:0] out_MUX_186_reg_13_0_0_0;
  wire [31:0] out_MUX_187_reg_14_0_0_0;
  wire [63:0] out_MUX_192_reg_19_0_0_0;
  wire [31:0] out_MUX_193_reg_2_0_0_0;
  wire [31:0] out_MUX_194_reg_20_0_0_0;
  wire [31:0] out_MUX_195_reg_21_0_0_0;
  wire [31:0] out_MUX_199_reg_25_0_0_0;
  wire [63:0] out_MUX_237_reg_6_0_0_0;
  wire [31:0] out_MUX_248_reg_7_0_0_0;
  wire [31:0] out_MUX_250_reg_8_0_0_0;
  wire [31:0] out_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0;
  wire [31:0] out_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1;
  wire [63:0] out_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0;
  wire [63:0] out_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0;
  wire [31:0] out_MUX_50___internal_malloc_198_i0_0_0_0;
  wire [31:0] out_MUX_50___internal_malloc_198_i0_0_0_1;
  wire [63:0] out_MUX_6_BMEMORY_CTRLN_114_i0_0_0_0;
  wire [20:0] out_MUX_7_BMEMORY_CTRLN_114_i0_1_0_0;
  wire [20:0] out_MUX_7_BMEMORY_CTRLN_114_i0_1_0_1;
  wire signed [1:0] out_UIconvert_expr_FU_61_i0_fu_main_33671_42643;
  wire signed [1:0] out_UIdata_converter_FU_60_i0_fu_main_33671_42628;
  wire [10:0] out_UUconvert_expr_FU_31_i0_fu_main_33671_42353;
  wire [10:0] out_UUconvert_expr_FU_33_i0_fu_main_33671_42369;
  wire [20:0] out_UUdata_converter_FU_103_i0_fu_main_33671_33824;
  wire [20:0] out_UUdata_converter_FU_104_i0_fu_main_33671_33827;
  wire [31:0] out_UUdata_converter_FU_108_i0_fu_main_33671_33881;
  wire [31:0] out_UUdata_converter_FU_10_i0_fu_main_33671_33794;
  wire [20:0] out_UUdata_converter_FU_112_i0_fu_main_33671_33924;
  wire [20:0] out_UUdata_converter_FU_14_i0_fu_main_33671_33744;
  wire [31:0] out_UUdata_converter_FU_16_i0_fu_main_33671_33769;
  wire [31:0] out_UUdata_converter_FU_17_i0_fu_main_33671_33796;
  wire [20:0] out_UUdata_converter_FU_20_i0_fu_main_33671_33780;
  wire [20:0] out_UUdata_converter_FU_24_i0_fu_main_33671_33808;
  wire out_UUdata_converter_FU_38_i0_fu_main_33671_42383;
  wire out_UUdata_converter_FU_47_i0_fu_main_33671_42475;
  wire out_UUdata_converter_FU_49_i0_fu_main_33671_42484;
  wire out_UUdata_converter_FU_52_i0_fu_main_33671_42511;
  wire out_UUdata_converter_FU_54_i0_fu_main_33671_42520;
  wire out_UUdata_converter_FU_56_i0_fu_main_33671_42610;
  wire out_UUdata_converter_FU_58_i0_fu_main_33671_42616;
  wire [11:0] out_UUdata_converter_FU_62_i0_fu_main_33671_42661;
  wire out_UUdata_converter_FU_67_i0_fu_main_33671_42688;
  wire [31:0] out_UUdata_converter_FU_7_i0_fu_main_33671_33689;
  wire [31:0] out_UUdata_converter_FU_8_i0_fu_main_33671_33691;
  wire [31:0] out_UUdata_converter_FU_9_i0_fu_main_33671_33767;
  wire [63:0] out___float_adde11m52b_1023nih_197_i0___float_adde11m52b_1023nih_197_i0;
  wire [31:0] out___internal_malloc_198_i0___internal_malloc_198_i0;
  wire out_const_0;
  wire [63:0] out_const_1;
  wire [6:0] out_const_10;
  wire out_const_11;
  wire [2:0] out_const_12;
  wire [3:0] out_const_13;
  wire [4:0] out_const_14;
  wire [5:0] out_const_15;
  wire [7:0] out_const_16;
  wire [23:0] out_const_17;
  wire [52:0] out_const_18;
  wire [56:0] out_const_19;
  wire [63:0] out_const_2;
  wire [2:0] out_const_20;
  wire [5:0] out_const_21;
  wire [7:0] out_const_22;
  wire [13:0] out_const_23;
  wire [31:0] out_const_24;
  wire [6:0] out_const_25;
  wire [30:0] out_const_26;
  wire [1:0] out_const_27;
  wire [2:0] out_const_28;
  wire [3:0] out_const_29;
  wire [1:0] out_const_3;
  wire [15:0] out_const_30;
  wire [5:0] out_const_31;
  wire [3:0] out_const_32;
  wire [5:0] out_const_33;
  wire [5:0] out_const_34;
  wire [13:0] out_const_35;
  wire [2:0] out_const_36;
  wire [7:0] out_const_37;
  wire [4:0] out_const_38;
  wire [5:0] out_const_39;
  wire [3:0] out_const_4;
  wire [22:0] out_const_40;
  wire [15:0] out_const_41;
  wire [63:0] out_const_42;
  wire [9:0] out_const_43;
  wire [9:0] out_const_44;
  wire [61:0] out_const_45;
  wire [10:0] out_const_46;
  wire [62:0] out_const_47;
  wire [63:0] out_const_48;
  wire [12:0] out_const_49;
  wire [6:0] out_const_5;
  wire [63:0] out_const_50;
  wire [31:0] out_const_51;
  wire [31:0] out_const_52;
  wire [51:0] out_const_53;
  wire [52:0] out_const_54;
  wire [53:0] out_const_55;
  wire [62:0] out_const_56;
  wire [63:0] out_const_57;
  wire [7:0] out_const_6;
  wire [4:0] out_const_7;
  wire [6:0] out_const_8;
  wire [6:0] out_const_9;
  wire signed [31:0] out_conv_out_const_0_I_1_I_32;
  wire [31:0] out_conv_out_const_16_8_32;
  wire [31:0] out_conv_out_const_17_24_32;
  wire [31:0] out_conv_out_const_40_23_32;
  wire [63:0] out_conv_out_const_45_62_64;
  wire [6:0] out_conv_out_const_6_8_7;
  wire [31:0] out_conv_out_i_assign_conn_obj_4_ASSIGN_SIGNED_FU_i_assign_0_I_1_32;
  wire [63:0] out_conv_out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_1_1_64;
  wire [63:0] out_conv_out_u_assign_conn_obj_5_ASSIGN_UNSIGNED_FU_u_assign_2_1_64;
  wire [31:0] out_conv_out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_3_1_32;
  wire [31:0] out_conv_out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_4_1_32;
  wire signed [0:0] out_i_assign_conn_obj_4_ASSIGN_SIGNED_FU_i_assign_0;
  wire out_lut_expr_FU_109_i0_fu_main_33671_42339;
  wire out_lut_expr_FU_37_i0_fu_main_33671_42380;
  wire out_lut_expr_FU_43_i0_fu_main_33671_42454;
  wire out_lut_expr_FU_44_i0_fu_main_33671_42457;
  wire out_lut_expr_FU_45_i0_fu_main_33671_42460;
  wire out_lut_expr_FU_46_i0_fu_main_33671_42472;
  wire out_lut_expr_FU_48_i0_fu_main_33671_42481;
  wire out_lut_expr_FU_50_i0_fu_main_33671_42502;
  wire out_lut_expr_FU_51_i0_fu_main_33671_42508;
  wire out_lut_expr_FU_53_i0_fu_main_33671_42517;
  wire out_lut_expr_FU_59_i0_fu_main_33671_42625;
  wire out_lut_expr_FU_66_i0_fu_main_33671_42685;
  wire out_lut_expr_FU_75_i0_fu_main_33671_42733;
  wire out_lut_expr_FU_76_i0_fu_main_33671_42736;
  wire out_lut_expr_FU_77_i0_fu_main_33671_42739;
  wire out_lut_expr_FU_78_i0_fu_main_33671_42742;
  wire out_lut_expr_FU_79_i0_fu_main_33671_42745;
  wire out_lut_expr_FU_80_i0_fu_main_33671_42748;
  wire out_lut_expr_FU_81_i0_fu_main_33671_42751;
  wire out_lut_expr_FU_82_i0_fu_main_33671_42754;
  wire out_lut_expr_FU_86_i0_fu_main_33671_42766;
  wire out_lut_expr_FU_90_i0_fu_main_33671_42781;
  wire out_lut_expr_FU_91_i0_fu_main_33671_42784;
  wire out_lut_expr_FU_95_i0_fu_main_33671_42799;
  wire out_lut_expr_FU_96_i0_fu_main_33671_42802;
  wire [1:0] out_multi_read_cond_FU_105_i0_fu_main_33671_42333;
  wire out_ne_expr_FU_32_0_32_115_i0_fu_main_33671_34780;
  wire signed [31:0] out_plus_expr_FU_32_0_32_116_i0_fu_main_33671_33831;
  wire out_read_cond_FU_15_i0_fu_main_33671_33748;
  wire out_read_cond_FU_21_i0_fu_main_33671_33783;
  wire out_read_cond_FU_25_i0_fu_main_33671_33811;
  wire out_read_cond_FU_97_i0_fu_main_33671_33832;
  wire out_read_cond_FU_98_i0_fu_main_33671_33962;
  wire [31:0] out_reg_0_reg_0;
  wire [31:0] out_reg_10_reg_10;
  wire [31:0] out_reg_11_reg_11;
  wire [31:0] out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire [31:0] out_reg_14_reg_14;
  wire [20:0] out_reg_15_reg_15;
  wire [31:0] out_reg_16_reg_16;
  wire out_reg_17_reg_17;
  wire [18:0] out_reg_18_reg_18;
  wire [63:0] out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire [31:0] out_reg_20_reg_20;
  wire [31:0] out_reg_21_reg_21;
  wire [20:0] out_reg_22_reg_22;
  wire out_reg_23_reg_23;
  wire out_reg_24_reg_24;
  wire [31:0] out_reg_25_reg_25;
  wire [20:0] out_reg_26_reg_26;
  wire [20:0] out_reg_27_reg_27;
  wire out_reg_28_reg_28;
  wire [63:0] out_reg_29_reg_29;
  wire [31:0] out_reg_2_reg_2;
  wire [20:0] out_reg_30_reg_30;
  wire [31:0] out_reg_31_reg_31;
  wire [20:0] out_reg_32_reg_32;
  wire [31:0] out_reg_33_reg_33;
  wire [12:0] out_reg_34_reg_34;
  wire out_reg_35_reg_35;
  wire out_reg_36_reg_36;
  wire out_reg_37_reg_37;
  wire out_reg_38_reg_38;
  wire out_reg_39_reg_39;
  wire [31:0] out_reg_3_reg_3;
  wire out_reg_40_reg_40;
  wire out_reg_41_reg_41;
  wire out_reg_42_reg_42;
  wire out_reg_43_reg_43;
  wire out_reg_44_reg_44;
  wire out_reg_45_reg_45;
  wire out_reg_46_reg_46;
  wire out_reg_47_reg_47;
  wire out_reg_48_reg_48;
  wire out_reg_49_reg_49;
  wire [31:0] out_reg_4_reg_4;
  wire out_reg_50_reg_50;
  wire out_reg_51_reg_51;
  wire [12:0] out_reg_52_reg_52;
  wire [20:0] out_reg_53_reg_53;
  wire [31:0] out_reg_54_reg_54;
  wire [20:0] out_reg_55_reg_55;
  wire [31:0] out_reg_56_reg_56;
  wire [31:0] out_reg_57_reg_57;
  wire [52:0] out_reg_58_reg_58;
  wire [52:0] out_reg_59_reg_59;
  wire [31:0] out_reg_5_reg_5;
  wire [41:0] out_reg_60_reg_60;
  wire [31:0] out_reg_61_reg_61;
  wire [21:0] out_reg_62_reg_62;
  wire [20:0] out_reg_63_reg_63;
  wire [9:0] out_reg_64_reg_64;
  wire [54:0] out_reg_65_reg_65;
  wire [1:0] out_reg_66_reg_66;
  wire [63:0] out_reg_67_reg_67;
  wire out_reg_68_reg_68;
  wire out_reg_69_reg_69;
  wire [63:0] out_reg_6_reg_6;
  wire [63:0] out_reg_70_reg_70;
  wire [31:0] out_reg_7_reg_7;
  wire [31:0] out_reg_8_reg_8;
  wire out_reg_9_reg_9;
  wire [0:0] out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_1;
  wire [0:0] out_u_assign_conn_obj_5_ASSIGN_UNSIGNED_FU_u_assign_2;
  wire [0:0] out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_3;
  wire [0:0] out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_4;
  wire [51:0] out_ui_bit_and_expr_FU_0_64_64_117_i0_fu_main_33671_42342;
  wire [51:0] out_ui_bit_and_expr_FU_0_64_64_117_i1_fu_main_33671_42358;
  wire [12:0] out_ui_bit_and_expr_FU_16_0_16_118_i0_fu_main_33671_37926;
  wire [9:0] out_ui_bit_and_expr_FU_16_0_16_119_i0_fu_main_33671_37976;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_120_i0_fu_main_33671_42350;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_120_i1_fu_main_33671_42366;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_120_i2_fu_main_33671_42700;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_121_i0_fu_main_33671_42389;
  wire [10:0] out_ui_bit_and_expr_FU_16_0_16_121_i1_fu_main_33671_42407;
  wire [9:0] out_ui_bit_and_expr_FU_16_0_16_122_i0_fu_main_33671_42598;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_123_i0_fu_main_33671_42496;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_123_i1_fu_main_33671_42532;
  wire [0:0] out_ui_bit_and_expr_FU_1_1_1_123_i2_fu_main_33671_42535;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_124_i0_fu_main_33671_42436;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_124_i1_fu_main_33671_42446;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_124_i2_fu_main_33671_42541;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_124_i3_fu_main_33671_42553;
  wire [31:0] out_ui_bit_and_expr_FU_32_0_32_125_i0_fu_main_33671_42583;
  wire [53:0] out_ui_bit_and_expr_FU_64_0_64_126_i0_fu_main_33671_42589;
  wire [52:0] out_ui_bit_and_expr_FU_64_0_64_126_i1_fu_main_33671_42634;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_127_i0_fu_main_33671_42604;
  wire [51:0] out_ui_bit_and_expr_FU_64_0_64_127_i1_fu_main_33671_42658;
  wire [52:0] out_ui_bit_and_expr_FU_64_0_64_128_i0_fu_main_33671_42673;
  wire [62:0] out_ui_bit_and_expr_FU_64_0_64_129_i0_fu_main_33671_42709;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_130_i0_fu_main_33671_37886;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_130_i1_fu_main_33671_37899;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_130_i2_fu_main_33671_37911;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_130_i3_fu_main_33671_37990;
  wire [4:0] out_ui_bit_and_expr_FU_8_0_8_131_i0_fu_main_33671_37942;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_132_i0_fu_main_33671_42640;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_133_i0_fu_main_33671_33747;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_133_i1_fu_main_33671_33782;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_133_i2_fu_main_33671_33810;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_133_i3_fu_main_33671_33931;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_134_i0_fu_main_33671_33878;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_135_i0_fu_main_33671_33887;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_136_i0_fu_main_33671_33952;
  wire [63:0] out_ui_bit_ior_concat_expr_FU_137_i0_fu_main_33671_42586;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_138_i0_fu_main_33671_42425;
  wire [52:0] out_ui_bit_ior_expr_FU_0_64_64_138_i1_fu_main_33671_42428;
  wire [51:0] out_ui_bit_ior_expr_FU_0_64_64_139_i0_fu_main_33671_42601;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_140_i0_fu_main_33671_42667;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_141_i0_fu_main_33671_42712;
  wire [63:0] out_ui_bit_ior_expr_FU_64_0_64_142_i0_fu_main_33671_42451;
  wire [51:0] out_ui_bit_ior_expr_FU_64_64_64_143_i0_fu_main_33671_42655;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_144_i0_fu_main_33671_42487;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_144_i1_fu_main_33671_42490;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_144_i2_fu_main_33671_42523;
  wire [1:0] out_ui_bit_ior_expr_FU_8_8_8_144_i3_fu_main_33671_42526;
  wire [12:0] out_ui_cond_expr_FU_16_16_16_16_145_i0_fu_main_33671_42808;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_146_i0_fu_main_33671_42769;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_146_i1_fu_main_33671_42787;
  wire [63:0] out_ui_cond_expr_FU_64_64_64_64_146_i2_fu_main_33671_42814;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_147_i0_fu_main_33671_42463;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_147_i1_fu_main_33671_42466;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_147_i2_fu_main_33671_42469;
  wire [1:0] out_ui_cond_expr_FU_8_8_8_8_147_i3_fu_main_33671_42505;
  wire out_ui_eq_expr_FU_16_0_16_148_i0_fu_main_33671_42392;
  wire out_ui_eq_expr_FU_16_0_16_148_i1_fu_main_33671_42410;
  wire out_ui_eq_expr_FU_16_0_16_148_i2_fu_main_33671_42703;
  wire out_ui_eq_expr_FU_16_0_16_149_i0_fu_main_33671_42395;
  wire out_ui_eq_expr_FU_16_0_16_149_i1_fu_main_33671_42413;
  wire out_ui_eq_expr_FU_64_0_64_150_i0_fu_main_33671_42398;
  wire out_ui_eq_expr_FU_64_0_64_150_i1_fu_main_33671_42416;
  wire out_ui_eq_expr_FU_64_0_64_151_i0_fu_main_33671_42694;
  wire out_ui_extract_bit_expr_FU_35_i0_fu_main_33671_42374;
  wire out_ui_extract_bit_expr_FU_36_i0_fu_main_33671_42377;
  wire out_ui_extract_bit_expr_FU_55_i0_fu_main_33671_42607;
  wire out_ui_extract_bit_expr_FU_57_i0_fu_main_33671_42613;
  wire out_ui_extract_bit_expr_FU_63_i0_fu_main_33671_42670;
  wire out_ui_extract_bit_expr_FU_64_i0_fu_main_33671_42679;
  wire out_ui_extract_bit_expr_FU_65_i0_fu_main_33671_42682;
  wire out_ui_extract_bit_expr_FU_68_i0_fu_main_33671_42706;
  wire out_ui_extract_bit_expr_FU_69_i0_fu_main_33671_42715;
  wire out_ui_extract_bit_expr_FU_70_i0_fu_main_33671_42718;
  wire out_ui_extract_bit_expr_FU_71_i0_fu_main_33671_42721;
  wire out_ui_extract_bit_expr_FU_72_i0_fu_main_33671_42724;
  wire out_ui_extract_bit_expr_FU_73_i0_fu_main_33671_42727;
  wire out_ui_extract_bit_expr_FU_74_i0_fu_main_33671_42730;
  wire out_ui_extract_bit_expr_FU_83_i0_fu_main_33671_42757;
  wire out_ui_extract_bit_expr_FU_84_i0_fu_main_33671_42760;
  wire out_ui_extract_bit_expr_FU_85_i0_fu_main_33671_42763;
  wire out_ui_extract_bit_expr_FU_87_i0_fu_main_33671_42772;
  wire out_ui_extract_bit_expr_FU_88_i0_fu_main_33671_42775;
  wire out_ui_extract_bit_expr_FU_89_i0_fu_main_33671_42778;
  wire out_ui_extract_bit_expr_FU_92_i0_fu_main_33671_42790;
  wire out_ui_extract_bit_expr_FU_93_i0_fu_main_33671_42793;
  wire out_ui_extract_bit_expr_FU_94_i0_fu_main_33671_42796;
  wire [12:0] out_ui_lshift_expr_FU_16_0_16_152_i0_fu_main_33671_38010;
  wire [20:0] out_ui_lshift_expr_FU_32_0_32_153_i0_fu_main_33671_34715;
  wire [20:0] out_ui_lshift_expr_FU_32_0_32_153_i1_fu_main_33671_34722;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_153_i2_fu_main_33671_37955;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_154_i0_fu_main_33671_37882;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_154_i1_fu_main_33671_37896;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_154_i2_fu_main_33671_37908;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_154_i3_fu_main_33671_37987;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_155_i0_fu_main_33671_37922;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_155_i1_fu_main_33671_37999;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_156_i0_fu_main_33671_37938;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_157_i0_fu_main_33671_37972;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_158_i0_fu_main_33671_42386;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_159_i0_fu_main_33671_42574;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_160_i0_fu_main_33671_42580;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_161_i0_fu_main_33671_42592;
  wire [54:0] out_ui_lshift_expr_FU_64_0_64_162_i0_fu_main_33671_42622;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_162_i1_fu_main_33671_42652;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_163_i0_fu_main_33671_42664;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_164_i0_fu_main_33671_42811;
  wire [53:0] out_ui_lshift_expr_FU_64_64_64_165_i0_fu_main_33671_42631;
  wire [50:0] out_ui_lshift_expr_FU_64_64_64_165_i1_fu_main_33671_42649;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_166_i0_fu_main_33671_42478;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_166_i1_fu_main_33671_42514;
  wire [63:0] out_ui_mult_expr_FU_32_32_32_0_167_i0_fu_main_33671_42538;
  wire [52:0] out_ui_mult_expr_FU_32_32_32_0_167_i1_fu_main_33671_42547;
  wire [52:0] out_ui_mult_expr_FU_32_32_32_0_167_i2_fu_main_33671_42559;
  wire [41:0] out_ui_mult_expr_FU_32_32_32_0_167_i3_fu_main_33671_42568;
  wire out_ui_ne_expr_FU_32_0_32_168_i0_fu_main_33671_34784;
  wire out_ui_ne_expr_FU_32_0_32_169_i0_fu_main_33671_34786;
  wire out_ui_ne_expr_FU_32_32_32_170_i0_fu_main_33671_34774;
  wire out_ui_ne_expr_FU_32_32_32_170_i1_fu_main_33671_34776;
  wire out_ui_ne_expr_FU_32_32_32_170_i2_fu_main_33671_34778;
  wire out_ui_ne_expr_FU_32_32_32_170_i3_fu_main_33671_34782;
  wire out_ui_ne_expr_FU_64_0_64_171_i0_fu_main_33671_42401;
  wire out_ui_ne_expr_FU_64_0_64_171_i1_fu_main_33671_42404;
  wire out_ui_ne_expr_FU_64_0_64_171_i2_fu_main_33671_42419;
  wire out_ui_ne_expr_FU_64_0_64_171_i3_fu_main_33671_42422;
  wire out_ui_ne_expr_FU_64_0_64_172_i0_fu_main_33671_42676;
  wire [12:0] out_ui_plus_expr_FU_16_16_16_173_i0_fu_main_33671_42619;
  wire [28:0] out_ui_plus_expr_FU_32_0_32_174_i0_fu_main_33671_37879;
  wire [28:0] out_ui_plus_expr_FU_32_0_32_174_i1_fu_main_33671_37893;
  wire [28:0] out_ui_plus_expr_FU_32_0_32_174_i2_fu_main_33671_37905;
  wire [18:0] out_ui_plus_expr_FU_32_0_32_174_i3_fu_main_33671_37919;
  wire [26:0] out_ui_plus_expr_FU_32_0_32_174_i4_fu_main_33671_37935;
  wire [18:0] out_ui_plus_expr_FU_32_0_32_174_i5_fu_main_33671_37996;
  wire [28:0] out_ui_plus_expr_FU_32_0_32_175_i0_fu_main_33671_37952;
  wire [28:0] out_ui_plus_expr_FU_32_0_32_176_i0_fu_main_33671_37984;
  wire [18:0] out_ui_plus_expr_FU_32_32_32_177_i0_fu_main_33671_37969;
  wire [53:0] out_ui_plus_expr_FU_64_64_64_178_i0_fu_main_33671_42550;
  wire [52:0] out_ui_plus_expr_FU_64_64_64_178_i1_fu_main_33671_42562;
  wire [63:0] out_ui_plus_expr_FU_64_64_64_178_i2_fu_main_33671_42691;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_179_i0_fu_main_33671_33690;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_180_i0_fu_main_33671_33768;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_181_i0_fu_main_33671_33795;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_182_i0_fu_main_33671_33884;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_32_32_182_i1_fu_main_33671_34718;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_32_32_182_i2_fu_main_33671_34725;
  wire [20:0] out_ui_pointer_plus_expr_FU_32_32_32_182_i3_fu_main_33671_34733;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_183_i0_fu_main_33671_37874;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_183_i1_fu_main_33671_37891;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_183_i2_fu_main_33671_37903;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_183_i3_fu_main_33671_37981;
  wire [18:0] out_ui_rshift_expr_FU_32_0_32_184_i0_fu_main_33671_37916;
  wire [18:0] out_ui_rshift_expr_FU_32_0_32_184_i1_fu_main_33671_37994;
  wire [18:0] out_ui_rshift_expr_FU_32_0_32_184_i2_fu_main_33671_38002;
  wire [26:0] out_ui_rshift_expr_FU_32_0_32_185_i0_fu_main_33671_37932;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_186_i0_fu_main_33671_37947;
  wire [28:0] out_ui_rshift_expr_FU_32_0_32_186_i1_fu_main_33671_37958;
  wire [9:0] out_ui_rshift_expr_FU_32_0_32_186_i2_fu_main_33671_38005;
  wire [18:0] out_ui_rshift_expr_FU_32_0_32_187_i0_fu_main_33671_37963;
  wire [18:0] out_ui_rshift_expr_FU_32_0_32_187_i1_fu_main_33671_37966;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_188_i0_fu_main_33671_42347;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_188_i1_fu_main_33671_42363;
  wire [1:0] out_ui_rshift_expr_FU_64_0_64_188_i2_fu_main_33671_42637;
  wire [10:0] out_ui_rshift_expr_FU_64_0_64_188_i3_fu_main_33671_42697;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_189_i0_fu_main_33671_42431;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_189_i1_fu_main_33671_42441;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_189_i2_fu_main_33671_42544;
  wire [21:0] out_ui_rshift_expr_FU_64_0_64_189_i3_fu_main_33671_42556;
  wire [20:0] out_ui_rshift_expr_FU_64_0_64_189_i4_fu_main_33671_42565;
  wire [31:0] out_ui_rshift_expr_FU_64_0_64_190_i0_fu_main_33671_42577;
  wire [9:0] out_ui_rshift_expr_FU_64_0_64_191_i0_fu_main_33671_42595;
  wire [12:0] out_ui_rshift_expr_FU_64_0_64_192_i0_fu_main_33671_42805;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_193_i0_fu_main_33671_42493;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_193_i1_fu_main_33671_42529;
  wire [1:0] out_ui_rshift_expr_FU_8_8_8_194_i0_fu_main_33671_42646;
  wire [12:0] out_ui_ternary_plus_expr_FU_16_0_16_16_195_i0_fu_main_33671_42499;
  wire [41:0] out_ui_ternary_plus_expr_FU_64_64_64_64_196_i0_fu_main_33671_42571;
  wire [63:0] out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_5;
  wire [63:0] out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_6;
  wire [63:0] out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_7;
  wire [63:0] out_vb_assign_conn_obj_6_ASSIGN_VECTOR_BOOL_FU_vb_assign_8;
  wire [127:0] proxy_out1_1020;
  wire [127:0] proxy_out1_792;
  wire [127:0] proxy_out1_796;
  wire [127:0] proxy_out1_992;
  wire s___float_adde11m52b_1023nih_197_i01;
  wire s___internal_free_instance0;
  wire s___internal_malloc_198_i02;
  wire s_done___float_adde11m52b_1023nih_197_i0;
  wire s_done___internal_free_instance;
  wire s_done___internal_malloc_198_i0;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_1;
  wire [127:0] sig_in_bus_mergerMout_Wdata_ram0_2;
  wire [41:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [41:0] sig_in_bus_mergerMout_addr_ram1_1;
  wire [41:0] sig_in_bus_mergerMout_addr_ram1_2;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_1;
  wire [13:0] sig_in_bus_mergerMout_data_ram_size2_2;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_1;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_2;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_0;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_1;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_2;
  wire [31:0] sig_in_bus_mergerPROXY_PREF_ap27_0;
  wire sig_in_bus_mergerPROXY_PREF_start_port28_0;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_0;
  wire [1:0] sig_in_bus_mergerSout_DataRdy5_1;
  wire [127:0] sig_in_bus_mergerSout_Rdata_ram6_0;
  wire [127:0] sig_in_bus_mergerSout_Rdata_ram6_1;
  wire [127:0] sig_in_bus_mergerproxy_in112_0;
  wire [127:0] sig_in_bus_mergerproxy_in117_0;
  wire [127:0] sig_in_bus_mergerproxy_in122_0;
  wire [127:0] sig_in_bus_mergerproxy_in17_0;
  wire [127:0] sig_in_bus_mergerproxy_in17_1;
  wire [41:0] sig_in_bus_mergerproxy_in213_0;
  wire [41:0] sig_in_bus_mergerproxy_in218_0;
  wire [41:0] sig_in_bus_mergerproxy_in223_0;
  wire [41:0] sig_in_bus_mergerproxy_in28_0;
  wire [41:0] sig_in_bus_mergerproxy_in28_1;
  wire [13:0] sig_in_bus_mergerproxy_in314_0;
  wire [13:0] sig_in_bus_mergerproxy_in319_0;
  wire [13:0] sig_in_bus_mergerproxy_in324_0;
  wire [13:0] sig_in_bus_mergerproxy_in39_0;
  wire [13:0] sig_in_bus_mergerproxy_in39_1;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD10_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD10_1;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD15_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD20_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_LOAD25_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE11_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE11_1;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE16_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE21_0;
  wire [1:0] sig_in_bus_mergerproxy_sel_STORE26_0;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_1;
  wire [127:0] sig_in_vector_bus_mergerMout_Wdata_ram0_2;
  wire [41:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [41:0] sig_in_vector_bus_mergerMout_addr_ram1_1;
  wire [41:0] sig_in_vector_bus_mergerMout_addr_ram1_2;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_1;
  wire [13:0] sig_in_vector_bus_mergerMout_data_ram_size2_2;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_1;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_2;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_0;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_1;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_2;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_0;
  wire [1:0] sig_in_vector_bus_mergerSout_DataRdy5_1;
  wire [127:0] sig_in_vector_bus_mergerSout_Rdata_ram6_0;
  wire [127:0] sig_in_vector_bus_mergerSout_Rdata_ram6_1;
  wire [127:0] sig_in_vector_bus_mergerproxy_in112_0;
  wire [127:0] sig_in_vector_bus_mergerproxy_in117_0;
  wire [127:0] sig_in_vector_bus_mergerproxy_in122_0;
  wire [127:0] sig_in_vector_bus_mergerproxy_in17_0;
  wire [127:0] sig_in_vector_bus_mergerproxy_in17_1;
  wire [41:0] sig_in_vector_bus_mergerproxy_in213_0;
  wire [41:0] sig_in_vector_bus_mergerproxy_in218_0;
  wire [41:0] sig_in_vector_bus_mergerproxy_in223_0;
  wire [41:0] sig_in_vector_bus_mergerproxy_in28_0;
  wire [41:0] sig_in_vector_bus_mergerproxy_in28_1;
  wire [13:0] sig_in_vector_bus_mergerproxy_in314_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in319_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in324_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in39_0;
  wire [13:0] sig_in_vector_bus_mergerproxy_in39_1;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD10_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD10_1;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD15_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD20_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_LOAD25_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE11_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE11_1;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE16_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE21_0;
  wire [1:0] sig_in_vector_bus_mergerproxy_sel_STORE26_0;
  wire [127:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [41:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [13:0] sig_out_bus_mergerMout_data_ram_size2_;
  wire [1:0] sig_out_bus_mergerMout_oe_ram3_;
  wire [1:0] sig_out_bus_mergerMout_we_ram4_;
  wire [31:0] sig_out_bus_mergerPROXY_PREF_ap27_;
  wire sig_out_bus_mergerPROXY_PREF_start_port28_;
  wire [1:0] sig_out_bus_mergerSout_DataRdy5_;
  wire [127:0] sig_out_bus_mergerSout_Rdata_ram6_;
  wire [127:0] sig_out_bus_mergerproxy_in112_;
  wire [127:0] sig_out_bus_mergerproxy_in117_;
  wire [127:0] sig_out_bus_mergerproxy_in122_;
  wire [127:0] sig_out_bus_mergerproxy_in17_;
  wire [41:0] sig_out_bus_mergerproxy_in213_;
  wire [41:0] sig_out_bus_mergerproxy_in218_;
  wire [41:0] sig_out_bus_mergerproxy_in223_;
  wire [41:0] sig_out_bus_mergerproxy_in28_;
  wire [13:0] sig_out_bus_mergerproxy_in314_;
  wire [13:0] sig_out_bus_mergerproxy_in319_;
  wire [13:0] sig_out_bus_mergerproxy_in324_;
  wire [13:0] sig_out_bus_mergerproxy_in39_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD10_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD15_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD20_;
  wire [1:0] sig_out_bus_mergerproxy_sel_LOAD25_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE11_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE16_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE21_;
  wire [1:0] sig_out_bus_mergerproxy_sel_STORE26_;
  wire [127:0] sig_out_vector_bus_mergerproxy_in112_;
  wire [127:0] sig_out_vector_bus_mergerproxy_in117_;
  wire [127:0] sig_out_vector_bus_mergerproxy_in122_;
  wire [127:0] sig_out_vector_bus_mergerproxy_in17_;
  wire [41:0] sig_out_vector_bus_mergerproxy_in213_;
  wire [41:0] sig_out_vector_bus_mergerproxy_in218_;
  wire [41:0] sig_out_vector_bus_mergerproxy_in223_;
  wire [41:0] sig_out_vector_bus_mergerproxy_in28_;
  wire [13:0] sig_out_vector_bus_mergerproxy_in314_;
  wire [13:0] sig_out_vector_bus_mergerproxy_in319_;
  wire [13:0] sig_out_vector_bus_mergerproxy_in324_;
  wire [13:0] sig_out_vector_bus_mergerproxy_in39_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_LOAD10_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_LOAD15_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_LOAD20_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_LOAD25_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_STORE11_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_STORE16_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_STORE21_;
  wire [1:0] sig_out_vector_bus_mergerproxy_sel_STORE26_;
  
  ASSIGN_SIGNED_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) ASSIGN_SIGNED_FU_i_assign_0 (.out1(out_i_assign_conn_obj_4_ASSIGN_SIGNED_FU_i_assign_0),
    .in1(out_const_0));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) ASSIGN_UNSIGNED_FU_u_assign_1 (.out1(out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_1),
    .in1(out_const_0));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) ASSIGN_UNSIGNED_FU_u_assign_2 (.out1(out_u_assign_conn_obj_5_ASSIGN_UNSIGNED_FU_u_assign_2),
    .in1(out_const_0));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) ASSIGN_UNSIGNED_FU_u_assign_3 (.out1(out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_3),
    .in1(out_const_0));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) ASSIGN_UNSIGNED_FU_u_assign_4 (.out1(out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_4),
    .in1(out_const_0));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) ASSIGN_VECTOR_BOOL_FU_vb_assign_5 (.out1(out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_5),
    .in1(out_reg_6_reg_6));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) ASSIGN_VECTOR_BOOL_FU_vb_assign_6 (.out1(out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_6),
    .in1(out_const_2));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) ASSIGN_VECTOR_BOOL_FU_vb_assign_7 (.out1(out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_7),
    .in1(out_const_1));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) ASSIGN_VECTOR_BOOL_FU_vb_assign_8 (.out1(out_vb_assign_conn_obj_6_ASSIGN_VECTOR_BOOL_FU_vb_assign_8),
    .in1(out_reg_19_reg_19));
  BMEMORY_CTRLN #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(21),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2),
    .BITSIZE_Min_oe_ram(1),
    .PORTSIZE_Min_oe_ram(2),
    .BITSIZE_Min_we_ram(1),
    .PORTSIZE_Min_we_ram(2),
    .BITSIZE_Mout_oe_ram(1),
    .PORTSIZE_Mout_oe_ram(2),
    .BITSIZE_Mout_we_ram(1),
    .PORTSIZE_Mout_we_ram(2),
    .BITSIZE_M_DataRdy(1),
    .PORTSIZE_M_DataRdy(2),
    .BITSIZE_Min_addr_ram(21),
    .PORTSIZE_Min_addr_ram(2),
    .BITSIZE_Mout_addr_ram(21),
    .PORTSIZE_Mout_addr_ram(2),
    .BITSIZE_M_Rdata_ram(64),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(64),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(64),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(7),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(7),
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_114_i0 (.out1({out_BMEMORY_CTRLN_114_i1_BMEMORY_CTRLN_114_i0,
      out_BMEMORY_CTRLN_114_i0_BMEMORY_CTRLN_114_i0}),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_1),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_1),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_1),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_1),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_1),
    .clock(clock),
    .in1({out_MUX_10_BMEMORY_CTRLN_114_i1_0_0_0,
      out_MUX_6_BMEMORY_CTRLN_114_i0_0_0_0}),
    .in2({out_MUX_11_BMEMORY_CTRLN_114_i1_1_0_1,
      out_MUX_7_BMEMORY_CTRLN_114_i0_1_0_1}),
    .in3({out_conv_out_const_6_8_7,
      out_conv_out_const_6_8_7}),
    .in4({out_const_11,
      out_const_11}),
    .sel_LOAD({fuselector_BMEMORY_CTRLN_114_i1_LOAD,
      fuselector_BMEMORY_CTRLN_114_i0_LOAD}),
    .sel_STORE({fuselector_BMEMORY_CTRLN_114_i1_STORE,
      fuselector_BMEMORY_CTRLN_114_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_10_BMEMORY_CTRLN_114_i1_0_0_0 (.out1(out_MUX_10_BMEMORY_CTRLN_114_i1_0_0_0),
    .sel(selector_MUX_10_BMEMORY_CTRLN_114_i1_0_0_0),
    .in1(out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_5),
    .in2(out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_7));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_11_BMEMORY_CTRLN_114_i1_1_0_0 (.out1(out_MUX_11_BMEMORY_CTRLN_114_i1_1_0_0),
    .sel(selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_0),
    .in1(out_UUdata_converter_FU_14_i0_fu_main_33671_33744),
    .in2(out_UUdata_converter_FU_24_i0_fu_main_33671_33808));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_11_BMEMORY_CTRLN_114_i1_1_0_1 (.out1(out_MUX_11_BMEMORY_CTRLN_114_i1_1_0_1),
    .sel(selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_182_i2_fu_main_33671_34725),
    .in2(out_MUX_11_BMEMORY_CTRLN_114_i1_1_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_185_reg_12_0_0_0 (.out1(out_MUX_185_reg_12_0_0_0),
    .sel(selector_MUX_185_reg_12_0_0_0),
    .in1(out_reg_8_reg_8),
    .in2(out_ui_bit_ior_concat_expr_FU_133_i2_fu_main_33671_33810));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_186_reg_13_0_0_0 (.out1(out_MUX_186_reg_13_0_0_0),
    .sel(selector_MUX_186_reg_13_0_0_0),
    .in1(out_conv_out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_4_1_32),
    .in2(out_ui_lshift_expr_FU_32_0_32_155_i1_fu_main_33671_37999));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_187_reg_14_0_0_0 (.out1(out_MUX_187_reg_14_0_0_0),
    .sel(selector_MUX_187_reg_14_0_0_0),
    .in1(out_conv_out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_3_1_32),
    .in2(out_ui_lshift_expr_FU_32_0_32_153_i2_fu_main_33671_37955));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_192_reg_19_0_0_0 (.out1(out_MUX_192_reg_19_0_0_0),
    .sel(selector_MUX_192_reg_19_0_0_0),
    .in1(out___float_adde11m52b_1023nih_197_i0___float_adde11m52b_1023nih_197_i0),
    .in2(out_conv_out_u_assign_conn_obj_5_ASSIGN_UNSIGNED_FU_u_assign_2_1_64));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_193_reg_2_0_0_0 (.out1(out_MUX_193_reg_2_0_0_0),
    .sel(selector_MUX_193_reg_2_0_0_0),
    .in1(out_UUdata_converter_FU_9_i0_fu_main_33671_33767),
    .in2(out_ui_bit_ior_concat_expr_FU_133_i1_fu_main_33671_33782));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_194_reg_20_0_0_0 (.out1(out_MUX_194_reg_20_0_0_0),
    .sel(selector_MUX_194_reg_20_0_0_0),
    .in1(out_UUdata_converter_FU_108_i0_fu_main_33671_33881),
    .in2(out_ui_bit_ior_concat_expr_FU_134_i0_fu_main_33671_33878));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_195_reg_21_0_0_0 (.out1(out_MUX_195_reg_21_0_0_0),
    .sel(selector_MUX_195_reg_21_0_0_0),
    .in1(out_reg_4_reg_4),
    .in2(out_ui_bit_ior_concat_expr_FU_136_i0_fu_main_33671_33952));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_199_reg_25_0_0_0 (.out1(out_MUX_199_reg_25_0_0_0),
    .sel(selector_MUX_199_reg_25_0_0_0),
    .in1(out_conv_out_i_assign_conn_obj_4_ASSIGN_SIGNED_FU_i_assign_0_I_1_32),
    .in2(out_plus_expr_FU_32_0_32_116_i0_fu_main_33671_33831));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_237_reg_6_0_0_0 (.out1(out_MUX_237_reg_6_0_0_0),
    .sel(selector_MUX_237_reg_6_0_0_0),
    .in1(out___float_adde11m52b_1023nih_197_i0___float_adde11m52b_1023nih_197_i0),
    .in2(out_conv_out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_1_1_64));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_248_reg_7_0_0_0 (.out1(out_MUX_248_reg_7_0_0_0),
    .sel(selector_MUX_248_reg_7_0_0_0),
    .in1(out_reg_4_reg_4),
    .in2(out_ui_bit_ior_concat_expr_FU_133_i0_fu_main_33671_33747));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_250_reg_8_0_0_0 (.out1(out_MUX_250_reg_8_0_0_0),
    .sel(selector_MUX_250_reg_8_0_0_0),
    .in1(out_reg_16_reg_16),
    .in2(out_UUdata_converter_FU_10_i0_fu_main_33671_33794));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0 (.out1(out_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0),
    .sel(selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0),
    .in1(out_reg_3_reg_3),
    .in2(out_reg_1_reg_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1 (.out1(out_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1),
    .sel(selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1),
    .in1(out_reg_0_reg_0),
    .in2(out_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0 (.out1(out_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0),
    .sel(selector_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0),
    .in1(out_reg_70_reg_70),
    .in2(out_reg_6_reg_6));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0 (.out1(out_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0),
    .sel(selector_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0),
    .in1(out_reg_19_reg_19),
    .in2(out_conv_out_const_45_62_64));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_50___internal_malloc_198_i0_0_0_0 (.out1(out_MUX_50___internal_malloc_198_i0_0_0_0),
    .sel(selector_MUX_50___internal_malloc_198_i0_0_0_0),
    .in1(out_conv_out_const_16_8_32),
    .in2(out_conv_out_const_17_24_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_50___internal_malloc_198_i0_0_0_1 (.out1(out_MUX_50___internal_malloc_198_i0_0_0_1),
    .sel(selector_MUX_50___internal_malloc_198_i0_0_0_1),
    .in1(out_conv_out_const_40_23_32),
    .in2(out_MUX_50___internal_malloc_198_i0_0_0_0));
  MUX_GATE #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) MUX_6_BMEMORY_CTRLN_114_i0_0_0_0 (.out1(out_MUX_6_BMEMORY_CTRLN_114_i0_0_0_0),
    .sel(selector_MUX_6_BMEMORY_CTRLN_114_i0_0_0_0),
    .in1(out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_6),
    .in2(out_vb_assign_conn_obj_6_ASSIGN_VECTOR_BOOL_FU_vb_assign_8));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_7_BMEMORY_CTRLN_114_i0_1_0_0 (.out1(out_MUX_7_BMEMORY_CTRLN_114_i0_1_0_0),
    .sel(selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_0),
    .in1(out_reg_22_reg_22),
    .in2(out_UUdata_converter_FU_20_i0_fu_main_33671_33780));
  MUX_GATE #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21)) MUX_7_BMEMORY_CTRLN_114_i0_1_0_1 (.out1(out_MUX_7_BMEMORY_CTRLN_114_i0_1_0_1),
    .sel(selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_1),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_182_i1_fu_main_33671_34718),
    .in2(out_MUX_7_BMEMORY_CTRLN_114_i0_1_0_0));
  __float_adde11m52b_1023nih __float_adde11m52b_1023nih_197_i0 (.done_port(s_done___float_adde11m52b_1023nih_197_i0),
    .return_port(out___float_adde11m52b_1023nih_197_i0___float_adde11m52b_1023nih_197_i0),
    .clock(clock),
    .reset(reset),
    .start_port(s___float_adde11m52b_1023nih_197_i01),
    .a(out_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0),
    .b(out_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0));
  WRAPPED_PROXY_PREF___internal_free #(.MEM_var_792_33671(MEM_var_792_33671)) __internal_free_instance (.done_port(s_done___internal_free_instance),
    .proxy_in1_792(sig_in_vector_bus_mergerproxy_in17_0),
    .proxy_in2_792(sig_in_vector_bus_mergerproxy_in28_0),
    .proxy_in3_792(sig_in_vector_bus_mergerproxy_in39_0),
    .proxy_sel_LOAD_792(sig_in_vector_bus_mergerproxy_sel_LOAD10_0),
    .proxy_sel_STORE_792(sig_in_vector_bus_mergerproxy_sel_STORE11_0),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_0),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_0),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_0),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_0),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_0),
    .PROXY_PREF_done_port(PROXY_PREF_done_port___internal_free),
    .clock(clock),
    .reset(reset),
    .start_port(s___internal_free_instance0),
    .ap(out_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .proxy_out1_792(proxy_out1_792),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .PROXY_PREF_start_port(sig_out_bus_mergerPROXY_PREF_start_port28_),
    .PROXY_PREF_ap(sig_out_bus_mergerPROXY_PREF_ap27_),
    .sel___internal_free(fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free));
  __internal_malloc #(.MEM_var_1020_33671(MEM_var_1020_33671),
    .MEM_var_792_33671(MEM_var_792_33671),
    .MEM_var_796_33671(MEM_var_796_33671),
    .MEM_var_992_33671(MEM_var_992_33671)) __internal_malloc_198_i0 (.done_port(s_done___internal_malloc_198_i0),
    .return_port(out___internal_malloc_198_i0___internal_malloc_198_i0),
    .proxy_in1_792(sig_in_vector_bus_mergerproxy_in17_1),
    .proxy_in2_792(sig_in_vector_bus_mergerproxy_in28_1),
    .proxy_in3_792(sig_in_vector_bus_mergerproxy_in39_1),
    .proxy_sel_LOAD_792(sig_in_vector_bus_mergerproxy_sel_LOAD10_1),
    .proxy_sel_STORE_792(sig_in_vector_bus_mergerproxy_sel_STORE11_1),
    .proxy_in1_796(sig_in_vector_bus_mergerproxy_in112_0),
    .proxy_in2_796(sig_in_vector_bus_mergerproxy_in213_0),
    .proxy_in3_796(sig_in_vector_bus_mergerproxy_in314_0),
    .proxy_sel_LOAD_796(sig_in_vector_bus_mergerproxy_sel_LOAD15_0),
    .proxy_sel_STORE_796(sig_in_vector_bus_mergerproxy_sel_STORE16_0),
    .proxy_in1_992(sig_in_vector_bus_mergerproxy_in117_0),
    .proxy_in2_992(sig_in_vector_bus_mergerproxy_in218_0),
    .proxy_in3_992(sig_in_vector_bus_mergerproxy_in319_0),
    .proxy_sel_LOAD_992(sig_in_vector_bus_mergerproxy_sel_LOAD20_0),
    .proxy_sel_STORE_992(sig_in_vector_bus_mergerproxy_sel_STORE21_0),
    .proxy_in1_1020(sig_in_vector_bus_mergerproxy_in122_0),
    .proxy_in2_1020(sig_in_vector_bus_mergerproxy_in223_0),
    .proxy_in3_1020(sig_in_vector_bus_mergerproxy_in324_0),
    .proxy_sel_LOAD_1020(sig_in_vector_bus_mergerproxy_sel_LOAD25_0),
    .proxy_sel_STORE_1020(sig_in_vector_bus_mergerproxy_sel_STORE26_0),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_2),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_2),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_2),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_2),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_2),
    .PROXY_PREF_start_port___internal_free(sig_in_bus_mergerPROXY_PREF_start_port28_0),
    .PROXY_PREF_ap___internal_free(sig_in_bus_mergerPROXY_PREF_ap27_0),
    .clock(clock),
    .reset(reset),
    .start_port(s___internal_malloc_198_i02),
    .nbytes(out_MUX_50___internal_malloc_198_i0_0_0_1),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .proxy_out1_792(proxy_out1_792),
    .proxy_out1_796(proxy_out1_796),
    .proxy_out1_992(proxy_out1_992),
    .proxy_out1_1020(proxy_out1_1020),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .PROXY_PREF_done_port___internal_free(PROXY_PREF_done_port___internal_free));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(21),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(21),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_1020.mem"),
    .MEMORY_INIT_file_b("0_array_ref_1020.mem"),
    .n_elements(393216),
    .data_size(8),
    .address_space_begin(MEM_var_1020_33671),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(32),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(21),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) array_1020_0 (.out1({null_out_signal_array_1020_0_out1_1,
      null_out_signal_array_1020_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_1),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_1),
    .proxy_out1(proxy_out1_1020),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2({21'b000000000000000000000,
      21'b000000000000000000000}),
    .in3({7'b0000000,
      7'b0000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1(sig_out_vector_bus_mergerproxy_in122_),
    .proxy_in2(sig_out_vector_bus_mergerproxy_in223_),
    .proxy_in3(sig_out_vector_bus_mergerproxy_in324_),
    .proxy_sel_LOAD(sig_out_vector_bus_mergerproxy_sel_LOAD25_),
    .proxy_sel_STORE(sig_out_vector_bus_mergerproxy_sel_STORE26_));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(21),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(21),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("array_ref_792.mem"),
    .n_elements(1),
    .data_size(32),
    .address_space_begin(MEM_var_792_33671),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(32),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(21),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) array_792_0 (.out1({null_out_signal_array_792_0_out1_1,
      null_out_signal_array_792_0_out1_0}),
    .Sout_Rdata_ram({null_out_signal_array_792_0_Sout_Rdata_ram_1,
      null_out_signal_array_792_0_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_792_0_Sout_DataRdy_1,
      null_out_signal_array_792_0_Sout_DataRdy_0}),
    .proxy_out1(proxy_out1_792),
    .clock(clock),
    .reset(reset),
    .in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .in2({21'b000000000000000000000,
      21'b000000000000000000000}),
    .in3({7'b0000000,
      7'b0000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({21'b000000000000000000000,
      21'b000000000000000000000}),
    .S_Wdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .Sin_Rdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .S_data_ram_size({7'b0000000,
      7'b0000000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1(sig_out_vector_bus_mergerproxy_in17_),
    .proxy_in2(sig_out_vector_bus_mergerproxy_in28_),
    .proxy_in3(sig_out_vector_bus_mergerproxy_in39_),
    .proxy_sel_LOAD(sig_out_vector_bus_mergerproxy_sel_LOAD10_),
    .proxy_sel_STORE(sig_out_vector_bus_mergerproxy_sel_STORE11_));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(21),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(21),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file_a("array_ref_796.mem"),
    .MEMORY_INIT_file_b("0_array_ref_796.mem"),
    .n_elements(1),
    .data_size(64),
    .address_space_begin(MEM_var_796_33671),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .BRAM_BITSIZE(32),
    .PRIVATE_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(21),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) array_796_0 (.out1({null_out_signal_array_796_0_out1_1,
      null_out_signal_array_796_0_out1_0}),
    .Sout_Rdata_ram(sig_in_vector_bus_mergerSout_Rdata_ram6_0),
    .Sout_DataRdy(sig_in_vector_bus_mergerSout_DataRdy5_0),
    .proxy_out1(proxy_out1_796),
    .clock(clock),
    .reset(reset),
    .in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .in2({21'b000000000000000000000,
      21'b000000000000000000000}),
    .in3({7'b0000000,
      7'b0000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .Sin_DataRdy(Sin_DataRdy),
    .proxy_in1(sig_out_vector_bus_mergerproxy_in112_),
    .proxy_in2(sig_out_vector_bus_mergerproxy_in213_),
    .proxy_in3(sig_out_vector_bus_mergerproxy_in314_),
    .proxy_sel_LOAD(sig_out_vector_bus_mergerproxy_sel_LOAD15_),
    .proxy_sel_STORE(sig_out_vector_bus_mergerproxy_sel_STORE16_));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(21),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(7),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(21),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(64),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(64),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(64),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(7),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("array_ref_992.mem"),
    .n_elements(1),
    .data_size(32),
    .address_space_begin(MEM_var_992_33671),
    .address_space_rangesize(524288),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(0),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(32),
    .BITSIZE_proxy_in1(64),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2(21),
    .PORTSIZE_proxy_in2(2),
    .BITSIZE_proxy_in3(7),
    .PORTSIZE_proxy_in3(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(64),
    .PORTSIZE_proxy_out1(2)) array_992_0 (.out1({null_out_signal_array_992_0_out1_1,
      null_out_signal_array_992_0_out1_0}),
    .Sout_Rdata_ram({null_out_signal_array_992_0_Sout_Rdata_ram_1,
      null_out_signal_array_992_0_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_992_0_Sout_DataRdy_1,
      null_out_signal_array_992_0_Sout_DataRdy_0}),
    .proxy_out1(proxy_out1_992),
    .clock(clock),
    .reset(reset),
    .in1({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .in2({21'b000000000000000000000,
      21'b000000000000000000000}),
    .in3({7'b0000000,
      7'b0000000}),
    .in4({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      1'b0}),
    .sel_STORE({1'b0,
      1'b0}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({21'b000000000000000000000,
      21'b000000000000000000000}),
    .S_Wdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .Sin_Rdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .S_data_ram_size({7'b0000000,
      7'b0000000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1(sig_out_vector_bus_mergerproxy_in117_),
    .proxy_in2(sig_out_vector_bus_mergerproxy_in218_),
    .proxy_in3(sig_out_vector_bus_mergerproxy_in319_),
    .proxy_sel_LOAD(sig_out_vector_bus_mergerproxy_sel_LOAD20_),
    .proxy_sel_STORE(sig_out_vector_bus_mergerproxy_sel_STORE21_));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(3),
    .BITSIZE_out1(128)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_),
    .in1({sig_in_bus_mergerMout_Wdata_ram0_2,
      sig_in_bus_mergerMout_Wdata_ram0_1,
      sig_in_bus_mergerMout_Wdata_ram0_0}));
  bus_merger #(.BITSIZE_in1(42),
    .PORTSIZE_in1(3),
    .BITSIZE_out1(42)) bus_mergerMout_addr_ram1_ (.out1(sig_out_bus_mergerMout_addr_ram1_),
    .in1({sig_in_bus_mergerMout_addr_ram1_2,
      sig_in_bus_mergerMout_addr_ram1_1,
      sig_in_bus_mergerMout_addr_ram1_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(3),
    .BITSIZE_out1(14)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_),
    .in1({sig_in_bus_mergerMout_data_ram_size2_2,
      sig_in_bus_mergerMout_data_ram_size2_1,
      sig_in_bus_mergerMout_data_ram_size2_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(3),
    .BITSIZE_out1(2)) bus_mergerMout_oe_ram3_ (.out1(sig_out_bus_mergerMout_oe_ram3_),
    .in1({sig_in_bus_mergerMout_oe_ram3_2,
      sig_in_bus_mergerMout_oe_ram3_1,
      sig_in_bus_mergerMout_oe_ram3_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(3),
    .BITSIZE_out1(2)) bus_mergerMout_we_ram4_ (.out1(sig_out_bus_mergerMout_we_ram4_),
    .in1({sig_in_bus_mergerMout_we_ram4_2,
      sig_in_bus_mergerMout_we_ram4_1,
      sig_in_bus_mergerMout_we_ram4_0}));
  bus_merger #(.BITSIZE_in1(32),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(32)) bus_mergerPROXY_PREF_ap27_ (.out1(sig_out_bus_mergerPROXY_PREF_ap27_),
    .in1({sig_in_bus_mergerPROXY_PREF_ap27_0}));
  bus_merger #(.BITSIZE_in1(1),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(1)) bus_mergerPROXY_PREF_start_port28_ (.out1(sig_out_bus_mergerPROXY_PREF_start_port28_),
    .in1({sig_in_bus_mergerPROXY_PREF_start_port28_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) bus_mergerSout_DataRdy5_ (.out1(sig_out_bus_mergerSout_DataRdy5_),
    .in1({sig_in_bus_mergerSout_DataRdy5_1,
      sig_in_bus_mergerSout_DataRdy5_0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) bus_mergerSout_Rdata_ram6_ (.out1(sig_out_bus_mergerSout_Rdata_ram6_),
    .in1({sig_in_bus_mergerSout_Rdata_ram6_1,
      sig_in_bus_mergerSout_Rdata_ram6_0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerproxy_in112_ (.out1(sig_out_bus_mergerproxy_in112_),
    .in1({sig_in_bus_mergerproxy_in112_0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerproxy_in117_ (.out1(sig_out_bus_mergerproxy_in117_),
    .in1({sig_in_bus_mergerproxy_in117_0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(128)) bus_mergerproxy_in122_ (.out1(sig_out_bus_mergerproxy_in122_),
    .in1({sig_in_bus_mergerproxy_in122_0}));
  bus_merger #(.BITSIZE_in1(128),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) bus_mergerproxy_in17_ (.out1(sig_out_bus_mergerproxy_in17_),
    .in1({sig_in_bus_mergerproxy_in17_1,
      sig_in_bus_mergerproxy_in17_0}));
  bus_merger #(.BITSIZE_in1(42),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(42)) bus_mergerproxy_in213_ (.out1(sig_out_bus_mergerproxy_in213_),
    .in1({sig_in_bus_mergerproxy_in213_0}));
  bus_merger #(.BITSIZE_in1(42),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(42)) bus_mergerproxy_in218_ (.out1(sig_out_bus_mergerproxy_in218_),
    .in1({sig_in_bus_mergerproxy_in218_0}));
  bus_merger #(.BITSIZE_in1(42),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(42)) bus_mergerproxy_in223_ (.out1(sig_out_bus_mergerproxy_in223_),
    .in1({sig_in_bus_mergerproxy_in223_0}));
  bus_merger #(.BITSIZE_in1(42),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(42)) bus_mergerproxy_in28_ (.out1(sig_out_bus_mergerproxy_in28_),
    .in1({sig_in_bus_mergerproxy_in28_1,
      sig_in_bus_mergerproxy_in28_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerproxy_in314_ (.out1(sig_out_bus_mergerproxy_in314_),
    .in1({sig_in_bus_mergerproxy_in314_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerproxy_in319_ (.out1(sig_out_bus_mergerproxy_in319_),
    .in1({sig_in_bus_mergerproxy_in319_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(14)) bus_mergerproxy_in324_ (.out1(sig_out_bus_mergerproxy_in324_),
    .in1({sig_in_bus_mergerproxy_in324_0}));
  bus_merger #(.BITSIZE_in1(14),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) bus_mergerproxy_in39_ (.out1(sig_out_bus_mergerproxy_in39_),
    .in1({sig_in_bus_mergerproxy_in39_1,
      sig_in_bus_mergerproxy_in39_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD10_ (.out1(sig_out_bus_mergerproxy_sel_LOAD10_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD10_1,
      sig_in_bus_mergerproxy_sel_LOAD10_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD15_ (.out1(sig_out_bus_mergerproxy_sel_LOAD15_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD15_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD20_ (.out1(sig_out_bus_mergerproxy_sel_LOAD20_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD20_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_LOAD25_ (.out1(sig_out_bus_mergerproxy_sel_LOAD25_),
    .in1({sig_in_bus_mergerproxy_sel_LOAD25_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE11_ (.out1(sig_out_bus_mergerproxy_sel_STORE11_),
    .in1({sig_in_bus_mergerproxy_sel_STORE11_1,
      sig_in_bus_mergerproxy_sel_STORE11_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE16_ (.out1(sig_out_bus_mergerproxy_sel_STORE16_),
    .in1({sig_in_bus_mergerproxy_sel_STORE16_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE21_ (.out1(sig_out_bus_mergerproxy_sel_STORE21_),
    .in1({sig_in_bus_mergerproxy_sel_STORE21_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerproxy_sel_STORE26_ (.out1(sig_out_bus_mergerproxy_sel_STORE26_),
    .in1({sig_in_bus_mergerproxy_sel_STORE26_0}));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b0000000000000000000000000000000000000000000000000000000000000000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0111111)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10000)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100000)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b10000000)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(24),
    .value(24'b100000000000000000000000)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(53),
    .value(53'b10000000000000000000000000000000000000000000000000000)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(57),
    .value(57'b100000000000000000000000011111111111111110000000000000000)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b0011111111110000000000000000000000000000000000000000000000000000)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b101)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101001)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b10101000)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(14),
    .value(14'b10101000001000)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b10101000010101110000000011111111)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b1010111)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(31),
    .value(31'b1011101011111110000100000101010)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b110)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1100)) const_29 (.out1(out_const_29));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1100010010000000)) const_30 (.out1(out_const_30));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110011)) const_31 (.out1(out_const_31));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1101)) const_32 (.out1(out_const_32));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110101)) const_33 (.out1(out_const_33));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110111)) const_34 (.out1(out_const_34));
  constant_value #(.BITSIZE_out1(14),
    .value(14'b11011100000000)) const_35 (.out1(out_const_35));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b111)) const_36 (.out1(out_const_36));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b11100000)) const_37 (.out1(out_const_37));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11111)) const_38 (.out1(out_const_38));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111111)) const_39 (.out1(out_const_39));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0100)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(23),
    .value(23'b11111110100000001001000)) const_40 (.out1(out_const_40));
  constant_value #(.BITSIZE_out1(16),
    .value(16'b1111111011111111)) const_41 (.out1(out_const_41));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111011111111000000000000000000000000000000000000000000000000)) const_42 (.out1(out_const_42));
  constant_value #(.BITSIZE_out1(10),
    .value(10'b1111111101)) const_43 (.out1(out_const_43));
  constant_value #(.BITSIZE_out1(10),
    .value(10'b1111111111)) const_44 (.out1(out_const_44));
  constant_value #(.BITSIZE_out1(62),
    .value(62'b11111111110000000000000000000000000000000000000000000000000000)) const_45 (.out1(out_const_45));
  constant_value #(.BITSIZE_out1(11),
    .value(11'b11111111111)) const_46 (.out1(out_const_46));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b111111111110000000000000000000000000000000000000000000000000000)) const_47 (.out1(out_const_47));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111110001000000001111111111111111111100011111111111111111)) const_48 (.out1(out_const_48));
  constant_value #(.BITSIZE_out1(13),
    .value(13'b1111111111111)) const_49 (.out1(out_const_49));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111000000000000000000000001000000000000000000000000)) const_50 (.out1(out_const_50));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111110000000001)) const_51 (.out1(out_const_51));
  constant_value #(.BITSIZE_out1(32),
    .value(32'b11111111111111111111111111111111)) const_52 (.out1(out_const_52));
  constant_value #(.BITSIZE_out1(52),
    .value(52'b1111111111111111111111111111111111111111111111111111)) const_53 (.out1(out_const_53));
  constant_value #(.BITSIZE_out1(53),
    .value(53'b11111111111111111111111111111111111111111111111111111)) const_54 (.out1(out_const_54));
  constant_value #(.BITSIZE_out1(54),
    .value(54'b111111111111111111111111111111111111111111111111111111)) const_55 (.out1(out_const_55));
  constant_value #(.BITSIZE_out1(63),
    .value(63'b111111111111111111111111111111111111111111111111111111111111111)) const_56 (.out1(out_const_56));
  constant_value #(.BITSIZE_out1(64),
    .value(64'b1111111111111111111111111111111111111111111111111111111111111111)) const_57 (.out1(out_const_57));
  constant_value #(.BITSIZE_out1(8),
    .value(8'b01000000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01010)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110100)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0110110)) const_9 (.out1(out_const_9));
  IIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_I_1_I_32 (.out1(out_conv_out_const_0_I_1_I_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(32)) conv_out_const_16_8_32 (.out1(out_conv_out_const_16_8_32),
    .in1(out_const_16));
  UUdata_converter_FU #(.BITSIZE_in1(24),
    .BITSIZE_out1(32)) conv_out_const_17_24_32 (.out1(out_conv_out_const_17_24_32),
    .in1(out_const_17));
  UUdata_converter_FU #(.BITSIZE_in1(23),
    .BITSIZE_out1(32)) conv_out_const_40_23_32 (.out1(out_conv_out_const_40_23_32),
    .in1(out_const_40));
  UUdata_converter_FU #(.BITSIZE_in1(62),
    .BITSIZE_out1(64)) conv_out_const_45_62_64 (.out1(out_conv_out_const_45_62_64),
    .in1(out_const_45));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(7)) conv_out_const_6_8_7 (.out1(out_conv_out_const_6_8_7),
    .in1(out_const_6));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_i_assign_conn_obj_4_ASSIGN_SIGNED_FU_i_assign_0_I_1_32 (.out1(out_conv_out_i_assign_conn_obj_4_ASSIGN_SIGNED_FU_i_assign_0_I_1_32),
    .in1(out_i_assign_conn_obj_4_ASSIGN_SIGNED_FU_i_assign_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(64)) conv_out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_1_1_64 (.out1(out_conv_out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_1_1_64),
    .in1(out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_1));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(64)) conv_out_u_assign_conn_obj_5_ASSIGN_UNSIGNED_FU_u_assign_2_1_64 (.out1(out_conv_out_u_assign_conn_obj_5_ASSIGN_UNSIGNED_FU_u_assign_2_1_64),
    .in1(out_u_assign_conn_obj_5_ASSIGN_UNSIGNED_FU_u_assign_2));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_3_1_32 (.out1(out_conv_out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_3_1_32),
    .in1(out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_3));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_4_1_32 (.out1(out_conv_out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_4_1_32),
    .in1(out_u_assign_conn_obj_8_ASSIGN_UNSIGNED_FU_u_assign_4));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_main_33671_33689 (.out1(out_UUdata_converter_FU_7_i0_fu_main_33671_33689),
    .in1(out_reg_1_reg_1));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(8),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_main_33671_33690 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_179_i0_fu_main_33671_33690),
    .in1(out_reg_1_reg_1),
    .in2(out_const_16));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_main_33671_33691 (.out1(out_UUdata_converter_FU_8_i0_fu_main_33671_33691),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_179_i0_fu_main_33671_33690));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_main_33671_33744 (.out1(out_UUdata_converter_FU_14_i0_fu_main_33671_33744),
    .in1(out_reg_7_reg_7));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_main_33671_33747 (.out1(out_ui_bit_ior_concat_expr_FU_133_i0_fu_main_33671_33747),
    .in1(out_ui_lshift_expr_FU_32_0_32_154_i0_fu_main_33671_37882),
    .in2(out_ui_bit_and_expr_FU_8_0_8_130_i0_fu_main_33671_37886),
    .in3(out_const_27));
  read_cond_FU #(.BITSIZE_in1(1)) fu_main_33671_33748 (.out1(out_read_cond_FU_15_i0_fu_main_33671_33748),
    .in1(out_reg_9_reg_9));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_main_33671_33767 (.out1(out_UUdata_converter_FU_9_i0_fu_main_33671_33767),
    .in1(out_reg_0_reg_0));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(24),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_main_33671_33768 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_180_i0_fu_main_33671_33768),
    .in1(out_reg_0_reg_0),
    .in2(out_const_17));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_main_33671_33769 (.out1(out_UUdata_converter_FU_16_i0_fu_main_33671_33769),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_180_i0_fu_main_33671_33768));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_main_33671_33780 (.out1(out_UUdata_converter_FU_20_i0_fu_main_33671_33780),
    .in1(out_reg_2_reg_2));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_main_33671_33782 (.out1(out_ui_bit_ior_concat_expr_FU_133_i1_fu_main_33671_33782),
    .in1(out_ui_lshift_expr_FU_32_0_32_154_i1_fu_main_33671_37896),
    .in2(out_ui_bit_and_expr_FU_8_0_8_130_i1_fu_main_33671_37899),
    .in3(out_const_27));
  read_cond_FU #(.BITSIZE_in1(1)) fu_main_33671_33783 (.out1(out_read_cond_FU_21_i0_fu_main_33671_33783),
    .in1(out_ui_ne_expr_FU_32_32_32_170_i1_fu_main_33671_34776));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_main_33671_33794 (.out1(out_UUdata_converter_FU_10_i0_fu_main_33671_33794),
    .in1(out_reg_3_reg_3));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(23),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_main_33671_33795 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_181_i0_fu_main_33671_33795),
    .in1(out_reg_3_reg_3),
    .in2(out_const_40));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_main_33671_33796 (.out1(out_UUdata_converter_FU_17_i0_fu_main_33671_33796),
    .in1(out_ui_pointer_plus_expr_FU_32_0_32_181_i0_fu_main_33671_33795));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_main_33671_33808 (.out1(out_UUdata_converter_FU_24_i0_fu_main_33671_33808),
    .in1(out_reg_12_reg_12));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_main_33671_33810 (.out1(out_ui_bit_ior_concat_expr_FU_133_i2_fu_main_33671_33810),
    .in1(out_ui_lshift_expr_FU_32_0_32_154_i2_fu_main_33671_37908),
    .in2(out_ui_bit_and_expr_FU_8_0_8_130_i2_fu_main_33671_37911),
    .in3(out_const_27));
  read_cond_FU #(.BITSIZE_in1(1)) fu_main_33671_33811 (.out1(out_read_cond_FU_25_i0_fu_main_33671_33811),
    .in1(out_ui_ne_expr_FU_32_32_32_170_i2_fu_main_33671_34778));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_main_33671_33824 (.out1(out_UUdata_converter_FU_103_i0_fu_main_33671_33824),
    .in1(out_reg_20_reg_20));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(18)) fu_main_33671_33825 (.out1(out_IUdata_converter_FU_30_i0_fu_main_33671_33825),
    .in1(out_reg_25_reg_25));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_main_33671_33827 (.out1(out_UUdata_converter_FU_104_i0_fu_main_33671_33827),
    .in1(out_reg_21_reg_21));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_main_33671_33831 (.out1(out_plus_expr_FU_32_0_32_116_i0_fu_main_33671_33831),
    .in1(out_reg_25_reg_25),
    .in2(out_const_3));
  read_cond_FU #(.BITSIZE_in1(1)) fu_main_33671_33832 (.out1(out_read_cond_FU_97_i0_fu_main_33671_33832),
    .in1(out_reg_28_reg_28));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(13),
    .BITSIZE_in3(4),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(13)) fu_main_33671_33878 (.out1(out_ui_bit_ior_concat_expr_FU_134_i0_fu_main_33671_33878),
    .in1(out_ui_lshift_expr_FU_32_0_32_155_i0_fu_main_33671_37922),
    .in2(out_ui_bit_and_expr_FU_16_0_16_118_i0_fu_main_33671_37926),
    .in3(out_const_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_main_33671_33881 (.out1(out_UUdata_converter_FU_108_i0_fu_main_33671_33881),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_182_i0_fu_main_33671_33884));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_main_33671_33884 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_182_i0_fu_main_33671_33884),
    .in1(out_reg_0_reg_0),
    .in2(out_ui_bit_ior_concat_expr_FU_135_i0_fu_main_33671_33887));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(13),
    .BITSIZE_in3(4),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(13)) fu_main_33671_33887 (.out1(out_ui_bit_ior_concat_expr_FU_135_i0_fu_main_33671_33887),
    .in1(out_ui_lshift_expr_FU_32_0_32_157_i0_fu_main_33671_37972),
    .in2(out_ui_lshift_expr_FU_16_0_16_152_i0_fu_main_33671_38010),
    .in3(out_const_32));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(21)) fu_main_33671_33924 (.out1(out_UUdata_converter_FU_112_i0_fu_main_33671_33924),
    .in1(out_reg_8_reg_8));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(3)) fu_main_33671_33931 (.out1(out_ui_bit_ior_concat_expr_FU_133_i3_fu_main_33671_33931),
    .in1(out_ui_lshift_expr_FU_32_0_32_154_i3_fu_main_33671_37987),
    .in2(out_ui_bit_and_expr_FU_8_0_8_130_i3_fu_main_33671_37990),
    .in3(out_const_27));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_in3(3),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(5)) fu_main_33671_33952 (.out1(out_ui_bit_ior_concat_expr_FU_136_i0_fu_main_33671_33952),
    .in1(out_ui_lshift_expr_FU_32_0_32_156_i0_fu_main_33671_37938),
    .in2(out_ui_bit_and_expr_FU_8_0_8_131_i0_fu_main_33671_37942),
    .in3(out_const_20));
  read_cond_FU #(.BITSIZE_in1(1)) fu_main_33671_33962 (.out1(out_read_cond_FU_98_i0_fu_main_33671_33962),
    .in1(out_ui_ne_expr_FU_32_32_32_170_i3_fu_main_33671_34782));
  ui_lshift_expr_FU #(.BITSIZE_in1(18),
    .BITSIZE_in2(2),
    .BITSIZE_out1(21),
    .PRECISION(32)) fu_main_33671_34715 (.out1(out_ui_lshift_expr_FU_32_0_32_153_i0_fu_main_33671_34715),
    .in1(out_IUdata_converter_FU_30_i0_fu_main_33671_33825),
    .in2(out_const_27));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu_main_33671_34718 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_182_i1_fu_main_33671_34718),
    .in1(out_reg_26_reg_26),
    .in2(out_ui_lshift_expr_FU_32_0_32_153_i0_fu_main_33671_34715));
  ui_lshift_expr_FU #(.BITSIZE_in1(18),
    .BITSIZE_in2(2),
    .BITSIZE_out1(21),
    .PRECISION(32)) fu_main_33671_34722 (.out1(out_ui_lshift_expr_FU_32_0_32_153_i1_fu_main_33671_34722),
    .in1(out_IUdata_converter_FU_30_i0_fu_main_33671_33825),
    .in2(out_const_27));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu_main_33671_34725 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_182_i2_fu_main_33671_34725),
    .in1(out_reg_27_reg_27),
    .in2(out_ui_lshift_expr_FU_32_0_32_153_i1_fu_main_33671_34722));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(32),
    .BITSIZE_out1(21),
    .LSB_PARAMETER(0)) fu_main_33671_34733 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_182_i3_fu_main_33671_34733),
    .in1(out_reg_15_reg_15),
    .in2(out_reg_14_reg_14));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_main_33671_34774 (.out1(out_ui_ne_expr_FU_32_32_32_170_i0_fu_main_33671_34774),
    .in1(out_ui_bit_ior_concat_expr_FU_133_i0_fu_main_33671_33747),
    .in2(out_reg_5_reg_5));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_main_33671_34776 (.out1(out_ui_ne_expr_FU_32_32_32_170_i1_fu_main_33671_34776),
    .in1(out_ui_bit_ior_concat_expr_FU_133_i1_fu_main_33671_33782),
    .in2(out_reg_10_reg_10));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_main_33671_34778 (.out1(out_ui_ne_expr_FU_32_32_32_170_i2_fu_main_33671_34778),
    .in1(out_ui_bit_ior_concat_expr_FU_133_i2_fu_main_33671_33810),
    .in2(out_reg_11_reg_11));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(1)) fu_main_33671_34780 (.out1(out_ne_expr_FU_32_0_32_115_i0_fu_main_33671_34780),
    .in1(out_plus_expr_FU_32_0_32_116_i0_fu_main_33671_33831),
    .in2(out_const_4));
  ui_ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_main_33671_34782 (.out1(out_ui_ne_expr_FU_32_32_32_170_i3_fu_main_33671_34782),
    .in1(out_reg_5_reg_5),
    .in2(out_reg_21_reg_21));
  ui_ne_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(10),
    .BITSIZE_out1(1)) fu_main_33671_34784 (.out1(out_ui_ne_expr_FU_32_0_32_168_i0_fu_main_33671_34784),
    .in1(out_ui_rshift_expr_FU_32_0_32_186_i1_fu_main_33671_37958),
    .in2(out_const_43));
  ui_ne_expr_FU #(.BITSIZE_in1(19),
    .BITSIZE_in2(10),
    .BITSIZE_out1(1)) fu_main_33671_34786 (.out1(out_ui_ne_expr_FU_32_0_32_169_i0_fu_main_33671_34786),
    .in1(out_ui_rshift_expr_FU_32_0_32_184_i2_fu_main_33671_38002),
    .in2(out_const_43));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_main_33671_37874 (.out1(out_ui_rshift_expr_FU_32_0_32_183_i0_fu_main_33671_37874),
    .in1(out_reg_7_reg_7),
    .in2(out_const_27));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_out1(29)) fu_main_33671_37879 (.out1(out_ui_plus_expr_FU_32_0_32_174_i0_fu_main_33671_37879),
    .in1(out_ui_rshift_expr_FU_32_0_32_183_i0_fu_main_33671_37874),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_main_33671_37882 (.out1(out_ui_lshift_expr_FU_32_0_32_154_i0_fu_main_33671_37882),
    .in1(out_ui_plus_expr_FU_32_0_32_174_i0_fu_main_33671_37879),
    .in2(out_const_27));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_main_33671_37886 (.out1(out_ui_bit_and_expr_FU_8_0_8_130_i0_fu_main_33671_37886),
    .in1(out_reg_7_reg_7),
    .in2(out_const_36));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_main_33671_37891 (.out1(out_ui_rshift_expr_FU_32_0_32_183_i1_fu_main_33671_37891),
    .in1(out_reg_2_reg_2),
    .in2(out_const_27));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_out1(29)) fu_main_33671_37893 (.out1(out_ui_plus_expr_FU_32_0_32_174_i1_fu_main_33671_37893),
    .in1(out_ui_rshift_expr_FU_32_0_32_183_i1_fu_main_33671_37891),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_main_33671_37896 (.out1(out_ui_lshift_expr_FU_32_0_32_154_i1_fu_main_33671_37896),
    .in1(out_ui_plus_expr_FU_32_0_32_174_i1_fu_main_33671_37893),
    .in2(out_const_27));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_main_33671_37899 (.out1(out_ui_bit_and_expr_FU_8_0_8_130_i1_fu_main_33671_37899),
    .in1(out_reg_2_reg_2),
    .in2(out_const_36));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_main_33671_37903 (.out1(out_ui_rshift_expr_FU_32_0_32_183_i2_fu_main_33671_37903),
    .in1(out_reg_12_reg_12),
    .in2(out_const_27));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_out1(29)) fu_main_33671_37905 (.out1(out_ui_plus_expr_FU_32_0_32_174_i2_fu_main_33671_37905),
    .in1(out_ui_rshift_expr_FU_32_0_32_183_i2_fu_main_33671_37903),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_main_33671_37908 (.out1(out_ui_lshift_expr_FU_32_0_32_154_i2_fu_main_33671_37908),
    .in1(out_ui_plus_expr_FU_32_0_32_174_i2_fu_main_33671_37905),
    .in2(out_const_27));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_main_33671_37911 (.out1(out_ui_bit_and_expr_FU_8_0_8_130_i2_fu_main_33671_37911),
    .in1(out_reg_12_reg_12),
    .in2(out_const_36));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(19),
    .PRECISION(32)) fu_main_33671_37916 (.out1(out_ui_rshift_expr_FU_32_0_32_184_i0_fu_main_33671_37916),
    .in1(out_reg_20_reg_20),
    .in2(out_const_32));
  ui_plus_expr_FU #(.BITSIZE_in1(19),
    .BITSIZE_in2(1),
    .BITSIZE_out1(19)) fu_main_33671_37919 (.out1(out_ui_plus_expr_FU_32_0_32_174_i3_fu_main_33671_37919),
    .in1(out_ui_rshift_expr_FU_32_0_32_184_i0_fu_main_33671_37916),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(19),
    .BITSIZE_in2(4),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_main_33671_37922 (.out1(out_ui_lshift_expr_FU_32_0_32_155_i0_fu_main_33671_37922),
    .in1(out_ui_plus_expr_FU_32_0_32_174_i3_fu_main_33671_37919),
    .in2(out_const_32));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(13),
    .BITSIZE_out1(13)) fu_main_33671_37926 (.out1(out_ui_bit_and_expr_FU_16_0_16_118_i0_fu_main_33671_37926),
    .in1(out_reg_20_reg_20),
    .in2(out_const_49));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(27),
    .PRECISION(32)) fu_main_33671_37932 (.out1(out_ui_rshift_expr_FU_32_0_32_185_i0_fu_main_33671_37932),
    .in1(out_reg_21_reg_21),
    .in2(out_const_20));
  ui_plus_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(1),
    .BITSIZE_out1(27)) fu_main_33671_37935 (.out1(out_ui_plus_expr_FU_32_0_32_174_i4_fu_main_33671_37935),
    .in1(out_ui_rshift_expr_FU_32_0_32_185_i0_fu_main_33671_37932),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(27),
    .BITSIZE_in2(3),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_main_33671_37938 (.out1(out_ui_lshift_expr_FU_32_0_32_156_i0_fu_main_33671_37938),
    .in1(out_ui_plus_expr_FU_32_0_32_174_i4_fu_main_33671_37935),
    .in2(out_const_20));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(5)) fu_main_33671_37942 (.out1(out_ui_bit_and_expr_FU_8_0_8_131_i0_fu_main_33671_37942),
    .in1(out_reg_21_reg_21),
    .in2(out_const_38));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_main_33671_37947 (.out1(out_ui_rshift_expr_FU_32_0_32_186_i0_fu_main_33671_37947),
    .in1(out_reg_14_reg_14),
    .in2(out_const_27));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(1),
    .BITSIZE_out1(29)) fu_main_33671_37952 (.out1(out_ui_plus_expr_FU_32_0_32_175_i0_fu_main_33671_37952),
    .in1(out_ui_rshift_expr_FU_32_0_32_186_i0_fu_main_33671_37947),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_main_33671_37955 (.out1(out_ui_lshift_expr_FU_32_0_32_153_i2_fu_main_33671_37955),
    .in1(out_ui_plus_expr_FU_32_0_32_175_i0_fu_main_33671_37952),
    .in2(out_const_27));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_main_33671_37958 (.out1(out_ui_rshift_expr_FU_32_0_32_186_i1_fu_main_33671_37958),
    .in1(out_ui_lshift_expr_FU_32_0_32_153_i2_fu_main_33671_37955),
    .in2(out_const_27));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(19),
    .PRECISION(32)) fu_main_33671_37963 (.out1(out_ui_rshift_expr_FU_32_0_32_187_i0_fu_main_33671_37963),
    .in1(out_reg_13_reg_13),
    .in2(out_const_32));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(19),
    .PRECISION(32)) fu_main_33671_37966 (.out1(out_ui_rshift_expr_FU_32_0_32_187_i1_fu_main_33671_37966),
    .in1(out_reg_14_reg_14),
    .in2(out_const_32));
  ui_plus_expr_FU #(.BITSIZE_in1(19),
    .BITSIZE_in2(19),
    .BITSIZE_out1(19)) fu_main_33671_37969 (.out1(out_ui_plus_expr_FU_32_32_32_177_i0_fu_main_33671_37969),
    .in1(out_reg_18_reg_18),
    .in2(out_ui_rshift_expr_FU_32_0_32_187_i1_fu_main_33671_37966));
  ui_lshift_expr_FU #(.BITSIZE_in1(19),
    .BITSIZE_in2(4),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_main_33671_37972 (.out1(out_ui_lshift_expr_FU_32_0_32_157_i0_fu_main_33671_37972),
    .in1(out_ui_plus_expr_FU_32_32_32_177_i0_fu_main_33671_37969),
    .in2(out_const_32));
  ui_bit_and_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(10),
    .BITSIZE_out1(10)) fu_main_33671_37976 (.out1(out_ui_bit_and_expr_FU_16_0_16_119_i0_fu_main_33671_37976),
    .in1(out_ui_rshift_expr_FU_32_0_32_186_i2_fu_main_33671_38005),
    .in2(out_const_44));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(29),
    .PRECISION(32)) fu_main_33671_37981 (.out1(out_ui_rshift_expr_FU_32_0_32_183_i3_fu_main_33671_37981),
    .in1(out_reg_8_reg_8),
    .in2(out_const_27));
  ui_plus_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(10),
    .BITSIZE_out1(29)) fu_main_33671_37984 (.out1(out_ui_plus_expr_FU_32_0_32_176_i0_fu_main_33671_37984),
    .in1(out_ui_rshift_expr_FU_32_0_32_183_i3_fu_main_33671_37981),
    .in2(out_const_43));
  ui_lshift_expr_FU #(.BITSIZE_in1(29),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_main_33671_37987 (.out1(out_ui_lshift_expr_FU_32_0_32_154_i3_fu_main_33671_37987),
    .in1(out_ui_plus_expr_FU_32_0_32_176_i0_fu_main_33671_37984),
    .in2(out_const_27));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_main_33671_37990 (.out1(out_ui_bit_and_expr_FU_8_0_8_130_i3_fu_main_33671_37990),
    .in1(out_reg_8_reg_8),
    .in2(out_const_36));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(19),
    .PRECISION(32)) fu_main_33671_37994 (.out1(out_ui_rshift_expr_FU_32_0_32_184_i1_fu_main_33671_37994),
    .in1(out_reg_13_reg_13),
    .in2(out_const_32));
  ui_plus_expr_FU #(.BITSIZE_in1(19),
    .BITSIZE_in2(1),
    .BITSIZE_out1(19)) fu_main_33671_37996 (.out1(out_ui_plus_expr_FU_32_0_32_174_i5_fu_main_33671_37996),
    .in1(out_ui_rshift_expr_FU_32_0_32_184_i1_fu_main_33671_37994),
    .in2(out_const_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(19),
    .BITSIZE_in2(4),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_main_33671_37999 (.out1(out_ui_lshift_expr_FU_32_0_32_155_i1_fu_main_33671_37999),
    .in1(out_ui_plus_expr_FU_32_0_32_174_i5_fu_main_33671_37996),
    .in2(out_const_32));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(19),
    .PRECISION(32)) fu_main_33671_38002 (.out1(out_ui_rshift_expr_FU_32_0_32_184_i2_fu_main_33671_38002),
    .in1(out_ui_lshift_expr_FU_32_0_32_155_i1_fu_main_33671_37999),
    .in2(out_const_32));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(10),
    .PRECISION(32)) fu_main_33671_38005 (.out1(out_ui_rshift_expr_FU_32_0_32_186_i2_fu_main_33671_38005),
    .in1(out_reg_14_reg_14),
    .in2(out_const_27));
  ui_lshift_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(2),
    .BITSIZE_out1(13),
    .PRECISION(32)) fu_main_33671_38010 (.out1(out_ui_lshift_expr_FU_16_0_16_152_i0_fu_main_33671_38010),
    .in1(out_ui_bit_and_expr_FU_16_0_16_119_i0_fu_main_33671_37976),
    .in2(out_const_27));
  multi_read_cond_FU #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) fu_main_33671_42333 (.out1(out_multi_read_cond_FU_105_i0_fu_main_33671_42333),
    .in1({out_reg_24_reg_24,
      out_reg_23_reg_23}));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu_main_33671_42339 (.out1(out_lut_expr_FU_109_i0_fu_main_33671_42339),
    .in1(out_const_12),
    .in2(out_ui_ne_expr_FU_32_0_32_168_i0_fu_main_33671_34784),
    .in3(out_reg_17_reg_17),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(64),
    .BITSIZE_out1(52)) fu_main_33671_42342 (.out1(out_ui_bit_and_expr_FU_0_64_64_117_i0_fu_main_33671_42342),
    .in1(out_const_53),
    .in2(out_BMEMORY_CTRLN_114_i0_BMEMORY_CTRLN_114_i0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu_main_33671_42347 (.out1(out_ui_rshift_expr_FU_64_0_64_188_i0_fu_main_33671_42347),
    .in1(out_BMEMORY_CTRLN_114_i0_BMEMORY_CTRLN_114_i0),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu_main_33671_42350 (.out1(out_ui_bit_and_expr_FU_16_0_16_120_i0_fu_main_33671_42350),
    .in1(out_ui_rshift_expr_FU_64_0_64_188_i0_fu_main_33671_42347),
    .in2(out_const_46));
  UUconvert_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu_main_33671_42353 (.out1(out_UUconvert_expr_FU_31_i0_fu_main_33671_42353),
    .in1(out_ui_bit_and_expr_FU_16_0_16_120_i0_fu_main_33671_42350));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(64),
    .BITSIZE_out1(52)) fu_main_33671_42358 (.out1(out_ui_bit_and_expr_FU_0_64_64_117_i1_fu_main_33671_42358),
    .in1(out_const_53),
    .in2(out_BMEMORY_CTRLN_114_i1_BMEMORY_CTRLN_114_i0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu_main_33671_42363 (.out1(out_ui_rshift_expr_FU_64_0_64_188_i1_fu_main_33671_42363),
    .in1(out_BMEMORY_CTRLN_114_i1_BMEMORY_CTRLN_114_i0),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu_main_33671_42366 (.out1(out_ui_bit_and_expr_FU_16_0_16_120_i1_fu_main_33671_42366),
    .in1(out_ui_rshift_expr_FU_64_0_64_188_i1_fu_main_33671_42363),
    .in2(out_const_46));
  UUconvert_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu_main_33671_42369 (.out1(out_UUconvert_expr_FU_33_i0_fu_main_33671_42369),
    .in1(out_ui_bit_and_expr_FU_16_0_16_120_i1_fu_main_33671_42366));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_main_33671_42374 (.out1(out_ui_extract_bit_expr_FU_35_i0_fu_main_33671_42374),
    .in1(out_BMEMORY_CTRLN_114_i0_BMEMORY_CTRLN_114_i0),
    .in2(out_const_39));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_main_33671_42377 (.out1(out_ui_extract_bit_expr_FU_36_i0_fu_main_33671_42377),
    .in1(out_BMEMORY_CTRLN_114_i1_BMEMORY_CTRLN_114_i0),
    .in2(out_const_39));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu_main_33671_42380 (.out1(out_lut_expr_FU_37_i0_fu_main_33671_42380),
    .in1(out_const_28),
    .in2(out_ui_extract_bit_expr_FU_35_i0_fu_main_33671_42374),
    .in3(out_ui_extract_bit_expr_FU_36_i0_fu_main_33671_42377),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_33671_42383 (.out1(out_UUdata_converter_FU_38_i0_fu_main_33671_42383),
    .in1(out_lut_expr_FU_37_i0_fu_main_33671_42380));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu_main_33671_42386 (.out1(out_ui_lshift_expr_FU_64_0_64_158_i0_fu_main_33671_42386),
    .in1(out_UUdata_converter_FU_38_i0_fu_main_33671_42383),
    .in2(out_const_10));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(32),
    .BITSIZE_out1(11)) fu_main_33671_42389 (.out1(out_ui_bit_and_expr_FU_16_0_16_121_i0_fu_main_33671_42389),
    .in1(out_ui_bit_and_expr_FU_16_0_16_120_i0_fu_main_33671_42350),
    .in2(out_const_52));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu_main_33671_42392 (.out1(out_ui_eq_expr_FU_16_0_16_148_i0_fu_main_33671_42392),
    .in1(out_ui_bit_and_expr_FU_16_0_16_121_i0_fu_main_33671_42389),
    .in2(out_const_46));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_33671_42395 (.out1(out_ui_eq_expr_FU_16_0_16_149_i0_fu_main_33671_42395),
    .in1(out_UUconvert_expr_FU_31_i0_fu_main_33671_42353),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_33671_42398 (.out1(out_ui_eq_expr_FU_64_0_64_150_i0_fu_main_33671_42398),
    .in1(out_ui_bit_and_expr_FU_0_64_64_117_i0_fu_main_33671_42342),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_33671_42401 (.out1(out_ui_ne_expr_FU_64_0_64_171_i0_fu_main_33671_42401),
    .in1(out_ui_bit_and_expr_FU_0_64_64_117_i0_fu_main_33671_42342),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_33671_42404 (.out1(out_ui_ne_expr_FU_64_0_64_171_i1_fu_main_33671_42404),
    .in1(out_ui_bit_and_expr_FU_0_64_64_117_i0_fu_main_33671_42342),
    .in2(out_const_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(32),
    .BITSIZE_out1(11)) fu_main_33671_42407 (.out1(out_ui_bit_and_expr_FU_16_0_16_121_i1_fu_main_33671_42407),
    .in1(out_ui_bit_and_expr_FU_16_0_16_120_i1_fu_main_33671_42366),
    .in2(out_const_52));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu_main_33671_42410 (.out1(out_ui_eq_expr_FU_16_0_16_148_i1_fu_main_33671_42410),
    .in1(out_ui_bit_and_expr_FU_16_0_16_121_i1_fu_main_33671_42407),
    .in2(out_const_46));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_33671_42413 (.out1(out_ui_eq_expr_FU_16_0_16_149_i1_fu_main_33671_42413),
    .in1(out_UUconvert_expr_FU_33_i0_fu_main_33671_42369),
    .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_33671_42416 (.out1(out_ui_eq_expr_FU_64_0_64_150_i1_fu_main_33671_42416),
    .in1(out_ui_bit_and_expr_FU_0_64_64_117_i1_fu_main_33671_42358),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_33671_42419 (.out1(out_ui_ne_expr_FU_64_0_64_171_i2_fu_main_33671_42419),
    .in1(out_ui_bit_and_expr_FU_0_64_64_117_i1_fu_main_33671_42358),
    .in2(out_const_0));
  ui_ne_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_33671_42422 (.out1(out_ui_ne_expr_FU_64_0_64_171_i3_fu_main_33671_42422),
    .in1(out_ui_bit_and_expr_FU_0_64_64_117_i1_fu_main_33671_42358),
    .in2(out_const_0));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu_main_33671_42425 (.out1(out_ui_bit_ior_expr_FU_0_64_64_138_i0_fu_main_33671_42425),
    .in1(out_const_18),
    .in2(out_ui_bit_and_expr_FU_0_64_64_117_i0_fu_main_33671_42342));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(52),
    .BITSIZE_out1(53)) fu_main_33671_42428 (.out1(out_ui_bit_ior_expr_FU_0_64_64_138_i1_fu_main_33671_42428),
    .in1(out_const_18),
    .in2(out_ui_bit_and_expr_FU_0_64_64_117_i1_fu_main_33671_42358));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu_main_33671_42431 (.out1(out_ui_rshift_expr_FU_64_0_64_189_i0_fu_main_33671_42431),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_138_i0_fu_main_33671_42425),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_main_33671_42436 (.out1(out_ui_bit_and_expr_FU_32_0_32_124_i0_fu_main_33671_42436),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_138_i0_fu_main_33671_42425),
    .in2(out_const_52));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu_main_33671_42441 (.out1(out_ui_rshift_expr_FU_64_0_64_189_i1_fu_main_33671_42441),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_138_i1_fu_main_33671_42428),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_main_33671_42446 (.out1(out_ui_bit_and_expr_FU_32_0_32_124_i1_fu_main_33671_42446),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_138_i1_fu_main_33671_42428),
    .in2(out_const_52));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(63),
    .BITSIZE_out1(64)) fu_main_33671_42451 (.out1(out_ui_bit_ior_expr_FU_64_0_64_142_i0_fu_main_33671_42451),
    .in1(out_ui_lshift_expr_FU_64_0_64_158_i0_fu_main_33671_42386),
    .in2(out_const_47));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu_main_33671_42454 (.out1(out_lut_expr_FU_43_i0_fu_main_33671_42454),
    .in1(out_const_16),
    .in2(out_ui_eq_expr_FU_16_0_16_148_i0_fu_main_33671_42392),
    .in3(out_ui_eq_expr_FU_64_0_64_150_i0_fu_main_33671_42398),
    .in4(out_ui_ne_expr_FU_64_0_64_171_i1_fu_main_33671_42404),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_main_33671_42457 (.out1(out_lut_expr_FU_44_i0_fu_main_33671_42457),
    .in1(out_const_13),
    .in2(out_ui_eq_expr_FU_16_0_16_148_i0_fu_main_33671_42392),
    .in3(out_ui_eq_expr_FU_64_0_64_150_i0_fu_main_33671_42398),
    .in4(out_ui_ne_expr_FU_64_0_64_171_i1_fu_main_33671_42404),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(14),
    .BITSIZE_out1(1)) fu_main_33671_42460 (.out1(out_lut_expr_FU_45_i0_fu_main_33671_42460),
    .in1(out_const_23),
    .in2(out_ui_eq_expr_FU_16_0_16_148_i0_fu_main_33671_42392),
    .in3(out_ui_eq_expr_FU_64_0_64_150_i0_fu_main_33671_42398),
    .in4(out_ui_ne_expr_FU_64_0_64_171_i1_fu_main_33671_42404),
    .in5(out_ui_ne_expr_FU_64_0_64_171_i0_fu_main_33671_42401),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu_main_33671_42463 (.out1(out_ui_cond_expr_FU_8_8_8_8_147_i0_fu_main_33671_42463),
    .in1(out_lut_expr_FU_44_i0_fu_main_33671_42457),
    .in2(out_const_0),
    .in3(out_const_27));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu_main_33671_42466 (.out1(out_ui_cond_expr_FU_8_8_8_8_147_i1_fu_main_33671_42466),
    .in1(out_lut_expr_FU_45_i0_fu_main_33671_42460),
    .in2(out_ui_cond_expr_FU_8_8_8_8_147_i0_fu_main_33671_42463),
    .in3(out_const_0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(2)) fu_main_33671_42469 (.out1(out_ui_cond_expr_FU_8_8_8_8_147_i2_fu_main_33671_42469),
    .in1(out_lut_expr_FU_43_i0_fu_main_33671_42454),
    .in2(out_const_27),
    .in3(out_ui_cond_expr_FU_8_8_8_8_147_i1_fu_main_33671_42466));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_main_33671_42472 (.out1(out_lut_expr_FU_46_i0_fu_main_33671_42472),
    .in1(out_const_13),
    .in2(out_ui_eq_expr_FU_16_0_16_148_i0_fu_main_33671_42392),
    .in3(out_ui_eq_expr_FU_64_0_64_150_i0_fu_main_33671_42398),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_33671_42475 (.out1(out_UUdata_converter_FU_47_i0_fu_main_33671_42475),
    .in1(out_lut_expr_FU_46_i0_fu_main_33671_42472));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_main_33671_42478 (.out1(out_ui_lshift_expr_FU_8_0_8_166_i0_fu_main_33671_42478),
    .in1(out_UUdata_converter_FU_47_i0_fu_main_33671_42475),
    .in2(out_const_11));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_33671_42481 (.out1(out_lut_expr_FU_48_i0_fu_main_33671_42481),
    .in1(out_const_11),
    .in2(out_ui_eq_expr_FU_16_0_16_148_i0_fu_main_33671_42392),
    .in3(out_ui_eq_expr_FU_16_0_16_149_i0_fu_main_33671_42395),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_33671_42484 (.out1(out_UUdata_converter_FU_49_i0_fu_main_33671_42484),
    .in1(out_lut_expr_FU_48_i0_fu_main_33671_42481));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_main_33671_42487 (.out1(out_ui_bit_ior_expr_FU_8_8_8_144_i0_fu_main_33671_42487),
    .in1(out_ui_cond_expr_FU_8_8_8_8_147_i2_fu_main_33671_42469),
    .in2(out_ui_lshift_expr_FU_8_0_8_166_i0_fu_main_33671_42478));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2)) fu_main_33671_42490 (.out1(out_ui_bit_ior_expr_FU_8_8_8_144_i1_fu_main_33671_42490),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_144_i0_fu_main_33671_42487),
    .in2(out_UUdata_converter_FU_49_i0_fu_main_33671_42484));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_main_33671_42493 (.out1(out_ui_rshift_expr_FU_8_0_8_193_i0_fu_main_33671_42493),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_144_i1_fu_main_33671_42490),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu_main_33671_42496 (.out1(out_ui_bit_and_expr_FU_1_1_1_123_i0_fu_main_33671_42496),
    .in1(out_ui_rshift_expr_FU_8_0_8_193_i0_fu_main_33671_42493),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_144_i1_fu_main_33671_42490));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(32),
    .BITSIZE_in3(11),
    .BITSIZE_out1(13)) fu_main_33671_42499 (.out1(out_ui_ternary_plus_expr_FU_16_0_16_16_195_i0_fu_main_33671_42499),
    .in1(out_ASSIGN_UNSIGNED_FU_32_i0_fu_main_33671_42828),
    .in2(out_const_51),
    .in3(out_ASSIGN_UNSIGNED_FU_34_i0_fu_main_33671_42830));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_main_33671_42502 (.out1(out_lut_expr_FU_50_i0_fu_main_33671_42502),
    .in1(out_const_30),
    .in2(out_ui_eq_expr_FU_64_0_64_150_i1_fu_main_33671_42416),
    .in3(out_ui_eq_expr_FU_16_0_16_148_i1_fu_main_33671_42410),
    .in4(out_ui_ne_expr_FU_64_0_64_171_i3_fu_main_33671_42422),
    .in5(out_ui_ne_expr_FU_64_0_64_171_i2_fu_main_33671_42419),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_in3(1),
    .BITSIZE_out1(2)) fu_main_33671_42505 (.out1(out_ui_cond_expr_FU_8_8_8_8_147_i3_fu_main_33671_42505),
    .in1(out_lut_expr_FU_50_i0_fu_main_33671_42502),
    .in2(out_const_27),
    .in3(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_main_33671_42508 (.out1(out_lut_expr_FU_51_i0_fu_main_33671_42508),
    .in1(out_const_13),
    .in2(out_ui_eq_expr_FU_64_0_64_150_i1_fu_main_33671_42416),
    .in3(out_ui_eq_expr_FU_16_0_16_148_i1_fu_main_33671_42410),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_33671_42511 (.out1(out_UUdata_converter_FU_52_i0_fu_main_33671_42511),
    .in1(out_lut_expr_FU_51_i0_fu_main_33671_42508));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_main_33671_42514 (.out1(out_ui_lshift_expr_FU_8_0_8_166_i1_fu_main_33671_42514),
    .in1(out_UUdata_converter_FU_52_i0_fu_main_33671_42511),
    .in2(out_const_11));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_33671_42517 (.out1(out_lut_expr_FU_53_i0_fu_main_33671_42517),
    .in1(out_const_11),
    .in2(out_ui_eq_expr_FU_16_0_16_148_i1_fu_main_33671_42410),
    .in3(out_ui_eq_expr_FU_16_0_16_149_i1_fu_main_33671_42413),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_33671_42520 (.out1(out_UUdata_converter_FU_54_i0_fu_main_33671_42520),
    .in1(out_lut_expr_FU_53_i0_fu_main_33671_42517));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_main_33671_42523 (.out1(out_ui_bit_ior_expr_FU_8_8_8_144_i2_fu_main_33671_42523),
    .in1(out_ui_cond_expr_FU_8_8_8_8_147_i3_fu_main_33671_42505),
    .in2(out_ui_lshift_expr_FU_8_0_8_166_i1_fu_main_33671_42514));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2)) fu_main_33671_42526 (.out1(out_ui_bit_ior_expr_FU_8_8_8_144_i3_fu_main_33671_42526),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_144_i2_fu_main_33671_42523),
    .in2(out_UUdata_converter_FU_54_i0_fu_main_33671_42520));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_main_33671_42529 (.out1(out_ui_rshift_expr_FU_8_0_8_193_i1_fu_main_33671_42529),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_144_i3_fu_main_33671_42526),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu_main_33671_42532 (.out1(out_ui_bit_and_expr_FU_1_1_1_123_i1_fu_main_33671_42532),
    .in1(out_ui_rshift_expr_FU_8_0_8_193_i1_fu_main_33671_42529),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_144_i3_fu_main_33671_42526));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu_main_33671_42535 (.out1(out_ui_bit_and_expr_FU_1_1_1_123_i2_fu_main_33671_42535),
    .in1(out_ui_bit_ior_expr_FU_8_8_8_144_i3_fu_main_33671_42526),
    .in2(out_ui_bit_ior_expr_FU_8_8_8_144_i1_fu_main_33671_42490));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(64),
    .PIPE_PARAMETER(0)) fu_main_33671_42538 (.out1(out_ui_mult_expr_FU_32_32_32_0_167_i0_fu_main_33671_42538),
    .clock(clock),
    .in1(out_reg_33_reg_33),
    .in2(out_reg_31_reg_31));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_main_33671_42541 (.out1(out_ui_bit_and_expr_FU_32_0_32_124_i2_fu_main_33671_42541),
    .in1(out_ui_mult_expr_FU_32_32_32_0_167_i0_fu_main_33671_42538),
    .in2(out_const_52));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu_main_33671_42544 (.out1(out_ui_rshift_expr_FU_64_0_64_189_i2_fu_main_33671_42544),
    .in1(out_ui_mult_expr_FU_32_32_32_0_167_i0_fu_main_33671_42538),
    .in2(out_const_5));
  ui_mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(21),
    .BITSIZE_out1(53),
    .PIPE_PARAMETER(0)) fu_main_33671_42547 (.out1(out_ui_mult_expr_FU_32_32_32_0_167_i1_fu_main_33671_42547),
    .clock(clock),
    .in1(out_reg_56_reg_56),
    .in2(out_reg_30_reg_30));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(53),
    .BITSIZE_out1(54)) fu_main_33671_42550 (.out1(out_ui_plus_expr_FU_64_64_64_178_i0_fu_main_33671_42550),
    .in1(out_reg_57_reg_57),
    .in2(out_reg_58_reg_58));
  ui_bit_and_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_main_33671_42553 (.out1(out_ui_bit_and_expr_FU_32_0_32_124_i3_fu_main_33671_42553),
    .in1(out_ui_plus_expr_FU_64_64_64_178_i0_fu_main_33671_42550),
    .in2(out_const_52));
  ui_rshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(7),
    .BITSIZE_out1(22),
    .PRECISION(64)) fu_main_33671_42556 (.out1(out_ui_rshift_expr_FU_64_0_64_189_i3_fu_main_33671_42556),
    .in1(out_ui_plus_expr_FU_64_64_64_178_i0_fu_main_33671_42550),
    .in2(out_const_5));
  ui_mult_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(32),
    .BITSIZE_out1(53),
    .PIPE_PARAMETER(0)) fu_main_33671_42559 (.out1(out_ui_mult_expr_FU_32_32_32_0_167_i2_fu_main_33671_42559),
    .clock(clock),
    .in1(out_reg_32_reg_32),
    .in2(out_reg_54_reg_54));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu_main_33671_42562 (.out1(out_ui_plus_expr_FU_64_64_64_178_i1_fu_main_33671_42562),
    .in1(out_ui_bit_and_expr_FU_32_0_32_124_i3_fu_main_33671_42553),
    .in2(out_reg_59_reg_59));
  ui_rshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(21),
    .PRECISION(64)) fu_main_33671_42565 (.out1(out_ui_rshift_expr_FU_64_0_64_189_i4_fu_main_33671_42565),
    .in1(out_ui_plus_expr_FU_64_64_64_178_i1_fu_main_33671_42562),
    .in2(out_const_5));
  ui_mult_expr_FU #(.BITSIZE_in1(21),
    .BITSIZE_in2(21),
    .BITSIZE_out1(42),
    .PIPE_PARAMETER(0)) fu_main_33671_42568 (.out1(out_ui_mult_expr_FU_32_32_32_0_167_i3_fu_main_33671_42568),
    .clock(clock),
    .in1(out_reg_55_reg_55),
    .in2(out_reg_53_reg_53));
  ui_ternary_plus_expr_FU #(.BITSIZE_in1(22),
    .BITSIZE_in2(42),
    .BITSIZE_in3(21),
    .BITSIZE_out1(42)) fu_main_33671_42571 (.out1(out_ui_ternary_plus_expr_FU_64_64_64_64_196_i0_fu_main_33671_42571),
    .in1(out_reg_62_reg_62),
    .in2(out_reg_60_reg_60),
    .in3(out_reg_63_reg_63));
  ui_lshift_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu_main_33671_42574 (.out1(out_ui_lshift_expr_FU_64_0_64_159_i0_fu_main_33671_42574),
    .in1(out_ui_plus_expr_FU_64_64_64_178_i1_fu_main_33671_42562),
    .in2(out_const_5));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu_main_33671_42577 (.out1(out_ui_rshift_expr_FU_64_0_64_190_i0_fu_main_33671_42577),
    .in1(out_ui_lshift_expr_FU_64_0_64_159_i0_fu_main_33671_42574),
    .in2(out_const_15));
  ui_lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu_main_33671_42580 (.out1(out_ui_lshift_expr_FU_64_0_64_160_i0_fu_main_33671_42580),
    .in1(out_ui_rshift_expr_FU_64_0_64_190_i0_fu_main_33671_42577),
    .in2(out_const_15));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_main_33671_42583 (.out1(out_ui_bit_and_expr_FU_32_0_32_125_i0_fu_main_33671_42583),
    .in1(out_ui_bit_and_expr_FU_32_0_32_124_i2_fu_main_33671_42541),
    .in2(out_const_52));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(32),
    .BITSIZE_in3(6),
    .BITSIZE_out1(64),
    .OFFSET_PARAMETER(32)) fu_main_33671_42586 (.out1(out_ui_bit_ior_concat_expr_FU_137_i0_fu_main_33671_42586),
    .in1(out_ui_lshift_expr_FU_64_0_64_160_i0_fu_main_33671_42580),
    .in2(out_reg_61_reg_61),
    .in3(out_const_15));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(54),
    .BITSIZE_out1(54)) fu_main_33671_42589 (.out1(out_ui_bit_and_expr_FU_64_0_64_126_i0_fu_main_33671_42589),
    .in1(out_ui_bit_ior_concat_expr_FU_137_i0_fu_main_33671_42586),
    .in2(out_const_55));
  ui_lshift_expr_FU #(.BITSIZE_in1(42),
    .BITSIZE_in2(5),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu_main_33671_42592 (.out1(out_ui_lshift_expr_FU_64_0_64_161_i0_fu_main_33671_42592),
    .in1(out_ui_ternary_plus_expr_FU_64_64_64_64_196_i0_fu_main_33671_42571),
    .in2(out_const_7));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(10),
    .PRECISION(64)) fu_main_33671_42595 (.out1(out_ui_rshift_expr_FU_64_0_64_191_i0_fu_main_33671_42595),
    .in1(out_ui_bit_ior_concat_expr_FU_137_i0_fu_main_33671_42586),
    .in2(out_const_9));
  ui_bit_and_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(10),
    .BITSIZE_out1(10)) fu_main_33671_42598 (.out1(out_ui_bit_and_expr_FU_16_0_16_122_i0_fu_main_33671_42598),
    .in1(out_ui_rshift_expr_FU_64_0_64_191_i0_fu_main_33671_42595),
    .in2(out_const_44));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(10),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu_main_33671_42601 (.out1(out_ui_bit_ior_expr_FU_0_64_64_139_i0_fu_main_33671_42601),
    .in1(out_reg_64_reg_64),
    .in2(out_ui_lshift_expr_FU_64_0_64_161_i0_fu_main_33671_42592));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu_main_33671_42604 (.out1(out_ui_bit_and_expr_FU_64_0_64_127_i0_fu_main_33671_42604),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_139_i0_fu_main_33671_42601),
    .in2(out_const_53));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(42),
    .BITSIZE_in2(6)) fu_main_33671_42607 (.out1(out_ui_extract_bit_expr_FU_55_i0_fu_main_33671_42607),
    .in1(out_ui_ternary_plus_expr_FU_64_64_64_64_196_i0_fu_main_33671_42571),
    .in2(out_const_21));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_33671_42610 (.out1(out_UUdata_converter_FU_56_i0_fu_main_33671_42610),
    .in1(out_ui_extract_bit_expr_FU_55_i0_fu_main_33671_42607));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(42),
    .BITSIZE_in2(6)) fu_main_33671_42613 (.out1(out_ui_extract_bit_expr_FU_57_i0_fu_main_33671_42613),
    .in1(out_ui_ternary_plus_expr_FU_64_64_64_64_196_i0_fu_main_33671_42571),
    .in2(out_const_21));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_33671_42616 (.out1(out_UUdata_converter_FU_58_i0_fu_main_33671_42616),
    .in1(out_UUdata_converter_FU_56_i0_fu_main_33671_42610));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(13),
    .BITSIZE_out1(13)) fu_main_33671_42619 (.out1(out_ui_plus_expr_FU_16_16_16_173_i0_fu_main_33671_42619),
    .in1(out_UUdata_converter_FU_58_i0_fu_main_33671_42616),
    .in2(out_reg_34_reg_34));
  ui_lshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(2),
    .BITSIZE_out1(55),
    .PRECISION(64)) fu_main_33671_42622 (.out1(out_ui_lshift_expr_FU_64_0_64_162_i0_fu_main_33671_42622),
    .in1(out_ui_bit_and_expr_FU_64_0_64_126_i0_fu_main_33671_42589),
    .in2(out_const_3));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_33671_42625 (.out1(out_lut_expr_FU_59_i0_fu_main_33671_42625),
    .in1(out_const_11),
    .in2(out_ui_extract_bit_expr_FU_57_i0_fu_main_33671_42613),
    .in3(1'b0),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UIdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu_main_33671_42628 (.out1(out_UIdata_converter_FU_60_i0_fu_main_33671_42628),
    .in1(out_lut_expr_FU_59_i0_fu_main_33671_42625));
  ui_lshift_expr_FU #(.BITSIZE_in1(55),
    .BITSIZE_in2(2),
    .BITSIZE_out1(54),
    .PRECISION(64)) fu_main_33671_42631 (.out1(out_ui_lshift_expr_FU_64_64_64_165_i0_fu_main_33671_42631),
    .in1(out_reg_65_reg_65),
    .in2(out_UIdata_converter_FU_60_i0_fu_main_33671_42628));
  ui_bit_and_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(54),
    .BITSIZE_out1(53)) fu_main_33671_42634 (.out1(out_ui_bit_and_expr_FU_64_0_64_126_i1_fu_main_33671_42634),
    .in1(out_ui_lshift_expr_FU_64_64_64_165_i0_fu_main_33671_42631),
    .in2(out_const_55));
  ui_rshift_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(7),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu_main_33671_42637 (.out1(out_ui_rshift_expr_FU_64_0_64_188_i2_fu_main_33671_42637),
    .in1(out_ui_bit_and_expr_FU_64_0_64_126_i0_fu_main_33671_42589),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_main_33671_42640 (.out1(out_ui_bit_and_expr_FU_8_0_8_132_i0_fu_main_33671_42640),
    .in1(out_ui_rshift_expr_FU_64_0_64_188_i2_fu_main_33671_42637),
    .in2(out_const_27));
  UIconvert_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(2)) fu_main_33671_42643 (.out1(out_UIconvert_expr_FU_61_i0_fu_main_33671_42643),
    .in1(out_UUdata_converter_FU_56_i0_fu_main_33671_42610));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(64)) fu_main_33671_42646 (.out1(out_ui_rshift_expr_FU_8_8_8_194_i0_fu_main_33671_42646),
    .in1(out_reg_66_reg_66),
    .in2(out_UIconvert_expr_FU_61_i0_fu_main_33671_42643));
  ui_lshift_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(2),
    .BITSIZE_out1(51),
    .PRECISION(64)) fu_main_33671_42649 (.out1(out_ui_lshift_expr_FU_64_64_64_165_i1_fu_main_33671_42649),
    .in1(out_ui_bit_and_expr_FU_64_0_64_127_i0_fu_main_33671_42604),
    .in2(out_UIdata_converter_FU_60_i0_fu_main_33671_42628));
  ui_lshift_expr_FU #(.BITSIZE_in1(51),
    .BITSIZE_in2(2),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu_main_33671_42652 (.out1(out_ui_lshift_expr_FU_64_0_64_162_i1_fu_main_33671_42652),
    .in1(out_ui_lshift_expr_FU_64_64_64_165_i1_fu_main_33671_42649),
    .in2(out_const_3));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(2),
    .BITSIZE_out1(52)) fu_main_33671_42655 (.out1(out_ui_bit_ior_expr_FU_64_64_64_143_i0_fu_main_33671_42655),
    .in1(out_ui_lshift_expr_FU_64_0_64_162_i1_fu_main_33671_42652),
    .in2(out_ui_rshift_expr_FU_8_8_8_194_i0_fu_main_33671_42646));
  ui_bit_and_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(52),
    .BITSIZE_out1(52)) fu_main_33671_42658 (.out1(out_ui_bit_and_expr_FU_64_0_64_127_i1_fu_main_33671_42658),
    .in1(out_ui_bit_ior_expr_FU_64_64_64_143_i0_fu_main_33671_42655),
    .in2(out_const_53));
  UUdata_converter_FU #(.BITSIZE_in1(13),
    .BITSIZE_out1(12)) fu_main_33671_42661 (.out1(out_UUdata_converter_FU_62_i0_fu_main_33671_42661),
    .in1(out_ui_plus_expr_FU_16_16_16_173_i0_fu_main_33671_42619));
  ui_lshift_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_in2(7),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu_main_33671_42664 (.out1(out_ui_lshift_expr_FU_64_0_64_163_i0_fu_main_33671_42664),
    .in1(out_UUdata_converter_FU_62_i0_fu_main_33671_42661),
    .in2(out_const_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu_main_33671_42667 (.out1(out_ui_bit_ior_expr_FU_0_64_64_140_i0_fu_main_33671_42667),
    .in1(out_ui_bit_and_expr_FU_64_0_64_127_i1_fu_main_33671_42658),
    .in2(out_ui_lshift_expr_FU_64_0_64_163_i0_fu_main_33671_42664));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_in2(4)) fu_main_33671_42670 (.out1(out_ui_extract_bit_expr_FU_63_i0_fu_main_33671_42670),
    .in1(out_ui_plus_expr_FU_16_16_16_173_i0_fu_main_33671_42619),
    .in2(out_const_29));
  ui_bit_and_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(53),
    .BITSIZE_out1(53)) fu_main_33671_42673 (.out1(out_ui_bit_and_expr_FU_64_0_64_128_i0_fu_main_33671_42673),
    .in1(out_ui_bit_and_expr_FU_64_0_64_126_i1_fu_main_33671_42634),
    .in2(out_const_54));
  ui_ne_expr_FU #(.BITSIZE_in1(53),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_main_33671_42676 (.out1(out_ui_ne_expr_FU_64_0_64_172_i0_fu_main_33671_42676),
    .in1(out_ui_bit_and_expr_FU_64_0_64_128_i0_fu_main_33671_42673),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(54),
    .BITSIZE_in2(6)) fu_main_33671_42679 (.out1(out_ui_extract_bit_expr_FU_64_i0_fu_main_33671_42679),
    .in1(out_ui_lshift_expr_FU_64_64_64_165_i0_fu_main_33671_42631),
    .in2(out_const_33));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1)) fu_main_33671_42682 (.out1(out_ui_extract_bit_expr_FU_65_i0_fu_main_33671_42682),
    .in1(out_ui_rshift_expr_FU_8_8_8_194_i0_fu_main_33671_42646),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu_main_33671_42685 (.out1(out_lut_expr_FU_66_i0_fu_main_33671_42685),
    .in1(out_const_22),
    .in2(out_ui_extract_bit_expr_FU_64_i0_fu_main_33671_42679),
    .in3(out_ui_ne_expr_FU_64_0_64_172_i0_fu_main_33671_42676),
    .in4(out_ui_extract_bit_expr_FU_65_i0_fu_main_33671_42682),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_main_33671_42688 (.out1(out_UUdata_converter_FU_67_i0_fu_main_33671_42688),
    .in1(out_lut_expr_FU_66_i0_fu_main_33671_42685));
  ui_plus_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu_main_33671_42691 (.out1(out_ui_plus_expr_FU_64_64_64_178_i2_fu_main_33671_42691),
    .in1(out_reg_68_reg_68),
    .in2(out_reg_67_reg_67));
  ui_eq_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(64),
    .BITSIZE_out1(1)) fu_main_33671_42694 (.out1(out_ui_eq_expr_FU_64_0_64_151_i0_fu_main_33671_42694),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_140_i0_fu_main_33671_42667),
    .in2(out_const_57));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(7),
    .BITSIZE_out1(11),
    .PRECISION(64)) fu_main_33671_42697 (.out1(out_ui_rshift_expr_FU_64_0_64_188_i3_fu_main_33671_42697),
    .in1(out_ui_plus_expr_FU_64_64_64_178_i2_fu_main_33671_42691),
    .in2(out_const_8));
  ui_bit_and_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(11)) fu_main_33671_42700 (.out1(out_ui_bit_and_expr_FU_16_0_16_120_i2_fu_main_33671_42700),
    .in1(out_ui_rshift_expr_FU_64_0_64_188_i3_fu_main_33671_42697),
    .in2(out_const_46));
  ui_eq_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(11),
    .BITSIZE_out1(1)) fu_main_33671_42703 (.out1(out_ui_eq_expr_FU_16_0_16_148_i2_fu_main_33671_42703),
    .in1(out_ui_bit_and_expr_FU_16_0_16_120_i2_fu_main_33671_42700),
    .in2(out_const_46));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6)) fu_main_33671_42706 (.out1(out_ui_extract_bit_expr_FU_68_i0_fu_main_33671_42706),
    .in1(out_ui_plus_expr_FU_64_64_64_178_i2_fu_main_33671_42691),
    .in2(out_const_39));
  ui_bit_and_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(63),
    .BITSIZE_out1(63)) fu_main_33671_42709 (.out1(out_ui_bit_and_expr_FU_64_0_64_129_i0_fu_main_33671_42709),
    .in1(out_ui_plus_expr_FU_64_64_64_178_i2_fu_main_33671_42691),
    .in2(out_const_56));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(63),
    .BITSIZE_in2(64),
    .BITSIZE_out1(64)) fu_main_33671_42712 (.out1(out_ui_bit_ior_expr_FU_0_64_64_141_i0_fu_main_33671_42712),
    .in1(out_ui_bit_and_expr_FU_64_0_64_129_i0_fu_main_33671_42709),
    .in2(out_reg_29_reg_29));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_main_33671_42715 (.out1(out_ui_extract_bit_expr_FU_69_i0_fu_main_33671_42715),
    .in1(out_ui_bit_and_expr_FU_1_1_1_123_i2_fu_main_33671_42535),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_main_33671_42718 (.out1(out_ui_extract_bit_expr_FU_70_i0_fu_main_33671_42718),
    .in1(out_ui_bit_and_expr_FU_1_1_1_123_i0_fu_main_33671_42496),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_main_33671_42721 (.out1(out_ui_extract_bit_expr_FU_71_i0_fu_main_33671_42721),
    .in1(out_ui_bit_and_expr_FU_1_1_1_123_i1_fu_main_33671_42532),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_main_33671_42724 (.out1(out_ui_extract_bit_expr_FU_72_i0_fu_main_33671_42724),
    .in1(out_ui_bit_and_expr_FU_1_1_1_123_i2_fu_main_33671_42535),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_main_33671_42727 (.out1(out_ui_extract_bit_expr_FU_73_i0_fu_main_33671_42727),
    .in1(out_ui_bit_and_expr_FU_1_1_1_123_i0_fu_main_33671_42496),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_main_33671_42730 (.out1(out_ui_extract_bit_expr_FU_74_i0_fu_main_33671_42730),
    .in1(out_ui_bit_and_expr_FU_1_1_1_123_i1_fu_main_33671_42532),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu_main_33671_42733 (.out1(out_lut_expr_FU_75_i0_fu_main_33671_42733),
    .in1(out_const_25),
    .in2(out_ui_eq_expr_FU_16_0_16_148_i0_fu_main_33671_42392),
    .in3(out_ui_eq_expr_FU_64_0_64_150_i0_fu_main_33671_42398),
    .in4(out_ui_ne_expr_FU_64_0_64_171_i0_fu_main_33671_42401),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_out1(1)) fu_main_33671_42736 (.out1(out_lut_expr_FU_76_i0_fu_main_33671_42736),
    .in1(out_const_34),
    .in2(out_ui_eq_expr_FU_64_0_64_150_i1_fu_main_33671_42416),
    .in3(out_ui_eq_expr_FU_16_0_16_148_i1_fu_main_33671_42410),
    .in4(out_ui_ne_expr_FU_64_0_64_171_i2_fu_main_33671_42419),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_out1(1)) fu_main_33671_42739 (.out1(out_lut_expr_FU_77_i0_fu_main_33671_42739),
    .in1(out_const_26),
    .in2(out_ui_eq_expr_FU_16_0_16_148_i0_fu_main_33671_42392),
    .in3(out_ui_eq_expr_FU_64_0_64_150_i0_fu_main_33671_42398),
    .in4(out_ui_ne_expr_FU_64_0_64_171_i1_fu_main_33671_42404),
    .in5(out_ui_ne_expr_FU_64_0_64_171_i0_fu_main_33671_42401),
    .in6(out_ui_eq_expr_FU_16_0_16_149_i0_fu_main_33671_42395),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_main_33671_42742 (.out1(out_lut_expr_FU_78_i0_fu_main_33671_42742),
    .in1(out_const_48),
    .in2(out_ui_eq_expr_FU_16_0_16_148_i1_fu_main_33671_42410),
    .in3(out_ui_eq_expr_FU_16_0_16_149_i1_fu_main_33671_42413),
    .in4(out_lut_expr_FU_50_i0_fu_main_33671_42502),
    .in5(out_lut_expr_FU_75_i0_fu_main_33671_42733),
    .in6(out_lut_expr_FU_76_i0_fu_main_33671_42736),
    .in7(out_lut_expr_FU_77_i0_fu_main_33671_42739),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(14),
    .BITSIZE_out1(1)) fu_main_33671_42745 (.out1(out_lut_expr_FU_79_i0_fu_main_33671_42745),
    .in1(out_const_35),
    .in2(out_ui_eq_expr_FU_64_0_64_150_i1_fu_main_33671_42416),
    .in3(out_ui_eq_expr_FU_16_0_16_148_i1_fu_main_33671_42410),
    .in4(out_ui_ne_expr_FU_64_0_64_171_i2_fu_main_33671_42419),
    .in5(out_lut_expr_FU_75_i0_fu_main_33671_42733),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(1)) fu_main_33671_42748 (.out1(out_lut_expr_FU_80_i0_fu_main_33671_42748),
    .in1(out_const_24),
    .in2(out_ui_extract_bit_expr_FU_64_i0_fu_main_33671_42679),
    .in3(out_ui_ne_expr_FU_64_0_64_172_i0_fu_main_33671_42676),
    .in4(out_ui_extract_bit_expr_FU_65_i0_fu_main_33671_42682),
    .in5(out_ui_extract_bit_expr_FU_63_i0_fu_main_33671_42670),
    .in6(out_ui_eq_expr_FU_64_0_64_151_i0_fu_main_33671_42694),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu_main_33671_42751 (.out1(out_lut_expr_FU_81_i0_fu_main_33671_42751),
    .in1(out_const_14),
    .in2(out_ui_extract_bit_expr_FU_68_i0_fu_main_33671_42706),
    .in3(out_ui_eq_expr_FU_16_0_16_148_i2_fu_main_33671_42703),
    .in4(out_reg_69_reg_69),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_main_33671_42754 (.out1(out_lut_expr_FU_82_i0_fu_main_33671_42754),
    .in1(out_const_42),
    .in2(out_reg_38_reg_38),
    .in3(out_reg_39_reg_39),
    .in4(out_reg_40_reg_40),
    .in5(out_reg_41_reg_41),
    .in6(out_reg_42_reg_42),
    .in7(out_lut_expr_FU_81_i0_fu_main_33671_42751),
    .in8(1'b0),
    .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_main_33671_42757 (.out1(out_ui_extract_bit_expr_FU_83_i0_fu_main_33671_42757),
    .in1(out_ui_bit_and_expr_FU_1_1_1_123_i2_fu_main_33671_42535),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_main_33671_42760 (.out1(out_ui_extract_bit_expr_FU_84_i0_fu_main_33671_42760),
    .in1(out_ui_bit_and_expr_FU_1_1_1_123_i0_fu_main_33671_42496),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_main_33671_42763 (.out1(out_ui_extract_bit_expr_FU_85_i0_fu_main_33671_42763),
    .in1(out_ui_bit_and_expr_FU_1_1_1_123_i1_fu_main_33671_42532),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_main_33671_42766 (.out1(out_lut_expr_FU_86_i0_fu_main_33671_42766),
    .in1(out_const_50),
    .in2(out_reg_43_reg_43),
    .in3(out_reg_44_reg_44),
    .in4(out_reg_45_reg_45),
    .in5(out_reg_41_reg_41),
    .in6(out_reg_42_reg_42),
    .in7(out_lut_expr_FU_81_i0_fu_main_33671_42751),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu_main_33671_42769 (.out1(out_ui_cond_expr_FU_64_64_64_64_146_i0_fu_main_33671_42769),
    .in1(out_lut_expr_FU_82_i0_fu_main_33671_42754),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_141_i0_fu_main_33671_42712),
    .in3(out_reg_29_reg_29));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_main_33671_42772 (.out1(out_ui_extract_bit_expr_FU_87_i0_fu_main_33671_42772),
    .in1(out_ui_bit_and_expr_FU_1_1_1_123_i2_fu_main_33671_42535),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_main_33671_42775 (.out1(out_ui_extract_bit_expr_FU_88_i0_fu_main_33671_42775),
    .in1(out_ui_bit_and_expr_FU_1_1_1_123_i0_fu_main_33671_42496),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_main_33671_42778 (.out1(out_ui_extract_bit_expr_FU_89_i0_fu_main_33671_42778),
    .in1(out_ui_bit_and_expr_FU_1_1_1_123_i1_fu_main_33671_42532),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(1)) fu_main_33671_42781 (.out1(out_lut_expr_FU_90_i0_fu_main_33671_42781),
    .in1(out_const_37),
    .in2(out_ui_extract_bit_expr_FU_68_i0_fu_main_33671_42706),
    .in3(out_ui_eq_expr_FU_16_0_16_148_i2_fu_main_33671_42703),
    .in4(out_reg_69_reg_69),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(57),
    .BITSIZE_out1(1)) fu_main_33671_42784 (.out1(out_lut_expr_FU_91_i0_fu_main_33671_42784),
    .in1(out_const_19),
    .in2(out_reg_46_reg_46),
    .in3(out_reg_47_reg_47),
    .in4(out_reg_48_reg_48),
    .in5(out_reg_41_reg_41),
    .in6(out_reg_42_reg_42),
    .in7(out_lut_expr_FU_90_i0_fu_main_33671_42781),
    .in8(1'b0),
    .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu_main_33671_42787 (.out1(out_ui_cond_expr_FU_64_64_64_64_146_i1_fu_main_33671_42787),
    .in1(out_lut_expr_FU_86_i0_fu_main_33671_42766),
    .in2(out_ui_cond_expr_FU_64_64_64_64_146_i0_fu_main_33671_42769),
    .in3(out_reg_29_reg_29));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_main_33671_42790 (.out1(out_ui_extract_bit_expr_FU_92_i0_fu_main_33671_42790),
    .in1(out_ui_bit_and_expr_FU_1_1_1_123_i2_fu_main_33671_42535),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_main_33671_42793 (.out1(out_ui_extract_bit_expr_FU_93_i0_fu_main_33671_42793),
    .in1(out_ui_bit_and_expr_FU_1_1_1_123_i0_fu_main_33671_42496),
    .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1)) fu_main_33671_42796 (.out1(out_ui_extract_bit_expr_FU_94_i0_fu_main_33671_42796),
    .in1(out_ui_bit_and_expr_FU_1_1_1_123_i1_fu_main_33671_42532),
    .in2(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(1)) fu_main_33671_42799 (.out1(out_lut_expr_FU_95_i0_fu_main_33671_42799),
    .in1(out_const_42),
    .in2(out_reg_35_reg_35),
    .in3(out_reg_36_reg_36),
    .in4(out_reg_37_reg_37),
    .in5(out_reg_41_reg_41),
    .in6(out_reg_42_reg_42),
    .in7(out_lut_expr_FU_90_i0_fu_main_33671_42781),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_out1(1)) fu_main_33671_42802 (.out1(out_lut_expr_FU_96_i0_fu_main_33671_42802),
    .in1(out_const_41),
    .in2(out_reg_49_reg_49),
    .in3(out_reg_50_reg_50),
    .in4(out_reg_51_reg_51),
    .in5(out_reg_41_reg_41),
    .in6(out_reg_42_reg_42),
    .in7(out_lut_expr_FU_95_i0_fu_main_33671_42799),
    .in8(1'b0),
    .in9(1'b0));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(13),
    .PRECISION(64)) fu_main_33671_42805 (.out1(out_ui_rshift_expr_FU_64_0_64_192_i0_fu_main_33671_42805),
    .in1(out_ui_bit_ior_expr_FU_64_0_64_142_i0_fu_main_33671_42451),
    .in2(out_const_31));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(13),
    .BITSIZE_in3(13),
    .BITSIZE_out1(13)) fu_main_33671_42808 (.out1(out_ui_cond_expr_FU_16_16_16_16_145_i0_fu_main_33671_42808),
    .in1(out_lut_expr_FU_96_i0_fu_main_33671_42802),
    .in2(out_const_49),
    .in3(out_reg_52_reg_52));
  ui_lshift_expr_FU #(.BITSIZE_in1(13),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu_main_33671_42811 (.out1(out_ui_lshift_expr_FU_64_0_64_164_i0_fu_main_33671_42811),
    .in1(out_ui_cond_expr_FU_16_16_16_16_145_i0_fu_main_33671_42808),
    .in2(out_const_31));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(64),
    .BITSIZE_in3(64),
    .BITSIZE_out1(64)) fu_main_33671_42814 (.out1(out_ui_cond_expr_FU_64_64_64_64_146_i2_fu_main_33671_42814),
    .in1(out_lut_expr_FU_91_i0_fu_main_33671_42784),
    .in2(out_ui_cond_expr_FU_64_64_64_64_146_i1_fu_main_33671_42787),
    .in3(out_ui_lshift_expr_FU_64_0_64_164_i0_fu_main_33671_42811));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu_main_33671_42828 (.out1(out_ASSIGN_UNSIGNED_FU_32_i0_fu_main_33671_42828),
    .in1(out_UUconvert_expr_FU_31_i0_fu_main_33671_42353));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) fu_main_33671_42830 (.out1(out_ASSIGN_UNSIGNED_FU_34_i0_fu_main_33671_42830),
    .in1(out_UUconvert_expr_FU_33_i0_fu_main_33671_42369));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu_main_33671_42832 (.out1(out_ASSIGN_UNSIGNED_FU_39_i0_fu_main_33671_42832),
    .in1(out_ui_rshift_expr_FU_64_0_64_189_i0_fu_main_33671_42431));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_main_33671_42834 (.out1(out_ASSIGN_UNSIGNED_FU_40_i0_fu_main_33671_42834),
    .in1(out_ui_bit_and_expr_FU_32_0_32_124_i0_fu_main_33671_42436));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) fu_main_33671_42836 (.out1(out_ASSIGN_UNSIGNED_FU_41_i0_fu_main_33671_42836),
    .in1(out_ui_rshift_expr_FU_64_0_64_189_i1_fu_main_33671_42441));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_main_33671_42838 (.out1(out_ASSIGN_UNSIGNED_FU_42_i0_fu_main_33671_42838),
    .in1(out_ui_bit_and_expr_FU_32_0_32_124_i1_fu_main_33671_42446));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_1 (.out1(sig_in_bus_mergerMout_Wdata_ram0_1),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_1));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerMout_Wdata_ram0_2 (.out1(sig_in_bus_mergerMout_Wdata_ram0_2),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_2));
  join_signal #(.BITSIZE_in1(21),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(42)) join_signalbus_mergerMout_addr_ram1_0 (.out1(sig_in_bus_mergerMout_addr_ram1_0),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_0));
  join_signal #(.BITSIZE_in1(21),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(42)) join_signalbus_mergerMout_addr_ram1_1 (.out1(sig_in_bus_mergerMout_addr_ram1_1),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_1));
  join_signal #(.BITSIZE_in1(21),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(42)) join_signalbus_mergerMout_addr_ram1_2 (.out1(sig_in_bus_mergerMout_addr_ram1_2),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_2));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_1 (.out1(sig_in_bus_mergerMout_data_ram_size2_1),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_1));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerMout_data_ram_size2_2 (.out1(sig_in_bus_mergerMout_data_ram_size2_2),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_2));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_0 (.out1(sig_in_bus_mergerMout_oe_ram3_0),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_1 (.out1(sig_in_bus_mergerMout_oe_ram3_1),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_1));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_2 (.out1(sig_in_bus_mergerMout_oe_ram3_2),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_2));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_0 (.out1(sig_in_bus_mergerMout_we_ram4_0),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_1 (.out1(sig_in_bus_mergerMout_we_ram4_1),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_1));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_2 (.out1(sig_in_bus_mergerMout_we_ram4_2),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_2));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_0 (.out1(sig_in_bus_mergerSout_DataRdy5_0),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerSout_DataRdy5_1 (.out1(sig_in_bus_mergerSout_DataRdy5_1),
    .in1(sig_in_vector_bus_mergerSout_DataRdy5_1));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerSout_Rdata_ram6_0 (.out1(sig_in_bus_mergerSout_Rdata_ram6_0),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerSout_Rdata_ram6_1 (.out1(sig_in_bus_mergerSout_Rdata_ram6_1),
    .in1(sig_in_vector_bus_mergerSout_Rdata_ram6_1));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in112_0 (.out1(sig_in_bus_mergerproxy_in112_0),
    .in1(sig_in_vector_bus_mergerproxy_in112_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in117_0 (.out1(sig_in_bus_mergerproxy_in117_0),
    .in1(sig_in_vector_bus_mergerproxy_in117_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in122_0 (.out1(sig_in_bus_mergerproxy_in122_0),
    .in1(sig_in_vector_bus_mergerproxy_in122_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in17_0 (.out1(sig_in_bus_mergerproxy_in17_0),
    .in1(sig_in_vector_bus_mergerproxy_in17_0));
  join_signal #(.BITSIZE_in1(64),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(128)) join_signalbus_mergerproxy_in17_1 (.out1(sig_in_bus_mergerproxy_in17_1),
    .in1(sig_in_vector_bus_mergerproxy_in17_1));
  join_signal #(.BITSIZE_in1(21),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(42)) join_signalbus_mergerproxy_in213_0 (.out1(sig_in_bus_mergerproxy_in213_0),
    .in1(sig_in_vector_bus_mergerproxy_in213_0));
  join_signal #(.BITSIZE_in1(21),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(42)) join_signalbus_mergerproxy_in218_0 (.out1(sig_in_bus_mergerproxy_in218_0),
    .in1(sig_in_vector_bus_mergerproxy_in218_0));
  join_signal #(.BITSIZE_in1(21),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(42)) join_signalbus_mergerproxy_in223_0 (.out1(sig_in_bus_mergerproxy_in223_0),
    .in1(sig_in_vector_bus_mergerproxy_in223_0));
  join_signal #(.BITSIZE_in1(21),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(42)) join_signalbus_mergerproxy_in28_0 (.out1(sig_in_bus_mergerproxy_in28_0),
    .in1(sig_in_vector_bus_mergerproxy_in28_0));
  join_signal #(.BITSIZE_in1(21),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(42)) join_signalbus_mergerproxy_in28_1 (.out1(sig_in_bus_mergerproxy_in28_1),
    .in1(sig_in_vector_bus_mergerproxy_in28_1));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in314_0 (.out1(sig_in_bus_mergerproxy_in314_0),
    .in1(sig_in_vector_bus_mergerproxy_in314_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in319_0 (.out1(sig_in_bus_mergerproxy_in319_0),
    .in1(sig_in_vector_bus_mergerproxy_in319_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in324_0 (.out1(sig_in_bus_mergerproxy_in324_0),
    .in1(sig_in_vector_bus_mergerproxy_in324_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in39_0 (.out1(sig_in_bus_mergerproxy_in39_0),
    .in1(sig_in_vector_bus_mergerproxy_in39_0));
  join_signal #(.BITSIZE_in1(7),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(14)) join_signalbus_mergerproxy_in39_1 (.out1(sig_in_bus_mergerproxy_in39_1),
    .in1(sig_in_vector_bus_mergerproxy_in39_1));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD10_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD10_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD10_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD10_1 (.out1(sig_in_bus_mergerproxy_sel_LOAD10_1),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD10_1));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD15_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD15_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD15_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD20_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD20_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD20_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_LOAD25_0 (.out1(sig_in_bus_mergerproxy_sel_LOAD25_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_LOAD25_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE11_0 (.out1(sig_in_bus_mergerproxy_sel_STORE11_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE11_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE11_1 (.out1(sig_in_bus_mergerproxy_sel_STORE11_1),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE11_1));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE16_0 (.out1(sig_in_bus_mergerproxy_sel_STORE16_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE16_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE21_0 (.out1(sig_in_bus_mergerproxy_sel_STORE21_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE21_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerproxy_sel_STORE26_0 (.out1(sig_in_bus_mergerproxy_sel_STORE26_0),
    .in1(sig_in_vector_bus_mergerproxy_sel_STORE26_0));
  or or_or___float_adde11m52b_1023nih_197_i01( s___float_adde11m52b_1023nih_197_i01, selector_IN_UNBOUNDED_main_33671_33746, selector_IN_UNBOUNDED_main_33671_33830);
  or or_or___internal_free_instance0( s___internal_free_instance0, selector_IN_UNBOUNDED_main_33671_33936, selector_IN_UNBOUNDED_main_33671_33941, selector_IN_UNBOUNDED_main_33671_33943);
  or or_or___internal_malloc_198_i02( s___internal_malloc_198_i02, selector_IN_UNBOUNDED_main_33671_33686, selector_IN_UNBOUNDED_main_33671_33687, selector_IN_UNBOUNDED_main_33671_33688);
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out___internal_malloc_198_i0___internal_malloc_198_i0),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out___internal_malloc_198_i0___internal_malloc_198_i0),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_16_i0_fu_main_33671_33769),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_17_i0_fu_main_33671_33796),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_185_reg_12_0_0_0),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_186_reg_13_0_0_0),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_187_reg_14_0_0_0),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_112_i0_fu_main_33671_33924),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_concat_expr_FU_133_i3_fu_main_33671_33931),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_169_i0_fu_main_33671_34786),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(19),
    .BITSIZE_out1(19)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_32_0_32_187_i0_fu_main_33671_37963),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_192_reg_19_0_0_0),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_193_reg_2_0_0_0),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_194_reg_20_0_0_0),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_195_reg_21_0_0_0),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_182_i3_fu_main_33671_34733),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_0_32_168_i0_fu_main_33671_34784),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_109_i0_fu_main_33671_42339),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_199_reg_25_0_0_0),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_103_i0_fu_main_33671_33824),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_104_i0_fu_main_33671_33827),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_ne_expr_FU_32_0_32_115_i0_fu_main_33671_34780),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_158_i0_fu_main_33671_42386),
    .wenable(wrenable_reg_29));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out___internal_malloc_198_i0___internal_malloc_198_i0),
    .wenable(wrenable_reg_3));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_189_i0_fu_main_33671_42431),
    .wenable(wrenable_reg_30));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_32_0_32_124_i0_fu_main_33671_42436),
    .wenable(wrenable_reg_31));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_189_i1_fu_main_33671_42441),
    .wenable(wrenable_reg_32));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_32_0_32_124_i1_fu_main_33671_42446),
    .wenable(wrenable_reg_33));
  register_SE #(.BITSIZE_in1(13),
    .BITSIZE_out1(13)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ternary_plus_expr_FU_16_0_16_16_195_i0_fu_main_33671_42499),
    .wenable(wrenable_reg_34));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_69_i0_fu_main_33671_42715),
    .wenable(wrenable_reg_35));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_70_i0_fu_main_33671_42718),
    .wenable(wrenable_reg_36));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_71_i0_fu_main_33671_42721),
    .wenable(wrenable_reg_37));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_38 (.out1(out_reg_38_reg_38),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_72_i0_fu_main_33671_42724),
    .wenable(wrenable_reg_38));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_39 (.out1(out_reg_39_reg_39),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_73_i0_fu_main_33671_42727),
    .wenable(wrenable_reg_39));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_7_i0_fu_main_33671_33689),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_40 (.out1(out_reg_40_reg_40),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_74_i0_fu_main_33671_42730),
    .wenable(wrenable_reg_40));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_41 (.out1(out_reg_41_reg_41),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_78_i0_fu_main_33671_42742),
    .wenable(wrenable_reg_41));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_42 (.out1(out_reg_42_reg_42),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_79_i0_fu_main_33671_42745),
    .wenable(wrenable_reg_42));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_43 (.out1(out_reg_43_reg_43),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_83_i0_fu_main_33671_42757),
    .wenable(wrenable_reg_43));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_44 (.out1(out_reg_44_reg_44),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_84_i0_fu_main_33671_42760),
    .wenable(wrenable_reg_44));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_45 (.out1(out_reg_45_reg_45),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_85_i0_fu_main_33671_42763),
    .wenable(wrenable_reg_45));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_46 (.out1(out_reg_46_reg_46),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_87_i0_fu_main_33671_42772),
    .wenable(wrenable_reg_46));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_47 (.out1(out_reg_47_reg_47),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_88_i0_fu_main_33671_42775),
    .wenable(wrenable_reg_47));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_48 (.out1(out_reg_48_reg_48),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_89_i0_fu_main_33671_42778),
    .wenable(wrenable_reg_48));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_49 (.out1(out_reg_49_reg_49),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_92_i0_fu_main_33671_42790),
    .wenable(wrenable_reg_49));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_8_i0_fu_main_33671_33691),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_50 (.out1(out_reg_50_reg_50),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_93_i0_fu_main_33671_42793),
    .wenable(wrenable_reg_50));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_51 (.out1(out_reg_51_reg_51),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_extract_bit_expr_FU_94_i0_fu_main_33671_42796),
    .wenable(wrenable_reg_51));
  register_SE #(.BITSIZE_in1(13),
    .BITSIZE_out1(13)) reg_52 (.out1(out_reg_52_reg_52),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_192_i0_fu_main_33671_42805),
    .wenable(wrenable_reg_52));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_53 (.out1(out_reg_53_reg_53),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_39_i0_fu_main_33671_42832),
    .wenable(wrenable_reg_53));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_54 (.out1(out_reg_54_reg_54),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_40_i0_fu_main_33671_42834),
    .wenable(wrenable_reg_54));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_55 (.out1(out_reg_55_reg_55),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_41_i0_fu_main_33671_42836),
    .wenable(wrenable_reg_55));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_56 (.out1(out_reg_56_reg_56),
    .clock(clock),
    .reset(reset),
    .in1(out_ASSIGN_UNSIGNED_FU_42_i0_fu_main_33671_42838),
    .wenable(wrenable_reg_56));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_57 (.out1(out_reg_57_reg_57),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_189_i2_fu_main_33671_42544),
    .wenable(wrenable_reg_57));
  register_STD #(.BITSIZE_in1(53),
    .BITSIZE_out1(53)) reg_58 (.out1(out_reg_58_reg_58),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_167_i1_fu_main_33671_42547),
    .wenable(wrenable_reg_58));
  register_STD #(.BITSIZE_in1(53),
    .BITSIZE_out1(53)) reg_59 (.out1(out_reg_59_reg_59),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_167_i2_fu_main_33671_42559),
    .wenable(wrenable_reg_59));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_237_reg_6_0_0_0),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(42),
    .BITSIZE_out1(42)) reg_60 (.out1(out_reg_60_reg_60),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_mult_expr_FU_32_32_32_0_167_i3_fu_main_33671_42568),
    .wenable(wrenable_reg_60));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_61 (.out1(out_reg_61_reg_61),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_32_0_32_125_i0_fu_main_33671_42583),
    .wenable(wrenable_reg_61));
  register_STD #(.BITSIZE_in1(22),
    .BITSIZE_out1(22)) reg_62 (.out1(out_reg_62_reg_62),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_189_i3_fu_main_33671_42556),
    .wenable(wrenable_reg_62));
  register_STD #(.BITSIZE_in1(21),
    .BITSIZE_out1(21)) reg_63 (.out1(out_reg_63_reg_63),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_rshift_expr_FU_64_0_64_189_i4_fu_main_33671_42565),
    .wenable(wrenable_reg_63));
  register_STD #(.BITSIZE_in1(10),
    .BITSIZE_out1(10)) reg_64 (.out1(out_reg_64_reg_64),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_16_0_16_122_i0_fu_main_33671_42598),
    .wenable(wrenable_reg_64));
  register_STD #(.BITSIZE_in1(55),
    .BITSIZE_out1(55)) reg_65 (.out1(out_reg_65_reg_65),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_64_0_64_162_i0_fu_main_33671_42622),
    .wenable(wrenable_reg_65));
  register_STD #(.BITSIZE_in1(2),
    .BITSIZE_out1(2)) reg_66 (.out1(out_reg_66_reg_66),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_and_expr_FU_8_0_8_132_i0_fu_main_33671_42640),
    .wenable(wrenable_reg_66));
  register_STD #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_67 (.out1(out_reg_67_reg_67),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_bit_ior_expr_FU_0_64_64_140_i0_fu_main_33671_42667),
    .wenable(wrenable_reg_67));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_68 (.out1(out_reg_68_reg_68),
    .clock(clock),
    .reset(reset),
    .in1(out_UUdata_converter_FU_67_i0_fu_main_33671_42688),
    .wenable(wrenable_reg_68));
  register_STD #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_69 (.out1(out_reg_69_reg_69),
    .clock(clock),
    .reset(reset),
    .in1(out_lut_expr_FU_80_i0_fu_main_33671_42748),
    .wenable(wrenable_reg_69));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_248_reg_7_0_0_0),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) reg_70 (.out1(out_reg_70_reg_70),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_cond_expr_FU_64_64_64_64_146_i2_fu_main_33671_42814),
    .wenable(wrenable_reg_70));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_250_reg_8_0_0_0),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_ne_expr_FU_32_32_32_170_i0_fu_main_33671_34774),
    .wenable(wrenable_reg_9));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram),
    .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(42),
    .BITSIZE_out1(21),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram),
    .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_data_ram_size2_ (.out1(Mout_data_ram_size),
    .in1(sig_out_bus_mergerMout_data_ram_size2_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_oe_ram3_ (.out1(Mout_oe_ram),
    .in1(sig_out_bus_mergerMout_oe_ram3_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_we_ram4_ (.out1(Mout_we_ram),
    .in1(sig_out_bus_mergerMout_we_ram4_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerSout_DataRdy5_ (.out1(Sout_DataRdy),
    .in1(sig_out_bus_mergerSout_DataRdy5_));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerSout_Rdata_ram6_ (.out1(Sout_Rdata_ram),
    .in1(sig_out_bus_mergerSout_Rdata_ram6_));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in112_ (.out1(sig_out_vector_bus_mergerproxy_in112_),
    .in1(sig_out_bus_mergerproxy_in112_));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in117_ (.out1(sig_out_vector_bus_mergerproxy_in117_),
    .in1(sig_out_bus_mergerproxy_in117_));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in122_ (.out1(sig_out_vector_bus_mergerproxy_in122_),
    .in1(sig_out_bus_mergerproxy_in122_));
  split_signal #(.BITSIZE_in1(128),
    .BITSIZE_out1(64),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in17_ (.out1(sig_out_vector_bus_mergerproxy_in17_),
    .in1(sig_out_bus_mergerproxy_in17_));
  split_signal #(.BITSIZE_in1(42),
    .BITSIZE_out1(21),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in213_ (.out1(sig_out_vector_bus_mergerproxy_in213_),
    .in1(sig_out_bus_mergerproxy_in213_));
  split_signal #(.BITSIZE_in1(42),
    .BITSIZE_out1(21),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in218_ (.out1(sig_out_vector_bus_mergerproxy_in218_),
    .in1(sig_out_bus_mergerproxy_in218_));
  split_signal #(.BITSIZE_in1(42),
    .BITSIZE_out1(21),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in223_ (.out1(sig_out_vector_bus_mergerproxy_in223_),
    .in1(sig_out_bus_mergerproxy_in223_));
  split_signal #(.BITSIZE_in1(42),
    .BITSIZE_out1(21),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in28_ (.out1(sig_out_vector_bus_mergerproxy_in28_),
    .in1(sig_out_bus_mergerproxy_in28_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in314_ (.out1(sig_out_vector_bus_mergerproxy_in314_),
    .in1(sig_out_bus_mergerproxy_in314_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in319_ (.out1(sig_out_vector_bus_mergerproxy_in319_),
    .in1(sig_out_bus_mergerproxy_in319_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in324_ (.out1(sig_out_vector_bus_mergerproxy_in324_),
    .in1(sig_out_bus_mergerproxy_in324_));
  split_signal #(.BITSIZE_in1(14),
    .BITSIZE_out1(7),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_in39_ (.out1(sig_out_vector_bus_mergerproxy_in39_),
    .in1(sig_out_bus_mergerproxy_in39_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD10_ (.out1(sig_out_vector_bus_mergerproxy_sel_LOAD10_),
    .in1(sig_out_bus_mergerproxy_sel_LOAD10_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD15_ (.out1(sig_out_vector_bus_mergerproxy_sel_LOAD15_),
    .in1(sig_out_bus_mergerproxy_sel_LOAD15_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD20_ (.out1(sig_out_vector_bus_mergerproxy_sel_LOAD20_),
    .in1(sig_out_bus_mergerproxy_sel_LOAD20_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_LOAD25_ (.out1(sig_out_vector_bus_mergerproxy_sel_LOAD25_),
    .in1(sig_out_bus_mergerproxy_sel_LOAD25_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE11_ (.out1(sig_out_vector_bus_mergerproxy_sel_STORE11_),
    .in1(sig_out_bus_mergerproxy_sel_STORE11_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE16_ (.out1(sig_out_vector_bus_mergerproxy_sel_STORE16_),
    .in1(sig_out_bus_mergerproxy_sel_STORE16_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE21_ (.out1(sig_out_vector_bus_mergerproxy_sel_STORE21_),
    .in1(sig_out_bus_mergerproxy_sel_STORE21_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerproxy_sel_STORE26_ (.out1(sig_out_vector_bus_mergerproxy_sel_STORE26_),
    .in1(sig_out_bus_mergerproxy_sel_STORE26_));
  // io-signal post fix
  assign return_port = out_conv_out_const_0_I_1_I_32;
  assign OUT_CONDITION_main_33671_33748 = out_read_cond_FU_15_i0_fu_main_33671_33748;
  assign OUT_CONDITION_main_33671_33783 = out_read_cond_FU_21_i0_fu_main_33671_33783;
  assign OUT_CONDITION_main_33671_33811 = out_read_cond_FU_25_i0_fu_main_33671_33811;
  assign OUT_CONDITION_main_33671_33832 = out_read_cond_FU_97_i0_fu_main_33671_33832;
  assign OUT_CONDITION_main_33671_33962 = out_read_cond_FU_98_i0_fu_main_33671_33962;
  assign OUT_MULTIIF_main_33671_42333 = out_multi_read_cond_FU_105_i0_fu_main_33671_42333;
  assign OUT_UNBOUNDED_main_33671_33686 = s_done___internal_malloc_198_i0;
  assign OUT_UNBOUNDED_main_33671_33687 = s_done___internal_malloc_198_i0;
  assign OUT_UNBOUNDED_main_33671_33688 = s_done___internal_malloc_198_i0;
  assign OUT_UNBOUNDED_main_33671_33746 = s_done___float_adde11m52b_1023nih_197_i0;
  assign OUT_UNBOUNDED_main_33671_33830 = s_done___float_adde11m52b_1023nih_197_i0;
  assign OUT_UNBOUNDED_main_33671_33936 = s_done___internal_free_instance;
  assign OUT_UNBOUNDED_main_33671_33941 = s_done___internal_free_instance;
  assign OUT_UNBOUNDED_main_33671_33943 = s_done___internal_free_instance;

endmodule

// FSM based controller description for main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_main(done_port,
  fuselector_BMEMORY_CTRLN_114_i0_LOAD,
  fuselector_BMEMORY_CTRLN_114_i0_STORE,
  fuselector_BMEMORY_CTRLN_114_i1_LOAD,
  fuselector_BMEMORY_CTRLN_114_i1_STORE,
  selector_IN_UNBOUNDED_main_33671_33686,
  selector_IN_UNBOUNDED_main_33671_33687,
  selector_IN_UNBOUNDED_main_33671_33688,
  selector_IN_UNBOUNDED_main_33671_33746,
  selector_IN_UNBOUNDED_main_33671_33830,
  selector_IN_UNBOUNDED_main_33671_33936,
  selector_IN_UNBOUNDED_main_33671_33941,
  selector_IN_UNBOUNDED_main_33671_33943,
  selector_MUX_10_BMEMORY_CTRLN_114_i1_0_0_0,
  selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_0,
  selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_1,
  selector_MUX_185_reg_12_0_0_0,
  selector_MUX_186_reg_13_0_0_0,
  selector_MUX_187_reg_14_0_0_0,
  selector_MUX_192_reg_19_0_0_0,
  selector_MUX_193_reg_2_0_0_0,
  selector_MUX_194_reg_20_0_0_0,
  selector_MUX_195_reg_21_0_0_0,
  selector_MUX_199_reg_25_0_0_0,
  selector_MUX_237_reg_6_0_0_0,
  selector_MUX_248_reg_7_0_0_0,
  selector_MUX_250_reg_8_0_0_0,
  selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0,
  selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1,
  selector_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0,
  selector_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0,
  selector_MUX_50___internal_malloc_198_i0_0_0_0,
  selector_MUX_50___internal_malloc_198_i0_0_0_1,
  selector_MUX_6_BMEMORY_CTRLN_114_i0_0_0_0,
  selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_0,
  selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_1,
  fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free,
  fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0_WRAPPED_PROXY_PREF___internal_free,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_32,
  wrenable_reg_33,
  wrenable_reg_34,
  wrenable_reg_35,
  wrenable_reg_36,
  wrenable_reg_37,
  wrenable_reg_38,
  wrenable_reg_39,
  wrenable_reg_4,
  wrenable_reg_40,
  wrenable_reg_41,
  wrenable_reg_42,
  wrenable_reg_43,
  wrenable_reg_44,
  wrenable_reg_45,
  wrenable_reg_46,
  wrenable_reg_47,
  wrenable_reg_48,
  wrenable_reg_49,
  wrenable_reg_5,
  wrenable_reg_50,
  wrenable_reg_51,
  wrenable_reg_52,
  wrenable_reg_53,
  wrenable_reg_54,
  wrenable_reg_55,
  wrenable_reg_56,
  wrenable_reg_57,
  wrenable_reg_58,
  wrenable_reg_59,
  wrenable_reg_6,
  wrenable_reg_60,
  wrenable_reg_61,
  wrenable_reg_62,
  wrenable_reg_63,
  wrenable_reg_64,
  wrenable_reg_65,
  wrenable_reg_66,
  wrenable_reg_67,
  wrenable_reg_68,
  wrenable_reg_69,
  wrenable_reg_7,
  wrenable_reg_70,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_main_33671_33748,
  OUT_CONDITION_main_33671_33783,
  OUT_CONDITION_main_33671_33811,
  OUT_CONDITION_main_33671_33832,
  OUT_CONDITION_main_33671_33962,
  OUT_MULTIIF_main_33671_42333,
  OUT_UNBOUNDED_main_33671_33686,
  OUT_UNBOUNDED_main_33671_33687,
  OUT_UNBOUNDED_main_33671_33688,
  OUT_UNBOUNDED_main_33671_33746,
  OUT_UNBOUNDED_main_33671_33830,
  OUT_UNBOUNDED_main_33671_33936,
  OUT_UNBOUNDED_main_33671_33941,
  OUT_UNBOUNDED_main_33671_33943,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_main_33671_33748;
  input OUT_CONDITION_main_33671_33783;
  input OUT_CONDITION_main_33671_33811;
  input OUT_CONDITION_main_33671_33832;
  input OUT_CONDITION_main_33671_33962;
  input [1:0] OUT_MULTIIF_main_33671_42333;
  input OUT_UNBOUNDED_main_33671_33686;
  input OUT_UNBOUNDED_main_33671_33687;
  input OUT_UNBOUNDED_main_33671_33688;
  input OUT_UNBOUNDED_main_33671_33746;
  input OUT_UNBOUNDED_main_33671_33830;
  input OUT_UNBOUNDED_main_33671_33936;
  input OUT_UNBOUNDED_main_33671_33941;
  input OUT_UNBOUNDED_main_33671_33943;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_114_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_114_i0_STORE;
  output fuselector_BMEMORY_CTRLN_114_i1_LOAD;
  output fuselector_BMEMORY_CTRLN_114_i1_STORE;
  output selector_IN_UNBOUNDED_main_33671_33686;
  output selector_IN_UNBOUNDED_main_33671_33687;
  output selector_IN_UNBOUNDED_main_33671_33688;
  output selector_IN_UNBOUNDED_main_33671_33746;
  output selector_IN_UNBOUNDED_main_33671_33830;
  output selector_IN_UNBOUNDED_main_33671_33936;
  output selector_IN_UNBOUNDED_main_33671_33941;
  output selector_IN_UNBOUNDED_main_33671_33943;
  output selector_MUX_10_BMEMORY_CTRLN_114_i1_0_0_0;
  output selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_0;
  output selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_1;
  output selector_MUX_185_reg_12_0_0_0;
  output selector_MUX_186_reg_13_0_0_0;
  output selector_MUX_187_reg_14_0_0_0;
  output selector_MUX_192_reg_19_0_0_0;
  output selector_MUX_193_reg_2_0_0_0;
  output selector_MUX_194_reg_20_0_0_0;
  output selector_MUX_195_reg_21_0_0_0;
  output selector_MUX_199_reg_25_0_0_0;
  output selector_MUX_237_reg_6_0_0_0;
  output selector_MUX_248_reg_7_0_0_0;
  output selector_MUX_250_reg_8_0_0_0;
  output selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0;
  output selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1;
  output selector_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0;
  output selector_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0;
  output selector_MUX_50___internal_malloc_198_i0_0_0_0;
  output selector_MUX_50___internal_malloc_198_i0_0_0_1;
  output selector_MUX_6_BMEMORY_CTRLN_114_i0_0_0_0;
  output selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_0;
  output selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_1;
  output fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free;
  output fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0_WRAPPED_PROXY_PREF___internal_free;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_15;
  output wrenable_reg_16;
  output wrenable_reg_17;
  output wrenable_reg_18;
  output wrenable_reg_19;
  output wrenable_reg_2;
  output wrenable_reg_20;
  output wrenable_reg_21;
  output wrenable_reg_22;
  output wrenable_reg_23;
  output wrenable_reg_24;
  output wrenable_reg_25;
  output wrenable_reg_26;
  output wrenable_reg_27;
  output wrenable_reg_28;
  output wrenable_reg_29;
  output wrenable_reg_3;
  output wrenable_reg_30;
  output wrenable_reg_31;
  output wrenable_reg_32;
  output wrenable_reg_33;
  output wrenable_reg_34;
  output wrenable_reg_35;
  output wrenable_reg_36;
  output wrenable_reg_37;
  output wrenable_reg_38;
  output wrenable_reg_39;
  output wrenable_reg_4;
  output wrenable_reg_40;
  output wrenable_reg_41;
  output wrenable_reg_42;
  output wrenable_reg_43;
  output wrenable_reg_44;
  output wrenable_reg_45;
  output wrenable_reg_46;
  output wrenable_reg_47;
  output wrenable_reg_48;
  output wrenable_reg_49;
  output wrenable_reg_5;
  output wrenable_reg_50;
  output wrenable_reg_51;
  output wrenable_reg_52;
  output wrenable_reg_53;
  output wrenable_reg_54;
  output wrenable_reg_55;
  output wrenable_reg_56;
  output wrenable_reg_57;
  output wrenable_reg_58;
  output wrenable_reg_59;
  output wrenable_reg_6;
  output wrenable_reg_60;
  output wrenable_reg_61;
  output wrenable_reg_62;
  output wrenable_reg_63;
  output wrenable_reg_64;
  output wrenable_reg_65;
  output wrenable_reg_66;
  output wrenable_reg_67;
  output wrenable_reg_68;
  output wrenable_reg_69;
  output wrenable_reg_7;
  output wrenable_reg_70;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [37:0] S_0 = 38'b00000000000000000000000000000000000001,
    S_1 = 38'b00000000000000000000000000000000000010,
    S_2 = 38'b00000000000000000000000000000000000100,
    S_3 = 38'b00000000000000000000000000000000001000,
    S_4 = 38'b00000000000000000000000000000000010000,
    S_5 = 38'b00000000000000000000000000000000100000,
    S_6 = 38'b00000000000000000000000000000001000000,
    S_7 = 38'b00000000000000000000000000000010000000,
    S_8 = 38'b00000000000000000000000000000100000000,
    S_9 = 38'b00000000000000000000000000001000000000,
    S_10 = 38'b00000000000000000000000000010000000000,
    S_11 = 38'b00000000000000000000000000100000000000,
    S_12 = 38'b00000000000000000000000001000000000000,
    S_13 = 38'b00000000000000000000000010000000000000,
    S_14 = 38'b00000000000000000000000100000000000000,
    S_30 = 38'b00000001000000000000000000000000000000,
    S_29 = 38'b00000000100000000000000000000000000000,
    S_27 = 38'b00000000001000000000000000000000000000,
    S_15 = 38'b00000000000000000000001000000000000000,
    S_16 = 38'b00000000000000000000010000000000000000,
    S_17 = 38'b00000000000000000000100000000000000000,
    S_18 = 38'b00000000000000000001000000000000000000,
    S_19 = 38'b00000000000000000010000000000000000000,
    S_20 = 38'b00000000000000000100000000000000000000,
    S_21 = 38'b00000000000000001000000000000000000000,
    S_22 = 38'b00000000000000010000000000000000000000,
    S_23 = 38'b00000000000000100000000000000000000000,
    S_24 = 38'b00000000000001000000000000000000000000,
    S_25 = 38'b00000000000010000000000000000000000000,
    S_26 = 38'b00000000000100000000000000000000000000,
    S_28 = 38'b00000000010000000000000000000000000000,
    S_31 = 38'b00000010000000000000000000000000000000,
    S_32 = 38'b00000100000000000000000000000000000000,
    S_33 = 38'b00001000000000000000000000000000000000,
    S_34 = 38'b00010000000000000000000000000000000000,
    S_35 = 38'b00100000000000000000000000000000000000,
    S_36 = 38'b01000000000000000000000000000000000000,
    S_37 = 38'b10000000000000000000000000000000000000;
  reg [37:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_114_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_114_i0_STORE;
  reg fuselector_BMEMORY_CTRLN_114_i1_LOAD;
  reg fuselector_BMEMORY_CTRLN_114_i1_STORE;
  reg selector_IN_UNBOUNDED_main_33671_33686;
  reg selector_IN_UNBOUNDED_main_33671_33687;
  reg selector_IN_UNBOUNDED_main_33671_33688;
  reg selector_IN_UNBOUNDED_main_33671_33746;
  reg selector_IN_UNBOUNDED_main_33671_33830;
  reg selector_IN_UNBOUNDED_main_33671_33936;
  reg selector_IN_UNBOUNDED_main_33671_33941;
  reg selector_IN_UNBOUNDED_main_33671_33943;
  reg selector_MUX_10_BMEMORY_CTRLN_114_i1_0_0_0;
  reg selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_0;
  reg selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_1;
  reg selector_MUX_185_reg_12_0_0_0;
  reg selector_MUX_186_reg_13_0_0_0;
  reg selector_MUX_187_reg_14_0_0_0;
  reg selector_MUX_192_reg_19_0_0_0;
  reg selector_MUX_193_reg_2_0_0_0;
  reg selector_MUX_194_reg_20_0_0_0;
  reg selector_MUX_195_reg_21_0_0_0;
  reg selector_MUX_199_reg_25_0_0_0;
  reg selector_MUX_237_reg_6_0_0_0;
  reg selector_MUX_248_reg_7_0_0_0;
  reg selector_MUX_250_reg_8_0_0_0;
  reg selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0;
  reg selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1;
  reg selector_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0;
  reg selector_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0;
  reg selector_MUX_50___internal_malloc_198_i0_0_0_0;
  reg selector_MUX_50___internal_malloc_198_i0_0_0_1;
  reg selector_MUX_6_BMEMORY_CTRLN_114_i0_0_0_0;
  reg selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_0;
  reg selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_1;
  reg fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free;
  reg fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0_WRAPPED_PROXY_PREF___internal_free;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
  reg wrenable_reg_15;
  reg wrenable_reg_16;
  reg wrenable_reg_17;
  reg wrenable_reg_18;
  reg wrenable_reg_19;
  reg wrenable_reg_2;
  reg wrenable_reg_20;
  reg wrenable_reg_21;
  reg wrenable_reg_22;
  reg wrenable_reg_23;
  reg wrenable_reg_24;
  reg wrenable_reg_25;
  reg wrenable_reg_26;
  reg wrenable_reg_27;
  reg wrenable_reg_28;
  reg wrenable_reg_29;
  reg wrenable_reg_3;
  reg wrenable_reg_30;
  reg wrenable_reg_31;
  reg wrenable_reg_32;
  reg wrenable_reg_33;
  reg wrenable_reg_34;
  reg wrenable_reg_35;
  reg wrenable_reg_36;
  reg wrenable_reg_37;
  reg wrenable_reg_38;
  reg wrenable_reg_39;
  reg wrenable_reg_4;
  reg wrenable_reg_40;
  reg wrenable_reg_41;
  reg wrenable_reg_42;
  reg wrenable_reg_43;
  reg wrenable_reg_44;
  reg wrenable_reg_45;
  reg wrenable_reg_46;
  reg wrenable_reg_47;
  reg wrenable_reg_48;
  reg wrenable_reg_49;
  reg wrenable_reg_5;
  reg wrenable_reg_50;
  reg wrenable_reg_51;
  reg wrenable_reg_52;
  reg wrenable_reg_53;
  reg wrenable_reg_54;
  reg wrenable_reg_55;
  reg wrenable_reg_56;
  reg wrenable_reg_57;
  reg wrenable_reg_58;
  reg wrenable_reg_59;
  reg wrenable_reg_6;
  reg wrenable_reg_60;
  reg wrenable_reg_61;
  reg wrenable_reg_62;
  reg wrenable_reg_63;
  reg wrenable_reg_64;
  reg wrenable_reg_65;
  reg wrenable_reg_66;
  reg wrenable_reg_67;
  reg wrenable_reg_68;
  reg wrenable_reg_69;
  reg wrenable_reg_7;
  reg wrenable_reg_70;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_BMEMORY_CTRLN_114_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_114_i0_STORE = 1'b0;
    fuselector_BMEMORY_CTRLN_114_i1_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_114_i1_STORE = 1'b0;
    selector_IN_UNBOUNDED_main_33671_33686 = 1'b0;
    selector_IN_UNBOUNDED_main_33671_33687 = 1'b0;
    selector_IN_UNBOUNDED_main_33671_33688 = 1'b0;
    selector_IN_UNBOUNDED_main_33671_33746 = 1'b0;
    selector_IN_UNBOUNDED_main_33671_33830 = 1'b0;
    selector_IN_UNBOUNDED_main_33671_33936 = 1'b0;
    selector_IN_UNBOUNDED_main_33671_33941 = 1'b0;
    selector_IN_UNBOUNDED_main_33671_33943 = 1'b0;
    selector_MUX_10_BMEMORY_CTRLN_114_i1_0_0_0 = 1'b0;
    selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_0 = 1'b0;
    selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_1 = 1'b0;
    selector_MUX_185_reg_12_0_0_0 = 1'b0;
    selector_MUX_186_reg_13_0_0_0 = 1'b0;
    selector_MUX_187_reg_14_0_0_0 = 1'b0;
    selector_MUX_192_reg_19_0_0_0 = 1'b0;
    selector_MUX_193_reg_2_0_0_0 = 1'b0;
    selector_MUX_194_reg_20_0_0_0 = 1'b0;
    selector_MUX_195_reg_21_0_0_0 = 1'b0;
    selector_MUX_199_reg_25_0_0_0 = 1'b0;
    selector_MUX_237_reg_6_0_0_0 = 1'b0;
    selector_MUX_248_reg_7_0_0_0 = 1'b0;
    selector_MUX_250_reg_8_0_0_0 = 1'b0;
    selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0 = 1'b0;
    selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1 = 1'b0;
    selector_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0 = 1'b0;
    selector_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0 = 1'b0;
    selector_MUX_50___internal_malloc_198_i0_0_0_0 = 1'b0;
    selector_MUX_50___internal_malloc_198_i0_0_0_1 = 1'b0;
    selector_MUX_6_BMEMORY_CTRLN_114_i0_0_0_0 = 1'b0;
    selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_0 = 1'b0;
    selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_1 = 1'b0;
    fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free = 1'b0;
    fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0_WRAPPED_PROXY_PREF___internal_free = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
    wrenable_reg_15 = 1'b0;
    wrenable_reg_16 = 1'b0;
    wrenable_reg_17 = 1'b0;
    wrenable_reg_18 = 1'b0;
    wrenable_reg_19 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_20 = 1'b0;
    wrenable_reg_21 = 1'b0;
    wrenable_reg_22 = 1'b0;
    wrenable_reg_23 = 1'b0;
    wrenable_reg_24 = 1'b0;
    wrenable_reg_25 = 1'b0;
    wrenable_reg_26 = 1'b0;
    wrenable_reg_27 = 1'b0;
    wrenable_reg_28 = 1'b0;
    wrenable_reg_29 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_30 = 1'b0;
    wrenable_reg_31 = 1'b0;
    wrenable_reg_32 = 1'b0;
    wrenable_reg_33 = 1'b0;
    wrenable_reg_34 = 1'b0;
    wrenable_reg_35 = 1'b0;
    wrenable_reg_36 = 1'b0;
    wrenable_reg_37 = 1'b0;
    wrenable_reg_38 = 1'b0;
    wrenable_reg_39 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_40 = 1'b0;
    wrenable_reg_41 = 1'b0;
    wrenable_reg_42 = 1'b0;
    wrenable_reg_43 = 1'b0;
    wrenable_reg_44 = 1'b0;
    wrenable_reg_45 = 1'b0;
    wrenable_reg_46 = 1'b0;
    wrenable_reg_47 = 1'b0;
    wrenable_reg_48 = 1'b0;
    wrenable_reg_49 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_50 = 1'b0;
    wrenable_reg_51 = 1'b0;
    wrenable_reg_52 = 1'b0;
    wrenable_reg_53 = 1'b0;
    wrenable_reg_54 = 1'b0;
    wrenable_reg_55 = 1'b0;
    wrenable_reg_56 = 1'b0;
    wrenable_reg_57 = 1'b0;
    wrenable_reg_58 = 1'b0;
    wrenable_reg_59 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_60 = 1'b0;
    wrenable_reg_61 = 1'b0;
    wrenable_reg_62 = 1'b0;
    wrenable_reg_63 = 1'b0;
    wrenable_reg_64 = 1'b0;
    wrenable_reg_65 = 1'b0;
    wrenable_reg_66 = 1'b0;
    wrenable_reg_67 = 1'b0;
    wrenable_reg_68 = 1'b0;
    wrenable_reg_69 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_70 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          selector_IN_UNBOUNDED_main_33671_33686 = 1'b1;
          wrenable_reg_0 = OUT_UNBOUNDED_main_33671_33686;
          if (OUT_UNBOUNDED_main_33671_33686 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_2;
            end
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          wrenable_reg_0 = OUT_UNBOUNDED_main_33671_33686;
          if (OUT_UNBOUNDED_main_33671_33686 == 1'b0)
            begin
              _next_state = S_1;
            end
          else
            begin
              _next_state = S_2;
            end
        end
      S_2 :
        begin
          selector_IN_UNBOUNDED_main_33671_33687 = 1'b1;
          selector_MUX_193_reg_2_0_0_0 = 1'b1;
          selector_MUX_50___internal_malloc_198_i0_0_0_0 = 1'b1;
          wrenable_reg_1 = OUT_UNBOUNDED_main_33671_33687;
          wrenable_reg_2 = 1'b1;
          if (OUT_UNBOUNDED_main_33671_33687 == 1'b0)
            begin
              _next_state = S_3;
            end
          else
            begin
              _next_state = S_4;
            end
        end
      S_3 :
        begin
          selector_MUX_50___internal_malloc_198_i0_0_0_0 = 1'b1;
          wrenable_reg_1 = OUT_UNBOUNDED_main_33671_33687;
          if (OUT_UNBOUNDED_main_33671_33687 == 1'b0)
            begin
              _next_state = S_3;
            end
          else
            begin
              _next_state = S_4;
            end
        end
      S_4 :
        begin
          selector_IN_UNBOUNDED_main_33671_33688 = 1'b1;
          selector_MUX_50___internal_malloc_198_i0_0_0_1 = 1'b1;
          wrenable_reg_3 = OUT_UNBOUNDED_main_33671_33688;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          if (OUT_UNBOUNDED_main_33671_33688 == 1'b0)
            begin
              _next_state = S_5;
            end
          else
            begin
              _next_state = S_6;
            end
        end
      S_5 :
        begin
          selector_MUX_50___internal_malloc_198_i0_0_0_1 = 1'b1;
          wrenable_reg_3 = OUT_UNBOUNDED_main_33671_33688;
          if (OUT_UNBOUNDED_main_33671_33688 == 1'b0)
            begin
              _next_state = S_5;
            end
          else
            begin
              _next_state = S_6;
            end
        end
      S_6 :
        begin
          selector_MUX_248_reg_7_0_0_0 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          _next_state = S_7;
        end
      S_7 :
        begin
          fuselector_BMEMORY_CTRLN_114_i1_STORE = 1'b1;
          selector_IN_UNBOUNDED_main_33671_33746 = 1'b1;
          selector_MUX_10_BMEMORY_CTRLN_114_i1_0_0_0 = 1'b1;
          selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_0 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_8;
        end
      S_8 :
        begin
          _next_state = S_9;
        end
      S_9 :
        begin
          _next_state = S_10;
        end
      S_10 :
        begin
          _next_state = S_11;
        end
      S_11 :
        begin
          selector_MUX_237_reg_6_0_0_0 = 1'b1;
          wrenable_reg_6 = 1'b1;
          if (OUT_CONDITION_main_33671_33748 == 1'b1)
            begin
              _next_state = S_7;
            end
          else
            begin
              _next_state = S_12;
              selector_MUX_237_reg_6_0_0_0 = 1'b0;
              wrenable_reg_6 = 1'b0;
            end
        end
      S_12 :
        begin
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          _next_state = S_13;
        end
      S_13 :
        begin
          fuselector_BMEMORY_CTRLN_114_i0_STORE = 1'b1;
          selector_MUX_185_reg_12_0_0_0 = 1'b1;
          selector_MUX_6_BMEMORY_CTRLN_114_i0_0_0_0 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_2 = 1'b1;
          if (OUT_CONDITION_main_33671_33783 == 1'b1)
            begin
              _next_state = S_13;
              selector_MUX_185_reg_12_0_0_0 = 1'b0;
              wrenable_reg_12 = 1'b0;
            end
          else
            begin
              _next_state = S_14;
              wrenable_reg_2 = 1'b0;
            end
        end
      S_14 :
        begin
          fuselector_BMEMORY_CTRLN_114_i1_STORE = 1'b1;
          selector_MUX_186_reg_13_0_0_0 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          if (OUT_CONDITION_main_33671_33811 == 1'b1)
            begin
              _next_state = S_14;
              selector_MUX_186_reg_13_0_0_0 = 1'b0;
              wrenable_reg_13 = 1'b0;
            end
          else
            begin
              _next_state = S_30;
              wrenable_reg_12 = 1'b0;
            end
        end
      S_30 :
        begin
          selector_MUX_187_reg_14_0_0_0 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          _next_state = S_29;
        end
      S_29 :
        begin
          selector_MUX_194_reg_20_0_0_0 = 1'b1;
          selector_MUX_195_reg_21_0_0_0 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          _next_state = S_27;
        end
      S_27 :
        begin
          selector_MUX_199_reg_25_0_0_0 = 1'b1;
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_27 = 1'b1;
          _next_state = S_15;
        end
      S_15 :
        begin
          fuselector_BMEMORY_CTRLN_114_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_114_i1_LOAD = 1'b1;
          selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_1 = 1'b1;
          selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_1 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_28 = 1'b1;
          _next_state = S_16;
        end
      S_16 :
        begin
          wrenable_reg_29 = 1'b1;
          wrenable_reg_30 = 1'b1;
          wrenable_reg_31 = 1'b1;
          wrenable_reg_32 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_37 = 1'b1;
          wrenable_reg_38 = 1'b1;
          wrenable_reg_39 = 1'b1;
          wrenable_reg_40 = 1'b1;
          wrenable_reg_41 = 1'b1;
          wrenable_reg_42 = 1'b1;
          wrenable_reg_43 = 1'b1;
          wrenable_reg_44 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_47 = 1'b1;
          wrenable_reg_48 = 1'b1;
          wrenable_reg_49 = 1'b1;
          wrenable_reg_50 = 1'b1;
          wrenable_reg_51 = 1'b1;
          wrenable_reg_52 = 1'b1;
          wrenable_reg_53 = 1'b1;
          wrenable_reg_54 = 1'b1;
          wrenable_reg_55 = 1'b1;
          wrenable_reg_56 = 1'b1;
          _next_state = S_17;
        end
      S_17 :
        begin
          wrenable_reg_57 = 1'b1;
          wrenable_reg_58 = 1'b1;
          wrenable_reg_59 = 1'b1;
          wrenable_reg_60 = 1'b1;
          wrenable_reg_61 = 1'b1;
          _next_state = S_18;
        end
      S_18 :
        begin
          wrenable_reg_62 = 1'b1;
          wrenable_reg_63 = 1'b1;
          wrenable_reg_64 = 1'b1;
          wrenable_reg_65 = 1'b1;
          wrenable_reg_66 = 1'b1;
          _next_state = S_19;
        end
      S_19 :
        begin
          wrenable_reg_67 = 1'b1;
          wrenable_reg_68 = 1'b1;
          wrenable_reg_69 = 1'b1;
          _next_state = S_20;
        end
      S_20 :
        begin
          wrenable_reg_70 = 1'b1;
          _next_state = S_21;
        end
      S_21 :
        begin
          selector_IN_UNBOUNDED_main_33671_33830 = 1'b1;
          selector_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0 = 1'b1;
          selector_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0 = 1'b1;
          _next_state = S_22;
        end
      S_22 :
        begin
          selector_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0 = 1'b1;
          selector_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0 = 1'b1;
          _next_state = S_23;
        end
      S_23 :
        begin
          selector_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0 = 1'b1;
          selector_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0 = 1'b1;
          _next_state = S_24;
        end
      S_24 :
        begin
          selector_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0 = 1'b1;
          selector_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0 = 1'b1;
          _next_state = S_25;
        end
      S_25 :
        begin
          selector_MUX_192_reg_19_0_0_0 = 1'b1;
          selector_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0 = 1'b1;
          selector_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0 = 1'b1;
          wrenable_reg_19 = 1'b1;
          if (OUT_CONDITION_main_33671_33832 == 1'b1)
            begin
              _next_state = S_15;
            end
          else
            begin
              _next_state = S_26;
            end
        end
      S_26 :
        begin
          if (OUT_CONDITION_main_33671_33962 == 1'b1)
            begin
              _next_state = S_27;
            end
          else
            begin
              _next_state = S_28;
            end
        end
      S_28 :
        begin
          fuselector_BMEMORY_CTRLN_114_i0_STORE = 1'b1;
          selector_MUX_250_reg_8_0_0_0 = 1'b1;
          selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_0 = 1'b1;
          wrenable_reg_8 = 1'b1;
          casez (OUT_MULTIIF_main_33671_42333)
            2'b?1 :
              begin
                _next_state = S_29;
                selector_MUX_250_reg_8_0_0_0 = 1'b0;
                wrenable_reg_8 = 1'b0;
              end
            2'b10 :
              begin
                _next_state = S_30;
              end
            default:
              begin
                _next_state = S_31;
                selector_MUX_250_reg_8_0_0_0 = 1'b0;
                wrenable_reg_8 = 1'b0;
              end
          endcase
        end
      S_31 :
        begin
          selector_IN_UNBOUNDED_main_33671_33936 = 1'b1;
          selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1 = 1'b1;
          fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free = 1'b1;
          if (OUT_UNBOUNDED_main_33671_33936 == 1'b0)
            begin
              _next_state = S_32;
            end
          else
            begin
              _next_state = S_33;
            end
        end
      S_32 :
        begin
          selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1 = 1'b1;
          fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free = 1'b1;
          if (OUT_UNBOUNDED_main_33671_33936 == 1'b0)
            begin
              _next_state = S_32;
            end
          else
            begin
              _next_state = S_33;
            end
        end
      S_33 :
        begin
          selector_IN_UNBOUNDED_main_33671_33941 = 1'b1;
          selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0 = 1'b1;
          fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free = 1'b1;
          if (OUT_UNBOUNDED_main_33671_33941 == 1'b0)
            begin
              _next_state = S_34;
            end
          else
            begin
              _next_state = S_35;
            end
        end
      S_34 :
        begin
          selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0 = 1'b1;
          fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free = 1'b1;
          if (OUT_UNBOUNDED_main_33671_33941 == 1'b0)
            begin
              _next_state = S_34;
            end
          else
            begin
              _next_state = S_35;
            end
        end
      S_35 :
        begin
          selector_IN_UNBOUNDED_main_33671_33943 = 1'b1;
          fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free = 1'b1;
          if (OUT_UNBOUNDED_main_33671_33943 == 1'b0)
            begin
              _next_state = S_36;
            end
          else
            begin
              _next_state = S_37;
              done_port = 1'b1;
            end
        end
      S_36 :
        begin
          fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free = 1'b1;
          if (OUT_UNBOUNDED_main_33671_33943 == 1'b0)
            begin
              _next_state = S_36;
            end
          else
            begin
              _next_state = S_37;
              done_port = 1'b1;
            end
        end
      S_37 :
        begin
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// Top component for main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _main(clock,
  reset,
  start_port,
  done_port,
  return_port,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  S_data_ram_size,
  M_Rdata_ram,
  M_DataRdy,
  Sin_Rdata_ram,
  Sin_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Sout_Rdata_ram,
  Sout_DataRdy,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  // IN
  input clock;
  input reset;
  input start_port;
  input [1:0] S_oe_ram;
  input [1:0] S_we_ram;
  input [41:0] S_addr_ram;
  input [127:0] S_Wdata_ram;
  input [13:0] S_data_ram_size;
  input [127:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [127:0] Sin_Rdata_ram;
  input [1:0] Sin_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [41:0] Min_addr_ram;
  input [127:0] Min_Wdata_ram;
  input [13:0] Min_data_ram_size;
  // OUT
  output done_port;
  output signed [31:0] return_port;
  output [127:0] Sout_Rdata_ram;
  output [1:0] Sout_DataRdy;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [41:0] Mout_addr_ram;
  output [127:0] Mout_Wdata_ram;
  output [13:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION_main_33671_33748;
  wire OUT_CONDITION_main_33671_33783;
  wire OUT_CONDITION_main_33671_33811;
  wire OUT_CONDITION_main_33671_33832;
  wire OUT_CONDITION_main_33671_33962;
  wire [1:0] OUT_MULTIIF_main_33671_42333;
  wire OUT_UNBOUNDED_main_33671_33686;
  wire OUT_UNBOUNDED_main_33671_33687;
  wire OUT_UNBOUNDED_main_33671_33688;
  wire OUT_UNBOUNDED_main_33671_33746;
  wire OUT_UNBOUNDED_main_33671_33830;
  wire OUT_UNBOUNDED_main_33671_33936;
  wire OUT_UNBOUNDED_main_33671_33941;
  wire OUT_UNBOUNDED_main_33671_33943;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_114_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_114_i0_STORE;
  wire fuselector_BMEMORY_CTRLN_114_i1_LOAD;
  wire fuselector_BMEMORY_CTRLN_114_i1_STORE;
  wire fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0_WRAPPED_PROXY_PREF___internal_free;
  wire fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free;
  wire selector_IN_UNBOUNDED_main_33671_33686;
  wire selector_IN_UNBOUNDED_main_33671_33687;
  wire selector_IN_UNBOUNDED_main_33671_33688;
  wire selector_IN_UNBOUNDED_main_33671_33746;
  wire selector_IN_UNBOUNDED_main_33671_33830;
  wire selector_IN_UNBOUNDED_main_33671_33936;
  wire selector_IN_UNBOUNDED_main_33671_33941;
  wire selector_IN_UNBOUNDED_main_33671_33943;
  wire selector_MUX_10_BMEMORY_CTRLN_114_i1_0_0_0;
  wire selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_0;
  wire selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_1;
  wire selector_MUX_185_reg_12_0_0_0;
  wire selector_MUX_186_reg_13_0_0_0;
  wire selector_MUX_187_reg_14_0_0_0;
  wire selector_MUX_192_reg_19_0_0_0;
  wire selector_MUX_193_reg_2_0_0_0;
  wire selector_MUX_194_reg_20_0_0_0;
  wire selector_MUX_195_reg_21_0_0_0;
  wire selector_MUX_199_reg_25_0_0_0;
  wire selector_MUX_237_reg_6_0_0_0;
  wire selector_MUX_248_reg_7_0_0_0;
  wire selector_MUX_250_reg_8_0_0_0;
  wire selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0;
  wire selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1;
  wire selector_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0;
  wire selector_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0;
  wire selector_MUX_50___internal_malloc_198_i0_0_0_0;
  wire selector_MUX_50___internal_malloc_198_i0_0_0_1;
  wire selector_MUX_6_BMEMORY_CTRLN_114_i0_0_0_0;
  wire selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_0;
  wire selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_1;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_15;
  wire wrenable_reg_16;
  wire wrenable_reg_17;
  wire wrenable_reg_18;
  wire wrenable_reg_19;
  wire wrenable_reg_2;
  wire wrenable_reg_20;
  wire wrenable_reg_21;
  wire wrenable_reg_22;
  wire wrenable_reg_23;
  wire wrenable_reg_24;
  wire wrenable_reg_25;
  wire wrenable_reg_26;
  wire wrenable_reg_27;
  wire wrenable_reg_28;
  wire wrenable_reg_29;
  wire wrenable_reg_3;
  wire wrenable_reg_30;
  wire wrenable_reg_31;
  wire wrenable_reg_32;
  wire wrenable_reg_33;
  wire wrenable_reg_34;
  wire wrenable_reg_35;
  wire wrenable_reg_36;
  wire wrenable_reg_37;
  wire wrenable_reg_38;
  wire wrenable_reg_39;
  wire wrenable_reg_4;
  wire wrenable_reg_40;
  wire wrenable_reg_41;
  wire wrenable_reg_42;
  wire wrenable_reg_43;
  wire wrenable_reg_44;
  wire wrenable_reg_45;
  wire wrenable_reg_46;
  wire wrenable_reg_47;
  wire wrenable_reg_48;
  wire wrenable_reg_49;
  wire wrenable_reg_5;
  wire wrenable_reg_50;
  wire wrenable_reg_51;
  wire wrenable_reg_52;
  wire wrenable_reg_53;
  wire wrenable_reg_54;
  wire wrenable_reg_55;
  wire wrenable_reg_56;
  wire wrenable_reg_57;
  wire wrenable_reg_58;
  wire wrenable_reg_59;
  wire wrenable_reg_6;
  wire wrenable_reg_60;
  wire wrenable_reg_61;
  wire wrenable_reg_62;
  wire wrenable_reg_63;
  wire wrenable_reg_64;
  wire wrenable_reg_65;
  wire wrenable_reg_66;
  wire wrenable_reg_67;
  wire wrenable_reg_68;
  wire wrenable_reg_69;
  wire wrenable_reg_7;
  wire wrenable_reg_70;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_main Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_114_i0_LOAD(fuselector_BMEMORY_CTRLN_114_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_114_i0_STORE(fuselector_BMEMORY_CTRLN_114_i0_STORE),
    .fuselector_BMEMORY_CTRLN_114_i1_LOAD(fuselector_BMEMORY_CTRLN_114_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_114_i1_STORE(fuselector_BMEMORY_CTRLN_114_i1_STORE),
    .selector_IN_UNBOUNDED_main_33671_33686(selector_IN_UNBOUNDED_main_33671_33686),
    .selector_IN_UNBOUNDED_main_33671_33687(selector_IN_UNBOUNDED_main_33671_33687),
    .selector_IN_UNBOUNDED_main_33671_33688(selector_IN_UNBOUNDED_main_33671_33688),
    .selector_IN_UNBOUNDED_main_33671_33746(selector_IN_UNBOUNDED_main_33671_33746),
    .selector_IN_UNBOUNDED_main_33671_33830(selector_IN_UNBOUNDED_main_33671_33830),
    .selector_IN_UNBOUNDED_main_33671_33936(selector_IN_UNBOUNDED_main_33671_33936),
    .selector_IN_UNBOUNDED_main_33671_33941(selector_IN_UNBOUNDED_main_33671_33941),
    .selector_IN_UNBOUNDED_main_33671_33943(selector_IN_UNBOUNDED_main_33671_33943),
    .selector_MUX_10_BMEMORY_CTRLN_114_i1_0_0_0(selector_MUX_10_BMEMORY_CTRLN_114_i1_0_0_0),
    .selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_0(selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_0),
    .selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_1(selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_1),
    .selector_MUX_185_reg_12_0_0_0(selector_MUX_185_reg_12_0_0_0),
    .selector_MUX_186_reg_13_0_0_0(selector_MUX_186_reg_13_0_0_0),
    .selector_MUX_187_reg_14_0_0_0(selector_MUX_187_reg_14_0_0_0),
    .selector_MUX_192_reg_19_0_0_0(selector_MUX_192_reg_19_0_0_0),
    .selector_MUX_193_reg_2_0_0_0(selector_MUX_193_reg_2_0_0_0),
    .selector_MUX_194_reg_20_0_0_0(selector_MUX_194_reg_20_0_0_0),
    .selector_MUX_195_reg_21_0_0_0(selector_MUX_195_reg_21_0_0_0),
    .selector_MUX_199_reg_25_0_0_0(selector_MUX_199_reg_25_0_0_0),
    .selector_MUX_237_reg_6_0_0_0(selector_MUX_237_reg_6_0_0_0),
    .selector_MUX_248_reg_7_0_0_0(selector_MUX_248_reg_7_0_0_0),
    .selector_MUX_250_reg_8_0_0_0(selector_MUX_250_reg_8_0_0_0),
    .selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0(selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0),
    .selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1(selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1),
    .selector_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0(selector_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0),
    .selector_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0(selector_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0),
    .selector_MUX_50___internal_malloc_198_i0_0_0_0(selector_MUX_50___internal_malloc_198_i0_0_0_0),
    .selector_MUX_50___internal_malloc_198_i0_0_0_1(selector_MUX_50___internal_malloc_198_i0_0_0_1),
    .selector_MUX_6_BMEMORY_CTRLN_114_i0_0_0_0(selector_MUX_6_BMEMORY_CTRLN_114_i0_0_0_0),
    .selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_0(selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_0),
    .selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_1(selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_1),
    .fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free(fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free),
    .fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0_WRAPPED_PROXY_PREF___internal_free(fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0_WRAPPED_PROXY_PREF___internal_free),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_32(wrenable_reg_32),
    .wrenable_reg_33(wrenable_reg_33),
    .wrenable_reg_34(wrenable_reg_34),
    .wrenable_reg_35(wrenable_reg_35),
    .wrenable_reg_36(wrenable_reg_36),
    .wrenable_reg_37(wrenable_reg_37),
    .wrenable_reg_38(wrenable_reg_38),
    .wrenable_reg_39(wrenable_reg_39),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_40(wrenable_reg_40),
    .wrenable_reg_41(wrenable_reg_41),
    .wrenable_reg_42(wrenable_reg_42),
    .wrenable_reg_43(wrenable_reg_43),
    .wrenable_reg_44(wrenable_reg_44),
    .wrenable_reg_45(wrenable_reg_45),
    .wrenable_reg_46(wrenable_reg_46),
    .wrenable_reg_47(wrenable_reg_47),
    .wrenable_reg_48(wrenable_reg_48),
    .wrenable_reg_49(wrenable_reg_49),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_50(wrenable_reg_50),
    .wrenable_reg_51(wrenable_reg_51),
    .wrenable_reg_52(wrenable_reg_52),
    .wrenable_reg_53(wrenable_reg_53),
    .wrenable_reg_54(wrenable_reg_54),
    .wrenable_reg_55(wrenable_reg_55),
    .wrenable_reg_56(wrenable_reg_56),
    .wrenable_reg_57(wrenable_reg_57),
    .wrenable_reg_58(wrenable_reg_58),
    .wrenable_reg_59(wrenable_reg_59),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_60(wrenable_reg_60),
    .wrenable_reg_61(wrenable_reg_61),
    .wrenable_reg_62(wrenable_reg_62),
    .wrenable_reg_63(wrenable_reg_63),
    .wrenable_reg_64(wrenable_reg_64),
    .wrenable_reg_65(wrenable_reg_65),
    .wrenable_reg_66(wrenable_reg_66),
    .wrenable_reg_67(wrenable_reg_67),
    .wrenable_reg_68(wrenable_reg_68),
    .wrenable_reg_69(wrenable_reg_69),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_70(wrenable_reg_70),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION_main_33671_33748(OUT_CONDITION_main_33671_33748),
    .OUT_CONDITION_main_33671_33783(OUT_CONDITION_main_33671_33783),
    .OUT_CONDITION_main_33671_33811(OUT_CONDITION_main_33671_33811),
    .OUT_CONDITION_main_33671_33832(OUT_CONDITION_main_33671_33832),
    .OUT_CONDITION_main_33671_33962(OUT_CONDITION_main_33671_33962),
    .OUT_MULTIIF_main_33671_42333(OUT_MULTIIF_main_33671_42333),
    .OUT_UNBOUNDED_main_33671_33686(OUT_UNBOUNDED_main_33671_33686),
    .OUT_UNBOUNDED_main_33671_33687(OUT_UNBOUNDED_main_33671_33687),
    .OUT_UNBOUNDED_main_33671_33688(OUT_UNBOUNDED_main_33671_33688),
    .OUT_UNBOUNDED_main_33671_33746(OUT_UNBOUNDED_main_33671_33746),
    .OUT_UNBOUNDED_main_33671_33830(OUT_UNBOUNDED_main_33671_33830),
    .OUT_UNBOUNDED_main_33671_33936(OUT_UNBOUNDED_main_33671_33936),
    .OUT_UNBOUNDED_main_33671_33941(OUT_UNBOUNDED_main_33671_33941),
    .OUT_UNBOUNDED_main_33671_33943(OUT_UNBOUNDED_main_33671_33943),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_main #(.MEM_var_1020_33671(1048576),
    .MEM_var_792_33671(524288),
    .MEM_var_796_33671(524288),
    .MEM_var_992_33671(524288)) Datapath_i (.return_port(return_port),
    .Sout_Rdata_ram(Sout_Rdata_ram),
    .Sout_DataRdy(Sout_DataRdy),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION_main_33671_33748(OUT_CONDITION_main_33671_33748),
    .OUT_CONDITION_main_33671_33783(OUT_CONDITION_main_33671_33783),
    .OUT_CONDITION_main_33671_33811(OUT_CONDITION_main_33671_33811),
    .OUT_CONDITION_main_33671_33832(OUT_CONDITION_main_33671_33832),
    .OUT_CONDITION_main_33671_33962(OUT_CONDITION_main_33671_33962),
    .OUT_MULTIIF_main_33671_42333(OUT_MULTIIF_main_33671_42333),
    .OUT_UNBOUNDED_main_33671_33686(OUT_UNBOUNDED_main_33671_33686),
    .OUT_UNBOUNDED_main_33671_33687(OUT_UNBOUNDED_main_33671_33687),
    .OUT_UNBOUNDED_main_33671_33688(OUT_UNBOUNDED_main_33671_33688),
    .OUT_UNBOUNDED_main_33671_33746(OUT_UNBOUNDED_main_33671_33746),
    .OUT_UNBOUNDED_main_33671_33830(OUT_UNBOUNDED_main_33671_33830),
    .OUT_UNBOUNDED_main_33671_33936(OUT_UNBOUNDED_main_33671_33936),
    .OUT_UNBOUNDED_main_33671_33941(OUT_UNBOUNDED_main_33671_33941),
    .OUT_UNBOUNDED_main_33671_33943(OUT_UNBOUNDED_main_33671_33943),
    .clock(clock),
    .reset(reset),
    .S_oe_ram(S_oe_ram),
    .S_we_ram(S_we_ram),
    .S_addr_ram(S_addr_ram),
    .S_Wdata_ram(S_Wdata_ram),
    .S_data_ram_size(S_data_ram_size),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Sin_Rdata_ram(Sin_Rdata_ram),
    .Sin_DataRdy(Sin_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_114_i0_LOAD(fuselector_BMEMORY_CTRLN_114_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_114_i0_STORE(fuselector_BMEMORY_CTRLN_114_i0_STORE),
    .fuselector_BMEMORY_CTRLN_114_i1_LOAD(fuselector_BMEMORY_CTRLN_114_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_114_i1_STORE(fuselector_BMEMORY_CTRLN_114_i1_STORE),
    .selector_IN_UNBOUNDED_main_33671_33686(selector_IN_UNBOUNDED_main_33671_33686),
    .selector_IN_UNBOUNDED_main_33671_33687(selector_IN_UNBOUNDED_main_33671_33687),
    .selector_IN_UNBOUNDED_main_33671_33688(selector_IN_UNBOUNDED_main_33671_33688),
    .selector_IN_UNBOUNDED_main_33671_33746(selector_IN_UNBOUNDED_main_33671_33746),
    .selector_IN_UNBOUNDED_main_33671_33830(selector_IN_UNBOUNDED_main_33671_33830),
    .selector_IN_UNBOUNDED_main_33671_33936(selector_IN_UNBOUNDED_main_33671_33936),
    .selector_IN_UNBOUNDED_main_33671_33941(selector_IN_UNBOUNDED_main_33671_33941),
    .selector_IN_UNBOUNDED_main_33671_33943(selector_IN_UNBOUNDED_main_33671_33943),
    .selector_MUX_10_BMEMORY_CTRLN_114_i1_0_0_0(selector_MUX_10_BMEMORY_CTRLN_114_i1_0_0_0),
    .selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_0(selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_0),
    .selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_1(selector_MUX_11_BMEMORY_CTRLN_114_i1_1_0_1),
    .selector_MUX_185_reg_12_0_0_0(selector_MUX_185_reg_12_0_0_0),
    .selector_MUX_186_reg_13_0_0_0(selector_MUX_186_reg_13_0_0_0),
    .selector_MUX_187_reg_14_0_0_0(selector_MUX_187_reg_14_0_0_0),
    .selector_MUX_192_reg_19_0_0_0(selector_MUX_192_reg_19_0_0_0),
    .selector_MUX_193_reg_2_0_0_0(selector_MUX_193_reg_2_0_0_0),
    .selector_MUX_194_reg_20_0_0_0(selector_MUX_194_reg_20_0_0_0),
    .selector_MUX_195_reg_21_0_0_0(selector_MUX_195_reg_21_0_0_0),
    .selector_MUX_199_reg_25_0_0_0(selector_MUX_199_reg_25_0_0_0),
    .selector_MUX_237_reg_6_0_0_0(selector_MUX_237_reg_6_0_0_0),
    .selector_MUX_248_reg_7_0_0_0(selector_MUX_248_reg_7_0_0_0),
    .selector_MUX_250_reg_8_0_0_0(selector_MUX_250_reg_8_0_0_0),
    .selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0(selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_0),
    .selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1(selector_MUX_47_WRAPPED_PROXY_PREF___internal_free_4_i0_0_0_1),
    .selector_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0(selector_MUX_48___float_adde11m52b_1023nih_197_i0_0_0_0),
    .selector_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0(selector_MUX_49___float_adde11m52b_1023nih_197_i0_1_0_0),
    .selector_MUX_50___internal_malloc_198_i0_0_0_0(selector_MUX_50___internal_malloc_198_i0_0_0_0),
    .selector_MUX_50___internal_malloc_198_i0_0_0_1(selector_MUX_50___internal_malloc_198_i0_0_0_1),
    .selector_MUX_6_BMEMORY_CTRLN_114_i0_0_0_0(selector_MUX_6_BMEMORY_CTRLN_114_i0_0_0_0),
    .selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_0(selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_0),
    .selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_1(selector_MUX_7_BMEMORY_CTRLN_114_i0_1_0_1),
    .fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free(fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0___internal_free),
    .fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0_WRAPPED_PROXY_PREF___internal_free(fuselector_WRAPPED_PROXY_PREF___internal_free_4_i0_WRAPPED_PROXY_PREF___internal_free),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_32(wrenable_reg_32),
    .wrenable_reg_33(wrenable_reg_33),
    .wrenable_reg_34(wrenable_reg_34),
    .wrenable_reg_35(wrenable_reg_35),
    .wrenable_reg_36(wrenable_reg_36),
    .wrenable_reg_37(wrenable_reg_37),
    .wrenable_reg_38(wrenable_reg_38),
    .wrenable_reg_39(wrenable_reg_39),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_40(wrenable_reg_40),
    .wrenable_reg_41(wrenable_reg_41),
    .wrenable_reg_42(wrenable_reg_42),
    .wrenable_reg_43(wrenable_reg_43),
    .wrenable_reg_44(wrenable_reg_44),
    .wrenable_reg_45(wrenable_reg_45),
    .wrenable_reg_46(wrenable_reg_46),
    .wrenable_reg_47(wrenable_reg_47),
    .wrenable_reg_48(wrenable_reg_48),
    .wrenable_reg_49(wrenable_reg_49),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_50(wrenable_reg_50),
    .wrenable_reg_51(wrenable_reg_51),
    .wrenable_reg_52(wrenable_reg_52),
    .wrenable_reg_53(wrenable_reg_53),
    .wrenable_reg_54(wrenable_reg_54),
    .wrenable_reg_55(wrenable_reg_55),
    .wrenable_reg_56(wrenable_reg_56),
    .wrenable_reg_57(wrenable_reg_57),
    .wrenable_reg_58(wrenable_reg_58),
    .wrenable_reg_59(wrenable_reg_59),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_60(wrenable_reg_60),
    .wrenable_reg_61(wrenable_reg_61),
    .wrenable_reg_62(wrenable_reg_62),
    .wrenable_reg_63(wrenable_reg_63),
    .wrenable_reg_64(wrenable_reg_64),
    .wrenable_reg_65(wrenable_reg_65),
    .wrenable_reg_66(wrenable_reg_66),
    .wrenable_reg_67(wrenable_reg_67),
    .wrenable_reg_68(wrenable_reg_68),
    .wrenable_reg_69(wrenable_reg_69),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_70(wrenable_reg_70),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module view_convert_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// Minimal interface for function: main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module main(clock,
  reset,
  start_port,
  done_port,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output [31:0] return_port;
  // Component and signal declarations
  wire [1:0] M_DataRdy_INT;
  wire [127:0] M_Rdata_ram_INT;
  wire [127:0] S_Wdata_ram_INT;
  wire [41:0] S_addr_ram_INT;
  wire [13:0] S_data_ram_size_INT;
  wire [1:0] S_oe_ram_INT;
  wire [1:0] S_we_ram_INT;
  wire signed [31:0] out_return_port_view_convert_expr_FU;
  
  _main _main_i0 (.done_port(done_port),
    .return_port(out_return_port_view_convert_expr_FU),
    .Sout_Rdata_ram(M_Rdata_ram_INT),
    .Sout_DataRdy(M_DataRdy_INT),
    .Mout_oe_ram(S_oe_ram_INT),
    .Mout_we_ram(S_we_ram_INT),
    .Mout_addr_ram(S_addr_ram_INT),
    .Mout_Wdata_ram(S_Wdata_ram_INT),
    .Mout_data_ram_size(S_data_ram_size_INT),
    .clock(clock),
    .reset(reset),
    .start_port(start_port),
    .S_oe_ram(S_oe_ram_INT),
    .S_we_ram(S_we_ram_INT),
    .S_addr_ram(S_addr_ram_INT),
    .S_Wdata_ram(S_Wdata_ram_INT),
    .S_data_ram_size(S_data_ram_size_INT),
    .M_Rdata_ram(M_Rdata_ram_INT),
    .M_DataRdy(M_DataRdy_INT),
    .Sin_Rdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .Min_oe_ram({1'b0,
      1'b0}),
    .Min_we_ram({1'b0,
      1'b0}),
    .Min_addr_ram({21'b000000000000000000000,
      21'b000000000000000000000}),
    .Min_Wdata_ram({64'b0000000000000000000000000000000000000000000000000000000000000000,
      64'b0000000000000000000000000000000000000000000000000000000000000000}),
    .Min_data_ram_size({7'b0000000,
      7'b0000000}));
  view_convert_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) return_port_view_convert_expr_FU (.out1(return_port),
    .in1(out_return_port_view_convert_expr_FU));

endmodule


