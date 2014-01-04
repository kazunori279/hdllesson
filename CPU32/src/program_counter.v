/*

  program_counter.v
  
  Holds Program Counter and branch logic.
  
  */

`include "src/defines.v"

module program_counter (
  input   clk_cpu,
  input   reset,
  input [`WORD] inst,
  input [`CPATH] cpath,
  input [`DWORD] alu_result,
  output reg [`WORD] pc
);

  // calculate branch addresses
  wire [`WORD] jmp_addr, brnc_addr, next_pc;
  assign jmp_addr = inst[`I_ADDR] << 2;
  assign brnc_addr = {{14{inst[15]}}, inst[`I_IMM], 2'b00} + next_pc; // sign extended + 2 bit shift
  assign next_pc = pc + 32'd4;
  
  // check if alu had unsupported operation
  wire alu_unsupported_op = inst[`I_OP] == `OP_R && alu_result === `B_DWORD'bx;
  
  // program counter and branch logic
  always_ff @(posedge clk_cpu, posedge reset) begin
    if (reset) begin
      pc <= `START_ADRS;
    end else begin
      if (cpath[`CP_EXCP] || alu_unsupported_op) // exceptions
        pc <= `EXCP_ADRS;
      else begin
        case (inst[`I_OP])
          `OP_R:
            case (cpath[`CP_ALU_CTRL])
              `R_jr:    pc <= alu_result[63:32];
              `R_jalr:  pc <= alu_result[63:32];
              default:  pc <= next_pc;
            endcase
          `OP_bltz: 
            case (inst[`I_RT])
              0:  pc <= $signed(alu_result) < 0 ? brnc_addr : next_pc;
              1:  pc <= $signed(alu_result) >= 0 ? brnc_addr : next_pc;
            endcase
          `OP_beq:  pc <= alu_result === 64'd0 ? brnc_addr : next_pc;
          `OP_bne:  pc <= alu_result !== 64'd0 ? brnc_addr : next_pc;
          `OP_blez: pc <= $signed(alu_result) <= 0 ? brnc_addr : next_pc;
          `OP_bgtz: pc <= $signed(alu_result) > 0 ? brnc_addr : next_pc;
          `OP_j:    pc <= {pc[31:28], jmp_addr[27:0]};
          default:  pc <= next_pc;
        endcase
      end
    end
  end

endmodule
