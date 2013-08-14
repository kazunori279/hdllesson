/*

  defines.v
  
  Holds define statements.
  
  */

//`define CPU_CLK_PRESCALE 32'd49999999
`define CPU_CLK_PRESCALE 32'd1

`define SEL_A   2'b00     // data select register A
`define SEL_B   2'b01     // data select register B
`define SEL_IN  2'b10     // data select IN

`define OP_NOP        4'h0
`define OP_ADD_A_IM   4'h1
`define OP_ADD_B_IM   4'h2
`define OP_MOV_A_IM   4'h3
`define OP_MOV_B_IM   4'h4
`define OP_MOV_A_B    4'h5
`define OP_MOV_B_A    4'h6
  
