/*

  defines.v
  
  Holds define statements.
  
 */

// CPU prescaling (1 cycle per sec)
`define CPU_CLK_PRESCALE 32'd49999999

// data select for ALU
`define SEL_A   2'b00     // data select register A
`define SEL_B   2'b01     // data select register B
`define SEL_I   2'b10     // data select IN
`define SEL_Z   2'b11     // data select ZERO

// operations
`define OP_NOP        4'h0
`define OP_ADD_A_IM   4'h1
`define OP_ADD_B_IM   4'h2
`define OP_MOV_A_IM   4'h3
`define OP_MOV_B_IM   4'h4
`define OP_MOV_A_B    4'h5
`define OP_MOV_B_A    4'h6
`define OP_IN_A       4'h7
`define OP_IN_B       4'h8
`define OP_OUT_IM     4'h9
`define OP_OUT_B      4'ha
`define OP_JMP_IM     4'hb
`define OP_JNC_IM     4'hc

// timing definitions for tests  
`timescale 1ns/1ns
`define CYCLE 20
`define HCYCL 10
`define DELAY 2
`define STROB 18
`define HSTRB 8
