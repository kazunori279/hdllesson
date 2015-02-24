module com_example_fib_Main
(
  input  clk,
  input  reset,
  output signed [32-1 : 0] result_return
);

  wire  clk_sig;
  wire  reset_sig;
  reg signed [32-1 : 0] result_return_sig = 0;

  wire  class_fib_0000_clk;
  wire  class_fib_0000_reset;
  reg signed [32-1 : 0] class_fib_0000_result_in = 0;
  reg  class_fib_0000_result_we = 1'b0;
  wire signed [32-1 : 0] class_fib_0000_result_out;
  reg signed [32-1 : 0] class_fib_0000_fib_n = 0;
  reg  class_fib_0000_fib_req = 1'b0;
  wire  class_fib_0000_fib_busy;
  reg  class_fib_0000_run_req = 1'b0;
  wire  class_fib_0000_run_busy;
  wire signed [32-1 : 0] class_fib_0000_fib_return;
  reg signed [32-1 : 0] field_access_00002 = 0;
  localparam result_method_IDLE = 32'd0;
  localparam result_method_S_0000 = 32'd1;
  localparam result_method_S_0001 = 32'd2;
  localparam result_method_S_0002 = 32'd3;
  localparam result_method_S_0003 = 32'd4;
  localparam result_method_S_0004 = 32'd5;
  reg [31:0] result_method = result_method_IDLE;
  reg signed [32-1 : 0] result_method_delay = 0;
  localparam main_method_IDLE = 32'd0;
  localparam main_method_S_0000 = 32'd1;
  localparam main_method_S_0001 = 32'd2;
  localparam main_method_S_0002 = 32'd3;
  localparam main_method_S_0003 = 32'd4;
  localparam main_method_main_method_S_0002_body = 32'd5;
  reg [31:0] main_method = main_method_IDLE;
  reg signed [32-1 : 0] main_method_delay = 0;
  wire  class_fib_0000_ext_call_flag_0002;
  wire  tmp_0001;
  wire  tmp_0002;
  wire  tmp_0003;
  wire  tmp_0004;
  wire  tmp_0005;


  assign clk_sig = clk;
  assign reset_sig = reset;
  assign result_return = result_return_sig;
  always @(posedge clk) begin
    if(reset == 1'b1) begin
      result_return_sig <= 0;
    end else begin
      if (result_method == result_method_S_0003) begin
        result_return_sig <= field_access_00002;
      end
    end
  end


  assign tmp_0001 = class_fib_0000_run_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0002 = class_fib_0000_run_req == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0003 = tmp_0001 && tmp_0002;
  assign tmp_0004 = tmp_0003 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0005 = class_fib_0000_run_busy == 1'b0 ? 1'b1 : 1'b0;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      result_method <= result_method_IDLE;
      result_method_delay <= 32'h0;
    end else begin
      case (result_method)
        result_method_IDLE : begin
          result_method <= result_method_S_0000;
        end
        result_method_S_0000 : begin
          result_method <= result_method_S_0001;
          result_method <= result_method_S_0001;
        end
        result_method_S_0001 : begin
          result_method <= result_method_S_0002;
        end
        result_method_S_0002 : begin
          result_method <= result_method_S_0003;
        end
        result_method_S_0003 : begin
          result_method <= result_method_S_0000;
        end
        result_method_S_0004 : begin
          result_method <= result_method_S_0000;
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      main_method <= main_method_IDLE;
      main_method_delay <= 32'h0;
    end else begin
      case (main_method)
        main_method_IDLE : begin
          main_method <= main_method_S_0000;
        end
        main_method_S_0000 : begin
          main_method <= main_method_S_0001;
          main_method <= main_method_S_0001;
        end
        main_method_S_0001 : begin
          main_method <= main_method_S_0002;
        end
        main_method_S_0002 : begin
          if (tmp_0005 == 1'b1) begin
            main_method <= main_method_main_method_S_0002_body;
          end
        end
        main_method_S_0003 : begin
          main_method <= main_method_S_0000;
        end
        main_method_main_method_S_0002_body : begin
          if (main_method_delay >= 1 && class_fib_0000_ext_call_flag_0002 == 1'b1) begin
            main_method_delay <= 32'h0;
            main_method_delay <= 0;
            main_method <= main_method_S_0003;
          end else begin
            main_method_delay <= main_method_delay + 1;
          end
        end
      endcase
    end
  end


  assign class_fib_0000_clk = clk_sig;

  assign class_fib_0000_reset = reset_sig;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      class_fib_0000_run_req <= 1'b0;
    end else begin
      if (main_method == main_method_main_method_S_0002_body && main_method_delay == 0) begin
        class_fib_0000_run_req <= 1'b1;
      end else begin
        class_fib_0000_run_req <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00002 <= 0;
    end else begin
      if (result_method == result_method_S_0002) begin
        field_access_00002 <= class_fib_0000_result_out;
      end
    end
  end

  assign class_fib_0000_ext_call_flag_0002 = tmp_0004;


  com_example_fib_Fib
  class_fib_0000
  (
    .clk(class_fib_0000_clk),
    .reset(class_fib_0000_reset),
    .result_in(class_fib_0000_result_in),
    .result_we(class_fib_0000_result_we),
    .result_out(class_fib_0000_result_out),
    .fib_n(class_fib_0000_fib_n),
    .fib_req(class_fib_0000_fib_req),
    .fib_busy(class_fib_0000_fib_busy),
    .run_req(class_fib_0000_run_req),
    .run_busy(class_fib_0000_run_busy),
    .fib_return(class_fib_0000_fib_return)
  );


endmodule
