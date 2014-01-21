/*

  memory_controller.v
  
  Represents a memory controller for RAM. Provides functions like:
  - read an instruction at PC address
  - decode the instruction to control the following RAM access
  -- read/write data at specified address 
  -- byte alighment and mask for byte/half-word load/store instructions
  
  */

`include "src/defines.v"

module memory_controller (
  input clk_cpu,
  input reset,
  input [`WORD] pc,
  input [`WORD] adrs,
  input [`WORD] data,
  input [`WORD] inst, // TODO change to output later
  output [`WORD] q
);

  // registers as RAM (the number of words is defined by `N_RAM)
  reg [`WORD] ram[0:`N_RAM - 1];
  
  // memory access controls
  reg [3:0] mem_ctrl;
  `define MEM_SIGN    0:0
  `define MEM_SIGN_x  1'bx
  `define MEM_SIGN_F  1'b0
  `define MEM_SIGN_T  1'b1
  `define MEM_WIDTH   2:1
  `define MEM_WIDTH_x 2'bxx
  `define MEM_WIDTH_W 2'b00
  `define MEM_WIDTH_H 2'b01
  `define MEM_WIDTH_B 2'b10
  `define MEM_RW      3:3
  `define MEM_RW_x    1'bx
  `define MEM_RW_R    1'b0
  `define MEM_RW_W    1'b1
  
  // read and decode an instruction
//  assign inst = ram[pc >> 2];
  always_comb begin
    case(inst[`I_OP])
      `OP_lb:   mem_ctrl = {`MEM_RW_R, `MEM_WIDTH_B, `MEM_SIGN_T};
      `OP_lh:   mem_ctrl = {`MEM_RW_R, `MEM_WIDTH_H, `MEM_SIGN_T};
      `OP_lw:   mem_ctrl = {`MEM_RW_R, `MEM_WIDTH_W, `MEM_SIGN_T};
      `OP_lbu:  mem_ctrl = {`MEM_RW_R, `MEM_WIDTH_B, `MEM_SIGN_F};
      `OP_lhu:  mem_ctrl = {`MEM_RW_R, `MEM_WIDTH_H, `MEM_SIGN_F};
      `OP_sb:   mem_ctrl = {`MEM_RW_W, `MEM_WIDTH_B, `MEM_SIGN_x};
      `OP_sh:   mem_ctrl = {`MEM_RW_W, `MEM_WIDTH_H, `MEM_SIGN_x};
      `OP_sw:   mem_ctrl = {`MEM_RW_W, `MEM_WIDTH_W, `MEM_SIGN_x};
      default:  mem_ctrl = {`MEM_RW_x, `MEM_WIDTH_x, `MEM_SIGN_x};
    endcase
  end
  
  // read data alignment and sign extension
  wire [15:0] word_adrs = adrs >> 2;
  wire [4:0] align_amt = adrs[1:0] << 3;
  wire [`WORD] aligned_rd_data = ram[word_adrs] >> align_amt;
  assign q =
    mem_ctrl[`MEM_WIDTH] === `MEM_WIDTH_W ? aligned_rd_data :
    mem_ctrl[`MEM_WIDTH] === `MEM_WIDTH_H ? {{16{aligned_rd_data[15] & mem_ctrl[`MEM_SIGN]}}, aligned_rd_data[15:0]} :
    mem_ctrl[`MEM_WIDTH] === `MEM_WIDTH_B ? {{24{aligned_rd_data[7] & mem_ctrl[`MEM_SIGN]}}, aligned_rd_data[7:0]} :
    32'bx;

  // write data alignment and overwrite to existing word
  wire [`WORD] aligned_wr_data = data << align_amt;
  wire [`WORD] wr_mask =
    mem_ctrl[`MEM_WIDTH] === `MEM_WIDTH_W ? 32'hffffffff :
    mem_ctrl[`MEM_WIDTH] === `MEM_WIDTH_H ? 32'h0000ffff :
    mem_ctrl[`MEM_WIDTH] === `MEM_WIDTH_B ? 32'h000000ff :
    32'bx;  
  wire [`WORD] aligned_mask = ~(wr_mask << align_amt);
  wire [`WORD] wr_data = (ram[word_adrs] & aligned_mask) | aligned_wr_data;

  // reset and write data
  wire ram_wr_en = mem_ctrl[`MEM_RW] === `MEM_RW_W;
  integer i;
  always_ff @(posedge clk_cpu, posedge reset) begin
    if (reset) begin
      for (i = 0; i < `N_RAM; i = i + 1) begin
        ram[i] <= 32'd0;
      end
    end else 
      if (ram_wr_en)
        ram[word_adrs] <= wr_data;
  end
  
endmodule
