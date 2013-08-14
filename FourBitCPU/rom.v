/*

  rom.v
  
  ROM for storing instruction code.
  
  */


module rom (
  input   clk_cpu,
  input   reset,
  input   [3:0] adrs,
  output  [7:0] dat_out
);

  // ROM instruction data
  function [7:0] rom_data (
    input [3:0] rom_adrs
  );
    begin
      case (rom_adrs)
        4'h0: rom_data = 8'h0;
        4'h1: rom_data = {`OP_ADD_A_IM, 4'b1111};
        4'h2: rom_data = 8'h0;
        4'h3: rom_data = {`OP_ADD_A_IM, 4'b0000};
        4'h4: rom_data = 8'h0;
        4'h5: rom_data = {`OP_ADD_B_IM, 4'b1111};
        4'h6: rom_data = 8'h0;
        4'h7: rom_data = {`OP_ADD_B_IM, 4'b0000};
        4'h8: rom_data = 8'h0;
        4'h9: rom_data = 8'h0;
        4'ha: rom_data = 8'h0;
        4'hb: rom_data = 8'h0;
        4'hc: rom_data = 8'h0;
        4'hd: rom_data = 8'h0;
        4'he: rom_data = 8'h0;
        4'hf: rom_data = 8'h0;
        default: rom_data = 8'h0;
      endcase
    end
  endfunction

  assign dat_out = rom_data(adrs);

endmodule