/*

  defines.v
  
  Holds define statements.
  
 */

// CPU prescaling (1 cycle per sec)
`define CPU_CLK_PRESCALE 32'd49999999
//`define CPU_CLK_PRESCALE 32'd1

// timing definitions for tests  
`timescale 1ns/1ns
`define CYCLE 20
`define HCYCL 10
`define DELAY 2
`define STROB 18
`define HSTRB 8

// data widths
`define B_BYTE  8
`define B_HWORD 16
`define B_WORD  32
`define B_DWORD 64
`define B_QWORD 128
`define BYTE    `B_BYTE-1:0
`define HWORD   `B_HWORD-1:0
`define WORD    `B_WORD-1:0
`define DWORD   `B_DWORD-1:0
`define QWORD   `B_QWORD-1:0

// number of registers
`define N_REGS 32

//
// Instruction Encodings
//

// common encodings
`define I_OP    31:26
`define I_RS    25:21
`define I_RT    20:16

// R-type encodings
`define I_RD    15:11
`define I_SHAMT 10:6
`define I_FUNCT 5:0

// I-type encodings
`define I_IMM   15:0

// J-type encodings
`define I_ADDR  25:0

// opcodes
`define OP_R      6'b000000
`define OP_addi   6'b001000
`define OP_addiu  6'b001001

// R-type functions
`define R_sll     6'b000000
`define R_add     6'b100000

//
// Control Paths
//

`define CP_START        0
`define CP_ALU_SRC_LSB  `CP_START
`define CP_ALU_SRC      `CP_ALU_SRC_LSB:`CP_ALU_SRC_LSB
`define CP_ALU_CTRL_LSB `CP_ALU_SRC_LSB + 1
`define CP_ALU_CTRL     `CP_ALU_CTRL_LSB + 2:`CP_ALU_CTRL_LSB
`define CP_REG_WR_LSB   `CP_ALU_CTRL_LSB + 3
`define CP_REG_WR       `CP_REG_WR_LSB:`CP_REG_WR_LSB
`define CP_END          `CP_REG_WR_LSB
`define CPATH           `CP_END:`CP_START

// control path encodings
`define ALU_SRC_RD_B  1'b0
`define ALU_SRC_IMM   1'b1

`define ALU_CTRL_ADD  3'b000

`define REG_WR_T      1'b1
`define REG_WR_F      1'b0
