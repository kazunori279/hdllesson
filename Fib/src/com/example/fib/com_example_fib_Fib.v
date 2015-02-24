module com_example_fib_Fib
(
  input  clk,
  input  reset,
  input signed [32-1 : 0] result_in,
  input  result_we,
  output signed [32-1 : 0] result_out,
  input signed [32-1 : 0] fib_n,
  input  fib_req,
  output  fib_busy,
  input  run_req,
  output  run_busy,
  output signed [32-1 : 0] fib_return
);

  wire  clk_sig;
  wire  reset_sig;
  wire signed [32-1 : 0] result_in_sig;
  wire  result_we_sig;
  wire signed [32-1 : 0] result_out_sig;
  wire signed [32-1 : 0] fib_n_sig;
  wire  fib_req_sig;
  reg  fib_busy_sig = 1'b1;
  wire  run_req_sig;
  reg  run_busy_sig = 1'b1;
  reg signed [32-1 : 0] fib_return_sig = 0;

  reg signed [32-1 : 0] class_result_0000 = 0;
  wire signed [32-1 : 0] class_result_0000_mux;
  wire signed [32-1 : 0] tmp_0001;
  reg signed [32-1 : 0] fib_n_0001 = 0;
  reg signed [32-1 : 0] fib_n_local = 0;
  reg signed [32-1 : 0] fib_cur_0002 = 32'h00000000;
  reg signed [32-1 : 0] fib_next_0003 = 32'h00000001;
  reg signed [32-1 : 0] fib_i_0004 = 32'h00000000;
  reg  binary_expr_00005 = 1'b0;
  reg signed [32-1 : 0] unary_expr_00006 = 0;
  reg signed [32-1 : 0] fib_tmp_0007 = 0;
  reg signed [32-1 : 0] binary_expr_00008 = 0;
  reg signed [32-1 : 0] method_result_00009 = 0;
  wire  fib_req_flag;
  reg  fib_req_local = 1'b0;
  wire  tmp_0002;
  wire  run_req_flag;
  reg  run_req_local = 1'b0;
  wire  tmp_0003;
  localparam fib_method_IDLE = 32'd0;
  localparam fib_method_S_0000 = 32'd1;
  localparam fib_method_S_0001 = 32'd2;
  localparam fib_method_S_0002 = 32'd3;
  localparam fib_method_S_0005 = 32'd4;
  localparam fib_method_S_0006 = 32'd5;
  localparam fib_method_S_0007 = 32'd6;
  localparam fib_method_S_0008 = 32'd7;
  localparam fib_method_S_0009 = 32'd8;
  localparam fib_method_S_0010 = 32'd9;
  localparam fib_method_S_0011 = 32'd10;
  localparam fib_method_S_0012 = 32'd11;
  localparam fib_method_S_0014 = 32'd12;
  localparam fib_method_S_0015 = 32'd13;
  localparam fib_method_S_0016 = 32'd14;
  localparam fib_method_S_0017 = 32'd15;
  reg [31:0] fib_method = fib_method_IDLE;
  reg signed [32-1 : 0] fib_method_delay = 0;
  wire  tmp_0004;
  wire  tmp_0005;
  wire signed [32-1 : 0] tmp_0006;
  wire  tmp_0007;
  wire signed [32-1 : 0] tmp_0008;
  wire signed [32-1 : 0] tmp_0009;
  localparam run_method_IDLE = 32'd0;
  localparam run_method_S_0000 = 32'd1;
  localparam run_method_S_0001 = 32'd2;
  localparam run_method_S_0002 = 32'd3;
  localparam run_method_S_0003 = 32'd4;
  localparam run_method_S_0004 = 32'd5;
  localparam run_method_run_method_S_0002_body = 32'd6;
  reg [31:0] run_method = run_method_IDLE;
  reg signed [32-1 : 0] run_method_delay = 0;
  wire  fib_call_flag_0002;
  wire  tmp_0010;
  wire  tmp_0011;
  wire  tmp_0012;
  wire  tmp_0013;
  wire  tmp_0014;


  assign clk_sig = clk;
  assign reset_sig = reset;
  assign result_in_sig = result_in;
  assign result_we_sig = result_we;
  assign result_out = result_out_sig;
  assign result_out_sig = class_result_0000;

  assign fib_n_sig = fib_n;
  assign fib_req_sig = fib_req;
  assign fib_busy = fib_busy_sig;
  always @(posedge clk) begin
    if(reset == 1'b1) begin
      fib_busy_sig <= 1'b1;
    end else begin
      if (fib_method == fib_method_S_0001) begin
        fib_busy_sig <= fib_req_flag;
      end
    end
  end

  assign run_req_sig = run_req;
  assign run_busy = run_busy_sig;
  always @(posedge clk) begin
    if(reset == 1'b1) begin
      run_busy_sig <= 1'b1;
    end else begin
      if (run_method == run_method_S_0001) begin
        run_busy_sig <= run_req_flag;
      end
    end
  end

  assign fib_return = fib_return_sig;
  always @(posedge clk) begin
    if(reset == 1'b1) begin
      fib_return_sig <= 0;
    end else begin
      if (fib_method == fib_method_S_0016) begin
        fib_return_sig <= fib_cur_0002;
      end
    end
  end


  assign tmp_0001 = result_we_sig == 1'b1 ? result_in_sig : class_result_0000;
  assign tmp_0002 = fib_req_local || fib_req_sig;
  assign tmp_0003 = run_req_local || run_req_sig;
  assign tmp_0004 = binary_expr_00005 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0005 = binary_expr_00005 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0006 = fib_req_sig == 1'b1 ? fib_n_sig : fib_n_local;
  assign tmp_0007 = fib_i_0004 < fib_n_0001 ? 1'b1 : 1'b0;
  assign tmp_0008 = fib_i_0004 + 32'h00000001;
  assign tmp_0009 = fib_next_0003 + fib_tmp_0007;
  assign tmp_0010 = fib_busy_sig == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0011 = fib_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0012 = tmp_0010 && tmp_0011;
  assign tmp_0013 = tmp_0012 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0014 = fib_busy_sig == 1'b0 ? 1'b1 : 1'b0;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      fib_method <= fib_method_IDLE;
      fib_method_delay <= 32'h0;
    end else begin
      case (fib_method)
        fib_method_IDLE : begin
          fib_method <= fib_method_S_0000;
        end
        fib_method_S_0000 : begin
          fib_method <= fib_method_S_0001;
          fib_method <= fib_method_S_0001;
        end
        fib_method_S_0001 : begin
          if (fib_req_flag == 1'b1) begin
            fib_method <= fib_method_S_0002;
          end
        end
        fib_method_S_0002 : begin
          fib_method <= fib_method_S_0005;
        end
        fib_method_S_0005 : begin
          fib_method <= fib_method_S_0006;
        end
        fib_method_S_0006 : begin
          if (tmp_0004 == 1'b1) begin
            fib_method <= fib_method_S_0011;
          end else if (tmp_0005 == 1'b1) begin
            fib_method <= fib_method_S_0007;
          end
        end
        fib_method_S_0007 : begin
          fib_method <= fib_method_S_0016;
        end
        fib_method_S_0008 : begin
          fib_method <= fib_method_S_0009;
        end
        fib_method_S_0009 : begin
          fib_method <= fib_method_S_0010;
        end
        fib_method_S_0010 : begin
          fib_method <= fib_method_S_0005;
        end
        fib_method_S_0011 : begin
          fib_method <= fib_method_S_0012;
        end
        fib_method_S_0012 : begin
          fib_method <= fib_method_S_0014;
        end
        fib_method_S_0014 : begin
          fib_method <= fib_method_S_0015;
        end
        fib_method_S_0015 : begin
          fib_method <= fib_method_S_0008;
        end
        fib_method_S_0016 : begin
          fib_method <= fib_method_S_0000;
        end
        fib_method_S_0017 : begin
          fib_method <= fib_method_S_0000;
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      run_method <= run_method_IDLE;
      run_method_delay <= 32'h0;
    end else begin
      case (run_method)
        run_method_IDLE : begin
          run_method <= run_method_S_0000;
        end
        run_method_S_0000 : begin
          run_method <= run_method_S_0001;
          run_method <= run_method_S_0001;
        end
        run_method_S_0001 : begin
          if (run_req_flag == 1'b1) begin
            run_method <= run_method_S_0002;
          end
        end
        run_method_S_0002 : begin
          if (tmp_0014 == 1'b1) begin
            run_method <= run_method_run_method_S_0002_body;
          end
        end
        run_method_S_0003 : begin
          run_method <= run_method_S_0004;
        end
        run_method_S_0004 : begin
          run_method <= run_method_S_0000;
        end
        run_method_run_method_S_0002_body : begin
          if (run_method_delay >= 1 && fib_call_flag_0002 == 1'b1) begin
            run_method_delay <= 32'h0;
            run_method_delay <= 0;
            run_method <= run_method_S_0003;
          end else begin
            run_method_delay <= run_method_delay + 1;
          end
        end
      endcase
    end
  end


  always @(posedge clk) begin
    if(reset == 1'b1) begin
      class_result_0000 <= 0;
    end else begin
      if (run_method == run_method_S_0003) begin
        class_result_0000 <= method_result_00009;
      end else begin
        class_result_0000 <= class_result_0000_mux;
      end
    end
  end

  assign class_result_0000_mux = tmp_0001;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      fib_n_0001 <= 0;
    end else begin
      if (fib_method == fib_method_S_0001) begin
        fib_n_0001 <= tmp_0006;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      fib_n_local <= 0;
    end else begin
      if (run_method == run_method_run_method_S_0002_body && run_method_delay == 0) begin
        fib_n_local <= 32'h0000002a;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      fib_cur_0002 <= 32'h00000000;
    end else begin
      if (fib_method == fib_method_S_0002) begin
        fib_cur_0002 <= 32'h00000000;
      end else if (fib_method == fib_method_S_0012) begin
        fib_cur_0002 <= fib_next_0003;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      fib_next_0003 <= 32'h00000001;
    end else begin
      if (fib_method == fib_method_S_0002) begin
        fib_next_0003 <= 32'h00000001;
      end else if (fib_method == fib_method_S_0014) begin
        fib_next_0003 <= binary_expr_00008;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      fib_i_0004 <= 32'h00000000;
    end else begin
      if (fib_method == fib_method_S_0002) begin
        fib_i_0004 <= 32'h00000000;
      end else if (fib_method == fib_method_S_0009) begin
        fib_i_0004 <= unary_expr_00006;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00005 <= 1'b0;
    end else begin
      if (fib_method == fib_method_S_0005) begin
        binary_expr_00005 <= tmp_0007;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      unary_expr_00006 <= 0;
    end else begin
      if (fib_method == fib_method_S_0008) begin
        unary_expr_00006 <= tmp_0008;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      fib_tmp_0007 <= 0;
    end else begin
      if (fib_method == fib_method_S_0011) begin
        fib_tmp_0007 <= fib_cur_0002;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00008 <= 0;
    end else begin
      if (fib_method == fib_method_S_0012) begin
        binary_expr_00008 <= tmp_0009;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      method_result_00009 <= 0;
    end else begin
      if (run_method == run_method_run_method_S_0002_body && run_method_delay >= 1 && fib_call_flag_0002 == 1'b1) begin
        method_result_00009 <= fib_return_sig;
      end
    end
  end

  assign fib_req_flag = tmp_0002;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      fib_req_local <= 1'b0;
    end else begin
      if (run_method == run_method_run_method_S_0002_body && run_method_delay == 0) begin
        fib_req_local <= 1'b1;
      end else begin
        fib_req_local <= 1'b0;
      end
    end
  end

  assign run_req_flag = tmp_0003;

  assign fib_call_flag_0002 = tmp_0013;



endmodule
