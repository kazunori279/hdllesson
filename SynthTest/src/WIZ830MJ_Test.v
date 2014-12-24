module WIZ830MJ_Test
(
  input  clk,
  input  reset,
  output [10-1 : 0] class_wiz830mj_0000_ADDR_exp,
  inout [8-1 : 0] class_wiz830mj_0000_DATA_exp,
  output  class_wiz830mj_0000_nCS_exp,
  output  class_wiz830mj_0000_nRD_exp,
  output  class_wiz830mj_0000_nWR_exp,
  input  class_wiz830mj_0000_nINT_exp,
  output  class_wiz830mj_0000_nRESET_exp,
  input [4-1 : 0] class_wiz830mj_0000_BRDY_exp,
  input signed [32-1 : 0] length_in,
  input  length_we,
  output signed [32-1 : 0] length_out,
  input signed [32-1 : 0] midi_msg_in,
  input  midi_msg_we,
  output signed [32-1 : 0] midi_msg_out,
  input  test_req,
  output  test_busy
);

  wire  clk_sig;
  wire  reset_sig;
  wire [10-1 : 0] class_wiz830mj_0000_ADDR_exp_sig;
  wire  class_wiz830mj_0000_nCS_exp_sig;
  wire  class_wiz830mj_0000_nRD_exp_sig;
  wire  class_wiz830mj_0000_nWR_exp_sig;
  wire  class_wiz830mj_0000_nINT_exp_sig;
  wire  class_wiz830mj_0000_nRESET_exp_sig;
  wire [4-1 : 0] class_wiz830mj_0000_BRDY_exp_sig;
  wire signed [32-1 : 0] length_in_sig;
  wire  length_we_sig;
  wire signed [32-1 : 0] length_out_sig;
  wire signed [32-1 : 0] midi_msg_in_sig;
  wire  midi_msg_we_sig;
  wire signed [32-1 : 0] midi_msg_out_sig;
  wire  test_req_sig;
  reg  test_busy_sig = 1'b1;

  wire  class_wiz830mj_0000_clk;
  wire  class_wiz830mj_0000_reset;
  reg [32-1 : 0] class_wiz830mj_0000_address = 0;
  reg [8-1 : 0] class_wiz830mj_0000_wdata = 0;
  wire [8-1 : 0] class_wiz830mj_0000_rdata;
  reg  class_wiz830mj_0000_cs = 1'b0;
  reg  class_wiz830mj_0000_oe = 1'b0;
  reg  class_wiz830mj_0000_we = 1'b0;
  wire  class_wiz830mj_0000_interrupt;
  reg  class_wiz830mj_0000_module_reset = 1'b0;
  wire  class_wiz830mj_0000_bready0;
  wire  class_wiz830mj_0000_bready1;
  wire  class_wiz830mj_0000_bready2;
  wire  class_wiz830mj_0000_bready3;
  wire [10-1 : 0] class_wiz830mj_0000_ADDR;
  wire  class_wiz830mj_0000_nCS;
  wire  class_wiz830mj_0000_nRD;
  wire  class_wiz830mj_0000_nWR;
  wire  class_wiz830mj_0000_nINT;
  wire  class_wiz830mj_0000_nRESET;
  wire [4-1 : 0] class_wiz830mj_0000_BRDY;
  reg signed [32-1 : 0] class_length_0002 = 0;
  wire signed [32-1 : 0] class_length_0002_mux;
  wire signed [32-1 : 0] tmp_0001;
  reg signed [32-1 : 0] class_midi_msg_0003 = 0;
  wire signed [32-1 : 0] class_midi_msg_0003_mux;
  wire signed [32-1 : 0] tmp_0002;
  reg signed [32-1 : 0] class_Sn_MR0_0004 = 32'h00000200;
  reg signed [32-1 : 0] class_Sn_MR1_0005 = 32'h00000201;
  reg signed [32-1 : 0] class_Sn_CR0_0006 = 32'h00000202;
  reg signed [32-1 : 0] class_Sn_CR1_0007 = 32'h00000203;
  reg signed [32-1 : 0] class_Sn_IMR0_0008 = 32'h00000204;
  reg signed [32-1 : 0] class_Sn_IMR1_0009 = 32'h00000205;
  reg signed [32-1 : 0] class_Sn_IR0_0010 = 32'h00000206;
  reg signed [32-1 : 0] class_Sn_IR1_0011 = 32'h00000207;
  reg signed [32-1 : 0] class_Sn_SSR0_0012 = 32'h00000208;
  reg signed [32-1 : 0] class_Sn_SSR1_0013 = 32'h00000209;
  reg signed [32-1 : 0] class_Sn_PORTR0_0014 = 32'h0000020a;
  reg signed [32-1 : 0] class_Sn_PORTR1_0015 = 32'h0000020b;
  reg signed [32-1 : 0] class_Sn_DHAR0_0016 = 32'h0000020c;
  reg signed [32-1 : 0] class_Sn_DHAR1_0017 = 32'h0000020d;
  reg signed [32-1 : 0] class_Sn_DHAR2_0018 = 32'h0000020e;
  reg signed [32-1 : 0] class_Sn_DHAR3_0019 = 32'h0000020f;
  reg signed [32-1 : 0] class_Sn_DHAR4_0020 = 32'h00000210;
  reg signed [32-1 : 0] class_Sn_DHAR5_0021 = 32'h00000211;
  reg signed [32-1 : 0] class_Sn_DPORTR0_0022 = 32'h00000212;
  reg signed [32-1 : 0] class_Sn_DPORTR1_0023 = 32'h00000213;
  reg signed [32-1 : 0] class_Sn_DIPR0_0024 = 32'h00000214;
  reg signed [32-1 : 0] class_Sn_DIPR1_0025 = 32'h00000215;
  reg signed [32-1 : 0] class_Sn_DIPR2_0026 = 32'h00000216;
  reg signed [32-1 : 0] class_Sn_DIPR3_0027 = 32'h00000217;
  reg signed [32-1 : 0] class_Sn_MSSR0_0028 = 32'h00000218;
  reg signed [32-1 : 0] class_Sn_MSSR1_0029 = 32'h00000219;
  reg signed [32-1 : 0] class_Sn_KPALVTR_0030 = 32'h0000021a;
  reg signed [32-1 : 0] class_Sn_PROTOR_0031 = 32'h0000021b;
  reg signed [32-1 : 0] class_Sn_TOSR0_0032 = 32'h0000021c;
  reg signed [32-1 : 0] class_Sn_TOSR1_0033 = 32'h0000021d;
  reg signed [32-1 : 0] class_Sn_TTLR0_0034 = 32'h0000021e;
  reg signed [32-1 : 0] class_Sn_TTLR1_0035 = 32'h0000021f;
  reg signed [32-1 : 0] class_Sn_TX_WRSR0_0036 = 32'h00000220;
  reg signed [32-1 : 0] class_Sn_TX_WRSR1_0037 = 32'h00000221;
  reg signed [32-1 : 0] class_Sn_TX_WRSR2_0038 = 32'h00000222;
  reg signed [32-1 : 0] class_Sn_TX_WRSR3_0039 = 32'h00000223;
  reg signed [32-1 : 0] class_Sn_TX_FSR0_0040 = 32'h00000224;
  reg signed [32-1 : 0] class_Sn_TX_FSR1_0041 = 32'h00000225;
  reg signed [32-1 : 0] class_Sn_TX_FSR2_0042 = 32'h00000226;
  reg signed [32-1 : 0] class_Sn_TX_FSR3_0043 = 32'h00000227;
  reg signed [32-1 : 0] class_Sn_RX_RSR0_0044 = 32'h00000228;
  reg signed [32-1 : 0] class_Sn_RX_RSR1_0045 = 32'h00000229;
  reg signed [32-1 : 0] class_Sn_RX_RSR2_0046 = 32'h0000022a;
  reg signed [32-1 : 0] class_Sn_RX_RSR3_0047 = 32'h0000022b;
  reg signed [32-1 : 0] class_Sn_FRAGR0_0048 = 32'h0000022c;
  reg signed [32-1 : 0] class_Sn_FRAGR1_0049 = 32'h0000022d;
  reg signed [32-1 : 0] class_Sn_TX_FIFOR0_0050 = 32'h0000022e;
  reg signed [32-1 : 0] class_Sn_TX_FIFOR1_0051 = 32'h0000022f;
  reg signed [32-1 : 0] class_Sn_RX_FIFOR0_0052 = 32'h00000230;
  reg signed [32-1 : 0] class_Sn_RX_FIFOR1_0053 = 32'h00000231;
  reg signed [8-1 : 0] class_Sn_MR_CLOSE_0054 = 8'h00;
  reg signed [8-1 : 0] class_Sn_MR_TCP_0055 = 8'h01;
  reg signed [8-1 : 0] class_Sn_MR_UDP_0056 = 8'h02;
  reg signed [8-1 : 0] class_Sn_MR_IPRAW_0057 = 8'h03;
  reg signed [8-1 : 0] class_Sn_MR_MACRAW_0058 = 8'h04;
  reg signed [8-1 : 0] class_Sn_MR_PPPoE_0059 = 8'h05;
  reg signed [8-1 : 0] class_Sn_CR_OPEN_0060 = 8'h01;
  reg signed [8-1 : 0] class_Sn_CR_LISTEN_0061 = 8'h02;
  reg signed [8-1 : 0] class_Sn_CR_CONNECT_0062 = 8'h04;
  reg signed [8-1 : 0] class_Sn_CR_DISCON_0063 = 8'h08;
  reg signed [8-1 : 0] class_Sn_CR_CLOSE_0064 = 8'h10;
  reg signed [8-1 : 0] class_Sn_CR_SEND_0065 = 8'h20;
  reg signed [8-1 : 0] class_Sn_CR_SEND_MAC_0066 = 8'h21;
  reg signed [8-1 : 0] class_Sn_CR_SEND_KEEP_0067 = 8'h22;
  reg signed [8-1 : 0] class_Sn_CR_RECV_0068 = 8'h40;
  reg signed [8-1 : 0] class_Sn_CR_PCON_0069 = 8'h23;
  reg signed [8-1 : 0] class_Sn_CR_PDISCON_0070 = 8'h24;
  reg signed [8-1 : 0] class_Sn_CR_PCR_0071 = 8'h25;
  reg signed [8-1 : 0] class_Sn_CR_PCN_0072 = 8'h26;
  reg signed [8-1 : 0] class_Sn_CR_PCJ_0073 = 8'h27;
  reg signed [8-1 : 0] class_Sn_SOCK_CLOSED_0074 = 8'h00;
  reg signed [8-1 : 0] class_Sn_SOCK_INIT_0075 = 8'h13;
  reg signed [8-1 : 0] class_Sn_SOCK_LISTEN_0076 = 8'h14;
  reg signed [8-1 : 0] class_Sn_SOCK_ESTABLISHED_0077 = 8'h17;
  reg signed [8-1 : 0] class_Sn_SOCK_CLOSE_WAIT_0078 = 8'h1c;
  reg signed [8-1 : 0] class_Sn_SOCK_UDP_0079 = 8'h22;
  reg signed [8-1 : 0] class_Sn_SOCK_IPRAW_0080 = 8'h32;
  reg signed [8-1 : 0] class_Sn_SOCK_MACRAW_0081 = 8'h42;
  reg signed [8-1 : 0] class_Sn_SOCK_PPPoE_0082 = 8'h5f;
  reg signed [8-1 : 0] class_Sn_SOCK_SYSSENT_0083 = 8'h15;
  reg signed [8-1 : 0] class_Sn_SOCK_SYSRECV_0084 = 8'h16;
  reg signed [8-1 : 0] class_Sn_SOCK_FIN_WAIT_0085 = 8'h18;
  reg signed [8-1 : 0] class_Sn_SOCK_TIME_WAIT_0086 = 8'h1b;
  reg signed [8-1 : 0] class_Sn_SOCK_LAST_ACK_0087 = 8'h1d;
  reg signed [8-1 : 0] class_Sn_SOCK_ARP_0088 = 8'h01;
  wire  class_buffer_0089_clk;
  wire  class_buffer_0089_reset;
  wire signed [32-1 : 0] class_buffer_0089_length;
  reg signed [32-1 : 0] class_buffer_0089_address = 0;
  reg signed [8-1 : 0] class_buffer_0089_din = 0;
  wire signed [8-1 : 0] class_buffer_0089_dout;
  reg  class_buffer_0089_we = 1'b0;
  reg  class_buffer_0089_oe = 1'b0;
  reg signed [32-1 : 0] class_buffer_0089_address_b = 0;
  reg signed [8-1 : 0] class_buffer_0089_din_b = 0;
  wire signed [8-1 : 0] class_buffer_0089_dout_b;
  reg  class_buffer_0089_we_b = 1'b0;
  reg  class_buffer_0089_oe_b = 1'b0;
  reg signed [32-1 : 0] wait_cycles_n_0090 = 0;
  reg signed [32-1 : 0] wait_cycles_n_local = 0;
  reg signed [32-1 : 0] wait_cycles_i_0091 = 32'h00000000;
  reg  binary_expr_00092 = 1'b0;
  reg signed [32-1 : 0] unary_expr_00093 = 0;
  reg signed [32-1 : 0] write_data_addr_0094 = 0;
  reg signed [32-1 : 0] write_data_addr_local = 0;
  reg signed [8-1 : 0] write_data_data_0095 = 0;
  reg signed [8-1 : 0] write_data_data_local = 0;
  reg signed [32-1 : 0] field_access_00096 = 0;
  reg signed [8-1 : 0] field_access_00097 = 0;
  reg  field_access_00098 = 1'b0;
  reg  field_access_00099 = 1'b0;
  reg  field_access_00101 = 1'b0;
  reg  field_access_00102 = 1'b0;
  reg signed [32-1 : 0] read_data_addr_0103 = 0;
  reg signed [32-1 : 0] read_data_addr_local = 0;
  reg signed [32-1 : 0] field_access_00104 = 0;
  reg  field_access_00105 = 1'b0;
  reg  field_access_00106 = 1'b0;
  reg signed [8-1 : 0] read_data_v_0108 = 0;
  reg signed [8-1 : 0] field_access_00109 = 0;
  reg  field_access_00110 = 1'b0;
  reg  field_access_00111 = 1'b0;
  reg  field_access_00112 = 1'b0;
  reg  field_access_00113 = 1'b0;
  reg  field_access_00114 = 1'b0;
  reg  field_access_00115 = 1'b0;
  reg  field_access_00117 = 1'b0;
  reg signed [32-1 : 0] tcp_server_open_port_0137 = 0;
  reg signed [32-1 : 0] tcp_server_open_port_local = 0;
  reg signed [32-1 : 0] binary_expr_00139 = 0;
  reg signed [32-1 : 0] binary_expr_00140 = 0;
  reg signed [32-1 : 0] binary_expr_00142 = 0;
  reg signed [32-1 : 0] binary_expr_00143 = 0;
  reg signed [32-1 : 0] binary_expr_00145 = 0;
  reg signed [32-1 : 0] binary_expr_00146 = 0;
  reg signed [32-1 : 0] binary_expr_00148 = 0;
  reg signed [32-1 : 0] binary_expr_00149 = 0;
  reg signed [8-1 : 0] method_result_00150 = 0;
  reg signed [32-1 : 0] binary_expr_00151 = 0;
  reg signed [32-1 : 0] binary_expr_00152 = 0;
  reg signed [32-1 : 0] tcp_server_listen_port_0153 = 0;
  reg signed [32-1 : 0] tcp_server_listen_port_local = 0;
  reg signed [32-1 : 0] binary_expr_00155 = 0;
  reg signed [32-1 : 0] binary_expr_00156 = 0;
  reg signed [8-1 : 0] method_result_00157 = 0;
  reg signed [32-1 : 0] binary_expr_00158 = 0;
  reg signed [32-1 : 0] binary_expr_00159 = 0;
  reg signed [32-1 : 0] wait_for_established_port_0160 = 0;
  reg signed [32-1 : 0] wait_for_established_port_local = 0;
  reg signed [8-1 : 0] wait_for_established_v_0161 = 0;
  reg signed [8-1 : 0] method_result_00162 = 0;
  reg signed [32-1 : 0] binary_expr_00163 = 0;
  reg signed [32-1 : 0] binary_expr_00164 = 0;
  reg  binary_expr_00165 = 1'b0;
  reg signed [32-1 : 0] wait_for_recv_port_0166 = 0;
  reg signed [32-1 : 0] wait_for_recv_port_local = 0;
  reg signed [32-1 : 0] wait_for_recv_v_0167 = 32'h00000000;
  reg signed [32-1 : 0] wait_for_recv_prev_v_0168 = 32'h00000000;
  reg signed [32-1 : 0] wait_for_recv_v0_0169 = 0;
  reg signed [8-1 : 0] method_result_00170 = 0;
  reg signed [32-1 : 0] binary_expr_00171 = 0;
  reg signed [32-1 : 0] binary_expr_00172 = 0;
  reg signed [32-1 : 0] cast_expr_00173 = 0;
  reg signed [32-1 : 0] wait_for_recv_v1_0174 = 0;
  reg signed [8-1 : 0] method_result_00175 = 0;
  reg signed [32-1 : 0] binary_expr_00176 = 0;
  reg signed [32-1 : 0] binary_expr_00177 = 0;
  reg signed [32-1 : 0] cast_expr_00178 = 0;
  reg signed [32-1 : 0] wait_for_recv_v2_0179 = 0;
  reg signed [8-1 : 0] method_result_00180 = 0;
  reg signed [32-1 : 0] binary_expr_00181 = 0;
  reg signed [32-1 : 0] binary_expr_00182 = 0;
  reg signed [32-1 : 0] cast_expr_00183 = 0;
  reg signed [32-1 : 0] binary_expr_00184 = 0;
  reg signed [32-1 : 0] binary_expr_00185 = 0;
  reg signed [32-1 : 0] binary_expr_00186 = 0;
  reg signed [32-1 : 0] binary_expr_00187 = 0;
  reg  binary_expr_00188 = 1'b0;
  reg  binary_expr_00189 = 1'b0;
  reg  binary_expr_00190 = 1'b0;
  reg signed [32-1 : 0] pull_recv_data_port_0191 = 0;
  reg signed [32-1 : 0] pull_recv_data_port_local = 0;
  reg signed [32-1 : 0] pull_recv_data_read_len_0192 = 0;
  reg signed [32-1 : 0] binary_expr_00193 = 0;
  reg signed [32-1 : 0] binary_expr_00194 = 0;
  reg  binary_expr_00195 = 1'b0;
  reg signed [32-1 : 0] binary_expr_00213 = 0;
  reg signed [32-1 : 0] binary_expr_00214 = 0;
  reg signed [32-1 : 0] binary_expr_00196 = 0;
  reg signed [32-1 : 0] pull_recv_data_i_0197 = 32'h00000000;
  reg  binary_expr_00198 = 1'b0;
  reg signed [32-1 : 0] unary_expr_00199 = 0;
  reg signed [32-1 : 0] binary_expr_00200 = 0;
  reg signed [32-1 : 0] binary_expr_00201 = 0;
  reg signed [8-1 : 0] array_access_00202 = 0;
  reg signed [8-1 : 0] method_result_00203 = 0;
  reg signed [32-1 : 0] binary_expr_00204 = 0;
  reg signed [32-1 : 0] binary_expr_00205 = 0;
  reg signed [32-1 : 0] binary_expr_00206 = 0;
  reg signed [32-1 : 0] binary_expr_00207 = 0;
  reg signed [8-1 : 0] array_access_00208 = 0;
  reg signed [8-1 : 0] method_result_00209 = 0;
  reg signed [32-1 : 0] binary_expr_00210 = 0;
  reg signed [32-1 : 0] binary_expr_00211 = 0;
  reg signed [32-1 : 0] push_send_data_port_0215 = 0;
  reg signed [32-1 : 0] push_send_data_port_local = 0;
  reg signed [32-1 : 0] push_send_data_write_len_0216 = 0;
  reg signed [32-1 : 0] binary_expr_00217 = 0;
  reg signed [32-1 : 0] binary_expr_00218 = 0;
  reg  binary_expr_00219 = 1'b0;
  reg signed [32-1 : 0] binary_expr_00238 = 0;
  reg signed [32-1 : 0] binary_expr_00239 = 0;
  reg signed [32-1 : 0] binary_expr_00241 = 0;
  reg signed [32-1 : 0] binary_expr_00242 = 0;
  reg signed [32-1 : 0] binary_expr_00243 = 0;
  reg signed [8-1 : 0] cast_expr_00244 = 0;
  reg signed [32-1 : 0] binary_expr_00246 = 0;
  reg signed [32-1 : 0] binary_expr_00247 = 0;
  reg signed [32-1 : 0] binary_expr_00248 = 0;
  reg signed [8-1 : 0] cast_expr_00249 = 0;
  reg signed [32-1 : 0] binary_expr_00251 = 0;
  reg signed [32-1 : 0] binary_expr_00252 = 0;
  reg signed [32-1 : 0] binary_expr_00253 = 0;
  reg signed [8-1 : 0] cast_expr_00254 = 0;
  reg signed [32-1 : 0] binary_expr_00256 = 0;
  reg signed [32-1 : 0] binary_expr_00257 = 0;
  reg signed [32-1 : 0] binary_expr_00220 = 0;
  reg signed [32-1 : 0] push_send_data_i_0221 = 32'h00000000;
  reg  binary_expr_00222 = 1'b0;
  reg signed [32-1 : 0] unary_expr_00223 = 0;
  reg signed [8-1 : 0] push_send_data_v_0224 = 0;
  reg signed [32-1 : 0] binary_expr_00225 = 0;
  reg signed [32-1 : 0] binary_expr_00226 = 0;
  reg signed [8-1 : 0] array_access_00227 = 0;
  reg signed [32-1 : 0] binary_expr_00229 = 0;
  reg signed [32-1 : 0] binary_expr_00230 = 0;
  reg signed [32-1 : 0] binary_expr_00231 = 0;
  reg signed [32-1 : 0] binary_expr_00232 = 0;
  reg signed [8-1 : 0] array_access_00233 = 0;
  reg signed [32-1 : 0] binary_expr_00235 = 0;
  reg signed [32-1 : 0] binary_expr_00236 = 0;
  reg signed [32-1 : 0] tcp_server_port_0258 = 0;
  reg signed [32-1 : 0] tcp_server_port_local = 0;
  reg signed [32-1 : 0] binary_expr_00260 = 0;
  reg signed [32-1 : 0] binary_expr_00261 = 0;
  reg signed [8-1 : 0] tcp_server_v_0262 = 0;
  reg signed [8-1 : 0] method_result_00263 = 0;
  reg  binary_expr_00264 = 1'b0;
  reg signed [8-1 : 0] method_result_00269 = 0;
  reg  binary_expr_00270 = 1'b0;
  reg signed [32-1 : 0] binary_expr_00266 = 0;
  reg signed [32-1 : 0] binary_expr_00267 = 0;
  reg signed [8-1 : 0] method_result_00268 = 0;
  reg signed [32-1 : 0] binary_expr_00272 = 0;
  reg signed [32-1 : 0] binary_expr_00273 = 0;
  reg signed [8-1 : 0] method_result_00274 = 0;
  reg signed [32-1 : 0] tcp_client_wiz_port_0279 = 0;
  reg signed [32-1 : 0] tcp_client_wiz_port_local = 0;
  reg signed [32-1 : 0] tcp_client_wiz_port_offset_0280 = 0;
  reg signed [32-1 : 0] binary_expr_00281 = 0;
  reg signed [32-1 : 0] binary_expr_00283 = 0;
  reg signed [32-1 : 0] binary_expr_00285 = 0;
  reg signed [32-1 : 0] binary_expr_00287 = 0;
  reg signed [32-1 : 0] binary_expr_00289 = 0;
  reg signed [32-1 : 0] binary_expr_00291 = 0;
  reg signed [8-1 : 0] method_result_00292 = 0;
  reg signed [32-1 : 0] binary_expr_00293 = 0;
  reg  binary_expr_00294 = 1'b0;
  reg signed [32-1 : 0] binary_expr_00296 = 0;
  reg signed [32-1 : 0] binary_expr_00298 = 0;
  reg signed [32-1 : 0] binary_expr_00300 = 0;
  reg signed [32-1 : 0] binary_expr_00302 = 0;
  reg signed [32-1 : 0] binary_expr_00304 = 0;
  reg signed [32-1 : 0] binary_expr_00306 = 0;
  reg signed [32-1 : 0] binary_expr_00308 = 0;
  reg signed [32-1 : 0] binary_expr_00314 = 0;
  reg signed [8-1 : 0] method_result_00315 = 0;
  reg signed [32-1 : 0] binary_expr_00316 = 0;
  reg  binary_expr_00317 = 1'b0;
  reg signed [32-1 : 0] tcp_client_prev_midi_msg_0318 = 0;
  reg  binary_expr_00320 = 1'b0;
  reg  binary_expr_00321 = 1'b0;
  reg  binary_expr_00322 = 1'b0;
  reg signed [8-1 : 0] array_access_00325 = 0;
  reg signed [8-1 : 0] array_access_00326 = 0;
  reg signed [8-1 : 0] array_access_00327 = 0;
  reg signed [8-1 : 0] array_access_00328 = 0;
  reg signed [8-1 : 0] array_access_00329 = 0;
  reg signed [8-1 : 0] array_access_00330 = 0;
  reg signed [8-1 : 0] array_access_00331 = 0;
  reg signed [8-1 : 0] array_access_00332 = 0;
  reg signed [8-1 : 0] array_access_00333 = 0;
  reg signed [8-1 : 0] array_access_00334 = 0;
  reg signed [8-1 : 0] array_access_00335 = 0;
  reg signed [8-1 : 0] array_access_00336 = 0;
  reg signed [8-1 : 0] array_access_00337 = 0;
  reg signed [8-1 : 0] array_access_00338 = 0;
  reg signed [8-1 : 0] array_access_00339 = 0;
  reg signed [32-1 : 0] binary_expr_00340 = 0;
  reg signed [8-1 : 0] cast_expr_00341 = 0;
  reg signed [8-1 : 0] array_access_00342 = 0;
  reg signed [8-1 : 0] array_access_00343 = 0;
  reg signed [32-1 : 0] binary_expr_00344 = 0;
  reg signed [8-1 : 0] cast_expr_00345 = 0;
  reg signed [8-1 : 0] array_access_00346 = 0;
  reg signed [8-1 : 0] array_access_00347 = 0;
  reg signed [8-1 : 0] cast_expr_00348 = 0;
  wire  wait_cycles_req_flag;
  reg  wait_cycles_req_local = 1'b0;
  reg  wait_cycles_busy = 1'b0;
  wire  write_data_req_flag;
  reg  write_data_req_local = 1'b0;
  reg  write_data_busy = 1'b0;
  wire  read_data_req_flag;
  reg  read_data_req_local = 1'b0;
  reg  read_data_busy = 1'b0;
  wire  init_req_flag;
  reg  init_req_local = 1'b0;
  reg  init_busy = 1'b0;
  wire  network_configuration_req_flag;
  reg  network_configuration_req_local = 1'b0;
  reg  network_configuration_busy = 1'b0;
  wire  tcp_server_open_req_flag;
  reg  tcp_server_open_req_local = 1'b0;
  reg  tcp_server_open_busy = 1'b0;
  wire  tcp_server_listen_req_flag;
  reg  tcp_server_listen_req_local = 1'b0;
  reg  tcp_server_listen_busy = 1'b0;
  wire  wait_for_established_req_flag;
  reg  wait_for_established_req_local = 1'b0;
  reg  wait_for_established_busy = 1'b0;
  wire  wait_for_recv_req_flag;
  reg  wait_for_recv_req_local = 1'b0;
  reg  wait_for_recv_busy = 1'b0;
  wire  pull_recv_data_req_flag;
  reg  pull_recv_data_req_local = 1'b0;
  reg  pull_recv_data_busy = 1'b0;
  wire  push_send_data_req_flag;
  reg  push_send_data_req_local = 1'b0;
  reg  push_send_data_busy = 1'b0;
  wire  tcp_server_req_flag;
  reg  tcp_server_req_local = 1'b0;
  reg  tcp_server_busy = 1'b0;
  wire  tcp_client_req_flag;
  reg  tcp_client_req_local = 1'b0;
  reg  tcp_client_busy = 1'b0;
  wire  buildMidiMsg_req_flag;
  reg  buildMidiMsg_req_local = 1'b0;
  reg  buildMidiMsg_busy = 1'b0;
  wire  test_req_flag;
  reg  test_req_local = 1'b0;
  wire  tmp_0003;
  localparam wait_cycles_method_IDLE = 32'd0;
  localparam wait_cycles_method_S_0000 = 32'd1;
  localparam wait_cycles_method_S_0001 = 32'd2;
  localparam wait_cycles_method_S_0002 = 32'd3;
  localparam wait_cycles_method_S_0003 = 32'd4;
  localparam wait_cycles_method_S_0004 = 32'd5;
  localparam wait_cycles_method_S_0005 = 32'd6;
  localparam wait_cycles_method_S_0006 = 32'd7;
  localparam wait_cycles_method_S_0007 = 32'd8;
  localparam wait_cycles_method_S_0008 = 32'd9;
  localparam wait_cycles_method_S_0009 = 32'd10;
  localparam wait_cycles_method_S_0010 = 32'd11;
  reg [31:0] wait_cycles_method = wait_cycles_method_IDLE;
  reg signed [32-1 : 0] wait_cycles_method_delay = 0;
  wire  tmp_0004;
  wire  tmp_0005;
  wire  tmp_0006;
  wire signed [32-1 : 0] tmp_0007;
  localparam write_data_method_IDLE = 32'd0;
  localparam write_data_method_S_0000 = 32'd1;
  localparam write_data_method_S_0001 = 32'd2;
  localparam write_data_method_S_0002 = 32'd3;
  localparam write_data_method_S_0003 = 32'd4;
  localparam write_data_method_S_0004 = 32'd5;
  localparam write_data_method_S_0005 = 32'd6;
  localparam write_data_method_S_0006 = 32'd7;
  localparam write_data_method_S_0007 = 32'd8;
  localparam write_data_method_S_0008 = 32'd9;
  localparam write_data_method_S_0009 = 32'd10;
  localparam write_data_method_S_0010 = 32'd11;
  localparam write_data_method_S_0011 = 32'd12;
  localparam write_data_method_S_0012 = 32'd13;
  localparam write_data_method_S_0013 = 32'd14;
  localparam write_data_method_S_0014 = 32'd15;
  localparam write_data_method_S_0015 = 32'd16;
  localparam write_data_method_write_data_method_S_0010_body = 32'd17;
  reg [31:0] write_data_method = write_data_method_IDLE;
  reg signed [32-1 : 0] write_data_method_delay = 0;
  wire  wait_cycles_call_flag_0010;
  wire  tmp_0008;
  wire  tmp_0009;
  wire  tmp_0010;
  wire  tmp_0011;
  wire  tmp_0012;
  localparam read_data_method_IDLE = 32'd0;
  localparam read_data_method_S_0000 = 32'd1;
  localparam read_data_method_S_0001 = 32'd2;
  localparam read_data_method_S_0002 = 32'd3;
  localparam read_data_method_S_0003 = 32'd4;
  localparam read_data_method_S_0004 = 32'd5;
  localparam read_data_method_S_0005 = 32'd6;
  localparam read_data_method_S_0006 = 32'd7;
  localparam read_data_method_S_0007 = 32'd8;
  localparam read_data_method_S_0008 = 32'd9;
  localparam read_data_method_S_0009 = 32'd10;
  localparam read_data_method_S_0010 = 32'd11;
  localparam read_data_method_S_0011 = 32'd12;
  localparam read_data_method_S_0012 = 32'd13;
  localparam read_data_method_S_0013 = 32'd14;
  localparam read_data_method_S_0014 = 32'd15;
  localparam read_data_method_S_0015 = 32'd16;
  localparam read_data_method_S_0016 = 32'd17;
  localparam read_data_method_read_data_method_S_0008_body = 32'd18;
  reg [31:0] read_data_method = read_data_method_IDLE;
  reg signed [32-1 : 0] read_data_method_delay = 0;
  wire  wait_cycles_call_flag_0008;
  wire  tmp_0013;
  wire  tmp_0014;
  wire  tmp_0015;
  wire  tmp_0016;
  wire  tmp_0017;
  reg signed [8-1 : 0] read_data_return = 0;
  localparam init_method_IDLE = 32'd0;
  localparam init_method_S_0000 = 32'd1;
  localparam init_method_S_0001 = 32'd2;
  localparam init_method_S_0002 = 32'd3;
  localparam init_method_S_0003 = 32'd4;
  localparam init_method_S_0004 = 32'd5;
  localparam init_method_S_0005 = 32'd6;
  localparam init_method_S_0006 = 32'd7;
  localparam init_method_S_0007 = 32'd8;
  localparam init_method_S_0008 = 32'd9;
  localparam init_method_S_0009 = 32'd10;
  localparam init_method_S_0010 = 32'd11;
  localparam init_method_S_0011 = 32'd12;
  localparam init_method_S_0012 = 32'd13;
  localparam init_method_S_0013 = 32'd14;
  localparam init_method_S_0014 = 32'd15;
  localparam init_method_init_method_S_0010_body = 32'd16;
  localparam init_method_init_method_S_0013_body = 32'd17;
  reg [31:0] init_method = init_method_IDLE;
  reg signed [32-1 : 0] init_method_delay = 0;
  wire  tmp_0018;
  wire  wait_cycles_call_flag_0013;
  wire  tmp_0019;
  wire  tmp_0020;
  wire  tmp_0021;
  wire  tmp_0022;
  wire  tmp_0023;
  localparam network_configuration_method_IDLE = 32'd0;
  localparam network_configuration_method_S_0000 = 32'd1;
  localparam network_configuration_method_S_0001 = 32'd2;
  localparam network_configuration_method_S_0002 = 32'd3;
  localparam network_configuration_method_S_0003 = 32'd4;
  localparam network_configuration_method_S_0004 = 32'd5;
  localparam network_configuration_method_S_0005 = 32'd6;
  localparam network_configuration_method_S_0006 = 32'd7;
  localparam network_configuration_method_S_0007 = 32'd8;
  localparam network_configuration_method_S_0008 = 32'd9;
  localparam network_configuration_method_S_0009 = 32'd10;
  localparam network_configuration_method_S_0010 = 32'd11;
  localparam network_configuration_method_S_0011 = 32'd12;
  localparam network_configuration_method_S_0012 = 32'd13;
  localparam network_configuration_method_S_0013 = 32'd14;
  localparam network_configuration_method_S_0014 = 32'd15;
  localparam network_configuration_method_S_0015 = 32'd16;
  localparam network_configuration_method_S_0016 = 32'd17;
  localparam network_configuration_method_S_0017 = 32'd18;
  localparam network_configuration_method_S_0018 = 32'd19;
  localparam network_configuration_method_S_0019 = 32'd20;
  localparam network_configuration_method_S_0020 = 32'd21;
  localparam network_configuration_method_network_configuration_method_S_0002_body = 32'd22;
  localparam network_configuration_method_network_configuration_method_S_0003_body = 32'd23;
  localparam network_configuration_method_network_configuration_method_S_0004_body = 32'd24;
  localparam network_configuration_method_network_configuration_method_S_0005_body = 32'd25;
  localparam network_configuration_method_network_configuration_method_S_0006_body = 32'd26;
  localparam network_configuration_method_network_configuration_method_S_0007_body = 32'd27;
  localparam network_configuration_method_network_configuration_method_S_0008_body = 32'd28;
  localparam network_configuration_method_network_configuration_method_S_0009_body = 32'd29;
  localparam network_configuration_method_network_configuration_method_S_0010_body = 32'd30;
  localparam network_configuration_method_network_configuration_method_S_0011_body = 32'd31;
  localparam network_configuration_method_network_configuration_method_S_0012_body = 32'd32;
  localparam network_configuration_method_network_configuration_method_S_0013_body = 32'd33;
  localparam network_configuration_method_network_configuration_method_S_0014_body = 32'd34;
  localparam network_configuration_method_network_configuration_method_S_0015_body = 32'd35;
  localparam network_configuration_method_network_configuration_method_S_0016_body = 32'd36;
  localparam network_configuration_method_network_configuration_method_S_0017_body = 32'd37;
  localparam network_configuration_method_network_configuration_method_S_0018_body = 32'd38;
  localparam network_configuration_method_network_configuration_method_S_0019_body = 32'd39;
  reg [31:0] network_configuration_method = network_configuration_method_IDLE;
  reg signed [32-1 : 0] network_configuration_method_delay = 0;
  wire  write_data_call_flag_0002;
  wire  tmp_0024;
  wire  tmp_0025;
  wire  tmp_0026;
  wire  tmp_0027;
  wire  tmp_0028;
  wire  write_data_call_flag_0003;
  wire  tmp_0029;
  wire  tmp_0030;
  wire  tmp_0031;
  wire  tmp_0032;
  wire  tmp_0033;
  wire  write_data_call_flag_0004;
  wire  tmp_0034;
  wire  tmp_0035;
  wire  tmp_0036;
  wire  tmp_0037;
  wire  tmp_0038;
  wire  write_data_call_flag_0005;
  wire  tmp_0039;
  wire  tmp_0040;
  wire  tmp_0041;
  wire  tmp_0042;
  wire  tmp_0043;
  wire  write_data_call_flag_0006;
  wire  tmp_0044;
  wire  tmp_0045;
  wire  tmp_0046;
  wire  tmp_0047;
  wire  tmp_0048;
  wire  write_data_call_flag_0007;
  wire  tmp_0049;
  wire  tmp_0050;
  wire  tmp_0051;
  wire  tmp_0052;
  wire  tmp_0053;
  wire  write_data_call_flag_0008;
  wire  tmp_0054;
  wire  tmp_0055;
  wire  tmp_0056;
  wire  tmp_0057;
  wire  tmp_0058;
  wire  write_data_call_flag_0009;
  wire  tmp_0059;
  wire  tmp_0060;
  wire  tmp_0061;
  wire  tmp_0062;
  wire  tmp_0063;
  wire  write_data_call_flag_0010;
  wire  tmp_0064;
  wire  tmp_0065;
  wire  tmp_0066;
  wire  tmp_0067;
  wire  tmp_0068;
  wire  write_data_call_flag_0011;
  wire  tmp_0069;
  wire  tmp_0070;
  wire  tmp_0071;
  wire  tmp_0072;
  wire  tmp_0073;
  wire  write_data_call_flag_0012;
  wire  tmp_0074;
  wire  tmp_0075;
  wire  tmp_0076;
  wire  tmp_0077;
  wire  tmp_0078;
  wire  write_data_call_flag_0013;
  wire  tmp_0079;
  wire  tmp_0080;
  wire  tmp_0081;
  wire  tmp_0082;
  wire  tmp_0083;
  wire  write_data_call_flag_0014;
  wire  tmp_0084;
  wire  tmp_0085;
  wire  tmp_0086;
  wire  tmp_0087;
  wire  tmp_0088;
  wire  write_data_call_flag_0015;
  wire  tmp_0089;
  wire  tmp_0090;
  wire  tmp_0091;
  wire  tmp_0092;
  wire  tmp_0093;
  wire  write_data_call_flag_0016;
  wire  tmp_0094;
  wire  tmp_0095;
  wire  tmp_0096;
  wire  tmp_0097;
  wire  tmp_0098;
  wire  write_data_call_flag_0017;
  wire  tmp_0099;
  wire  tmp_0100;
  wire  tmp_0101;
  wire  tmp_0102;
  wire  tmp_0103;
  wire  write_data_call_flag_0018;
  wire  tmp_0104;
  wire  tmp_0105;
  wire  tmp_0106;
  wire  tmp_0107;
  wire  tmp_0108;
  wire  write_data_call_flag_0019;
  wire  tmp_0109;
  wire  tmp_0110;
  wire  tmp_0111;
  wire  tmp_0112;
  wire  tmp_0113;
  localparam tcp_server_open_method_IDLE = 32'd0;
  localparam tcp_server_open_method_S_0000 = 32'd1;
  localparam tcp_server_open_method_S_0001 = 32'd2;
  localparam tcp_server_open_method_S_0002 = 32'd3;
  localparam tcp_server_open_method_S_0003 = 32'd4;
  localparam tcp_server_open_method_S_0004 = 32'd5;
  localparam tcp_server_open_method_S_0005 = 32'd6;
  localparam tcp_server_open_method_S_0006 = 32'd7;
  localparam tcp_server_open_method_S_0007 = 32'd8;
  localparam tcp_server_open_method_S_0008 = 32'd9;
  localparam tcp_server_open_method_S_0009 = 32'd10;
  localparam tcp_server_open_method_S_0010 = 32'd11;
  localparam tcp_server_open_method_S_0011 = 32'd12;
  localparam tcp_server_open_method_S_0012 = 32'd13;
  localparam tcp_server_open_method_S_0013 = 32'd14;
  localparam tcp_server_open_method_S_0014 = 32'd15;
  localparam tcp_server_open_method_S_0015 = 32'd16;
  localparam tcp_server_open_method_S_0016 = 32'd17;
  localparam tcp_server_open_method_S_0017 = 32'd18;
  localparam tcp_server_open_method_S_0018 = 32'd19;
  localparam tcp_server_open_method_tcp_server_open_method_S_0004_body = 32'd20;
  localparam tcp_server_open_method_tcp_server_open_method_S_0007_body = 32'd21;
  localparam tcp_server_open_method_tcp_server_open_method_S_0010_body = 32'd22;
  localparam tcp_server_open_method_tcp_server_open_method_S_0013_body = 32'd23;
  localparam tcp_server_open_method_tcp_server_open_method_S_0016_body = 32'd24;
  reg [31:0] tcp_server_open_method = tcp_server_open_method_IDLE;
  reg signed [32-1 : 0] tcp_server_open_method_delay = 0;
  wire  tmp_0114;
  wire  tmp_0115;
  wire  tmp_0116;
  wire  tmp_0117;
  wire  read_data_call_flag_0016;
  wire  tmp_0118;
  wire  tmp_0119;
  wire  tmp_0120;
  wire  tmp_0121;
  wire  tmp_0122;
  reg signed [8-1 : 0] tcp_server_open_return = 0;
  wire signed [32-1 : 0] tmp_0123;
  wire signed [32-1 : 0] tmp_0124;
  wire signed [32-1 : 0] tmp_0125;
  wire signed [32-1 : 0] tmp_0126;
  wire signed [32-1 : 0] tmp_0127;
  wire signed [32-1 : 0] tmp_0128;
  wire signed [32-1 : 0] tmp_0129;
  wire signed [32-1 : 0] tmp_0130;
  wire signed [32-1 : 0] tmp_0131;
  wire signed [32-1 : 0] tmp_0132;
  localparam tcp_server_listen_method_IDLE = 32'd0;
  localparam tcp_server_listen_method_S_0000 = 32'd1;
  localparam tcp_server_listen_method_S_0001 = 32'd2;
  localparam tcp_server_listen_method_S_0002 = 32'd3;
  localparam tcp_server_listen_method_S_0003 = 32'd4;
  localparam tcp_server_listen_method_S_0004 = 32'd5;
  localparam tcp_server_listen_method_S_0005 = 32'd6;
  localparam tcp_server_listen_method_S_0006 = 32'd7;
  localparam tcp_server_listen_method_S_0007 = 32'd8;
  localparam tcp_server_listen_method_S_0008 = 32'd9;
  localparam tcp_server_listen_method_S_0009 = 32'd10;
  localparam tcp_server_listen_method_tcp_server_listen_method_S_0004_body = 32'd11;
  localparam tcp_server_listen_method_tcp_server_listen_method_S_0007_body = 32'd12;
  reg [31:0] tcp_server_listen_method = tcp_server_listen_method_IDLE;
  reg signed [32-1 : 0] tcp_server_listen_method_delay = 0;
  wire  tmp_0133;
  wire  read_data_call_flag_0007;
  wire  tmp_0134;
  wire  tmp_0135;
  wire  tmp_0136;
  wire  tmp_0137;
  wire  tmp_0138;
  reg signed [8-1 : 0] tcp_server_listen_return = 0;
  wire signed [32-1 : 0] tmp_0139;
  wire signed [32-1 : 0] tmp_0140;
  wire signed [32-1 : 0] tmp_0141;
  wire signed [32-1 : 0] tmp_0142;
  localparam wait_for_established_method_IDLE = 32'd0;
  localparam wait_for_established_method_S_0000 = 32'd1;
  localparam wait_for_established_method_S_0001 = 32'd2;
  localparam wait_for_established_method_S_0002 = 32'd3;
  localparam wait_for_established_method_S_0003 = 32'd4;
  localparam wait_for_established_method_S_0004 = 32'd5;
  localparam wait_for_established_method_S_0005 = 32'd6;
  localparam wait_for_established_method_S_0006 = 32'd7;
  localparam wait_for_established_method_S_0007 = 32'd8;
  localparam wait_for_established_method_S_0008 = 32'd9;
  localparam wait_for_established_method_S_0009 = 32'd10;
  localparam wait_for_established_method_S_0010 = 32'd11;
  localparam wait_for_established_method_S_0011 = 32'd12;
  localparam wait_for_established_method_S_0012 = 32'd13;
  localparam wait_for_established_method_S_0013 = 32'd14;
  localparam wait_for_established_method_S_0014 = 32'd15;
  localparam wait_for_established_method_wait_for_established_method_S_0006_body = 32'd16;
  reg [31:0] wait_for_established_method = wait_for_established_method_IDLE;
  reg signed [32-1 : 0] wait_for_established_method_delay = 0;
  wire  tmp_0143;
  wire  tmp_0144;
  wire  read_data_call_flag_0006;
  wire  tmp_0145;
  wire  tmp_0146;
  wire  tmp_0147;
  wire  tmp_0148;
  wire  tmp_0149;
  wire  tmp_0150;
  wire  tmp_0151;
  wire signed [32-1 : 0] tmp_0152;
  wire signed [32-1 : 0] tmp_0153;
  wire  tmp_0154;
  localparam wait_for_recv_method_IDLE = 32'd0;
  localparam wait_for_recv_method_S_0000 = 32'd1;
  localparam wait_for_recv_method_S_0001 = 32'd2;
  localparam wait_for_recv_method_S_0002 = 32'd3;
  localparam wait_for_recv_method_S_0004 = 32'd4;
  localparam wait_for_recv_method_S_0005 = 32'd5;
  localparam wait_for_recv_method_S_0006 = 32'd6;
  localparam wait_for_recv_method_S_0007 = 32'd7;
  localparam wait_for_recv_method_S_0010 = 32'd8;
  localparam wait_for_recv_method_S_0011 = 32'd9;
  localparam wait_for_recv_method_S_0012 = 32'd10;
  localparam wait_for_recv_method_S_0015 = 32'd11;
  localparam wait_for_recv_method_S_0016 = 32'd12;
  localparam wait_for_recv_method_S_0017 = 32'd13;
  localparam wait_for_recv_method_S_0020 = 32'd14;
  localparam wait_for_recv_method_S_0021 = 32'd15;
  localparam wait_for_recv_method_S_0022 = 32'd16;
  localparam wait_for_recv_method_S_0026 = 32'd17;
  localparam wait_for_recv_method_S_0027 = 32'd18;
  localparam wait_for_recv_method_S_0028 = 32'd19;
  localparam wait_for_recv_method_S_0030 = 32'd20;
  localparam wait_for_recv_method_S_0031 = 32'd21;
  localparam wait_for_recv_method_S_0032 = 32'd22;
  localparam wait_for_recv_method_S_0033 = 32'd23;
  localparam wait_for_recv_method_S_0034 = 32'd24;
  localparam wait_for_recv_method_S_0035 = 32'd25;
  localparam wait_for_recv_method_S_0036 = 32'd26;
  localparam wait_for_recv_method_S_0037 = 32'd27;
  localparam wait_for_recv_method_wait_for_recv_method_S_0010_body = 32'd28;
  localparam wait_for_recv_method_wait_for_recv_method_S_0015_body = 32'd29;
  localparam wait_for_recv_method_wait_for_recv_method_S_0020_body = 32'd30;
  reg [31:0] wait_for_recv_method = wait_for_recv_method_IDLE;
  reg signed [32-1 : 0] wait_for_recv_method_delay = 0;
  wire  tmp_0155;
  wire  tmp_0156;
  wire  read_data_call_flag_0010;
  wire  tmp_0157;
  wire  tmp_0158;
  wire  tmp_0159;
  wire  tmp_0160;
  wire  tmp_0161;
  wire  read_data_call_flag_0015;
  wire  tmp_0162;
  wire  tmp_0163;
  wire  tmp_0164;
  wire  tmp_0165;
  wire  tmp_0166;
  wire  read_data_call_flag_0020;
  wire  tmp_0167;
  wire  tmp_0168;
  wire  tmp_0169;
  wire  tmp_0170;
  wire  tmp_0171;
  wire  tmp_0172;
  wire  tmp_0173;
  wire signed [32-1 : 0] tmp_0174;
  wire signed [32-1 : 0] tmp_0175;
  wire signed [32-1 : 0] tmp_0176;
  wire signed [32-1 : 0] tmp_0177;
  wire signed [32-1 : 0] tmp_0178;
  wire signed [32-1 : 0] tmp_0179;
  wire signed [32-1 : 0] tmp_0180;
  wire signed [32-1 : 0] tmp_0181;
  wire signed [32-1 : 0] tmp_0182;
  wire signed [32-1 : 0] tmp_0183;
  wire signed [32-1 : 0] tmp_0184;
  wire signed [32-1 : 0] tmp_0185;
  wire signed [32-1 : 0] tmp_0186;
  wire  tmp_0187;
  wire  tmp_0188;
  wire  tmp_0189;
  localparam pull_recv_data_method_IDLE = 32'd0;
  localparam pull_recv_data_method_S_0000 = 32'd1;
  localparam pull_recv_data_method_S_0001 = 32'd2;
  localparam pull_recv_data_method_S_0002 = 32'd3;
  localparam pull_recv_data_method_S_0003 = 32'd4;
  localparam pull_recv_data_method_S_0006 = 32'd5;
  localparam pull_recv_data_method_S_0007 = 32'd6;
  localparam pull_recv_data_method_S_0008 = 32'd7;
  localparam pull_recv_data_method_S_0009 = 32'd8;
  localparam pull_recv_data_method_S_0010 = 32'd9;
  localparam pull_recv_data_method_S_0011 = 32'd10;
  localparam pull_recv_data_method_S_0012 = 32'd11;
  localparam pull_recv_data_method_S_0013 = 32'd12;
  localparam pull_recv_data_method_S_0014 = 32'd13;
  localparam pull_recv_data_method_S_0015 = 32'd14;
  localparam pull_recv_data_method_S_0016 = 32'd15;
  localparam pull_recv_data_method_S_0017 = 32'd16;
  localparam pull_recv_data_method_S_0018 = 32'd17;
  localparam pull_recv_data_method_S_0019 = 32'd18;
  localparam pull_recv_data_method_S_0020 = 32'd19;
  localparam pull_recv_data_method_S_0021 = 32'd20;
  localparam pull_recv_data_method_S_0022 = 32'd21;
  localparam pull_recv_data_method_S_0023 = 32'd22;
  localparam pull_recv_data_method_S_0024 = 32'd23;
  localparam pull_recv_data_method_S_0026 = 32'd24;
  localparam pull_recv_data_method_S_0027 = 32'd25;
  localparam pull_recv_data_method_S_0028 = 32'd26;
  localparam pull_recv_data_method_S_0029 = 32'd27;
  localparam pull_recv_data_method_S_0030 = 32'd28;
  localparam pull_recv_data_method_S_0031 = 32'd29;
  localparam pull_recv_data_method_S_0032 = 32'd30;
  localparam pull_recv_data_method_S_0033 = 32'd31;
  localparam pull_recv_data_method_S_0034 = 32'd32;
  localparam pull_recv_data_method_S_0035 = 32'd33;
  localparam pull_recv_data_method_S_0036 = 32'd34;
  localparam pull_recv_data_method_pull_recv_data_method_S_0023_body = 32'd35;
  localparam pull_recv_data_method_pull_recv_data_method_S_0030_body = 32'd36;
  localparam pull_recv_data_method_pull_recv_data_method_S_0035_body = 32'd37;
  reg [31:0] pull_recv_data_method = pull_recv_data_method_IDLE;
  reg signed [32-1 : 0] pull_recv_data_method_delay = 0;
  wire  tmp_0190;
  wire  tmp_0191;
  wire  tmp_0192;
  wire  tmp_0193;
  wire  read_data_call_flag_0023;
  wire  tmp_0194;
  wire  tmp_0195;
  wire  tmp_0196;
  wire  tmp_0197;
  wire  tmp_0198;
  wire  read_data_call_flag_0030;
  wire  tmp_0199;
  wire  tmp_0200;
  wire  tmp_0201;
  wire  tmp_0202;
  wire  tmp_0203;
  wire  write_data_call_flag_0035;
  wire  tmp_0204;
  wire  tmp_0205;
  wire  tmp_0206;
  wire  tmp_0207;
  wire  tmp_0208;
  wire signed [32-1 : 0] tmp_0209;
  wire signed [32-1 : 0] tmp_0210;
  wire  tmp_0211;
  wire signed [32-1 : 0] tmp_0212;
  wire  tmp_0213;
  wire signed [32-1 : 0] tmp_0214;
  wire signed [32-1 : 0] tmp_0215;
  wire signed [32-1 : 0] tmp_0216;
  wire signed [32-1 : 0] tmp_0217;
  wire signed [32-1 : 0] tmp_0218;
  wire signed [32-1 : 0] tmp_0219;
  wire signed [32-1 : 0] tmp_0220;
  wire signed [32-1 : 0] tmp_0221;
  wire signed [32-1 : 0] tmp_0222;
  wire signed [32-1 : 0] tmp_0223;
  wire signed [32-1 : 0] tmp_0224;
  localparam push_send_data_method_IDLE = 32'd0;
  localparam push_send_data_method_S_0000 = 32'd1;
  localparam push_send_data_method_S_0001 = 32'd2;
  localparam push_send_data_method_S_0002 = 32'd3;
  localparam push_send_data_method_S_0003 = 32'd4;
  localparam push_send_data_method_S_0006 = 32'd5;
  localparam push_send_data_method_S_0007 = 32'd6;
  localparam push_send_data_method_S_0008 = 32'd7;
  localparam push_send_data_method_S_0009 = 32'd8;
  localparam push_send_data_method_S_0010 = 32'd9;
  localparam push_send_data_method_S_0011 = 32'd10;
  localparam push_send_data_method_S_0012 = 32'd11;
  localparam push_send_data_method_S_0013 = 32'd12;
  localparam push_send_data_method_S_0014 = 32'd13;
  localparam push_send_data_method_S_0015 = 32'd14;
  localparam push_send_data_method_S_0016 = 32'd15;
  localparam push_send_data_method_S_0017 = 32'd16;
  localparam push_send_data_method_S_0018 = 32'd17;
  localparam push_send_data_method_S_0019 = 32'd18;
  localparam push_send_data_method_S_0020 = 32'd19;
  localparam push_send_data_method_S_0021 = 32'd20;
  localparam push_send_data_method_S_0023 = 32'd21;
  localparam push_send_data_method_S_0024 = 32'd22;
  localparam push_send_data_method_S_0025 = 32'd23;
  localparam push_send_data_method_S_0026 = 32'd24;
  localparam push_send_data_method_S_0027 = 32'd25;
  localparam push_send_data_method_S_0028 = 32'd26;
  localparam push_send_data_method_S_0030 = 32'd27;
  localparam push_send_data_method_S_0031 = 32'd28;
  localparam push_send_data_method_S_0032 = 32'd29;
  localparam push_send_data_method_S_0033 = 32'd30;
  localparam push_send_data_method_S_0034 = 32'd31;
  localparam push_send_data_method_S_0035 = 32'd32;
  localparam push_send_data_method_S_0036 = 32'd33;
  localparam push_send_data_method_S_0037 = 32'd34;
  localparam push_send_data_method_S_0040 = 32'd35;
  localparam push_send_data_method_S_0041 = 32'd36;
  localparam push_send_data_method_S_0042 = 32'd37;
  localparam push_send_data_method_S_0045 = 32'd38;
  localparam push_send_data_method_S_0046 = 32'd39;
  localparam push_send_data_method_S_0047 = 32'd40;
  localparam push_send_data_method_S_0050 = 32'd41;
  localparam push_send_data_method_S_0051 = 32'd42;
  localparam push_send_data_method_S_0052 = 32'd43;
  localparam push_send_data_method_S_0053 = 32'd44;
  localparam push_send_data_method_S_0054 = 32'd45;
  localparam push_send_data_method_push_send_data_method_S_0024_body = 32'd46;
  localparam push_send_data_method_push_send_data_method_S_0031_body = 32'd47;
  localparam push_send_data_method_push_send_data_method_S_0035_body = 32'd48;
  localparam push_send_data_method_push_send_data_method_S_0040_body = 32'd49;
  localparam push_send_data_method_push_send_data_method_S_0045_body = 32'd50;
  localparam push_send_data_method_push_send_data_method_S_0050_body = 32'd51;
  localparam push_send_data_method_push_send_data_method_S_0053_body = 32'd52;
  reg [31:0] push_send_data_method = push_send_data_method_IDLE;
  reg signed [32-1 : 0] push_send_data_method_delay = 0;
  wire  tmp_0225;
  wire  tmp_0226;
  wire  tmp_0227;
  wire  tmp_0228;
  wire  write_data_call_flag_0024;
  wire  tmp_0229;
  wire  tmp_0230;
  wire  tmp_0231;
  wire  tmp_0232;
  wire  tmp_0233;
  wire  write_data_call_flag_0031;
  wire  tmp_0234;
  wire  tmp_0235;
  wire  tmp_0236;
  wire  tmp_0237;
  wire  tmp_0238;
  wire  tmp_0239;
  wire  write_data_call_flag_0040;
  wire  tmp_0240;
  wire  tmp_0241;
  wire  tmp_0242;
  wire  tmp_0243;
  wire  tmp_0244;
  wire  write_data_call_flag_0045;
  wire  tmp_0245;
  wire  tmp_0246;
  wire  tmp_0247;
  wire  tmp_0248;
  wire  tmp_0249;
  wire  write_data_call_flag_0050;
  wire  tmp_0250;
  wire  tmp_0251;
  wire  tmp_0252;
  wire  tmp_0253;
  wire  tmp_0254;
  wire  write_data_call_flag_0053;
  wire  tmp_0255;
  wire  tmp_0256;
  wire  tmp_0257;
  wire  tmp_0258;
  wire  tmp_0259;
  wire signed [32-1 : 0] tmp_0260;
  wire signed [32-1 : 0] tmp_0261;
  wire  tmp_0262;
  wire signed [32-1 : 0] tmp_0263;
  wire  tmp_0264;
  wire signed [32-1 : 0] tmp_0265;
  wire signed [32-1 : 0] tmp_0266;
  wire signed [32-1 : 0] tmp_0267;
  wire signed [32-1 : 0] tmp_0268;
  wire signed [32-1 : 0] tmp_0269;
  wire signed [32-1 : 0] tmp_0270;
  wire signed [32-1 : 0] tmp_0271;
  wire signed [32-1 : 0] tmp_0272;
  wire signed [32-1 : 0] tmp_0273;
  wire signed [32-1 : 0] tmp_0274;
  wire signed [32-1 : 0] tmp_0275;
  wire signed [32-1 : 0] tmp_0276;
  wire signed [32-1 : 0] tmp_0277;
  wire signed [32-1 : 0] tmp_0278;
  wire signed [8-1 : 0] tmp_0279;
  wire signed [32-1 : 0] tmp_0280;
  wire signed [32-1 : 0] tmp_0281;
  wire signed [32-1 : 0] tmp_0282;
  wire signed [8-1 : 0] tmp_0283;
  wire signed [32-1 : 0] tmp_0284;
  wire signed [32-1 : 0] tmp_0285;
  wire signed [32-1 : 0] tmp_0286;
  wire signed [8-1 : 0] tmp_0287;
  wire signed [32-1 : 0] tmp_0288;
  wire signed [32-1 : 0] tmp_0289;
  localparam tcp_server_method_IDLE = 32'd0;
  localparam tcp_server_method_S_0000 = 32'd1;
  localparam tcp_server_method_S_0001 = 32'd2;
  localparam tcp_server_method_S_0002 = 32'd3;
  localparam tcp_server_method_S_0003 = 32'd4;
  localparam tcp_server_method_S_0004 = 32'd5;
  localparam tcp_server_method_S_0005 = 32'd6;
  localparam tcp_server_method_S_0006 = 32'd7;
  localparam tcp_server_method_S_0007 = 32'd8;
  localparam tcp_server_method_S_0008 = 32'd9;
  localparam tcp_server_method_S_0009 = 32'd10;
  localparam tcp_server_method_S_0010 = 32'd11;
  localparam tcp_server_method_S_0011 = 32'd12;
  localparam tcp_server_method_S_0012 = 32'd13;
  localparam tcp_server_method_S_0013 = 32'd14;
  localparam tcp_server_method_S_0014 = 32'd15;
  localparam tcp_server_method_S_0015 = 32'd16;
  localparam tcp_server_method_S_0016 = 32'd17;
  localparam tcp_server_method_S_0017 = 32'd18;
  localparam tcp_server_method_S_0018 = 32'd19;
  localparam tcp_server_method_S_0019 = 32'd20;
  localparam tcp_server_method_S_0020 = 32'd21;
  localparam tcp_server_method_S_0021 = 32'd22;
  localparam tcp_server_method_S_0022 = 32'd23;
  localparam tcp_server_method_S_0023 = 32'd24;
  localparam tcp_server_method_S_0024 = 32'd25;
  localparam tcp_server_method_S_0025 = 32'd26;
  localparam tcp_server_method_S_0026 = 32'd27;
  localparam tcp_server_method_S_0027 = 32'd28;
  localparam tcp_server_method_S_0028 = 32'd29;
  localparam tcp_server_method_S_0029 = 32'd30;
  localparam tcp_server_method_S_0030 = 32'd31;
  localparam tcp_server_method_S_0031 = 32'd32;
  localparam tcp_server_method_S_0032 = 32'd33;
  localparam tcp_server_method_S_0033 = 32'd34;
  localparam tcp_server_method_S_0034 = 32'd35;
  localparam tcp_server_method_S_0035 = 32'd36;
  localparam tcp_server_method_S_0036 = 32'd37;
  localparam tcp_server_method_S_0037 = 32'd38;
  localparam tcp_server_method_tcp_server_method_S_0004_body = 32'd39;
  localparam tcp_server_method_tcp_server_method_S_0005_body = 32'd40;
  localparam tcp_server_method_tcp_server_method_S_0012_body = 32'd41;
  localparam tcp_server_method_tcp_server_method_S_0013_body = 32'd42;
  localparam tcp_server_method_tcp_server_method_S_0017_body = 32'd43;
  localparam tcp_server_method_tcp_server_method_S_0024_body = 32'd44;
  localparam tcp_server_method_tcp_server_method_S_0025_body = 32'd45;
  localparam tcp_server_method_tcp_server_method_S_0029_body = 32'd46;
  localparam tcp_server_method_tcp_server_method_S_0033_body = 32'd47;
  localparam tcp_server_method_tcp_server_method_S_0034_body = 32'd48;
  localparam tcp_server_method_tcp_server_method_S_0035_body = 32'd49;
  reg [31:0] tcp_server_method = tcp_server_method_IDLE;
  reg signed [32-1 : 0] tcp_server_method_delay = 0;
  wire  tmp_0290;
  wire  tcp_server_open_call_flag_0005;
  wire  tmp_0291;
  wire  tmp_0292;
  wire  tmp_0293;
  wire  tmp_0294;
  wire  tmp_0295;
  wire  tmp_0296;
  wire  tmp_0297;
  wire  tmp_0298;
  wire  tcp_server_open_call_flag_0013;
  wire  tmp_0299;
  wire  tmp_0300;
  wire  tmp_0301;
  wire  tmp_0302;
  wire  tmp_0303;
  wire  tcp_server_listen_call_flag_0017;
  wire  tmp_0304;
  wire  tmp_0305;
  wire  tmp_0306;
  wire  tmp_0307;
  wire  tmp_0308;
  wire  tmp_0309;
  wire  tmp_0310;
  wire  tmp_0311;
  wire  tcp_server_listen_call_flag_0025;
  wire  tmp_0312;
  wire  tmp_0313;
  wire  tmp_0314;
  wire  tmp_0315;
  wire  tmp_0316;
  wire  wait_for_established_call_flag_0029;
  wire  tmp_0317;
  wire  tmp_0318;
  wire  tmp_0319;
  wire  tmp_0320;
  wire  tmp_0321;
  wire  tmp_0322;
  wire  tmp_0323;
  wire  wait_for_recv_call_flag_0033;
  wire  tmp_0324;
  wire  tmp_0325;
  wire  tmp_0326;
  wire  tmp_0327;
  wire  tmp_0328;
  wire  pull_recv_data_call_flag_0034;
  wire  tmp_0329;
  wire  tmp_0330;
  wire  tmp_0331;
  wire  tmp_0332;
  wire  tmp_0333;
  wire  push_send_data_call_flag_0035;
  wire  tmp_0334;
  wire  tmp_0335;
  wire  tmp_0336;
  wire  tmp_0337;
  wire  tmp_0338;
  wire signed [32-1 : 0] tmp_0339;
  wire signed [32-1 : 0] tmp_0340;
  wire  tmp_0341;
  wire signed [32-1 : 0] tmp_0342;
  wire signed [32-1 : 0] tmp_0343;
  wire  tmp_0344;
  wire signed [32-1 : 0] tmp_0345;
  wire signed [32-1 : 0] tmp_0346;
  localparam tcp_client_method_IDLE = 32'd0;
  localparam tcp_client_method_S_0000 = 32'd1;
  localparam tcp_client_method_S_0001 = 32'd2;
  localparam tcp_client_method_S_0002 = 32'd3;
  localparam tcp_client_method_S_0003 = 32'd4;
  localparam tcp_client_method_S_0004 = 32'd5;
  localparam tcp_client_method_S_0005 = 32'd6;
  localparam tcp_client_method_S_0006 = 32'd7;
  localparam tcp_client_method_S_0007 = 32'd8;
  localparam tcp_client_method_S_0008 = 32'd9;
  localparam tcp_client_method_S_0009 = 32'd10;
  localparam tcp_client_method_S_0010 = 32'd11;
  localparam tcp_client_method_S_0011 = 32'd12;
  localparam tcp_client_method_S_0012 = 32'd13;
  localparam tcp_client_method_S_0013 = 32'd14;
  localparam tcp_client_method_S_0014 = 32'd15;
  localparam tcp_client_method_S_0015 = 32'd16;
  localparam tcp_client_method_S_0016 = 32'd17;
  localparam tcp_client_method_S_0017 = 32'd18;
  localparam tcp_client_method_S_0018 = 32'd19;
  localparam tcp_client_method_S_0019 = 32'd20;
  localparam tcp_client_method_S_0020 = 32'd21;
  localparam tcp_client_method_S_0021 = 32'd22;
  localparam tcp_client_method_S_0022 = 32'd23;
  localparam tcp_client_method_S_0023 = 32'd24;
  localparam tcp_client_method_S_0024 = 32'd25;
  localparam tcp_client_method_S_0025 = 32'd26;
  localparam tcp_client_method_S_0026 = 32'd27;
  localparam tcp_client_method_S_0027 = 32'd28;
  localparam tcp_client_method_S_0028 = 32'd29;
  localparam tcp_client_method_S_0029 = 32'd30;
  localparam tcp_client_method_S_0030 = 32'd31;
  localparam tcp_client_method_S_0031 = 32'd32;
  localparam tcp_client_method_S_0032 = 32'd33;
  localparam tcp_client_method_S_0033 = 32'd34;
  localparam tcp_client_method_S_0034 = 32'd35;
  localparam tcp_client_method_S_0035 = 32'd36;
  localparam tcp_client_method_S_0036 = 32'd37;
  localparam tcp_client_method_S_0037 = 32'd38;
  localparam tcp_client_method_S_0038 = 32'd39;
  localparam tcp_client_method_S_0039 = 32'd40;
  localparam tcp_client_method_S_0040 = 32'd41;
  localparam tcp_client_method_S_0041 = 32'd42;
  localparam tcp_client_method_S_0042 = 32'd43;
  localparam tcp_client_method_S_0043 = 32'd44;
  localparam tcp_client_method_S_0044 = 32'd45;
  localparam tcp_client_method_S_0045 = 32'd46;
  localparam tcp_client_method_S_0046 = 32'd47;
  localparam tcp_client_method_S_0047 = 32'd48;
  localparam tcp_client_method_S_0048 = 32'd49;
  localparam tcp_client_method_S_0049 = 32'd50;
  localparam tcp_client_method_S_0050 = 32'd51;
  localparam tcp_client_method_S_0051 = 32'd52;
  localparam tcp_client_method_S_0052 = 32'd53;
  localparam tcp_client_method_S_0053 = 32'd54;
  localparam tcp_client_method_S_0054 = 32'd55;
  localparam tcp_client_method_S_0055 = 32'd56;
  localparam tcp_client_method_S_0056 = 32'd57;
  localparam tcp_client_method_S_0057 = 32'd58;
  localparam tcp_client_method_S_0058 = 32'd59;
  localparam tcp_client_method_S_0059 = 32'd60;
  localparam tcp_client_method_S_0060 = 32'd61;
  localparam tcp_client_method_S_0061 = 32'd62;
  localparam tcp_client_method_S_0062 = 32'd63;
  localparam tcp_client_method_tcp_client_method_S_0005_body = 32'd64;
  localparam tcp_client_method_tcp_client_method_S_0007_body = 32'd65;
  localparam tcp_client_method_tcp_client_method_S_0009_body = 32'd66;
  localparam tcp_client_method_tcp_client_method_S_0011_body = 32'd67;
  localparam tcp_client_method_tcp_client_method_S_0013_body = 32'd68;
  localparam tcp_client_method_tcp_client_method_S_0016_body = 32'd69;
  localparam tcp_client_method_tcp_client_method_S_0022_body = 32'd70;
  localparam tcp_client_method_tcp_client_method_S_0024_body = 32'd71;
  localparam tcp_client_method_tcp_client_method_S_0026_body = 32'd72;
  localparam tcp_client_method_tcp_client_method_S_0028_body = 32'd73;
  localparam tcp_client_method_tcp_client_method_S_0030_body = 32'd74;
  localparam tcp_client_method_tcp_client_method_S_0032_body = 32'd75;
  localparam tcp_client_method_tcp_client_method_S_0034_body = 32'd76;
  localparam tcp_client_method_tcp_client_method_S_0035_body = 32'd77;
  localparam tcp_client_method_tcp_client_method_S_0036_body = 32'd78;
  localparam tcp_client_method_tcp_client_method_S_0037_body = 32'd79;
  localparam tcp_client_method_tcp_client_method_S_0038_body = 32'd80;
  localparam tcp_client_method_tcp_client_method_S_0040_body = 32'd81;
  localparam tcp_client_method_tcp_client_method_S_0043_body = 32'd82;
  localparam tcp_client_method_tcp_client_method_S_0051_body = 32'd83;
  localparam tcp_client_method_tcp_client_method_S_0059_body = 32'd84;
  localparam tcp_client_method_tcp_client_method_S_0060_body = 32'd85;
  reg [31:0] tcp_client_method = tcp_client_method_IDLE;
  reg signed [32-1 : 0] tcp_client_method_delay = 0;
  wire  tmp_0347;
  wire  tmp_0348;
  wire  tmp_0349;
  wire  tmp_0350;
  wire  tmp_0351;
  wire  tmp_0352;
  wire  tmp_0353;
  wire  tmp_0354;
  wire  write_data_call_flag_0022;
  wire  tmp_0355;
  wire  tmp_0356;
  wire  tmp_0357;
  wire  tmp_0358;
  wire  tmp_0359;
  wire  tmp_0360;
  wire  write_data_call_flag_0026;
  wire  tmp_0361;
  wire  tmp_0362;
  wire  tmp_0363;
  wire  tmp_0364;
  wire  tmp_0365;
  wire  write_data_call_flag_0028;
  wire  tmp_0366;
  wire  tmp_0367;
  wire  tmp_0368;
  wire  tmp_0369;
  wire  tmp_0370;
  wire  write_data_call_flag_0030;
  wire  tmp_0371;
  wire  tmp_0372;
  wire  tmp_0373;
  wire  tmp_0374;
  wire  tmp_0375;
  wire  write_data_call_flag_0032;
  wire  tmp_0376;
  wire  tmp_0377;
  wire  tmp_0378;
  wire  tmp_0379;
  wire  tmp_0380;
  wire  write_data_call_flag_0034;
  wire  tmp_0381;
  wire  tmp_0382;
  wire  tmp_0383;
  wire  tmp_0384;
  wire  tmp_0385;
  wire  tmp_0386;
  wire  write_data_call_flag_0036;
  wire  tmp_0387;
  wire  tmp_0388;
  wire  tmp_0389;
  wire  tmp_0390;
  wire  tmp_0391;
  wire  write_data_call_flag_0037;
  wire  tmp_0392;
  wire  tmp_0393;
  wire  tmp_0394;
  wire  tmp_0395;
  wire  tmp_0396;
  wire  write_data_call_flag_0038;
  wire  tmp_0397;
  wire  tmp_0398;
  wire  tmp_0399;
  wire  tmp_0400;
  wire  tmp_0401;
  wire  tmp_0402;
  wire  read_data_call_flag_0043;
  wire  tmp_0403;
  wire  tmp_0404;
  wire  tmp_0405;
  wire  tmp_0406;
  wire  tmp_0407;
  wire  tmp_0408;
  wire  tmp_0409;
  wire  tmp_0410;
  wire  tmp_0411;
  wire  wait_cycles_call_flag_0051;
  wire  tmp_0412;
  wire  tmp_0413;
  wire  tmp_0414;
  wire  tmp_0415;
  wire  tmp_0416;
  wire  tmp_0417;
  wire  tmp_0418;
  wire  buildMidiMsg_call_flag_0059;
  wire  tmp_0419;
  wire  tmp_0420;
  wire  tmp_0421;
  wire  tmp_0422;
  wire  tmp_0423;
  wire  push_send_data_call_flag_0060;
  wire  tmp_0424;
  wire  tmp_0425;
  wire  tmp_0426;
  wire  tmp_0427;
  wire  tmp_0428;
  wire signed [32-1 : 0] tmp_0429;
  wire signed [32-1 : 0] tmp_0430;
  wire signed [32-1 : 0] tmp_0431;
  wire signed [32-1 : 0] tmp_0432;
  wire signed [32-1 : 0] tmp_0433;
  wire signed [32-1 : 0] tmp_0434;
  wire signed [32-1 : 0] tmp_0435;
  wire  tmp_0436;
  wire signed [32-1 : 0] tmp_0437;
  wire signed [32-1 : 0] tmp_0438;
  wire signed [32-1 : 0] tmp_0439;
  wire signed [32-1 : 0] tmp_0440;
  wire signed [32-1 : 0] tmp_0441;
  wire signed [32-1 : 0] tmp_0442;
  wire signed [32-1 : 0] tmp_0443;
  wire signed [32-1 : 0] tmp_0444;
  wire signed [32-1 : 0] tmp_0445;
  wire  tmp_0446;
  wire  tmp_0447;
  wire  tmp_0448;
  wire  tmp_0449;
  localparam buildMidiMsg_method_IDLE = 32'd0;
  localparam buildMidiMsg_method_S_0000 = 32'd1;
  localparam buildMidiMsg_method_S_0001 = 32'd2;
  localparam buildMidiMsg_method_S_0002 = 32'd3;
  localparam buildMidiMsg_method_S_0004 = 32'd4;
  localparam buildMidiMsg_method_S_0006 = 32'd5;
  localparam buildMidiMsg_method_S_0008 = 32'd6;
  localparam buildMidiMsg_method_S_0010 = 32'd7;
  localparam buildMidiMsg_method_S_0012 = 32'd8;
  localparam buildMidiMsg_method_S_0014 = 32'd9;
  localparam buildMidiMsg_method_S_0016 = 32'd10;
  localparam buildMidiMsg_method_S_0018 = 32'd11;
  localparam buildMidiMsg_method_S_0020 = 32'd12;
  localparam buildMidiMsg_method_S_0022 = 32'd13;
  localparam buildMidiMsg_method_S_0024 = 32'd14;
  localparam buildMidiMsg_method_S_0026 = 32'd15;
  localparam buildMidiMsg_method_S_0028 = 32'd16;
  localparam buildMidiMsg_method_S_0030 = 32'd17;
  localparam buildMidiMsg_method_S_0031 = 32'd18;
  localparam buildMidiMsg_method_S_0032 = 32'd19;
  localparam buildMidiMsg_method_S_0033 = 32'd20;
  localparam buildMidiMsg_method_S_0034 = 32'd21;
  localparam buildMidiMsg_method_S_0036 = 32'd22;
  localparam buildMidiMsg_method_S_0037 = 32'd23;
  localparam buildMidiMsg_method_S_0038 = 32'd24;
  localparam buildMidiMsg_method_S_0039 = 32'd25;
  localparam buildMidiMsg_method_S_0040 = 32'd26;
  localparam buildMidiMsg_method_S_0042 = 32'd27;
  localparam buildMidiMsg_method_S_0043 = 32'd28;
  localparam buildMidiMsg_method_S_0044 = 32'd29;
  localparam buildMidiMsg_method_S_0046 = 32'd30;
  reg [31:0] buildMidiMsg_method = buildMidiMsg_method_IDLE;
  reg signed [32-1 : 0] buildMidiMsg_method_delay = 0;
  wire signed [32-1 : 0] tmp_0450;
  wire signed [8-1 : 0] tmp_0451;
  wire signed [32-1 : 0] tmp_0452;
  wire signed [8-1 : 0] tmp_0453;
  wire signed [8-1 : 0] tmp_0454;
  localparam test_method_IDLE = 32'd0;
  localparam test_method_S_0000 = 32'd1;
  localparam test_method_S_0001 = 32'd2;
  localparam test_method_S_0002 = 32'd3;
  localparam test_method_S_0003 = 32'd4;
  localparam test_method_S_0004 = 32'd5;
  localparam test_method_S_0005 = 32'd6;
  localparam test_method_S_0006 = 32'd7;
  localparam test_method_S_0007 = 32'd8;
  localparam test_method_S_0008 = 32'd9;
  localparam test_method_test_method_S_0002_body = 32'd10;
  localparam test_method_test_method_S_0003_body = 32'd11;
  localparam test_method_test_method_S_0004_body = 32'd12;
  reg [31:0] test_method = test_method_IDLE;
  reg signed [32-1 : 0] test_method_delay = 0;
  wire  init_call_flag_0002;
  wire  tmp_0455;
  wire  tmp_0456;
  wire  tmp_0457;
  wire  tmp_0458;
  wire  tmp_0459;
  wire  network_configuration_call_flag_0003;
  wire  tmp_0460;
  wire  tmp_0461;
  wire  tmp_0462;
  wire  tmp_0463;
  wire  tmp_0464;
  wire  tcp_client_call_flag_0004;
  wire  tmp_0465;
  wire  tmp_0466;
  wire  tmp_0467;
  wire  tmp_0468;
  wire  tmp_0469;
  wire  tmp_0470;
  wire  tmp_0471;


  assign clk_sig = clk;
  assign reset_sig = reset;
  assign class_wiz830mj_0000_ADDR_exp = class_wiz830mj_0000_ADDR_exp_sig;
  assign class_wiz830mj_0000_ADDR_exp_sig = class_wiz830mj_0000_ADDR;

  assign class_wiz830mj_0000_nCS_exp = class_wiz830mj_0000_nCS_exp_sig;
  assign class_wiz830mj_0000_nCS_exp_sig = class_wiz830mj_0000_nCS;

  assign class_wiz830mj_0000_nRD_exp = class_wiz830mj_0000_nRD_exp_sig;
  assign class_wiz830mj_0000_nRD_exp_sig = class_wiz830mj_0000_nRD;

  assign class_wiz830mj_0000_nWR_exp = class_wiz830mj_0000_nWR_exp_sig;
  assign class_wiz830mj_0000_nWR_exp_sig = class_wiz830mj_0000_nWR;

  assign class_wiz830mj_0000_nINT_exp_sig = class_wiz830mj_0000_nINT_exp;
  assign class_wiz830mj_0000_nRESET_exp = class_wiz830mj_0000_nRESET_exp_sig;
  assign class_wiz830mj_0000_nRESET_exp_sig = class_wiz830mj_0000_nRESET;

  assign class_wiz830mj_0000_BRDY_exp_sig = class_wiz830mj_0000_BRDY_exp;
  assign length_in_sig = length_in;
  assign length_we_sig = length_we;
  assign length_out = length_out_sig;
  assign length_out_sig = class_length_0002;

  assign midi_msg_in_sig = midi_msg_in;
  assign midi_msg_we_sig = midi_msg_we;
  assign midi_msg_out = midi_msg_out_sig;
  assign midi_msg_out_sig = class_midi_msg_0003;

  assign test_req_sig = test_req;
  assign test_busy = test_busy_sig;
  always @(posedge clk) begin
    if(reset == 1'b1) begin
      test_busy_sig <= 1'b1;
    end else begin
      if (test_method == test_method_S_0001) begin
        test_busy_sig <= test_req_flag;
      end
    end
  end


  assign tmp_0001 = length_we_sig == 1'b1 ? length_in_sig : class_length_0002;
  assign tmp_0002 = midi_msg_we_sig == 1'b1 ? midi_msg_in_sig : class_midi_msg_0003;
  assign tmp_0003 = test_req_local || test_req_sig;
  assign tmp_0004 = binary_expr_00092 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0005 = binary_expr_00092 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0006 = wait_cycles_i_0091 < wait_cycles_n_0090 ? 1'b1 : 1'b0;
  assign tmp_0007 = wait_cycles_i_0091 + 32'h00000001;
  assign tmp_0008 = wait_cycles_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0009 = wait_cycles_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0010 = tmp_0008 && tmp_0009;
  assign tmp_0011 = tmp_0010 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0012 = wait_cycles_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0013 = wait_cycles_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0014 = wait_cycles_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0015 = tmp_0013 && tmp_0014;
  assign tmp_0016 = tmp_0015 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0017 = wait_cycles_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0018 = wait_cycles_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0019 = wait_cycles_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0020 = wait_cycles_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0021 = tmp_0019 && tmp_0020;
  assign tmp_0022 = tmp_0021 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0023 = wait_cycles_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0024 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0025 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0026 = tmp_0024 && tmp_0025;
  assign tmp_0027 = tmp_0026 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0028 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0029 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0030 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0031 = tmp_0029 && tmp_0030;
  assign tmp_0032 = tmp_0031 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0033 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0034 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0035 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0036 = tmp_0034 && tmp_0035;
  assign tmp_0037 = tmp_0036 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0038 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0039 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0040 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0041 = tmp_0039 && tmp_0040;
  assign tmp_0042 = tmp_0041 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0043 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0044 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0045 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0046 = tmp_0044 && tmp_0045;
  assign tmp_0047 = tmp_0046 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0048 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0049 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0050 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0051 = tmp_0049 && tmp_0050;
  assign tmp_0052 = tmp_0051 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0053 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0054 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0055 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0056 = tmp_0054 && tmp_0055;
  assign tmp_0057 = tmp_0056 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0058 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0059 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0060 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0061 = tmp_0059 && tmp_0060;
  assign tmp_0062 = tmp_0061 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0063 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0064 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0065 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0066 = tmp_0064 && tmp_0065;
  assign tmp_0067 = tmp_0066 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0068 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0069 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0070 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0071 = tmp_0069 && tmp_0070;
  assign tmp_0072 = tmp_0071 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0073 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0074 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0075 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0076 = tmp_0074 && tmp_0075;
  assign tmp_0077 = tmp_0076 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0078 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0079 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0080 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0081 = tmp_0079 && tmp_0080;
  assign tmp_0082 = tmp_0081 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0083 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0084 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0085 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0086 = tmp_0084 && tmp_0085;
  assign tmp_0087 = tmp_0086 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0088 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0089 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0090 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0091 = tmp_0089 && tmp_0090;
  assign tmp_0092 = tmp_0091 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0093 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0094 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0095 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0096 = tmp_0094 && tmp_0095;
  assign tmp_0097 = tmp_0096 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0098 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0099 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0100 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0101 = tmp_0099 && tmp_0100;
  assign tmp_0102 = tmp_0101 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0103 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0104 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0105 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0106 = tmp_0104 && tmp_0105;
  assign tmp_0107 = tmp_0106 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0108 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0109 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0110 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0111 = tmp_0109 && tmp_0110;
  assign tmp_0112 = tmp_0111 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0113 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0114 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0115 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0116 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0117 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0118 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0119 = read_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0120 = tmp_0118 && tmp_0119;
  assign tmp_0121 = tmp_0120 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0122 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0123 = {tcp_server_open_port_0137[25:0],6'b0};
  assign tmp_0124 = class_Sn_MR1_0005 + binary_expr_00139;
  assign tmp_0125 = {tcp_server_open_port_0137[25:0],6'b0};
  assign tmp_0126 = class_Sn_PORTR0_0014 + binary_expr_00142;
  assign tmp_0127 = {tcp_server_open_port_0137[25:0],6'b0};
  assign tmp_0128 = class_Sn_PORTR1_0015 + binary_expr_00145;
  assign tmp_0129 = {tcp_server_open_port_0137[25:0],6'b0};
  assign tmp_0130 = class_Sn_CR1_0007 + binary_expr_00148;
  assign tmp_0131 = {tcp_server_open_port_0137[25:0],6'b0};
  assign tmp_0132 = class_Sn_SSR1_0013 + binary_expr_00151;
  assign tmp_0133 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0134 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0135 = read_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0136 = tmp_0134 && tmp_0135;
  assign tmp_0137 = tmp_0136 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0138 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0139 = {tcp_server_listen_port_0153[25:0],6'b0};
  assign tmp_0140 = class_Sn_CR1_0007 + binary_expr_00155;
  assign tmp_0141 = {tcp_server_listen_port_0153[25:0],6'b0};
  assign tmp_0142 = class_Sn_SSR1_0013 + binary_expr_00158;
  assign tmp_0143 = 1'b1 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0144 = 1'b1 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0145 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0146 = read_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0147 = tmp_0145 && tmp_0146;
  assign tmp_0148 = tmp_0147 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0149 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0150 = binary_expr_00165 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0151 = binary_expr_00165 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0152 = {wait_for_established_port_0160[25:0],6'b0};
  assign tmp_0153 = class_Sn_SSR1_0013 + binary_expr_00163;
  assign tmp_0154 = wait_for_established_v_0161 == class_Sn_SOCK_ESTABLISHED_0077 ? 1'b1 : 1'b0;
  assign tmp_0155 = 1'b1 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0156 = 1'b1 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0157 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0158 = read_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0159 = tmp_0157 && tmp_0158;
  assign tmp_0160 = tmp_0159 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0161 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0162 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0163 = read_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0164 = tmp_0162 && tmp_0163;
  assign tmp_0165 = tmp_0164 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0166 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0167 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0168 = read_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0169 = tmp_0167 && tmp_0168;
  assign tmp_0170 = tmp_0169 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0171 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0172 = binary_expr_00190 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0173 = binary_expr_00190 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0174 = {wait_for_recv_port_0166[25:0],6'b0};
  assign tmp_0175 = class_Sn_RX_RSR1_0045 + binary_expr_00171;
  assign tmp_0176 = {method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170[7], method_result_00170};
  assign tmp_0177 = {wait_for_recv_port_0166[25:0],6'b0};
  assign tmp_0178 = class_Sn_RX_RSR2_0046 + binary_expr_00176;
  assign tmp_0179 = {method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175[7], method_result_00175};
  assign tmp_0180 = {wait_for_recv_port_0166[25:0],6'b0};
  assign tmp_0181 = class_Sn_RX_RSR3_0047 + binary_expr_00181;
  assign tmp_0182 = {method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180[7], method_result_00180};
  assign tmp_0183 = {wait_for_recv_v0_0169[15:0],16'b0};
  assign tmp_0184 = {wait_for_recv_v1_0174[23:0],8'b0};
  assign tmp_0185 = binary_expr_00184 + binary_expr_00185;
  assign tmp_0186 = binary_expr_00186 + wait_for_recv_v2_0179;
  assign tmp_0187 = wait_for_recv_v_0167 != 32'h00000000 ? 1'b1 : 1'b0;
  assign tmp_0188 = wait_for_recv_v_0167 == wait_for_recv_prev_v_0168 ? 1'b1 : 1'b0;
  assign tmp_0189 = binary_expr_00188 && binary_expr_00189;
  assign tmp_0190 = binary_expr_00195 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0191 = binary_expr_00195 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0192 = binary_expr_00198 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0193 = binary_expr_00198 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0194 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0195 = read_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0196 = tmp_0194 && tmp_0195;
  assign tmp_0197 = tmp_0196 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0198 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0199 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0200 = read_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0201 = tmp_0199 && tmp_0200;
  assign tmp_0202 = tmp_0201 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0203 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0204 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0205 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0206 = tmp_0204 && tmp_0205;
  assign tmp_0207 = tmp_0206 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0208 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0209 = {class_length_0002[31], class_length_0002[31:1]};
  assign tmp_0210 = class_length_0002 && 32'h00000001;
  assign tmp_0211 = binary_expr_00194 == 32'h00000001 ? 1'b1 : 1'b0;
  assign tmp_0212 = pull_recv_data_read_len_0192 + 32'h00000001;
  assign tmp_0213 = pull_recv_data_i_0197 < pull_recv_data_read_len_0192 ? 1'b1 : 1'b0;
  assign tmp_0214 = pull_recv_data_i_0197 + 32'h00000001;
  assign tmp_0215 = {pull_recv_data_i_0197[30:0],1'b0};
  assign tmp_0216 = binary_expr_00200 + 32'h00000000;
  assign tmp_0217 = {pull_recv_data_port_0191[25:0],6'b0};
  assign tmp_0218 = class_Sn_RX_FIFOR0_0052 + binary_expr_00204;
  assign tmp_0219 = {pull_recv_data_i_0197[30:0],1'b0};
  assign tmp_0220 = binary_expr_00206 + 32'h00000001;
  assign tmp_0221 = {pull_recv_data_port_0191[25:0],6'b0};
  assign tmp_0222 = class_Sn_RX_FIFOR1_0053 + binary_expr_00210;
  assign tmp_0223 = {pull_recv_data_port_0191[25:0],6'b0};
  assign tmp_0224 = class_Sn_CR1_0007 + binary_expr_00213;
  assign tmp_0225 = binary_expr_00219 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0226 = binary_expr_00219 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0227 = binary_expr_00222 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0228 = binary_expr_00222 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0229 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0230 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0231 = tmp_0229 && tmp_0230;
  assign tmp_0232 = tmp_0231 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0233 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0234 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0235 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0236 = tmp_0234 && tmp_0235;
  assign tmp_0237 = tmp_0236 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0238 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0239 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0240 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0241 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0242 = tmp_0240 && tmp_0241;
  assign tmp_0243 = tmp_0242 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0244 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0245 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0246 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0247 = tmp_0245 && tmp_0246;
  assign tmp_0248 = tmp_0247 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0249 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0250 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0251 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0252 = tmp_0250 && tmp_0251;
  assign tmp_0253 = tmp_0252 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0254 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0255 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0256 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0257 = tmp_0255 && tmp_0256;
  assign tmp_0258 = tmp_0257 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0259 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0260 = {class_length_0002[31], class_length_0002[31:1]};
  assign tmp_0261 = class_length_0002 && 32'h00000001;
  assign tmp_0262 = binary_expr_00218 == 32'h00000001 ? 1'b1 : 1'b0;
  assign tmp_0263 = push_send_data_write_len_0216 + 32'h00000001;
  assign tmp_0264 = push_send_data_i_0221 < push_send_data_write_len_0216 ? 1'b1 : 1'b0;
  assign tmp_0265 = push_send_data_i_0221 + 32'h00000001;
  assign tmp_0266 = {push_send_data_i_0221[30:0],1'b0};
  assign tmp_0267 = binary_expr_00225 + 32'h00000000;
  assign tmp_0268 = {push_send_data_port_0215[25:0],6'b0};
  assign tmp_0269 = class_Sn_TX_FIFOR0_0050 + binary_expr_00229;
  assign tmp_0270 = {push_send_data_i_0221[30:0],1'b0};
  assign tmp_0271 = binary_expr_00231 + 32'h00000001;
  assign tmp_0272 = {push_send_data_port_0215[25:0],6'b0};
  assign tmp_0273 = class_Sn_TX_FIFOR1_0051 + binary_expr_00235;
  assign tmp_0274 = {push_send_data_port_0215[25:0],6'b0};
  assign tmp_0275 = class_Sn_CR1_0007 + binary_expr_00238;
  assign tmp_0276 = {push_send_data_port_0215[25:0],6'b0};
  assign tmp_0277 = {class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31:16]};
  assign tmp_0278 = class_Sn_TX_WRSR1_0037 + binary_expr_00241;
  assign tmp_0279 = binary_expr_00243[32 - 32'h00000018 - 1 : 0];
  assign tmp_0280 = {push_send_data_port_0215[25:0],6'b0};
  assign tmp_0281 = {class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31], class_length_0002[31:8]};
  assign tmp_0282 = class_Sn_TX_WRSR2_0038 + binary_expr_00246;
  assign tmp_0283 = binary_expr_00248[32 - 32'h00000018 - 1 : 0];
  assign tmp_0284 = {push_send_data_port_0215[25:0],6'b0};
  assign tmp_0285 = class_length_0002;
  assign tmp_0286 = class_Sn_TX_WRSR3_0039 + binary_expr_00251;
  assign tmp_0287 = binary_expr_00253[32 - 32'h00000018 - 1 : 0];
  assign tmp_0288 = {push_send_data_port_0215[25:0],6'b0};
  assign tmp_0289 = class_Sn_CR1_0007 + binary_expr_00256;
  assign tmp_0290 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0291 = tcp_server_open_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0292 = tcp_server_open_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0293 = tmp_0291 && tmp_0292;
  assign tmp_0294 = tmp_0293 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0295 = tcp_server_open_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0296 = binary_expr_00264 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0297 = binary_expr_00264 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0298 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0299 = tcp_server_open_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0300 = tcp_server_open_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0301 = tmp_0299 && tmp_0300;
  assign tmp_0302 = tmp_0301 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0303 = tcp_server_open_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0304 = tcp_server_listen_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0305 = tcp_server_listen_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0306 = tmp_0304 && tmp_0305;
  assign tmp_0307 = tmp_0306 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0308 = tcp_server_listen_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0309 = binary_expr_00270 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0310 = binary_expr_00270 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0311 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0312 = tcp_server_listen_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0313 = tcp_server_listen_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0314 = tmp_0312 && tmp_0313;
  assign tmp_0315 = tmp_0314 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0316 = tcp_server_listen_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0317 = wait_for_established_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0318 = wait_for_established_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0319 = tmp_0317 && tmp_0318;
  assign tmp_0320 = tmp_0319 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0321 = wait_for_established_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0322 = 1'b1 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0323 = 1'b1 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0324 = wait_for_recv_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0325 = wait_for_recv_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0326 = tmp_0324 && tmp_0325;
  assign tmp_0327 = tmp_0326 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0328 = wait_for_recv_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0329 = pull_recv_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0330 = pull_recv_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0331 = tmp_0329 && tmp_0330;
  assign tmp_0332 = tmp_0331 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0333 = pull_recv_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0334 = push_send_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0335 = push_send_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0336 = tmp_0334 && tmp_0335;
  assign tmp_0337 = tmp_0336 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0338 = push_send_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0339 = {tcp_server_port_0258[25:0],6'b0};
  assign tmp_0340 = class_Sn_MR0_0004 + binary_expr_00260;
  assign tmp_0341 = tcp_server_v_0262 != class_Sn_SOCK_INIT_0075 ? 1'b1 : 1'b0;
  assign tmp_0342 = {tcp_server_port_0258[25:0],6'b0};
  assign tmp_0343 = class_Sn_CR1_0007 + binary_expr_00266;
  assign tmp_0344 = tcp_server_v_0262 != class_Sn_SOCK_LISTEN_0076 ? 1'b1 : 1'b0;
  assign tmp_0345 = {tcp_server_port_0258[25:0],6'b0};
  assign tmp_0346 = class_Sn_CR1_0007 + binary_expr_00272;
  assign tmp_0347 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0348 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0349 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0350 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0351 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0352 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0353 = binary_expr_00294 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0354 = binary_expr_00294 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0355 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0356 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0357 = tmp_0355 && tmp_0356;
  assign tmp_0358 = tmp_0357 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0359 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0360 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0361 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0362 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0363 = tmp_0361 && tmp_0362;
  assign tmp_0364 = tmp_0363 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0365 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0366 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0367 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0368 = tmp_0366 && tmp_0367;
  assign tmp_0369 = tmp_0368 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0370 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0371 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0372 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0373 = tmp_0371 && tmp_0372;
  assign tmp_0374 = tmp_0373 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0375 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0376 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0377 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0378 = tmp_0376 && tmp_0377;
  assign tmp_0379 = tmp_0378 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0380 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0381 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0382 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0383 = tmp_0381 && tmp_0382;
  assign tmp_0384 = tmp_0383 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0385 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0386 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0387 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0388 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0389 = tmp_0387 && tmp_0388;
  assign tmp_0390 = tmp_0389 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0391 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0392 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0393 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0394 = tmp_0392 && tmp_0393;
  assign tmp_0395 = tmp_0394 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0396 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0397 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0398 = write_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0399 = tmp_0397 && tmp_0398;
  assign tmp_0400 = tmp_0399 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0401 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0402 = write_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0403 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0404 = read_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0405 = tmp_0403 && tmp_0404;
  assign tmp_0406 = tmp_0405 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0407 = read_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0408 = binary_expr_00317 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0409 = binary_expr_00317 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0410 = 1'b1 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0411 = 1'b1 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0412 = wait_cycles_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0413 = wait_cycles_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0414 = tmp_0412 && tmp_0413;
  assign tmp_0415 = tmp_0414 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0416 = wait_cycles_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0417 = binary_expr_00322 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0418 = binary_expr_00322 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0419 = buildMidiMsg_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0420 = buildMidiMsg_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0421 = tmp_0419 && tmp_0420;
  assign tmp_0422 = tmp_0421 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0423 = buildMidiMsg_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0424 = push_send_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0425 = push_send_data_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0426 = tmp_0424 && tmp_0425;
  assign tmp_0427 = tmp_0426 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0428 = push_send_data_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0429 = {tcp_client_wiz_port_0279[25:0],6'b0};
  assign tmp_0430 = class_Sn_MR0_0004 + tcp_client_wiz_port_offset_0280;
  assign tmp_0431 = class_Sn_MR1_0005 + tcp_client_wiz_port_offset_0280;
  assign tmp_0432 = class_Sn_PORTR0_0014 + tcp_client_wiz_port_offset_0280;
  assign tmp_0433 = class_Sn_PORTR1_0015 + tcp_client_wiz_port_offset_0280;
  assign tmp_0434 = class_Sn_CR1_0007 + tcp_client_wiz_port_offset_0280;
  assign tmp_0435 = class_Sn_SSR1_0013 + tcp_client_wiz_port_offset_0280;
  assign tmp_0436 = method_result_00292 != class_Sn_SOCK_INIT_0075 ? 1'b1 : 1'b0;
  assign tmp_0437 = class_Sn_DIPR0_0024 + tcp_client_wiz_port_offset_0280;
  assign tmp_0438 = class_Sn_DIPR0_0024 + tcp_client_wiz_port_offset_0280;
  assign tmp_0439 = class_Sn_DIPR1_0025 + tcp_client_wiz_port_offset_0280;
  assign tmp_0440 = class_Sn_DIPR2_0026 + tcp_client_wiz_port_offset_0280;
  assign tmp_0441 = class_Sn_DIPR3_0027 + tcp_client_wiz_port_offset_0280;
  assign tmp_0442 = class_Sn_DPORTR0_0022 + tcp_client_wiz_port_offset_0280;
  assign tmp_0443 = class_Sn_DPORTR1_0023 + tcp_client_wiz_port_offset_0280;
  assign tmp_0444 = class_Sn_CR1_0007 + tcp_client_wiz_port_offset_0280;
  assign tmp_0445 = class_Sn_SSR1_0013 + tcp_client_wiz_port_offset_0280;
  assign tmp_0446 = method_result_00315 != class_Sn_SOCK_ESTABLISHED_0077 ? 1'b1 : 1'b0;
  assign tmp_0447 = class_midi_msg_0003 == tcp_client_prev_midi_msg_0318 ? 1'b1 : 1'b0;
  assign tmp_0448 = class_midi_msg_0003 == 32'h00000000 ? 1'b1 : 1'b0;
  assign tmp_0449 = binary_expr_00320 || binary_expr_00321;
  assign tmp_0450 = {class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31:16]};
  assign tmp_0451 = binary_expr_00340[32 - 32'h00000018 - 1 : 0];
  assign tmp_0452 = {class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31], class_midi_msg_0003[31:8]};
  assign tmp_0453 = binary_expr_00344[32 - 32'h00000018 - 1 : 0];
  assign tmp_0454 = class_midi_msg_0003[32 - 32'h00000018 - 1 : 0];
  assign tmp_0455 = init_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0456 = init_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0457 = tmp_0455 && tmp_0456;
  assign tmp_0458 = tmp_0457 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0459 = init_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0460 = network_configuration_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0461 = network_configuration_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0462 = tmp_0460 && tmp_0461;
  assign tmp_0463 = tmp_0462 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0464 = network_configuration_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0465 = tcp_client_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0466 = tcp_client_req_local == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0467 = tmp_0465 && tmp_0466;
  assign tmp_0468 = tmp_0467 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0469 = tcp_client_busy == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0470 = 1'b1 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0471 = 1'b1 == 1'b0 ? 1'b1 : 1'b0;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_cycles_method <= wait_cycles_method_IDLE;
      wait_cycles_method_delay <= 32'h0;
    end else begin
      case (wait_cycles_method)
        wait_cycles_method_IDLE : begin
          wait_cycles_method <= wait_cycles_method_S_0000;
        end
        wait_cycles_method_S_0000 : begin
          wait_cycles_method <= wait_cycles_method_S_0001;
          wait_cycles_method <= wait_cycles_method_S_0001;
        end
        wait_cycles_method_S_0001 : begin
          if (wait_cycles_req_flag == 1'b1) begin
            wait_cycles_method <= wait_cycles_method_S_0002;
          end
        end
        wait_cycles_method_S_0002 : begin
          wait_cycles_method <= wait_cycles_method_S_0003;
        end
        wait_cycles_method_S_0003 : begin
          wait_cycles_method <= wait_cycles_method_S_0004;
        end
        wait_cycles_method_S_0004 : begin
          if (tmp_0004 == 1'b1) begin
            wait_cycles_method <= wait_cycles_method_S_0009;
          end else if (tmp_0005 == 1'b1) begin
            wait_cycles_method <= wait_cycles_method_S_0005;
          end
        end
        wait_cycles_method_S_0005 : begin
          wait_cycles_method <= wait_cycles_method_S_0010;
        end
        wait_cycles_method_S_0006 : begin
          wait_cycles_method <= wait_cycles_method_S_0007;
        end
        wait_cycles_method_S_0007 : begin
          wait_cycles_method <= wait_cycles_method_S_0008;
        end
        wait_cycles_method_S_0008 : begin
          wait_cycles_method <= wait_cycles_method_S_0003;
        end
        wait_cycles_method_S_0009 : begin
          wait_cycles_method <= wait_cycles_method_S_0006;
        end
        wait_cycles_method_S_0010 : begin
          wait_cycles_method <= wait_cycles_method_S_0000;
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      write_data_method <= write_data_method_IDLE;
      write_data_method_delay <= 32'h0;
    end else begin
      case (write_data_method)
        write_data_method_IDLE : begin
          write_data_method <= write_data_method_S_0000;
        end
        write_data_method_S_0000 : begin
          write_data_method <= write_data_method_S_0001;
          write_data_method <= write_data_method_S_0001;
        end
        write_data_method_S_0001 : begin
          if (write_data_req_flag == 1'b1) begin
            write_data_method <= write_data_method_S_0002;
          end
        end
        write_data_method_S_0002 : begin
          write_data_method <= write_data_method_S_0003;
        end
        write_data_method_S_0003 : begin
          write_data_method <= write_data_method_S_0004;
        end
        write_data_method_S_0004 : begin
          write_data_method <= write_data_method_S_0005;
        end
        write_data_method_S_0005 : begin
          write_data_method <= write_data_method_S_0006;
        end
        write_data_method_S_0006 : begin
          write_data_method <= write_data_method_S_0007;
        end
        write_data_method_S_0007 : begin
          write_data_method <= write_data_method_S_0008;
        end
        write_data_method_S_0008 : begin
          write_data_method <= write_data_method_S_0009;
        end
        write_data_method_S_0009 : begin
          write_data_method <= write_data_method_S_0010;
        end
        write_data_method_S_0010 : begin
          if (tmp_0012 == 1'b1) begin
            write_data_method <= write_data_method_write_data_method_S_0010_body;
          end
        end
        write_data_method_S_0011 : begin
          write_data_method <= write_data_method_S_0012;
        end
        write_data_method_S_0012 : begin
          write_data_method <= write_data_method_S_0013;
        end
        write_data_method_S_0013 : begin
          write_data_method <= write_data_method_S_0014;
        end
        write_data_method_S_0014 : begin
          write_data_method <= write_data_method_S_0015;
        end
        write_data_method_S_0015 : begin
          write_data_method <= write_data_method_S_0000;
        end
        write_data_method_write_data_method_S_0010_body : begin
          if (write_data_method_delay >= 1 && wait_cycles_call_flag_0010 == 1'b1) begin
            write_data_method_delay <= 32'h0;
            write_data_method_delay <= 0;
            write_data_method <= write_data_method_S_0011;
          end else begin
            write_data_method_delay <= write_data_method_delay + 1;
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      read_data_method <= read_data_method_IDLE;
      read_data_method_delay <= 32'h0;
    end else begin
      case (read_data_method)
        read_data_method_IDLE : begin
          read_data_method <= read_data_method_S_0000;
        end
        read_data_method_S_0000 : begin
          read_data_method <= read_data_method_S_0001;
          read_data_method <= read_data_method_S_0001;
        end
        read_data_method_S_0001 : begin
          if (read_data_req_flag == 1'b1) begin
            read_data_method <= read_data_method_S_0002;
          end
        end
        read_data_method_S_0002 : begin
          read_data_method <= read_data_method_S_0003;
        end
        read_data_method_S_0003 : begin
          read_data_method <= read_data_method_S_0004;
        end
        read_data_method_S_0004 : begin
          read_data_method <= read_data_method_S_0005;
        end
        read_data_method_S_0005 : begin
          read_data_method <= read_data_method_S_0006;
        end
        read_data_method_S_0006 : begin
          read_data_method <= read_data_method_S_0007;
        end
        read_data_method_S_0007 : begin
          read_data_method <= read_data_method_S_0008;
        end
        read_data_method_S_0008 : begin
          if (tmp_0017 == 1'b1) begin
            read_data_method <= read_data_method_read_data_method_S_0008_body;
          end
        end
        read_data_method_S_0009 : begin
          read_data_method <= read_data_method_S_0010;
        end
        read_data_method_S_0010 : begin
          read_data_method <= read_data_method_S_0011;
        end
        read_data_method_S_0011 : begin
          read_data_method <= read_data_method_S_0012;
        end
        read_data_method_S_0012 : begin
          read_data_method <= read_data_method_S_0013;
        end
        read_data_method_S_0013 : begin
          read_data_method <= read_data_method_S_0014;
        end
        read_data_method_S_0014 : begin
          read_data_method <= read_data_method_S_0015;
        end
        read_data_method_S_0015 : begin
          read_data_method <= read_data_method_S_0000;
        end
        read_data_method_S_0016 : begin
          read_data_method <= read_data_method_S_0000;
        end
        read_data_method_read_data_method_S_0008_body : begin
          if (read_data_method_delay >= 1 && wait_cycles_call_flag_0008 == 1'b1) begin
            read_data_method_delay <= 32'h0;
            read_data_method_delay <= 0;
            read_data_method <= read_data_method_S_0009;
          end else begin
            read_data_method_delay <= read_data_method_delay + 1;
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      init_method <= init_method_IDLE;
      init_method_delay <= 32'h0;
    end else begin
      case (init_method)
        init_method_IDLE : begin
          init_method <= init_method_S_0000;
        end
        init_method_S_0000 : begin
          init_method <= init_method_S_0001;
          init_method <= init_method_S_0001;
        end
        init_method_S_0001 : begin
          if (init_req_flag == 1'b1) begin
            init_method <= init_method_S_0002;
          end
        end
        init_method_S_0002 : begin
          init_method <= init_method_S_0003;
        end
        init_method_S_0003 : begin
          init_method <= init_method_S_0004;
        end
        init_method_S_0004 : begin
          init_method <= init_method_S_0005;
        end
        init_method_S_0005 : begin
          init_method <= init_method_S_0006;
        end
        init_method_S_0006 : begin
          init_method <= init_method_S_0007;
        end
        init_method_S_0007 : begin
          init_method <= init_method_S_0008;
        end
        init_method_S_0008 : begin
          init_method <= init_method_S_0009;
        end
        init_method_S_0009 : begin
          init_method <= init_method_S_0010;
        end
        init_method_S_0010 : begin
          if (tmp_0018 == 1'b1) begin
            init_method <= init_method_init_method_S_0010_body;
          end
        end
        init_method_S_0011 : begin
          init_method <= init_method_S_0012;
        end
        init_method_S_0012 : begin
          init_method <= init_method_S_0013;
        end
        init_method_S_0013 : begin
          if (tmp_0023 == 1'b1) begin
            init_method <= init_method_init_method_S_0013_body;
          end
        end
        init_method_S_0014 : begin
          init_method <= init_method_S_0000;
        end
        init_method_init_method_S_0010_body : begin
          if (init_method_delay >= 1 && wait_cycles_call_flag_0010 == 1'b1) begin
            init_method_delay <= 32'h0;
            init_method_delay <= 0;
            init_method <= init_method_S_0011;
          end else begin
            init_method_delay <= init_method_delay + 1;
          end
        end
        init_method_init_method_S_0013_body : begin
          if (init_method_delay >= 1 && wait_cycles_call_flag_0013 == 1'b1) begin
            init_method_delay <= 32'h0;
            init_method_delay <= 0;
            init_method <= init_method_S_0014;
          end else begin
            init_method_delay <= init_method_delay + 1;
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      network_configuration_method <= network_configuration_method_IDLE;
      network_configuration_method_delay <= 32'h0;
    end else begin
      case (network_configuration_method)
        network_configuration_method_IDLE : begin
          network_configuration_method <= network_configuration_method_S_0000;
        end
        network_configuration_method_S_0000 : begin
          network_configuration_method <= network_configuration_method_S_0001;
          network_configuration_method <= network_configuration_method_S_0001;
        end
        network_configuration_method_S_0001 : begin
          if (network_configuration_req_flag == 1'b1) begin
            network_configuration_method <= network_configuration_method_S_0002;
          end
        end
        network_configuration_method_S_0002 : begin
          if (tmp_0028 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0002_body;
          end
        end
        network_configuration_method_S_0003 : begin
          if (tmp_0033 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0003_body;
          end
        end
        network_configuration_method_S_0004 : begin
          if (tmp_0038 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0004_body;
          end
        end
        network_configuration_method_S_0005 : begin
          if (tmp_0043 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0005_body;
          end
        end
        network_configuration_method_S_0006 : begin
          if (tmp_0048 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0006_body;
          end
        end
        network_configuration_method_S_0007 : begin
          if (tmp_0053 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0007_body;
          end
        end
        network_configuration_method_S_0008 : begin
          if (tmp_0058 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0008_body;
          end
        end
        network_configuration_method_S_0009 : begin
          if (tmp_0063 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0009_body;
          end
        end
        network_configuration_method_S_0010 : begin
          if (tmp_0068 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0010_body;
          end
        end
        network_configuration_method_S_0011 : begin
          if (tmp_0073 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0011_body;
          end
        end
        network_configuration_method_S_0012 : begin
          if (tmp_0078 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0012_body;
          end
        end
        network_configuration_method_S_0013 : begin
          if (tmp_0083 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0013_body;
          end
        end
        network_configuration_method_S_0014 : begin
          if (tmp_0088 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0014_body;
          end
        end
        network_configuration_method_S_0015 : begin
          if (tmp_0093 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0015_body;
          end
        end
        network_configuration_method_S_0016 : begin
          if (tmp_0098 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0016_body;
          end
        end
        network_configuration_method_S_0017 : begin
          if (tmp_0103 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0017_body;
          end
        end
        network_configuration_method_S_0018 : begin
          if (tmp_0108 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0018_body;
          end
        end
        network_configuration_method_S_0019 : begin
          if (tmp_0113 == 1'b1) begin
            network_configuration_method <= network_configuration_method_network_configuration_method_S_0019_body;
          end
        end
        network_configuration_method_S_0020 : begin
          network_configuration_method <= network_configuration_method_S_0000;
        end
        network_configuration_method_network_configuration_method_S_0002_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0002 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0003;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
        network_configuration_method_network_configuration_method_S_0003_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0003 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0004;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
        network_configuration_method_network_configuration_method_S_0004_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0004 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0005;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
        network_configuration_method_network_configuration_method_S_0005_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0005 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0006;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
        network_configuration_method_network_configuration_method_S_0006_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0006 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0007;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
        network_configuration_method_network_configuration_method_S_0007_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0007 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0008;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
        network_configuration_method_network_configuration_method_S_0008_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0008 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0009;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
        network_configuration_method_network_configuration_method_S_0009_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0009 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0010;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
        network_configuration_method_network_configuration_method_S_0010_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0010 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0011;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
        network_configuration_method_network_configuration_method_S_0011_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0011 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0012;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
        network_configuration_method_network_configuration_method_S_0012_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0012 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0013;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
        network_configuration_method_network_configuration_method_S_0013_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0013 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0014;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
        network_configuration_method_network_configuration_method_S_0014_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0014 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0015;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
        network_configuration_method_network_configuration_method_S_0015_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0015 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0016;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
        network_configuration_method_network_configuration_method_S_0016_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0016 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0017;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
        network_configuration_method_network_configuration_method_S_0017_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0017 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0018;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
        network_configuration_method_network_configuration_method_S_0018_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0018 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0019;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
        network_configuration_method_network_configuration_method_S_0019_body : begin
          if (network_configuration_method_delay >= 1 && write_data_call_flag_0019 == 1'b1) begin
            network_configuration_method_delay <= 32'h0;
            network_configuration_method_delay <= 0;
            network_configuration_method <= network_configuration_method_S_0020;
          end else begin
            network_configuration_method_delay <= network_configuration_method_delay + 1;
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_server_open_method <= tcp_server_open_method_IDLE;
      tcp_server_open_method_delay <= 32'h0;
    end else begin
      case (tcp_server_open_method)
        tcp_server_open_method_IDLE : begin
          tcp_server_open_method <= tcp_server_open_method_S_0000;
        end
        tcp_server_open_method_S_0000 : begin
          tcp_server_open_method <= tcp_server_open_method_S_0001;
          tcp_server_open_method <= tcp_server_open_method_S_0001;
        end
        tcp_server_open_method_S_0001 : begin
          if (tcp_server_open_req_flag == 1'b1) begin
            tcp_server_open_method <= tcp_server_open_method_S_0002;
          end
        end
        tcp_server_open_method_S_0002 : begin
          tcp_server_open_method <= tcp_server_open_method_S_0003;
        end
        tcp_server_open_method_S_0003 : begin
          tcp_server_open_method <= tcp_server_open_method_S_0004;
        end
        tcp_server_open_method_S_0004 : begin
          if (tmp_0114 == 1'b1) begin
            tcp_server_open_method <= tcp_server_open_method_tcp_server_open_method_S_0004_body;
          end
        end
        tcp_server_open_method_S_0005 : begin
          tcp_server_open_method <= tcp_server_open_method_S_0006;
        end
        tcp_server_open_method_S_0006 : begin
          tcp_server_open_method <= tcp_server_open_method_S_0007;
        end
        tcp_server_open_method_S_0007 : begin
          if (tmp_0115 == 1'b1) begin
            tcp_server_open_method <= tcp_server_open_method_tcp_server_open_method_S_0007_body;
          end
        end
        tcp_server_open_method_S_0008 : begin
          tcp_server_open_method <= tcp_server_open_method_S_0009;
        end
        tcp_server_open_method_S_0009 : begin
          tcp_server_open_method <= tcp_server_open_method_S_0010;
        end
        tcp_server_open_method_S_0010 : begin
          if (tmp_0116 == 1'b1) begin
            tcp_server_open_method <= tcp_server_open_method_tcp_server_open_method_S_0010_body;
          end
        end
        tcp_server_open_method_S_0011 : begin
          tcp_server_open_method <= tcp_server_open_method_S_0012;
        end
        tcp_server_open_method_S_0012 : begin
          tcp_server_open_method <= tcp_server_open_method_S_0013;
        end
        tcp_server_open_method_S_0013 : begin
          if (tmp_0117 == 1'b1) begin
            tcp_server_open_method <= tcp_server_open_method_tcp_server_open_method_S_0013_body;
          end
        end
        tcp_server_open_method_S_0014 : begin
          tcp_server_open_method <= tcp_server_open_method_S_0015;
        end
        tcp_server_open_method_S_0015 : begin
          tcp_server_open_method <= tcp_server_open_method_S_0016;
        end
        tcp_server_open_method_S_0016 : begin
          if (tmp_0122 == 1'b1) begin
            tcp_server_open_method <= tcp_server_open_method_tcp_server_open_method_S_0016_body;
          end
        end
        tcp_server_open_method_S_0017 : begin
          tcp_server_open_method <= tcp_server_open_method_S_0000;
        end
        tcp_server_open_method_S_0018 : begin
          tcp_server_open_method <= tcp_server_open_method_S_0000;
        end
        tcp_server_open_method_tcp_server_open_method_S_0004_body : begin
          if (tcp_server_open_method_delay >= 1 && write_data_call_flag_0004 == 1'b1) begin
            tcp_server_open_method_delay <= 32'h0;
            tcp_server_open_method_delay <= 0;
            tcp_server_open_method <= tcp_server_open_method_S_0005;
          end else begin
            tcp_server_open_method_delay <= tcp_server_open_method_delay + 1;
          end
        end
        tcp_server_open_method_tcp_server_open_method_S_0007_body : begin
          if (tcp_server_open_method_delay >= 1 && write_data_call_flag_0007 == 1'b1) begin
            tcp_server_open_method_delay <= 32'h0;
            tcp_server_open_method_delay <= 0;
            tcp_server_open_method <= tcp_server_open_method_S_0008;
          end else begin
            tcp_server_open_method_delay <= tcp_server_open_method_delay + 1;
          end
        end
        tcp_server_open_method_tcp_server_open_method_S_0010_body : begin
          if (tcp_server_open_method_delay >= 1 && write_data_call_flag_0010 == 1'b1) begin
            tcp_server_open_method_delay <= 32'h0;
            tcp_server_open_method_delay <= 0;
            tcp_server_open_method <= tcp_server_open_method_S_0011;
          end else begin
            tcp_server_open_method_delay <= tcp_server_open_method_delay + 1;
          end
        end
        tcp_server_open_method_tcp_server_open_method_S_0013_body : begin
          if (tcp_server_open_method_delay >= 1 && write_data_call_flag_0013 == 1'b1) begin
            tcp_server_open_method_delay <= 32'h0;
            tcp_server_open_method_delay <= 0;
            tcp_server_open_method <= tcp_server_open_method_S_0014;
          end else begin
            tcp_server_open_method_delay <= tcp_server_open_method_delay + 1;
          end
        end
        tcp_server_open_method_tcp_server_open_method_S_0016_body : begin
          if (tcp_server_open_method_delay >= 1 && read_data_call_flag_0016 == 1'b1) begin
            tcp_server_open_method_delay <= 32'h0;
            tcp_server_open_method_delay <= 0;
            tcp_server_open_method <= tcp_server_open_method_S_0017;
          end else begin
            tcp_server_open_method_delay <= tcp_server_open_method_delay + 1;
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_server_listen_method <= tcp_server_listen_method_IDLE;
      tcp_server_listen_method_delay <= 32'h0;
    end else begin
      case (tcp_server_listen_method)
        tcp_server_listen_method_IDLE : begin
          tcp_server_listen_method <= tcp_server_listen_method_S_0000;
        end
        tcp_server_listen_method_S_0000 : begin
          tcp_server_listen_method <= tcp_server_listen_method_S_0001;
          tcp_server_listen_method <= tcp_server_listen_method_S_0001;
        end
        tcp_server_listen_method_S_0001 : begin
          if (tcp_server_listen_req_flag == 1'b1) begin
            tcp_server_listen_method <= tcp_server_listen_method_S_0002;
          end
        end
        tcp_server_listen_method_S_0002 : begin
          tcp_server_listen_method <= tcp_server_listen_method_S_0003;
        end
        tcp_server_listen_method_S_0003 : begin
          tcp_server_listen_method <= tcp_server_listen_method_S_0004;
        end
        tcp_server_listen_method_S_0004 : begin
          if (tmp_0133 == 1'b1) begin
            tcp_server_listen_method <= tcp_server_listen_method_tcp_server_listen_method_S_0004_body;
          end
        end
        tcp_server_listen_method_S_0005 : begin
          tcp_server_listen_method <= tcp_server_listen_method_S_0006;
        end
        tcp_server_listen_method_S_0006 : begin
          tcp_server_listen_method <= tcp_server_listen_method_S_0007;
        end
        tcp_server_listen_method_S_0007 : begin
          if (tmp_0138 == 1'b1) begin
            tcp_server_listen_method <= tcp_server_listen_method_tcp_server_listen_method_S_0007_body;
          end
        end
        tcp_server_listen_method_S_0008 : begin
          tcp_server_listen_method <= tcp_server_listen_method_S_0000;
        end
        tcp_server_listen_method_S_0009 : begin
          tcp_server_listen_method <= tcp_server_listen_method_S_0000;
        end
        tcp_server_listen_method_tcp_server_listen_method_S_0004_body : begin
          if (tcp_server_listen_method_delay >= 1 && write_data_call_flag_0004 == 1'b1) begin
            tcp_server_listen_method_delay <= 32'h0;
            tcp_server_listen_method_delay <= 0;
            tcp_server_listen_method <= tcp_server_listen_method_S_0005;
          end else begin
            tcp_server_listen_method_delay <= tcp_server_listen_method_delay + 1;
          end
        end
        tcp_server_listen_method_tcp_server_listen_method_S_0007_body : begin
          if (tcp_server_listen_method_delay >= 1 && read_data_call_flag_0007 == 1'b1) begin
            tcp_server_listen_method_delay <= 32'h0;
            tcp_server_listen_method_delay <= 0;
            tcp_server_listen_method <= tcp_server_listen_method_S_0008;
          end else begin
            tcp_server_listen_method_delay <= tcp_server_listen_method_delay + 1;
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_for_established_method <= wait_for_established_method_IDLE;
      wait_for_established_method_delay <= 32'h0;
    end else begin
      case (wait_for_established_method)
        wait_for_established_method_IDLE : begin
          wait_for_established_method <= wait_for_established_method_S_0000;
        end
        wait_for_established_method_S_0000 : begin
          wait_for_established_method <= wait_for_established_method_S_0001;
          wait_for_established_method <= wait_for_established_method_S_0001;
        end
        wait_for_established_method_S_0001 : begin
          if (wait_for_established_req_flag == 1'b1) begin
            wait_for_established_method <= wait_for_established_method_S_0002;
          end
        end
        wait_for_established_method_S_0002 : begin
          if (tmp_0143 == 1'b1) begin
            wait_for_established_method <= wait_for_established_method_S_0004;
          end else if (tmp_0144 == 1'b1) begin
            wait_for_established_method <= wait_for_established_method_S_0003;
          end
        end
        wait_for_established_method_S_0003 : begin
          wait_for_established_method <= wait_for_established_method_S_0014;
        end
        wait_for_established_method_S_0004 : begin
          wait_for_established_method <= wait_for_established_method_S_0005;
        end
        wait_for_established_method_S_0005 : begin
          wait_for_established_method <= wait_for_established_method_S_0006;
        end
        wait_for_established_method_S_0006 : begin
          if (tmp_0149 == 1'b1) begin
            wait_for_established_method <= wait_for_established_method_wait_for_established_method_S_0006_body;
          end
        end
        wait_for_established_method_S_0007 : begin
          wait_for_established_method <= wait_for_established_method_S_0008;
        end
        wait_for_established_method_S_0008 : begin
          wait_for_established_method <= wait_for_established_method_S_0009;
        end
        wait_for_established_method_S_0009 : begin
          if (tmp_0150 == 1'b1) begin
            wait_for_established_method <= wait_for_established_method_S_0011;
          end else if (tmp_0151 == 1'b1) begin
            wait_for_established_method <= wait_for_established_method_S_0010;
          end
        end
        wait_for_established_method_S_0010 : begin
          wait_for_established_method <= wait_for_established_method_S_0013;
        end
        wait_for_established_method_S_0011 : begin
          wait_for_established_method <= wait_for_established_method_S_0000;
        end
        wait_for_established_method_S_0012 : begin
          wait_for_established_method <= wait_for_established_method_S_0010;
        end
        wait_for_established_method_S_0013 : begin
          wait_for_established_method <= wait_for_established_method_S_0002;
        end
        wait_for_established_method_S_0014 : begin
          wait_for_established_method <= wait_for_established_method_S_0000;
        end
        wait_for_established_method_wait_for_established_method_S_0006_body : begin
          if (wait_for_established_method_delay >= 1 && read_data_call_flag_0006 == 1'b1) begin
            wait_for_established_method_delay <= 32'h0;
            wait_for_established_method_delay <= 0;
            wait_for_established_method <= wait_for_established_method_S_0007;
          end else begin
            wait_for_established_method_delay <= wait_for_established_method_delay + 1;
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_for_recv_method <= wait_for_recv_method_IDLE;
      wait_for_recv_method_delay <= 32'h0;
    end else begin
      case (wait_for_recv_method)
        wait_for_recv_method_IDLE : begin
          wait_for_recv_method <= wait_for_recv_method_S_0000;
        end
        wait_for_recv_method_S_0000 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0001;
          wait_for_recv_method <= wait_for_recv_method_S_0001;
        end
        wait_for_recv_method_S_0001 : begin
          if (wait_for_recv_req_flag == 1'b1) begin
            wait_for_recv_method <= wait_for_recv_method_S_0002;
          end
        end
        wait_for_recv_method_S_0002 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0004;
        end
        wait_for_recv_method_S_0004 : begin
          if (tmp_0155 == 1'b1) begin
            wait_for_recv_method <= wait_for_recv_method_S_0006;
          end else if (tmp_0156 == 1'b1) begin
            wait_for_recv_method <= wait_for_recv_method_S_0005;
          end
        end
        wait_for_recv_method_S_0005 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0037;
        end
        wait_for_recv_method_S_0006 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0007;
        end
        wait_for_recv_method_S_0007 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0010;
        end
        wait_for_recv_method_S_0010 : begin
          if (tmp_0161 == 1'b1) begin
            wait_for_recv_method <= wait_for_recv_method_wait_for_recv_method_S_0010_body;
          end
        end
        wait_for_recv_method_S_0011 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0012;
        end
        wait_for_recv_method_S_0012 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0015;
        end
        wait_for_recv_method_S_0015 : begin
          if (tmp_0166 == 1'b1) begin
            wait_for_recv_method <= wait_for_recv_method_wait_for_recv_method_S_0015_body;
          end
        end
        wait_for_recv_method_S_0016 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0017;
        end
        wait_for_recv_method_S_0017 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0020;
        end
        wait_for_recv_method_S_0020 : begin
          if (tmp_0171 == 1'b1) begin
            wait_for_recv_method <= wait_for_recv_method_wait_for_recv_method_S_0020_body;
          end
        end
        wait_for_recv_method_S_0021 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0022;
        end
        wait_for_recv_method_S_0022 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0026;
        end
        wait_for_recv_method_S_0026 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0027;
        end
        wait_for_recv_method_S_0027 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0028;
        end
        wait_for_recv_method_S_0028 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0030;
        end
        wait_for_recv_method_S_0030 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0031;
        end
        wait_for_recv_method_S_0031 : begin
          if (tmp_0172 == 1'b1) begin
            wait_for_recv_method <= wait_for_recv_method_S_0033;
          end else if (tmp_0173 == 1'b1) begin
            wait_for_recv_method <= wait_for_recv_method_S_0032;
          end
        end
        wait_for_recv_method_S_0032 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0036;
        end
        wait_for_recv_method_S_0033 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0034;
        end
        wait_for_recv_method_S_0034 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0000;
        end
        wait_for_recv_method_S_0035 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0032;
        end
        wait_for_recv_method_S_0036 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0004;
        end
        wait_for_recv_method_S_0037 : begin
          wait_for_recv_method <= wait_for_recv_method_S_0000;
        end
        wait_for_recv_method_wait_for_recv_method_S_0010_body : begin
          if (wait_for_recv_method_delay >= 1 && read_data_call_flag_0010 == 1'b1) begin
            wait_for_recv_method_delay <= 32'h0;
            wait_for_recv_method_delay <= 0;
            wait_for_recv_method <= wait_for_recv_method_S_0011;
          end else begin
            wait_for_recv_method_delay <= wait_for_recv_method_delay + 1;
          end
        end
        wait_for_recv_method_wait_for_recv_method_S_0015_body : begin
          if (wait_for_recv_method_delay >= 1 && read_data_call_flag_0015 == 1'b1) begin
            wait_for_recv_method_delay <= 32'h0;
            wait_for_recv_method_delay <= 0;
            wait_for_recv_method <= wait_for_recv_method_S_0016;
          end else begin
            wait_for_recv_method_delay <= wait_for_recv_method_delay + 1;
          end
        end
        wait_for_recv_method_wait_for_recv_method_S_0020_body : begin
          if (wait_for_recv_method_delay >= 1 && read_data_call_flag_0020 == 1'b1) begin
            wait_for_recv_method_delay <= 32'h0;
            wait_for_recv_method_delay <= 0;
            wait_for_recv_method <= wait_for_recv_method_S_0021;
          end else begin
            wait_for_recv_method_delay <= wait_for_recv_method_delay + 1;
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      pull_recv_data_method <= pull_recv_data_method_IDLE;
      pull_recv_data_method_delay <= 32'h0;
    end else begin
      case (pull_recv_data_method)
        pull_recv_data_method_IDLE : begin
          pull_recv_data_method <= pull_recv_data_method_S_0000;
        end
        pull_recv_data_method_S_0000 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0001;
          pull_recv_data_method <= pull_recv_data_method_S_0001;
        end
        pull_recv_data_method_S_0001 : begin
          if (pull_recv_data_req_flag == 1'b1) begin
            pull_recv_data_method <= pull_recv_data_method_S_0002;
          end
        end
        pull_recv_data_method_S_0002 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0003;
        end
        pull_recv_data_method_S_0003 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0006;
        end
        pull_recv_data_method_S_0006 : begin
          if (tmp_0190 == 1'b1) begin
            pull_recv_data_method <= pull_recv_data_method_S_0008;
          end else if (tmp_0191 == 1'b1) begin
            pull_recv_data_method <= pull_recv_data_method_S_0007;
          end
        end
        pull_recv_data_method_S_0007 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0011;
        end
        pull_recv_data_method_S_0008 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0009;
        end
        pull_recv_data_method_S_0009 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0010;
        end
        pull_recv_data_method_S_0010 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0007;
        end
        pull_recv_data_method_S_0011 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0012;
        end
        pull_recv_data_method_S_0012 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0013;
        end
        pull_recv_data_method_S_0013 : begin
          if (tmp_0192 == 1'b1) begin
            pull_recv_data_method <= pull_recv_data_method_S_0018;
          end else if (tmp_0193 == 1'b1) begin
            pull_recv_data_method <= pull_recv_data_method_S_0014;
          end
        end
        pull_recv_data_method_S_0014 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0033;
        end
        pull_recv_data_method_S_0015 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0016;
        end
        pull_recv_data_method_S_0016 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0017;
        end
        pull_recv_data_method_S_0017 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0012;
        end
        pull_recv_data_method_S_0018 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0019;
        end
        pull_recv_data_method_S_0019 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0020;
        end
        pull_recv_data_method_S_0020 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0021;
        end
        pull_recv_data_method_S_0021 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0022;
        end
        pull_recv_data_method_S_0022 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0023;
        end
        pull_recv_data_method_S_0023 : begin
          if (tmp_0198 == 1'b1) begin
            pull_recv_data_method <= pull_recv_data_method_pull_recv_data_method_S_0023_body;
          end
        end
        pull_recv_data_method_S_0024 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0026;
        end
        pull_recv_data_method_S_0026 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0027;
        end
        pull_recv_data_method_S_0027 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0028;
        end
        pull_recv_data_method_S_0028 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0029;
        end
        pull_recv_data_method_S_0029 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0030;
        end
        pull_recv_data_method_S_0030 : begin
          if (tmp_0203 == 1'b1) begin
            pull_recv_data_method <= pull_recv_data_method_pull_recv_data_method_S_0030_body;
          end
        end
        pull_recv_data_method_S_0031 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0032;
        end
        pull_recv_data_method_S_0032 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0015;
        end
        pull_recv_data_method_S_0033 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0034;
        end
        pull_recv_data_method_S_0034 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0035;
        end
        pull_recv_data_method_S_0035 : begin
          if (tmp_0208 == 1'b1) begin
            pull_recv_data_method <= pull_recv_data_method_pull_recv_data_method_S_0035_body;
          end
        end
        pull_recv_data_method_S_0036 : begin
          pull_recv_data_method <= pull_recv_data_method_S_0000;
        end
        pull_recv_data_method_pull_recv_data_method_S_0023_body : begin
          if (pull_recv_data_method_delay >= 1 && read_data_call_flag_0023 == 1'b1) begin
            pull_recv_data_method_delay <= 32'h0;
            pull_recv_data_method_delay <= 0;
            pull_recv_data_method <= pull_recv_data_method_S_0024;
          end else begin
            pull_recv_data_method_delay <= pull_recv_data_method_delay + 1;
          end
        end
        pull_recv_data_method_pull_recv_data_method_S_0030_body : begin
          if (pull_recv_data_method_delay >= 1 && read_data_call_flag_0030 == 1'b1) begin
            pull_recv_data_method_delay <= 32'h0;
            pull_recv_data_method_delay <= 0;
            pull_recv_data_method <= pull_recv_data_method_S_0031;
          end else begin
            pull_recv_data_method_delay <= pull_recv_data_method_delay + 1;
          end
        end
        pull_recv_data_method_pull_recv_data_method_S_0035_body : begin
          if (pull_recv_data_method_delay >= 1 && write_data_call_flag_0035 == 1'b1) begin
            pull_recv_data_method_delay <= 32'h0;
            pull_recv_data_method_delay <= 0;
            pull_recv_data_method <= pull_recv_data_method_S_0036;
          end else begin
            pull_recv_data_method_delay <= pull_recv_data_method_delay + 1;
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      push_send_data_method <= push_send_data_method_IDLE;
      push_send_data_method_delay <= 32'h0;
    end else begin
      case (push_send_data_method)
        push_send_data_method_IDLE : begin
          push_send_data_method <= push_send_data_method_S_0000;
        end
        push_send_data_method_S_0000 : begin
          push_send_data_method <= push_send_data_method_S_0001;
          push_send_data_method <= push_send_data_method_S_0001;
        end
        push_send_data_method_S_0001 : begin
          if (push_send_data_req_flag == 1'b1) begin
            push_send_data_method <= push_send_data_method_S_0002;
          end
        end
        push_send_data_method_S_0002 : begin
          push_send_data_method <= push_send_data_method_S_0003;
        end
        push_send_data_method_S_0003 : begin
          push_send_data_method <= push_send_data_method_S_0006;
        end
        push_send_data_method_S_0006 : begin
          if (tmp_0225 == 1'b1) begin
            push_send_data_method <= push_send_data_method_S_0008;
          end else if (tmp_0226 == 1'b1) begin
            push_send_data_method <= push_send_data_method_S_0007;
          end
        end
        push_send_data_method_S_0007 : begin
          push_send_data_method <= push_send_data_method_S_0011;
        end
        push_send_data_method_S_0008 : begin
          push_send_data_method <= push_send_data_method_S_0009;
        end
        push_send_data_method_S_0009 : begin
          push_send_data_method <= push_send_data_method_S_0010;
        end
        push_send_data_method_S_0010 : begin
          push_send_data_method <= push_send_data_method_S_0007;
        end
        push_send_data_method_S_0011 : begin
          push_send_data_method <= push_send_data_method_S_0012;
        end
        push_send_data_method_S_0012 : begin
          push_send_data_method <= push_send_data_method_S_0013;
        end
        push_send_data_method_S_0013 : begin
          if (tmp_0227 == 1'b1) begin
            push_send_data_method <= push_send_data_method_S_0018;
          end else if (tmp_0228 == 1'b1) begin
            push_send_data_method <= push_send_data_method_S_0014;
          end
        end
        push_send_data_method_S_0014 : begin
          push_send_data_method <= push_send_data_method_S_0033;
        end
        push_send_data_method_S_0015 : begin
          push_send_data_method <= push_send_data_method_S_0016;
        end
        push_send_data_method_S_0016 : begin
          push_send_data_method <= push_send_data_method_S_0017;
        end
        push_send_data_method_S_0017 : begin
          push_send_data_method <= push_send_data_method_S_0012;
        end
        push_send_data_method_S_0018 : begin
          push_send_data_method <= push_send_data_method_S_0019;
        end
        push_send_data_method_S_0019 : begin
          push_send_data_method <= push_send_data_method_S_0020;
        end
        push_send_data_method_S_0020 : begin
          if (push_send_data_method_delay >= 2) begin
            push_send_data_method_delay <= 32'h0;
            push_send_data_method_delay <= 0;
            push_send_data_method <= push_send_data_method_S_0021;
          end else begin
            push_send_data_method_delay <= push_send_data_method_delay + 1;
          end
        end
        push_send_data_method_S_0021 : begin
          push_send_data_method <= push_send_data_method_S_0023;
        end
        push_send_data_method_S_0023 : begin
          push_send_data_method <= push_send_data_method_S_0024;
        end
        push_send_data_method_S_0024 : begin
          if (tmp_0233 == 1'b1) begin
            push_send_data_method <= push_send_data_method_push_send_data_method_S_0024_body;
          end
        end
        push_send_data_method_S_0025 : begin
          push_send_data_method <= push_send_data_method_S_0026;
        end
        push_send_data_method_S_0026 : begin
          push_send_data_method <= push_send_data_method_S_0027;
        end
        push_send_data_method_S_0027 : begin
          if (push_send_data_method_delay >= 2) begin
            push_send_data_method_delay <= 32'h0;
            push_send_data_method_delay <= 0;
            push_send_data_method <= push_send_data_method_S_0028;
          end else begin
            push_send_data_method_delay <= push_send_data_method_delay + 1;
          end
        end
        push_send_data_method_S_0028 : begin
          push_send_data_method <= push_send_data_method_S_0030;
        end
        push_send_data_method_S_0030 : begin
          push_send_data_method <= push_send_data_method_S_0031;
        end
        push_send_data_method_S_0031 : begin
          if (tmp_0238 == 1'b1) begin
            push_send_data_method <= push_send_data_method_push_send_data_method_S_0031_body;
          end
        end
        push_send_data_method_S_0032 : begin
          push_send_data_method <= push_send_data_method_S_0015;
        end
        push_send_data_method_S_0033 : begin
          push_send_data_method <= push_send_data_method_S_0034;
        end
        push_send_data_method_S_0034 : begin
          push_send_data_method <= push_send_data_method_S_0035;
        end
        push_send_data_method_S_0035 : begin
          if (tmp_0239 == 1'b1) begin
            push_send_data_method <= push_send_data_method_push_send_data_method_S_0035_body;
          end
        end
        push_send_data_method_S_0036 : begin
          push_send_data_method <= push_send_data_method_S_0037;
        end
        push_send_data_method_S_0037 : begin
          push_send_data_method <= push_send_data_method_S_0040;
        end
        push_send_data_method_S_0040 : begin
          if (tmp_0244 == 1'b1) begin
            push_send_data_method <= push_send_data_method_push_send_data_method_S_0040_body;
          end
        end
        push_send_data_method_S_0041 : begin
          push_send_data_method <= push_send_data_method_S_0042;
        end
        push_send_data_method_S_0042 : begin
          push_send_data_method <= push_send_data_method_S_0045;
        end
        push_send_data_method_S_0045 : begin
          if (tmp_0249 == 1'b1) begin
            push_send_data_method <= push_send_data_method_push_send_data_method_S_0045_body;
          end
        end
        push_send_data_method_S_0046 : begin
          push_send_data_method <= push_send_data_method_S_0047;
        end
        push_send_data_method_S_0047 : begin
          push_send_data_method <= push_send_data_method_S_0050;
        end
        push_send_data_method_S_0050 : begin
          if (tmp_0254 == 1'b1) begin
            push_send_data_method <= push_send_data_method_push_send_data_method_S_0050_body;
          end
        end
        push_send_data_method_S_0051 : begin
          push_send_data_method <= push_send_data_method_S_0052;
        end
        push_send_data_method_S_0052 : begin
          push_send_data_method <= push_send_data_method_S_0053;
        end
        push_send_data_method_S_0053 : begin
          if (tmp_0259 == 1'b1) begin
            push_send_data_method <= push_send_data_method_push_send_data_method_S_0053_body;
          end
        end
        push_send_data_method_S_0054 : begin
          push_send_data_method <= push_send_data_method_S_0000;
        end
        push_send_data_method_push_send_data_method_S_0024_body : begin
          if (push_send_data_method_delay >= 1 && write_data_call_flag_0024 == 1'b1) begin
            push_send_data_method_delay <= 32'h0;
            push_send_data_method_delay <= 0;
            push_send_data_method <= push_send_data_method_S_0025;
          end else begin
            push_send_data_method_delay <= push_send_data_method_delay + 1;
          end
        end
        push_send_data_method_push_send_data_method_S_0031_body : begin
          if (push_send_data_method_delay >= 1 && write_data_call_flag_0031 == 1'b1) begin
            push_send_data_method_delay <= 32'h0;
            push_send_data_method_delay <= 0;
            push_send_data_method <= push_send_data_method_S_0032;
          end else begin
            push_send_data_method_delay <= push_send_data_method_delay + 1;
          end
        end
        push_send_data_method_push_send_data_method_S_0035_body : begin
          if (push_send_data_method_delay >= 1 && write_data_call_flag_0035 == 1'b1) begin
            push_send_data_method_delay <= 32'h0;
            push_send_data_method_delay <= 0;
            push_send_data_method <= push_send_data_method_S_0036;
          end else begin
            push_send_data_method_delay <= push_send_data_method_delay + 1;
          end
        end
        push_send_data_method_push_send_data_method_S_0040_body : begin
          if (push_send_data_method_delay >= 1 && write_data_call_flag_0040 == 1'b1) begin
            push_send_data_method_delay <= 32'h0;
            push_send_data_method_delay <= 0;
            push_send_data_method <= push_send_data_method_S_0041;
          end else begin
            push_send_data_method_delay <= push_send_data_method_delay + 1;
          end
        end
        push_send_data_method_push_send_data_method_S_0045_body : begin
          if (push_send_data_method_delay >= 1 && write_data_call_flag_0045 == 1'b1) begin
            push_send_data_method_delay <= 32'h0;
            push_send_data_method_delay <= 0;
            push_send_data_method <= push_send_data_method_S_0046;
          end else begin
            push_send_data_method_delay <= push_send_data_method_delay + 1;
          end
        end
        push_send_data_method_push_send_data_method_S_0050_body : begin
          if (push_send_data_method_delay >= 1 && write_data_call_flag_0050 == 1'b1) begin
            push_send_data_method_delay <= 32'h0;
            push_send_data_method_delay <= 0;
            push_send_data_method <= push_send_data_method_S_0051;
          end else begin
            push_send_data_method_delay <= push_send_data_method_delay + 1;
          end
        end
        push_send_data_method_push_send_data_method_S_0053_body : begin
          if (push_send_data_method_delay >= 1 && write_data_call_flag_0053 == 1'b1) begin
            push_send_data_method_delay <= 32'h0;
            push_send_data_method_delay <= 0;
            push_send_data_method <= push_send_data_method_S_0054;
          end else begin
            push_send_data_method_delay <= push_send_data_method_delay + 1;
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_server_method <= tcp_server_method_IDLE;
      tcp_server_method_delay <= 32'h0;
    end else begin
      case (tcp_server_method)
        tcp_server_method_IDLE : begin
          tcp_server_method <= tcp_server_method_S_0000;
        end
        tcp_server_method_S_0000 : begin
          tcp_server_method <= tcp_server_method_S_0001;
          tcp_server_method <= tcp_server_method_S_0001;
        end
        tcp_server_method_S_0001 : begin
          if (tcp_server_req_flag == 1'b1) begin
            tcp_server_method <= tcp_server_method_S_0002;
          end
        end
        tcp_server_method_S_0002 : begin
          tcp_server_method <= tcp_server_method_S_0003;
        end
        tcp_server_method_S_0003 : begin
          tcp_server_method <= tcp_server_method_S_0004;
        end
        tcp_server_method_S_0004 : begin
          if (tmp_0290 == 1'b1) begin
            tcp_server_method <= tcp_server_method_tcp_server_method_S_0004_body;
          end
        end
        tcp_server_method_S_0005 : begin
          if (tmp_0295 == 1'b1) begin
            tcp_server_method <= tcp_server_method_tcp_server_method_S_0005_body;
          end
        end
        tcp_server_method_S_0006 : begin
          tcp_server_method <= tcp_server_method_S_0007;
        end
        tcp_server_method_S_0007 : begin
          tcp_server_method <= tcp_server_method_S_0008;
        end
        tcp_server_method_S_0008 : begin
          if (tmp_0296 == 1'b1) begin
            tcp_server_method <= tcp_server_method_S_0010;
          end else if (tmp_0297 == 1'b1) begin
            tcp_server_method <= tcp_server_method_S_0009;
          end
        end
        tcp_server_method_S_0009 : begin
          tcp_server_method <= tcp_server_method_S_0016;
        end
        tcp_server_method_S_0010 : begin
          tcp_server_method <= tcp_server_method_S_0011;
        end
        tcp_server_method_S_0011 : begin
          tcp_server_method <= tcp_server_method_S_0012;
        end
        tcp_server_method_S_0012 : begin
          if (tmp_0298 == 1'b1) begin
            tcp_server_method <= tcp_server_method_tcp_server_method_S_0012_body;
          end
        end
        tcp_server_method_S_0013 : begin
          if (tmp_0303 == 1'b1) begin
            tcp_server_method <= tcp_server_method_tcp_server_method_S_0013_body;
          end
        end
        tcp_server_method_S_0014 : begin
          tcp_server_method <= tcp_server_method_S_0015;
        end
        tcp_server_method_S_0015 : begin
          tcp_server_method <= tcp_server_method_S_0007;
        end
        tcp_server_method_S_0016 : begin
          tcp_server_method <= tcp_server_method_S_0017;
        end
        tcp_server_method_S_0017 : begin
          if (tmp_0308 == 1'b1) begin
            tcp_server_method <= tcp_server_method_tcp_server_method_S_0017_body;
          end
        end
        tcp_server_method_S_0018 : begin
          tcp_server_method <= tcp_server_method_S_0019;
        end
        tcp_server_method_S_0019 : begin
          tcp_server_method <= tcp_server_method_S_0020;
        end
        tcp_server_method_S_0020 : begin
          if (tmp_0309 == 1'b1) begin
            tcp_server_method <= tcp_server_method_S_0022;
          end else if (tmp_0310 == 1'b1) begin
            tcp_server_method <= tcp_server_method_S_0021;
          end
        end
        tcp_server_method_S_0021 : begin
          tcp_server_method <= tcp_server_method_S_0028;
        end
        tcp_server_method_S_0022 : begin
          tcp_server_method <= tcp_server_method_S_0023;
        end
        tcp_server_method_S_0023 : begin
          tcp_server_method <= tcp_server_method_S_0024;
        end
        tcp_server_method_S_0024 : begin
          if (tmp_0311 == 1'b1) begin
            tcp_server_method <= tcp_server_method_tcp_server_method_S_0024_body;
          end
        end
        tcp_server_method_S_0025 : begin
          if (tmp_0316 == 1'b1) begin
            tcp_server_method <= tcp_server_method_tcp_server_method_S_0025_body;
          end
        end
        tcp_server_method_S_0026 : begin
          tcp_server_method <= tcp_server_method_S_0027;
        end
        tcp_server_method_S_0027 : begin
          tcp_server_method <= tcp_server_method_S_0019;
        end
        tcp_server_method_S_0028 : begin
          tcp_server_method <= tcp_server_method_S_0029;
        end
        tcp_server_method_S_0029 : begin
          if (tmp_0321 == 1'b1) begin
            tcp_server_method <= tcp_server_method_tcp_server_method_S_0029_body;
          end
        end
        tcp_server_method_S_0030 : begin
          tcp_server_method <= tcp_server_method_S_0031;
        end
        tcp_server_method_S_0031 : begin
          if (tmp_0322 == 1'b1) begin
            tcp_server_method <= tcp_server_method_S_0033;
          end else if (tmp_0323 == 1'b1) begin
            tcp_server_method <= tcp_server_method_S_0032;
          end
        end
        tcp_server_method_S_0032 : begin
          tcp_server_method <= tcp_server_method_S_0037;
        end
        tcp_server_method_S_0033 : begin
          if (tmp_0328 == 1'b1) begin
            tcp_server_method <= tcp_server_method_tcp_server_method_S_0033_body;
          end
        end
        tcp_server_method_S_0034 : begin
          if (tmp_0333 == 1'b1) begin
            tcp_server_method <= tcp_server_method_tcp_server_method_S_0034_body;
          end
        end
        tcp_server_method_S_0035 : begin
          if (tmp_0338 == 1'b1) begin
            tcp_server_method <= tcp_server_method_tcp_server_method_S_0035_body;
          end
        end
        tcp_server_method_S_0036 : begin
          tcp_server_method <= tcp_server_method_S_0031;
        end
        tcp_server_method_S_0037 : begin
          tcp_server_method <= tcp_server_method_S_0000;
        end
        tcp_server_method_tcp_server_method_S_0004_body : begin
          if (tcp_server_method_delay >= 1 && write_data_call_flag_0004 == 1'b1) begin
            tcp_server_method_delay <= 32'h0;
            tcp_server_method_delay <= 0;
            tcp_server_method <= tcp_server_method_S_0005;
          end else begin
            tcp_server_method_delay <= tcp_server_method_delay + 1;
          end
        end
        tcp_server_method_tcp_server_method_S_0005_body : begin
          if (tcp_server_method_delay >= 1 && tcp_server_open_call_flag_0005 == 1'b1) begin
            tcp_server_method_delay <= 32'h0;
            tcp_server_method_delay <= 0;
            tcp_server_method <= tcp_server_method_S_0006;
          end else begin
            tcp_server_method_delay <= tcp_server_method_delay + 1;
          end
        end
        tcp_server_method_tcp_server_method_S_0012_body : begin
          if (tcp_server_method_delay >= 1 && write_data_call_flag_0012 == 1'b1) begin
            tcp_server_method_delay <= 32'h0;
            tcp_server_method_delay <= 0;
            tcp_server_method <= tcp_server_method_S_0013;
          end else begin
            tcp_server_method_delay <= tcp_server_method_delay + 1;
          end
        end
        tcp_server_method_tcp_server_method_S_0013_body : begin
          if (tcp_server_method_delay >= 1 && tcp_server_open_call_flag_0013 == 1'b1) begin
            tcp_server_method_delay <= 32'h0;
            tcp_server_method_delay <= 0;
            tcp_server_method <= tcp_server_method_S_0014;
          end else begin
            tcp_server_method_delay <= tcp_server_method_delay + 1;
          end
        end
        tcp_server_method_tcp_server_method_S_0017_body : begin
          if (tcp_server_method_delay >= 1 && tcp_server_listen_call_flag_0017 == 1'b1) begin
            tcp_server_method_delay <= 32'h0;
            tcp_server_method_delay <= 0;
            tcp_server_method <= tcp_server_method_S_0018;
          end else begin
            tcp_server_method_delay <= tcp_server_method_delay + 1;
          end
        end
        tcp_server_method_tcp_server_method_S_0024_body : begin
          if (tcp_server_method_delay >= 1 && write_data_call_flag_0024 == 1'b1) begin
            tcp_server_method_delay <= 32'h0;
            tcp_server_method_delay <= 0;
            tcp_server_method <= tcp_server_method_S_0025;
          end else begin
            tcp_server_method_delay <= tcp_server_method_delay + 1;
          end
        end
        tcp_server_method_tcp_server_method_S_0025_body : begin
          if (tcp_server_method_delay >= 1 && tcp_server_listen_call_flag_0025 == 1'b1) begin
            tcp_server_method_delay <= 32'h0;
            tcp_server_method_delay <= 0;
            tcp_server_method <= tcp_server_method_S_0026;
          end else begin
            tcp_server_method_delay <= tcp_server_method_delay + 1;
          end
        end
        tcp_server_method_tcp_server_method_S_0029_body : begin
          if (tcp_server_method_delay >= 1 && wait_for_established_call_flag_0029 == 1'b1) begin
            tcp_server_method_delay <= 32'h0;
            tcp_server_method_delay <= 0;
            tcp_server_method <= tcp_server_method_S_0030;
          end else begin
            tcp_server_method_delay <= tcp_server_method_delay + 1;
          end
        end
        tcp_server_method_tcp_server_method_S_0033_body : begin
          if (tcp_server_method_delay >= 1 && wait_for_recv_call_flag_0033 == 1'b1) begin
            tcp_server_method_delay <= 32'h0;
            tcp_server_method_delay <= 0;
            tcp_server_method <= tcp_server_method_S_0034;
          end else begin
            tcp_server_method_delay <= tcp_server_method_delay + 1;
          end
        end
        tcp_server_method_tcp_server_method_S_0034_body : begin
          if (tcp_server_method_delay >= 1 && pull_recv_data_call_flag_0034 == 1'b1) begin
            tcp_server_method_delay <= 32'h0;
            tcp_server_method_delay <= 0;
            tcp_server_method <= tcp_server_method_S_0035;
          end else begin
            tcp_server_method_delay <= tcp_server_method_delay + 1;
          end
        end
        tcp_server_method_tcp_server_method_S_0035_body : begin
          if (tcp_server_method_delay >= 1 && push_send_data_call_flag_0035 == 1'b1) begin
            tcp_server_method_delay <= 32'h0;
            tcp_server_method_delay <= 0;
            tcp_server_method <= tcp_server_method_S_0036;
          end else begin
            tcp_server_method_delay <= tcp_server_method_delay + 1;
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_client_method <= tcp_client_method_IDLE;
      tcp_client_method_delay <= 32'h0;
    end else begin
      case (tcp_client_method)
        tcp_client_method_IDLE : begin
          tcp_client_method <= tcp_client_method_S_0000;
        end
        tcp_client_method_S_0000 : begin
          tcp_client_method <= tcp_client_method_S_0001;
          tcp_client_method <= tcp_client_method_S_0001;
        end
        tcp_client_method_S_0001 : begin
          if (tcp_client_req_flag == 1'b1) begin
            tcp_client_method <= tcp_client_method_S_0002;
          end
        end
        tcp_client_method_S_0002 : begin
          tcp_client_method <= tcp_client_method_S_0003;
        end
        tcp_client_method_S_0003 : begin
          tcp_client_method <= tcp_client_method_S_0004;
        end
        tcp_client_method_S_0004 : begin
          tcp_client_method <= tcp_client_method_S_0005;
        end
        tcp_client_method_S_0005 : begin
          if (tmp_0347 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0005_body;
          end
        end
        tcp_client_method_S_0006 : begin
          tcp_client_method <= tcp_client_method_S_0007;
        end
        tcp_client_method_S_0007 : begin
          if (tmp_0348 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0007_body;
          end
        end
        tcp_client_method_S_0008 : begin
          tcp_client_method <= tcp_client_method_S_0009;
        end
        tcp_client_method_S_0009 : begin
          if (tmp_0349 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0009_body;
          end
        end
        tcp_client_method_S_0010 : begin
          tcp_client_method <= tcp_client_method_S_0011;
        end
        tcp_client_method_S_0011 : begin
          if (tmp_0350 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0011_body;
          end
        end
        tcp_client_method_S_0012 : begin
          tcp_client_method <= tcp_client_method_S_0013;
        end
        tcp_client_method_S_0013 : begin
          if (tmp_0351 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0013_body;
          end
        end
        tcp_client_method_S_0014 : begin
          tcp_client_method <= tcp_client_method_S_0015;
        end
        tcp_client_method_S_0015 : begin
          tcp_client_method <= tcp_client_method_S_0016;
        end
        tcp_client_method_S_0016 : begin
          if (tmp_0352 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0016_body;
          end
        end
        tcp_client_method_S_0017 : begin
          tcp_client_method <= tcp_client_method_S_0018;
        end
        tcp_client_method_S_0018 : begin
          if (tmp_0353 == 1'b1) begin
            tcp_client_method <= tcp_client_method_S_0020;
          end else if (tmp_0354 == 1'b1) begin
            tcp_client_method <= tcp_client_method_S_0019;
          end
        end
        tcp_client_method_S_0019 : begin
          tcp_client_method <= tcp_client_method_S_0021;
        end
        tcp_client_method_S_0020 : begin
          tcp_client_method <= tcp_client_method_S_0015;
        end
        tcp_client_method_S_0021 : begin
          tcp_client_method <= tcp_client_method_S_0022;
        end
        tcp_client_method_S_0022 : begin
          if (tmp_0359 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0022_body;
          end
        end
        tcp_client_method_S_0023 : begin
          tcp_client_method <= tcp_client_method_S_0024;
        end
        tcp_client_method_S_0024 : begin
          if (tmp_0360 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0024_body;
          end
        end
        tcp_client_method_S_0025 : begin
          tcp_client_method <= tcp_client_method_S_0026;
        end
        tcp_client_method_S_0026 : begin
          if (tmp_0365 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0026_body;
          end
        end
        tcp_client_method_S_0027 : begin
          tcp_client_method <= tcp_client_method_S_0028;
        end
        tcp_client_method_S_0028 : begin
          if (tmp_0370 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0028_body;
          end
        end
        tcp_client_method_S_0029 : begin
          tcp_client_method <= tcp_client_method_S_0030;
        end
        tcp_client_method_S_0030 : begin
          if (tmp_0375 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0030_body;
          end
        end
        tcp_client_method_S_0031 : begin
          tcp_client_method <= tcp_client_method_S_0032;
        end
        tcp_client_method_S_0032 : begin
          if (tmp_0380 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0032_body;
          end
        end
        tcp_client_method_S_0033 : begin
          tcp_client_method <= tcp_client_method_S_0034;
        end
        tcp_client_method_S_0034 : begin
          if (tmp_0385 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0034_body;
          end
        end
        tcp_client_method_S_0035 : begin
          if (tmp_0386 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0035_body;
          end
        end
        tcp_client_method_S_0036 : begin
          if (tmp_0391 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0036_body;
          end
        end
        tcp_client_method_S_0037 : begin
          if (tmp_0396 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0037_body;
          end
        end
        tcp_client_method_S_0038 : begin
          if (tmp_0401 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0038_body;
          end
        end
        tcp_client_method_S_0039 : begin
          tcp_client_method <= tcp_client_method_S_0040;
        end
        tcp_client_method_S_0040 : begin
          if (tmp_0402 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0040_body;
          end
        end
        tcp_client_method_S_0041 : begin
          tcp_client_method <= tcp_client_method_S_0042;
        end
        tcp_client_method_S_0042 : begin
          tcp_client_method <= tcp_client_method_S_0043;
        end
        tcp_client_method_S_0043 : begin
          if (tmp_0407 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0043_body;
          end
        end
        tcp_client_method_S_0044 : begin
          tcp_client_method <= tcp_client_method_S_0045;
        end
        tcp_client_method_S_0045 : begin
          if (tmp_0408 == 1'b1) begin
            tcp_client_method <= tcp_client_method_S_0047;
          end else if (tmp_0409 == 1'b1) begin
            tcp_client_method <= tcp_client_method_S_0046;
          end
        end
        tcp_client_method_S_0046 : begin
          tcp_client_method <= tcp_client_method_S_0048;
        end
        tcp_client_method_S_0047 : begin
          tcp_client_method <= tcp_client_method_S_0042;
        end
        tcp_client_method_S_0048 : begin
          tcp_client_method <= tcp_client_method_S_0049;
        end
        tcp_client_method_S_0049 : begin
          if (tmp_0410 == 1'b1) begin
            tcp_client_method <= tcp_client_method_S_0051;
          end else if (tmp_0411 == 1'b1) begin
            tcp_client_method <= tcp_client_method_S_0050;
          end
        end
        tcp_client_method_S_0050 : begin
          tcp_client_method <= tcp_client_method_S_0062;
        end
        tcp_client_method_S_0051 : begin
          if (tmp_0416 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0051_body;
          end
        end
        tcp_client_method_S_0052 : begin
          tcp_client_method <= tcp_client_method_S_0053;
        end
        tcp_client_method_S_0053 : begin
          tcp_client_method <= tcp_client_method_S_0054;
        end
        tcp_client_method_S_0054 : begin
          tcp_client_method <= tcp_client_method_S_0055;
        end
        tcp_client_method_S_0055 : begin
          if (tmp_0417 == 1'b1) begin
            tcp_client_method <= tcp_client_method_S_0057;
          end else if (tmp_0418 == 1'b1) begin
            tcp_client_method <= tcp_client_method_S_0056;
          end
        end
        tcp_client_method_S_0056 : begin
          tcp_client_method <= tcp_client_method_S_0058;
        end
        tcp_client_method_S_0057 : begin
          tcp_client_method <= tcp_client_method_S_0052;
        end
        tcp_client_method_S_0058 : begin
          tcp_client_method <= tcp_client_method_S_0059;
        end
        tcp_client_method_S_0059 : begin
          if (tmp_0423 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0059_body;
          end
        end
        tcp_client_method_S_0060 : begin
          if (tmp_0428 == 1'b1) begin
            tcp_client_method <= tcp_client_method_tcp_client_method_S_0060_body;
          end
        end
        tcp_client_method_S_0061 : begin
          tcp_client_method <= tcp_client_method_S_0049;
        end
        tcp_client_method_S_0062 : begin
          tcp_client_method <= tcp_client_method_S_0000;
        end
        tcp_client_method_tcp_client_method_S_0005_body : begin
          if (tcp_client_method_delay >= 1 && write_data_call_flag_0005 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0006;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0007_body : begin
          if (tcp_client_method_delay >= 1 && write_data_call_flag_0007 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0008;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0009_body : begin
          if (tcp_client_method_delay >= 1 && write_data_call_flag_0009 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0010;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0011_body : begin
          if (tcp_client_method_delay >= 1 && write_data_call_flag_0011 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0012;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0013_body : begin
          if (tcp_client_method_delay >= 1 && write_data_call_flag_0013 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0014;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0016_body : begin
          if (tcp_client_method_delay >= 1 && read_data_call_flag_0016 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0017;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0022_body : begin
          if (tcp_client_method_delay >= 1 && write_data_call_flag_0022 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0023;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0024_body : begin
          if (tcp_client_method_delay >= 1 && write_data_call_flag_0024 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0025;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0026_body : begin
          if (tcp_client_method_delay >= 1 && write_data_call_flag_0026 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0027;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0028_body : begin
          if (tcp_client_method_delay >= 1 && write_data_call_flag_0028 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0029;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0030_body : begin
          if (tcp_client_method_delay >= 1 && write_data_call_flag_0030 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0031;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0032_body : begin
          if (tcp_client_method_delay >= 1 && write_data_call_flag_0032 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0033;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0034_body : begin
          if (tcp_client_method_delay >= 1 && write_data_call_flag_0034 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0035;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0035_body : begin
          if (tcp_client_method_delay >= 1 && write_data_call_flag_0035 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0036;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0036_body : begin
          if (tcp_client_method_delay >= 1 && write_data_call_flag_0036 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0037;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0037_body : begin
          if (tcp_client_method_delay >= 1 && write_data_call_flag_0037 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0038;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0038_body : begin
          if (tcp_client_method_delay >= 1 && write_data_call_flag_0038 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0039;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0040_body : begin
          if (tcp_client_method_delay >= 1 && write_data_call_flag_0040 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0041;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0043_body : begin
          if (tcp_client_method_delay >= 1 && read_data_call_flag_0043 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0044;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0051_body : begin
          if (tcp_client_method_delay >= 1 && wait_cycles_call_flag_0051 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0052;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0059_body : begin
          if (tcp_client_method_delay >= 1 && buildMidiMsg_call_flag_0059 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0060;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
        tcp_client_method_tcp_client_method_S_0060_body : begin
          if (tcp_client_method_delay >= 1 && push_send_data_call_flag_0060 == 1'b1) begin
            tcp_client_method_delay <= 32'h0;
            tcp_client_method_delay <= 0;
            tcp_client_method <= tcp_client_method_S_0061;
          end else begin
            tcp_client_method_delay <= tcp_client_method_delay + 1;
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      buildMidiMsg_method <= buildMidiMsg_method_IDLE;
      buildMidiMsg_method_delay <= 32'h0;
    end else begin
      case (buildMidiMsg_method)
        buildMidiMsg_method_IDLE : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0000;
        end
        buildMidiMsg_method_S_0000 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0001;
          buildMidiMsg_method <= buildMidiMsg_method_S_0001;
        end
        buildMidiMsg_method_S_0001 : begin
          if (buildMidiMsg_req_flag == 1'b1) begin
            buildMidiMsg_method <= buildMidiMsg_method_S_0002;
          end
        end
        buildMidiMsg_method_S_0002 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0004;
        end
        buildMidiMsg_method_S_0004 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0006;
        end
        buildMidiMsg_method_S_0006 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0008;
        end
        buildMidiMsg_method_S_0008 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0010;
        end
        buildMidiMsg_method_S_0010 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0012;
        end
        buildMidiMsg_method_S_0012 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0014;
        end
        buildMidiMsg_method_S_0014 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0016;
        end
        buildMidiMsg_method_S_0016 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0018;
        end
        buildMidiMsg_method_S_0018 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0020;
        end
        buildMidiMsg_method_S_0020 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0022;
        end
        buildMidiMsg_method_S_0022 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0024;
        end
        buildMidiMsg_method_S_0024 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0026;
        end
        buildMidiMsg_method_S_0026 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0028;
        end
        buildMidiMsg_method_S_0028 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0030;
        end
        buildMidiMsg_method_S_0030 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0031;
        end
        buildMidiMsg_method_S_0031 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0032;
        end
        buildMidiMsg_method_S_0032 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0033;
        end
        buildMidiMsg_method_S_0033 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0034;
        end
        buildMidiMsg_method_S_0034 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0036;
        end
        buildMidiMsg_method_S_0036 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0037;
        end
        buildMidiMsg_method_S_0037 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0038;
        end
        buildMidiMsg_method_S_0038 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0039;
        end
        buildMidiMsg_method_S_0039 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0040;
        end
        buildMidiMsg_method_S_0040 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0042;
        end
        buildMidiMsg_method_S_0042 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0043;
        end
        buildMidiMsg_method_S_0043 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0044;
        end
        buildMidiMsg_method_S_0044 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0046;
        end
        buildMidiMsg_method_S_0046 : begin
          buildMidiMsg_method <= buildMidiMsg_method_S_0000;
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      test_method <= test_method_IDLE;
      test_method_delay <= 32'h0;
    end else begin
      case (test_method)
        test_method_IDLE : begin
          test_method <= test_method_S_0000;
        end
        test_method_S_0000 : begin
          test_method <= test_method_S_0001;
          test_method <= test_method_S_0001;
        end
        test_method_S_0001 : begin
          if (test_req_flag == 1'b1) begin
            test_method <= test_method_S_0002;
          end
        end
        test_method_S_0002 : begin
          if (tmp_0459 == 1'b1) begin
            test_method <= test_method_test_method_S_0002_body;
          end
        end
        test_method_S_0003 : begin
          if (tmp_0464 == 1'b1) begin
            test_method <= test_method_test_method_S_0003_body;
          end
        end
        test_method_S_0004 : begin
          if (tmp_0469 == 1'b1) begin
            test_method <= test_method_test_method_S_0004_body;
          end
        end
        test_method_S_0005 : begin
          if (tmp_0470 == 1'b1) begin
            test_method <= test_method_S_0007;
          end else if (tmp_0471 == 1'b1) begin
            test_method <= test_method_S_0006;
          end
        end
        test_method_S_0006 : begin
          test_method <= test_method_S_0008;
        end
        test_method_S_0007 : begin
          test_method <= test_method_S_0005;
        end
        test_method_S_0008 : begin
          test_method <= test_method_S_0000;
        end
        test_method_test_method_S_0002_body : begin
          if (test_method_delay >= 1 && init_call_flag_0002 == 1'b1) begin
            test_method_delay <= 32'h0;
            test_method_delay <= 0;
            test_method <= test_method_S_0003;
          end else begin
            test_method_delay <= test_method_delay + 1;
          end
        end
        test_method_test_method_S_0003_body : begin
          if (test_method_delay >= 1 && network_configuration_call_flag_0003 == 1'b1) begin
            test_method_delay <= 32'h0;
            test_method_delay <= 0;
            test_method <= test_method_S_0004;
          end else begin
            test_method_delay <= test_method_delay + 1;
          end
        end
        test_method_test_method_S_0004_body : begin
          if (test_method_delay >= 1 && tcp_client_call_flag_0004 == 1'b1) begin
            test_method_delay <= 32'h0;
            test_method_delay <= 0;
            test_method <= test_method_S_0005;
          end else begin
            test_method_delay <= test_method_delay + 1;
          end
        end
      endcase
    end
  end


  assign class_wiz830mj_0000_clk = clk_sig;

  assign class_wiz830mj_0000_reset = reset_sig;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      class_wiz830mj_0000_address <= 0;
    end else begin
      if (write_data_method == write_data_method_S_0003) begin
        class_wiz830mj_0000_address <= write_data_addr_0094;
      end else if (read_data_method == read_data_method_S_0003) begin
        class_wiz830mj_0000_address <= read_data_addr_0103;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      class_wiz830mj_0000_wdata <= 0;
    end else begin
      if (write_data_method == write_data_method_S_0005) begin
        class_wiz830mj_0000_wdata <= write_data_data_0095;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      class_wiz830mj_0000_cs <= 1'b0;
    end else begin
      if (write_data_method == write_data_method_S_0007) begin
        class_wiz830mj_0000_cs <= 1'b1;
      end else if (write_data_method == write_data_method_S_0014) begin
        class_wiz830mj_0000_cs <= 1'b0;
      end else if (read_data_method == read_data_method_S_0005) begin
        class_wiz830mj_0000_cs <= 1'b1;
      end else if (read_data_method == read_data_method_S_0014) begin
        class_wiz830mj_0000_cs <= 1'b0;
      end else if (init_method == init_method_S_0003) begin
        class_wiz830mj_0000_cs <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      class_wiz830mj_0000_oe <= 1'b0;
    end else begin
      if (read_data_method == read_data_method_S_0007) begin
        class_wiz830mj_0000_oe <= 1'b1;
      end else if (read_data_method == read_data_method_S_0012) begin
        class_wiz830mj_0000_oe <= 1'b0;
      end else if (init_method == init_method_S_0007) begin
        class_wiz830mj_0000_oe <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      class_wiz830mj_0000_we <= 1'b0;
    end else begin
      if (write_data_method == write_data_method_S_0009) begin
        class_wiz830mj_0000_we <= 1'b1;
      end else if (write_data_method == write_data_method_S_0012) begin
        class_wiz830mj_0000_we <= 1'b0;
      end else if (init_method == init_method_S_0005) begin
        class_wiz830mj_0000_we <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      class_wiz830mj_0000_module_reset <= 1'b0;
    end else begin
      if (init_method == init_method_S_0009) begin
        class_wiz830mj_0000_module_reset <= 1'b1;
      end else if (init_method == init_method_S_0012) begin
        class_wiz830mj_0000_module_reset <= 1'b0;
      end
    end
  end

  assign class_wiz830mj_0000_nINT = class_wiz830mj_0000_nINT_exp_sig;

  assign class_wiz830mj_0000_BRDY = class_wiz830mj_0000_BRDY_exp_sig;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      class_length_0002 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0033) begin
        class_length_0002 <= wait_for_recv_v_0167;
      end else if (tcp_server_method == tcp_server_method_S_0016) begin
        class_length_0002 <= 32'h0000f000;
      end else if (tcp_server_method == tcp_server_method_S_0028) begin
        class_length_0002 <= 32'h0000f001;
      end else if (tcp_server_method == tcp_server_method_S_0030) begin
        class_length_0002 <= 32'h0000f002;
      end else if (tcp_client_method == tcp_client_method_S_0014) begin
        class_length_0002 <= 32'h0000f000;
      end else if (tcp_client_method == tcp_client_method_S_0041) begin
        class_length_0002 <= 32'h0000f001;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0043) begin
        class_length_0002 <= 32'h00000013;
      end else begin
        class_length_0002 <= class_length_0002_mux;
      end
    end
  end

  assign class_length_0002_mux = tmp_0001;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      class_midi_msg_0003 <= 0;
    end else begin
      class_midi_msg_0003 <= class_midi_msg_0003_mux;
    end
  end

  assign class_midi_msg_0003_mux = tmp_0002;

  assign class_buffer_0089_clk = clk_sig;

  assign class_buffer_0089_reset = reset_sig;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      class_buffer_0089_address_b <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0020) begin
        class_buffer_0089_address_b <= binary_expr_00201;
      end else if (pull_recv_data_method == pull_recv_data_method_S_0027) begin
        class_buffer_0089_address_b <= binary_expr_00207;
      end else if (push_send_data_method == push_send_data_method_S_0020 && push_send_data_method_delay == 0) begin
        class_buffer_0089_address_b <= binary_expr_00226;
      end else if (push_send_data_method == push_send_data_method_S_0027 && push_send_data_method_delay == 0) begin
        class_buffer_0089_address_b <= binary_expr_00232;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0002) begin
        class_buffer_0089_address_b <= 32'h00000000;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0004) begin
        class_buffer_0089_address_b <= 32'h00000001;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0006) begin
        class_buffer_0089_address_b <= 32'h00000002;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0008) begin
        class_buffer_0089_address_b <= 32'h00000003;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0010) begin
        class_buffer_0089_address_b <= 32'h00000004;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0012) begin
        class_buffer_0089_address_b <= 32'h00000005;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0014) begin
        class_buffer_0089_address_b <= 32'h00000006;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0016) begin
        class_buffer_0089_address_b <= 32'h00000007;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0018) begin
        class_buffer_0089_address_b <= 32'h00000008;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0020) begin
        class_buffer_0089_address_b <= 32'h00000009;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0022) begin
        class_buffer_0089_address_b <= 32'h0000000a;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0024) begin
        class_buffer_0089_address_b <= 32'h0000000b;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0026) begin
        class_buffer_0089_address_b <= 32'h0000000c;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0028) begin
        class_buffer_0089_address_b <= 32'h0000000d;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0030) begin
        class_buffer_0089_address_b <= 32'h0000000e;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0034) begin
        class_buffer_0089_address_b <= 32'h0000000f;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0036) begin
        class_buffer_0089_address_b <= 32'h00000010;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0040) begin
        class_buffer_0089_address_b <= 32'h00000011;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0042) begin
        class_buffer_0089_address_b <= 32'h00000012;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      class_buffer_0089_din_b <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0024) begin
        class_buffer_0089_din_b <= method_result_00203;
      end else if (pull_recv_data_method == pull_recv_data_method_S_0031) begin
        class_buffer_0089_din_b <= method_result_00209;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0002) begin
        class_buffer_0089_din_b <= 8'h93;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0004) begin
        class_buffer_0089_din_b <= 8'ha4;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0006) begin
        class_buffer_0089_din_b <= 8'h6d;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0008) begin
        class_buffer_0089_din_b <= 8'h69;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0010) begin
        class_buffer_0089_din_b <= 8'h64;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0012) begin
        class_buffer_0089_din_b <= 8'h69;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0014) begin
        class_buffer_0089_din_b <= 8'h00;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0016) begin
        class_buffer_0089_din_b <= 8'h81;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0018) begin
        class_buffer_0089_din_b <= 8'ha3;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0020) begin
        class_buffer_0089_din_b <= 8'h6d;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0022) begin
        class_buffer_0089_din_b <= 8'h73;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0024) begin
        class_buffer_0089_din_b <= 8'h67;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0026) begin
        class_buffer_0089_din_b <= 8'h93;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0028) begin
        class_buffer_0089_din_b <= 8'hcc;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0033) begin
        class_buffer_0089_din_b <= cast_expr_00341;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0034) begin
        class_buffer_0089_din_b <= 8'hcc;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0039) begin
        class_buffer_0089_din_b <= cast_expr_00345;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0040) begin
        class_buffer_0089_din_b <= 8'hcc;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0044) begin
        class_buffer_0089_din_b <= cast_expr_00348;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      class_buffer_0089_we_b <= 1'b0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0024) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (pull_recv_data_method == pull_recv_data_method_S_0031) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0002) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0004) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0006) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0008) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0010) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0012) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0014) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0016) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0018) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0020) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0022) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0024) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0026) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0028) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0033) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0034) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0039) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0040) begin
        class_buffer_0089_we_b <= 1'b1;
      end else if (buildMidiMsg_method == buildMidiMsg_method_S_0044) begin
        class_buffer_0089_we_b <= 1'b1;
      end else begin
        class_buffer_0089_we_b <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      class_buffer_0089_oe_b <= 1'b0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0020 && push_send_data_method_delay == 0) begin
        class_buffer_0089_oe_b <= 1'b1;
      end else if (push_send_data_method == push_send_data_method_S_0027 && push_send_data_method_delay == 0) begin
        class_buffer_0089_oe_b <= 1'b1;
      end else begin
        class_buffer_0089_oe_b <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_cycles_n_0090 <= 0;
    end else begin
      if (wait_cycles_method == wait_cycles_method_S_0001) begin
        wait_cycles_n_0090 <= wait_cycles_n_local;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_cycles_n_local <= 0;
    end else begin
      if (write_data_method == write_data_method_write_data_method_S_0010_body && write_data_method_delay == 0) begin
        wait_cycles_n_local <= 32'h00000003;
      end else if (read_data_method == read_data_method_read_data_method_S_0008_body && read_data_method_delay == 0) begin
        wait_cycles_n_local <= 32'h00000003;
      end else if (init_method == init_method_init_method_S_0010_body && init_method_delay == 0) begin
        wait_cycles_n_local <= 32'h000003e8;
      end else if (init_method == init_method_init_method_S_0013_body && init_method_delay == 0) begin
        wait_cycles_n_local <= 32'h02faf080;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0051_body && tcp_client_method_delay == 0) begin
        wait_cycles_n_local <= 32'h00002710;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_cycles_i_0091 <= 32'h00000000;
    end else begin
      if (wait_cycles_method == wait_cycles_method_S_0002) begin
        wait_cycles_i_0091 <= 32'h00000000;
      end else if (wait_cycles_method == wait_cycles_method_S_0007) begin
        wait_cycles_i_0091 <= unary_expr_00093;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00092 <= 1'b0;
    end else begin
      if (wait_cycles_method == wait_cycles_method_S_0003) begin
        binary_expr_00092 <= tmp_0006;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      unary_expr_00093 <= 0;
    end else begin
      if (wait_cycles_method == wait_cycles_method_S_0006) begin
        unary_expr_00093 <= tmp_0007;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      write_data_addr_0094 <= 0;
    end else begin
      if (write_data_method == write_data_method_S_0001) begin
        write_data_addr_0094 <= write_data_addr_local;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      write_data_addr_local <= 0;
    end else begin
      if (network_configuration_method == network_configuration_method_network_configuration_method_S_0002_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h00000008;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0003_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h00000009;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0004_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h0000000a;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0005_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h0000000b;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0006_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h0000000c;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0007_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h0000000d;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0008_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h00000010;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0009_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h00000011;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0010_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h00000012;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0011_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h00000013;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0012_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h00000014;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0013_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h00000015;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0014_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h00000016;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0015_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h00000017;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0016_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h00000018;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0017_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h00000019;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0018_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h0000001a;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0019_body && network_configuration_method_delay == 0) begin
        write_data_addr_local <= 32'h0000001b;
      end else if (tcp_server_open_method == tcp_server_open_method_tcp_server_open_method_S_0004_body && tcp_server_open_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00140;
      end else if (tcp_server_open_method == tcp_server_open_method_tcp_server_open_method_S_0007_body && tcp_server_open_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00143;
      end else if (tcp_server_open_method == tcp_server_open_method_tcp_server_open_method_S_0010_body && tcp_server_open_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00146;
      end else if (tcp_server_open_method == tcp_server_open_method_tcp_server_open_method_S_0013_body && tcp_server_open_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00149;
      end else if (tcp_server_listen_method == tcp_server_listen_method_tcp_server_listen_method_S_0004_body && tcp_server_listen_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00156;
      end else if (pull_recv_data_method == pull_recv_data_method_pull_recv_data_method_S_0035_body && pull_recv_data_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00214;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0024_body && push_send_data_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00230;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0031_body && push_send_data_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00236;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0035_body && push_send_data_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00239;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0040_body && push_send_data_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00242;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0045_body && push_send_data_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00247;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0050_body && push_send_data_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00252;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0053_body && push_send_data_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00257;
      end else if (tcp_server_method == tcp_server_method_tcp_server_method_S_0004_body && tcp_server_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00261;
      end else if (tcp_server_method == tcp_server_method_tcp_server_method_S_0012_body && tcp_server_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00267;
      end else if (tcp_server_method == tcp_server_method_tcp_server_method_S_0024_body && tcp_server_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00273;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0005_body && tcp_client_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00283;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0007_body && tcp_client_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00285;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0009_body && tcp_client_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00287;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0011_body && tcp_client_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00289;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0013_body && tcp_client_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00291;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0022_body && tcp_client_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00296;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0024_body && tcp_client_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00298;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0026_body && tcp_client_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00300;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0028_body && tcp_client_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00302;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0030_body && tcp_client_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00304;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0032_body && tcp_client_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00306;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0034_body && tcp_client_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00308;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0035_body && tcp_client_method_delay == 0) begin
        write_data_addr_local <= 32'h00000014;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0036_body && tcp_client_method_delay == 0) begin
        write_data_addr_local <= 32'h00000015;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0037_body && tcp_client_method_delay == 0) begin
        write_data_addr_local <= 32'h00000016;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0038_body && tcp_client_method_delay == 0) begin
        write_data_addr_local <= 32'h00000017;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0040_body && tcp_client_method_delay == 0) begin
        write_data_addr_local <= binary_expr_00314;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      write_data_data_0095 <= 0;
    end else begin
      if (write_data_method == write_data_method_S_0001) begin
        write_data_data_0095 <= write_data_data_local;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      write_data_data_local <= 0;
    end else begin
      if (network_configuration_method == network_configuration_method_network_configuration_method_S_0002_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'h00;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0003_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'h08;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0004_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'hdc;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0005_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'h01;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0006_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'h02;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0007_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'h03;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0008_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'hc0;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0009_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'ha8;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0010_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'h01;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0011_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'h01;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0012_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'hff;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0013_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'hff;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0014_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'hff;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0015_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'h00;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0016_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'hc0;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0017_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'ha8;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0018_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'h01;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0019_body && network_configuration_method_delay == 0) begin
        write_data_data_local <= 8'hc8;
      end else if (tcp_server_open_method == tcp_server_open_method_tcp_server_open_method_S_0004_body && tcp_server_open_method_delay == 0) begin
        write_data_data_local <= class_Sn_MR_TCP_0055;
      end else if (tcp_server_open_method == tcp_server_open_method_tcp_server_open_method_S_0007_body && tcp_server_open_method_delay == 0) begin
        write_data_data_local <= 8'h00;
      end else if (tcp_server_open_method == tcp_server_open_method_tcp_server_open_method_S_0010_body && tcp_server_open_method_delay == 0) begin
        write_data_data_local <= 8'h50;
      end else if (tcp_server_open_method == tcp_server_open_method_tcp_server_open_method_S_0013_body && tcp_server_open_method_delay == 0) begin
        write_data_data_local <= class_Sn_CR_OPEN_0060;
      end else if (tcp_server_listen_method == tcp_server_listen_method_tcp_server_listen_method_S_0004_body && tcp_server_listen_method_delay == 0) begin
        write_data_data_local <= class_Sn_CR_LISTEN_0061;
      end else if (pull_recv_data_method == pull_recv_data_method_pull_recv_data_method_S_0035_body && pull_recv_data_method_delay == 0) begin
        write_data_data_local <= class_Sn_CR_RECV_0068;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0024_body && push_send_data_method_delay == 0) begin
        write_data_data_local <= push_send_data_v_0224;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0031_body && push_send_data_method_delay == 0) begin
        write_data_data_local <= push_send_data_v_0224;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0035_body && push_send_data_method_delay == 0) begin
        write_data_data_local <= class_Sn_CR_RECV_0068;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0040_body && push_send_data_method_delay == 0) begin
        write_data_data_local <= cast_expr_00244;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0045_body && push_send_data_method_delay == 0) begin
        write_data_data_local <= cast_expr_00249;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0050_body && push_send_data_method_delay == 0) begin
        write_data_data_local <= cast_expr_00254;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0053_body && push_send_data_method_delay == 0) begin
        write_data_data_local <= class_Sn_CR_SEND_0065;
      end else if (tcp_server_method == tcp_server_method_tcp_server_method_S_0004_body && tcp_server_method_delay == 0) begin
        write_data_data_local <= 8'h01;
      end else if (tcp_server_method == tcp_server_method_tcp_server_method_S_0012_body && tcp_server_method_delay == 0) begin
        write_data_data_local <= class_Sn_CR_CLOSE_0064;
      end else if (tcp_server_method == tcp_server_method_tcp_server_method_S_0024_body && tcp_server_method_delay == 0) begin
        write_data_data_local <= class_Sn_CR_CLOSE_0064;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0005_body && tcp_client_method_delay == 0) begin
        write_data_data_local <= 8'h01;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0007_body && tcp_client_method_delay == 0) begin
        write_data_data_local <= class_Sn_MR_TCP_0055;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0009_body && tcp_client_method_delay == 0) begin
        write_data_data_local <= 8'h13;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0011_body && tcp_client_method_delay == 0) begin
        write_data_data_local <= 8'h88;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0013_body && tcp_client_method_delay == 0) begin
        write_data_data_local <= class_Sn_CR_OPEN_0060;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0022_body && tcp_client_method_delay == 0) begin
        write_data_data_local <= 8'hc0;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0024_body && tcp_client_method_delay == 0) begin
        write_data_data_local <= 8'hc0;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0026_body && tcp_client_method_delay == 0) begin
        write_data_data_local <= 8'ha8;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0028_body && tcp_client_method_delay == 0) begin
        write_data_data_local <= 8'h01;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0030_body && tcp_client_method_delay == 0) begin
        write_data_data_local <= 8'h6e;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0032_body && tcp_client_method_delay == 0) begin
        write_data_data_local <= 8'h5e;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0034_body && tcp_client_method_delay == 0) begin
        write_data_data_local <= 8'ha0;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0035_body && tcp_client_method_delay == 0) begin
        write_data_data_local <= 8'h00;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0036_body && tcp_client_method_delay == 0) begin
        write_data_data_local <= 8'h00;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0037_body && tcp_client_method_delay == 0) begin
        write_data_data_local <= 8'h00;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0038_body && tcp_client_method_delay == 0) begin
        write_data_data_local <= 8'h00;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0040_body && tcp_client_method_delay == 0) begin
        write_data_data_local <= 8'h04;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00096 <= 0;
    end else begin
      if (write_data_method == write_data_method_S_0002) begin
        field_access_00096 <= class_wiz830mj_0000_address;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00097 <= 0;
    end else begin
      if (write_data_method == write_data_method_S_0004) begin
        field_access_00097 <= class_wiz830mj_0000_wdata;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00098 <= 1'b0;
    end else begin
      if (write_data_method == write_data_method_S_0006) begin
        field_access_00098 <= class_wiz830mj_0000_cs;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00099 <= 1'b0;
    end else begin
      if (write_data_method == write_data_method_S_0008) begin
        field_access_00099 <= class_wiz830mj_0000_we;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00101 <= 1'b0;
    end else begin
      if (write_data_method == write_data_method_S_0011) begin
        field_access_00101 <= class_wiz830mj_0000_we;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00102 <= 1'b0;
    end else begin
      if (write_data_method == write_data_method_S_0013) begin
        field_access_00102 <= class_wiz830mj_0000_cs;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      read_data_addr_0103 <= 0;
    end else begin
      if (read_data_method == read_data_method_S_0001) begin
        read_data_addr_0103 <= read_data_addr_local;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      read_data_addr_local <= 0;
    end else begin
      if (tcp_server_open_method == tcp_server_open_method_tcp_server_open_method_S_0016_body && tcp_server_open_method_delay == 0) begin
        read_data_addr_local <= binary_expr_00152;
      end else if (tcp_server_listen_method == tcp_server_listen_method_tcp_server_listen_method_S_0007_body && tcp_server_listen_method_delay == 0) begin
        read_data_addr_local <= binary_expr_00159;
      end else if (wait_for_established_method == wait_for_established_method_wait_for_established_method_S_0006_body && wait_for_established_method_delay == 0) begin
        read_data_addr_local <= binary_expr_00164;
      end else if (wait_for_recv_method == wait_for_recv_method_wait_for_recv_method_S_0010_body && wait_for_recv_method_delay == 0) begin
        read_data_addr_local <= binary_expr_00172;
      end else if (wait_for_recv_method == wait_for_recv_method_wait_for_recv_method_S_0015_body && wait_for_recv_method_delay == 0) begin
        read_data_addr_local <= binary_expr_00177;
      end else if (wait_for_recv_method == wait_for_recv_method_wait_for_recv_method_S_0020_body && wait_for_recv_method_delay == 0) begin
        read_data_addr_local <= binary_expr_00182;
      end else if (pull_recv_data_method == pull_recv_data_method_pull_recv_data_method_S_0023_body && pull_recv_data_method_delay == 0) begin
        read_data_addr_local <= binary_expr_00205;
      end else if (pull_recv_data_method == pull_recv_data_method_pull_recv_data_method_S_0030_body && pull_recv_data_method_delay == 0) begin
        read_data_addr_local <= binary_expr_00211;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0016_body && tcp_client_method_delay == 0) begin
        read_data_addr_local <= binary_expr_00293;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0043_body && tcp_client_method_delay == 0) begin
        read_data_addr_local <= binary_expr_00316;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00104 <= 0;
    end else begin
      if (read_data_method == read_data_method_S_0002) begin
        field_access_00104 <= class_wiz830mj_0000_address;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00105 <= 1'b0;
    end else begin
      if (read_data_method == read_data_method_S_0004) begin
        field_access_00105 <= class_wiz830mj_0000_cs;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00106 <= 1'b0;
    end else begin
      if (read_data_method == read_data_method_S_0006) begin
        field_access_00106 <= class_wiz830mj_0000_oe;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      read_data_v_0108 <= 0;
    end else begin
      if (read_data_method == read_data_method_S_0010) begin
        read_data_v_0108 <= field_access_00109;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00109 <= 0;
    end else begin
      if (read_data_method == read_data_method_S_0009) begin
        field_access_00109 <= class_wiz830mj_0000_rdata;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00110 <= 1'b0;
    end else begin
      if (read_data_method == read_data_method_S_0011) begin
        field_access_00110 <= class_wiz830mj_0000_oe;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00111 <= 1'b0;
    end else begin
      if (read_data_method == read_data_method_S_0013) begin
        field_access_00111 <= class_wiz830mj_0000_cs;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00112 <= 1'b0;
    end else begin
      if (init_method == init_method_S_0002) begin
        field_access_00112 <= class_wiz830mj_0000_cs;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00113 <= 1'b0;
    end else begin
      if (init_method == init_method_S_0004) begin
        field_access_00113 <= class_wiz830mj_0000_we;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00114 <= 1'b0;
    end else begin
      if (init_method == init_method_S_0006) begin
        field_access_00114 <= class_wiz830mj_0000_oe;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00115 <= 1'b0;
    end else begin
      if (init_method == init_method_S_0008) begin
        field_access_00115 <= class_wiz830mj_0000_module_reset;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      field_access_00117 <= 1'b0;
    end else begin
      if (init_method == init_method_S_0011) begin
        field_access_00117 <= class_wiz830mj_0000_module_reset;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_server_open_port_0137 <= 0;
    end else begin
      if (tcp_server_open_method == tcp_server_open_method_S_0001) begin
        tcp_server_open_port_0137 <= tcp_server_open_port_local;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_server_open_port_local <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_tcp_server_method_S_0005_body && tcp_server_method_delay == 0) begin
        tcp_server_open_port_local <= tcp_server_port_0258;
      end else if (tcp_server_method == tcp_server_method_tcp_server_method_S_0013_body && tcp_server_method_delay == 0) begin
        tcp_server_open_port_local <= tcp_server_port_0258;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00139 <= 0;
    end else begin
      if (tcp_server_open_method == tcp_server_open_method_S_0002) begin
        binary_expr_00139 <= tmp_0123;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00140 <= 0;
    end else begin
      if (tcp_server_open_method == tcp_server_open_method_S_0003) begin
        binary_expr_00140 <= tmp_0124;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00142 <= 0;
    end else begin
      if (tcp_server_open_method == tcp_server_open_method_S_0005) begin
        binary_expr_00142 <= tmp_0125;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00143 <= 0;
    end else begin
      if (tcp_server_open_method == tcp_server_open_method_S_0006) begin
        binary_expr_00143 <= tmp_0126;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00145 <= 0;
    end else begin
      if (tcp_server_open_method == tcp_server_open_method_S_0008) begin
        binary_expr_00145 <= tmp_0127;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00146 <= 0;
    end else begin
      if (tcp_server_open_method == tcp_server_open_method_S_0009) begin
        binary_expr_00146 <= tmp_0128;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00148 <= 0;
    end else begin
      if (tcp_server_open_method == tcp_server_open_method_S_0011) begin
        binary_expr_00148 <= tmp_0129;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00149 <= 0;
    end else begin
      if (tcp_server_open_method == tcp_server_open_method_S_0012) begin
        binary_expr_00149 <= tmp_0130;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      method_result_00150 <= 0;
    end else begin
      if (tcp_server_open_method == tcp_server_open_method_tcp_server_open_method_S_0016_body && tcp_server_open_method_delay >= 1 && read_data_call_flag_0016 == 1'b1) begin
        method_result_00150 <= read_data_return;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00151 <= 0;
    end else begin
      if (tcp_server_open_method == tcp_server_open_method_S_0014) begin
        binary_expr_00151 <= tmp_0131;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00152 <= 0;
    end else begin
      if (tcp_server_open_method == tcp_server_open_method_S_0015) begin
        binary_expr_00152 <= tmp_0132;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_server_listen_port_0153 <= 0;
    end else begin
      if (tcp_server_listen_method == tcp_server_listen_method_S_0001) begin
        tcp_server_listen_port_0153 <= tcp_server_listen_port_local;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_server_listen_port_local <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_tcp_server_method_S_0017_body && tcp_server_method_delay == 0) begin
        tcp_server_listen_port_local <= tcp_server_port_0258;
      end else if (tcp_server_method == tcp_server_method_tcp_server_method_S_0025_body && tcp_server_method_delay == 0) begin
        tcp_server_listen_port_local <= tcp_server_port_0258;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00155 <= 0;
    end else begin
      if (tcp_server_listen_method == tcp_server_listen_method_S_0002) begin
        binary_expr_00155 <= tmp_0139;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00156 <= 0;
    end else begin
      if (tcp_server_listen_method == tcp_server_listen_method_S_0003) begin
        binary_expr_00156 <= tmp_0140;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      method_result_00157 <= 0;
    end else begin
      if (tcp_server_listen_method == tcp_server_listen_method_tcp_server_listen_method_S_0007_body && tcp_server_listen_method_delay >= 1 && read_data_call_flag_0007 == 1'b1) begin
        method_result_00157 <= read_data_return;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00158 <= 0;
    end else begin
      if (tcp_server_listen_method == tcp_server_listen_method_S_0005) begin
        binary_expr_00158 <= tmp_0141;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00159 <= 0;
    end else begin
      if (tcp_server_listen_method == tcp_server_listen_method_S_0006) begin
        binary_expr_00159 <= tmp_0142;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_for_established_port_0160 <= 0;
    end else begin
      if (wait_for_established_method == wait_for_established_method_S_0001) begin
        wait_for_established_port_0160 <= wait_for_established_port_local;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_for_established_port_local <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_tcp_server_method_S_0029_body && tcp_server_method_delay == 0) begin
        wait_for_established_port_local <= tcp_server_port_0258;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_for_established_v_0161 <= 0;
    end else begin
      if (wait_for_established_method == wait_for_established_method_S_0007) begin
        wait_for_established_v_0161 <= method_result_00162;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      method_result_00162 <= 0;
    end else begin
      if (wait_for_established_method == wait_for_established_method_wait_for_established_method_S_0006_body && wait_for_established_method_delay >= 1 && read_data_call_flag_0006 == 1'b1) begin
        method_result_00162 <= read_data_return;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00163 <= 0;
    end else begin
      if (wait_for_established_method == wait_for_established_method_S_0004) begin
        binary_expr_00163 <= tmp_0152;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00164 <= 0;
    end else begin
      if (wait_for_established_method == wait_for_established_method_S_0005) begin
        binary_expr_00164 <= tmp_0153;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00165 <= 1'b0;
    end else begin
      if (wait_for_established_method == wait_for_established_method_S_0008) begin
        binary_expr_00165 <= tmp_0154;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_for_recv_port_0166 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0001) begin
        wait_for_recv_port_0166 <= wait_for_recv_port_local;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_for_recv_port_local <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_tcp_server_method_S_0033_body && tcp_server_method_delay == 0) begin
        wait_for_recv_port_local <= tcp_server_port_0258;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_for_recv_v_0167 <= 32'h00000000;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0002) begin
        wait_for_recv_v_0167 <= 32'h00000000;
      end else if (wait_for_recv_method == wait_for_recv_method_S_0007) begin
        wait_for_recv_v_0167 <= 32'h00000000;
      end else if (wait_for_recv_method == wait_for_recv_method_S_0027) begin
        wait_for_recv_v_0167 <= binary_expr_00187;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_for_recv_prev_v_0168 <= 32'h00000000;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0002) begin
        wait_for_recv_prev_v_0168 <= 32'h00000000;
      end else if (wait_for_recv_method == wait_for_recv_method_S_0006) begin
        wait_for_recv_prev_v_0168 <= wait_for_recv_v_0167;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_for_recv_v0_0169 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0012) begin
        wait_for_recv_v0_0169 <= cast_expr_00173;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      method_result_00170 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_wait_for_recv_method_S_0010_body && wait_for_recv_method_delay >= 1 && read_data_call_flag_0010 == 1'b1) begin
        method_result_00170 <= read_data_return;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00171 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0006) begin
        binary_expr_00171 <= tmp_0174;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00172 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0007) begin
        binary_expr_00172 <= tmp_0175;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      cast_expr_00173 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0011) begin
        cast_expr_00173 <= tmp_0176;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_for_recv_v1_0174 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0017) begin
        wait_for_recv_v1_0174 <= cast_expr_00178;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      method_result_00175 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_wait_for_recv_method_S_0015_body && wait_for_recv_method_delay >= 1 && read_data_call_flag_0015 == 1'b1) begin
        method_result_00175 <= read_data_return;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00176 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0011) begin
        binary_expr_00176 <= tmp_0177;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00177 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0012) begin
        binary_expr_00177 <= tmp_0178;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      cast_expr_00178 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0016) begin
        cast_expr_00178 <= tmp_0179;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_for_recv_v2_0179 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0022) begin
        wait_for_recv_v2_0179 <= cast_expr_00183;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      method_result_00180 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_wait_for_recv_method_S_0020_body && wait_for_recv_method_delay >= 1 && read_data_call_flag_0020 == 1'b1) begin
        method_result_00180 <= read_data_return;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00181 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0016) begin
        binary_expr_00181 <= tmp_0180;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00182 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0017) begin
        binary_expr_00182 <= tmp_0181;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      cast_expr_00183 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0021) begin
        cast_expr_00183 <= tmp_0182;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00184 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0021) begin
        binary_expr_00184 <= tmp_0183;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00185 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0021) begin
        binary_expr_00185 <= tmp_0184;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00186 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0022) begin
        binary_expr_00186 <= tmp_0185;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00187 <= 0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0026) begin
        binary_expr_00187 <= tmp_0186;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00188 <= 1'b0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0028) begin
        binary_expr_00188 <= tmp_0187;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00189 <= 1'b0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0028) begin
        binary_expr_00189 <= tmp_0188;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00190 <= 1'b0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0030) begin
        binary_expr_00190 <= tmp_0189;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      pull_recv_data_port_0191 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0001) begin
        pull_recv_data_port_0191 <= pull_recv_data_port_local;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      pull_recv_data_port_local <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_tcp_server_method_S_0034_body && tcp_server_method_delay == 0) begin
        pull_recv_data_port_local <= tcp_server_port_0258;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      pull_recv_data_read_len_0192 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0003) begin
        pull_recv_data_read_len_0192 <= binary_expr_00193;
      end else if (pull_recv_data_method == pull_recv_data_method_S_0009) begin
        pull_recv_data_read_len_0192 <= binary_expr_00196;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00193 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0002) begin
        binary_expr_00193 <= tmp_0209;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00194 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0002) begin
        binary_expr_00194 <= tmp_0210;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00195 <= 1'b0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0003) begin
        binary_expr_00195 <= tmp_0211;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00213 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0033) begin
        binary_expr_00213 <= tmp_0223;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00214 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0034) begin
        binary_expr_00214 <= tmp_0224;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00196 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0008) begin
        binary_expr_00196 <= tmp_0212;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      pull_recv_data_i_0197 <= 32'h00000000;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0011) begin
        pull_recv_data_i_0197 <= 32'h00000000;
      end else if (pull_recv_data_method == pull_recv_data_method_S_0016) begin
        pull_recv_data_i_0197 <= unary_expr_00199;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00198 <= 1'b0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0012) begin
        binary_expr_00198 <= tmp_0213;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      unary_expr_00199 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0015) begin
        unary_expr_00199 <= tmp_0214;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00200 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0018) begin
        binary_expr_00200 <= tmp_0215;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00201 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0019) begin
        binary_expr_00201 <= tmp_0216;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      method_result_00203 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_pull_recv_data_method_S_0023_body && pull_recv_data_method_delay >= 1 && read_data_call_flag_0023 == 1'b1) begin
        method_result_00203 <= read_data_return;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00204 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0021) begin
        binary_expr_00204 <= tmp_0217;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00205 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0022) begin
        binary_expr_00205 <= tmp_0218;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00206 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0024) begin
        binary_expr_00206 <= tmp_0219;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00207 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0026) begin
        binary_expr_00207 <= tmp_0220;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      method_result_00209 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_pull_recv_data_method_S_0030_body && pull_recv_data_method_delay >= 1 && read_data_call_flag_0030 == 1'b1) begin
        method_result_00209 <= read_data_return;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00210 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0028) begin
        binary_expr_00210 <= tmp_0221;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00211 <= 0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0029) begin
        binary_expr_00211 <= tmp_0222;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      push_send_data_port_0215 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0001) begin
        push_send_data_port_0215 <= push_send_data_port_local;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      push_send_data_port_local <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_tcp_server_method_S_0035_body && tcp_server_method_delay == 0) begin
        push_send_data_port_local <= tcp_server_port_0258;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0060_body && tcp_client_method_delay == 0) begin
        push_send_data_port_local <= tcp_client_wiz_port_0279;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      push_send_data_write_len_0216 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0003) begin
        push_send_data_write_len_0216 <= binary_expr_00217;
      end else if (push_send_data_method == push_send_data_method_S_0009) begin
        push_send_data_write_len_0216 <= binary_expr_00220;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00217 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0002) begin
        binary_expr_00217 <= tmp_0260;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00218 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0002) begin
        binary_expr_00218 <= tmp_0261;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00219 <= 1'b0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0003) begin
        binary_expr_00219 <= tmp_0262;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00238 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0033) begin
        binary_expr_00238 <= tmp_0274;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00239 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0034) begin
        binary_expr_00239 <= tmp_0275;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00241 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0036) begin
        binary_expr_00241 <= tmp_0276;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00242 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0037) begin
        binary_expr_00242 <= tmp_0278;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00243 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0036) begin
        binary_expr_00243 <= tmp_0277;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      cast_expr_00244 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0037) begin
        cast_expr_00244 <= tmp_0279;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00246 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0041) begin
        binary_expr_00246 <= tmp_0280;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00247 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0042) begin
        binary_expr_00247 <= tmp_0282;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00248 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0041) begin
        binary_expr_00248 <= tmp_0281;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      cast_expr_00249 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0042) begin
        cast_expr_00249 <= tmp_0283;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00251 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0046) begin
        binary_expr_00251 <= tmp_0284;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00252 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0047) begin
        binary_expr_00252 <= tmp_0286;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00253 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0046) begin
        binary_expr_00253 <= tmp_0285;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      cast_expr_00254 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0047) begin
        cast_expr_00254 <= tmp_0287;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00256 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0051) begin
        binary_expr_00256 <= tmp_0288;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00257 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0052) begin
        binary_expr_00257 <= tmp_0289;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00220 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0008) begin
        binary_expr_00220 <= tmp_0263;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      push_send_data_i_0221 <= 32'h00000000;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0011) begin
        push_send_data_i_0221 <= 32'h00000000;
      end else if (push_send_data_method == push_send_data_method_S_0016) begin
        push_send_data_i_0221 <= unary_expr_00223;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00222 <= 1'b0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0012) begin
        binary_expr_00222 <= tmp_0264;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      unary_expr_00223 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0015) begin
        unary_expr_00223 <= tmp_0265;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      push_send_data_v_0224 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0021) begin
        push_send_data_v_0224 <= array_access_00227;
      end else if (push_send_data_method == push_send_data_method_S_0028) begin
        push_send_data_v_0224 <= array_access_00233;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00225 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0018) begin
        binary_expr_00225 <= tmp_0266;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00226 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0019) begin
        binary_expr_00226 <= tmp_0267;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      array_access_00227 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0020 && push_send_data_method_delay == 2) begin
        array_access_00227 <= class_buffer_0089_dout_b;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00229 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0021) begin
        binary_expr_00229 <= tmp_0268;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00230 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0023) begin
        binary_expr_00230 <= tmp_0269;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00231 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0025) begin
        binary_expr_00231 <= tmp_0270;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00232 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0026) begin
        binary_expr_00232 <= tmp_0271;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      array_access_00233 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0027 && push_send_data_method_delay == 2) begin
        array_access_00233 <= class_buffer_0089_dout_b;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00235 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0028) begin
        binary_expr_00235 <= tmp_0272;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00236 <= 0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0030) begin
        binary_expr_00236 <= tmp_0273;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_server_port_0258 <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_S_0001) begin
        tcp_server_port_0258 <= tcp_server_port_local;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00260 <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_S_0002) begin
        binary_expr_00260 <= tmp_0339;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00261 <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_S_0003) begin
        binary_expr_00261 <= tmp_0340;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_server_v_0262 <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_S_0006) begin
        tcp_server_v_0262 <= method_result_00263;
      end else if (tcp_server_method == tcp_server_method_S_0014) begin
        tcp_server_v_0262 <= method_result_00268;
      end else if (tcp_server_method == tcp_server_method_S_0018) begin
        tcp_server_v_0262 <= method_result_00269;
      end else if (tcp_server_method == tcp_server_method_S_0026) begin
        tcp_server_v_0262 <= method_result_00274;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      method_result_00263 <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_tcp_server_method_S_0005_body && tcp_server_method_delay >= 1 && tcp_server_open_call_flag_0005 == 1'b1) begin
        method_result_00263 <= tcp_server_open_return;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00264 <= 1'b0;
    end else begin
      if (tcp_server_method == tcp_server_method_S_0007) begin
        binary_expr_00264 <= tmp_0341;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      method_result_00269 <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_tcp_server_method_S_0017_body && tcp_server_method_delay >= 1 && tcp_server_listen_call_flag_0017 == 1'b1) begin
        method_result_00269 <= tcp_server_listen_return;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00270 <= 1'b0;
    end else begin
      if (tcp_server_method == tcp_server_method_S_0019) begin
        binary_expr_00270 <= tmp_0344;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00266 <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_S_0010) begin
        binary_expr_00266 <= tmp_0342;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00267 <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_S_0011) begin
        binary_expr_00267 <= tmp_0343;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      method_result_00268 <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_tcp_server_method_S_0013_body && tcp_server_method_delay >= 1 && tcp_server_open_call_flag_0013 == 1'b1) begin
        method_result_00268 <= tcp_server_open_return;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00272 <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_S_0022) begin
        binary_expr_00272 <= tmp_0345;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00273 <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_S_0023) begin
        binary_expr_00273 <= tmp_0346;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      method_result_00274 <= 0;
    end else begin
      if (tcp_server_method == tcp_server_method_tcp_server_method_S_0025_body && tcp_server_method_delay >= 1 && tcp_server_listen_call_flag_0025 == 1'b1) begin
        method_result_00274 <= tcp_server_listen_return;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_client_wiz_port_0279 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0001) begin
        tcp_client_wiz_port_0279 <= tcp_client_wiz_port_local;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_client_wiz_port_local <= 0;
    end else begin
      if (test_method == test_method_test_method_S_0004_body && test_method_delay == 0) begin
        tcp_client_wiz_port_local <= 32'h00000000;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_client_wiz_port_offset_0280 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0003) begin
        tcp_client_wiz_port_offset_0280 <= binary_expr_00281;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00281 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0002) begin
        binary_expr_00281 <= tmp_0429;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00283 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0004) begin
        binary_expr_00283 <= tmp_0430;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00285 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0006) begin
        binary_expr_00285 <= tmp_0431;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00287 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0008) begin
        binary_expr_00287 <= tmp_0432;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00289 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0010) begin
        binary_expr_00289 <= tmp_0433;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00291 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0012) begin
        binary_expr_00291 <= tmp_0434;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      method_result_00292 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_tcp_client_method_S_0016_body && tcp_client_method_delay >= 1 && read_data_call_flag_0016 == 1'b1) begin
        method_result_00292 <= read_data_return;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00293 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0015) begin
        binary_expr_00293 <= tmp_0435;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00294 <= 1'b0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0017) begin
        binary_expr_00294 <= tmp_0436;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00296 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0021) begin
        binary_expr_00296 <= tmp_0437;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00298 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0023) begin
        binary_expr_00298 <= tmp_0438;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00300 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0025) begin
        binary_expr_00300 <= tmp_0439;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00302 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0027) begin
        binary_expr_00302 <= tmp_0440;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00304 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0029) begin
        binary_expr_00304 <= tmp_0441;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00306 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0031) begin
        binary_expr_00306 <= tmp_0442;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00308 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0033) begin
        binary_expr_00308 <= tmp_0443;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00314 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0039) begin
        binary_expr_00314 <= tmp_0444;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      method_result_00315 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_tcp_client_method_S_0043_body && tcp_client_method_delay >= 1 && read_data_call_flag_0043 == 1'b1) begin
        method_result_00315 <= read_data_return;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00316 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0042) begin
        binary_expr_00316 <= tmp_0445;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00317 <= 1'b0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0044) begin
        binary_expr_00317 <= tmp_0446;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_client_prev_midi_msg_0318 <= 0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0048) begin
        tcp_client_prev_midi_msg_0318 <= class_midi_msg_0003;
      end else if (tcp_client_method == tcp_client_method_S_0058) begin
        tcp_client_prev_midi_msg_0318 <= class_midi_msg_0003;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00320 <= 1'b0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0052) begin
        binary_expr_00320 <= tmp_0447;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00321 <= 1'b0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0053) begin
        binary_expr_00321 <= tmp_0448;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00322 <= 1'b0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0054) begin
        binary_expr_00322 <= tmp_0449;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00340 <= 0;
    end else begin
      if (buildMidiMsg_method == buildMidiMsg_method_S_0031) begin
        binary_expr_00340 <= tmp_0450;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      cast_expr_00341 <= 0;
    end else begin
      if (buildMidiMsg_method == buildMidiMsg_method_S_0032) begin
        cast_expr_00341 <= tmp_0451;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00344 <= 0;
    end else begin
      if (buildMidiMsg_method == buildMidiMsg_method_S_0037) begin
        binary_expr_00344 <= tmp_0452;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      cast_expr_00345 <= 0;
    end else begin
      if (buildMidiMsg_method == buildMidiMsg_method_S_0038) begin
        cast_expr_00345 <= tmp_0453;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      cast_expr_00348 <= 0;
    end else begin
      if (buildMidiMsg_method == buildMidiMsg_method_S_0043) begin
        cast_expr_00348 <= tmp_0454;
      end
    end
  end

  assign wait_cycles_req_flag = wait_cycles_req_local;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_cycles_req_local <= 1'b0;
    end else begin
      if (write_data_method == write_data_method_write_data_method_S_0010_body && write_data_method_delay == 0) begin
        wait_cycles_req_local <= 1'b1;
      end else if (read_data_method == read_data_method_read_data_method_S_0008_body && read_data_method_delay == 0) begin
        wait_cycles_req_local <= 1'b1;
      end else if (init_method == init_method_init_method_S_0010_body && init_method_delay == 0) begin
        wait_cycles_req_local <= 1'b1;
      end else if (init_method == init_method_init_method_S_0013_body && init_method_delay == 0) begin
        wait_cycles_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0051_body && tcp_client_method_delay == 0) begin
        wait_cycles_req_local <= 1'b1;
      end else begin
        wait_cycles_req_local <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_cycles_busy <= 1'b0;
    end else begin
      if (wait_cycles_method == wait_cycles_method_S_0001) begin
        wait_cycles_busy <= wait_cycles_req_flag;
      end
    end
  end

  assign write_data_req_flag = write_data_req_local;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      write_data_req_local <= 1'b0;
    end else begin
      if (network_configuration_method == network_configuration_method_network_configuration_method_S_0002_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0003_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0004_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0005_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0006_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0007_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0008_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0009_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0010_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0011_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0012_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0013_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0014_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0015_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0016_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0017_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0018_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (network_configuration_method == network_configuration_method_network_configuration_method_S_0019_body && network_configuration_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_server_open_method == tcp_server_open_method_tcp_server_open_method_S_0004_body && tcp_server_open_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_server_open_method == tcp_server_open_method_tcp_server_open_method_S_0007_body && tcp_server_open_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_server_open_method == tcp_server_open_method_tcp_server_open_method_S_0010_body && tcp_server_open_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_server_open_method == tcp_server_open_method_tcp_server_open_method_S_0013_body && tcp_server_open_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_server_listen_method == tcp_server_listen_method_tcp_server_listen_method_S_0004_body && tcp_server_listen_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (pull_recv_data_method == pull_recv_data_method_pull_recv_data_method_S_0035_body && pull_recv_data_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0024_body && push_send_data_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0031_body && push_send_data_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0035_body && push_send_data_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0040_body && push_send_data_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0045_body && push_send_data_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0050_body && push_send_data_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (push_send_data_method == push_send_data_method_push_send_data_method_S_0053_body && push_send_data_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_server_method == tcp_server_method_tcp_server_method_S_0004_body && tcp_server_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_server_method == tcp_server_method_tcp_server_method_S_0012_body && tcp_server_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_server_method == tcp_server_method_tcp_server_method_S_0024_body && tcp_server_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0005_body && tcp_client_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0007_body && tcp_client_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0009_body && tcp_client_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0011_body && tcp_client_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0013_body && tcp_client_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0022_body && tcp_client_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0024_body && tcp_client_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0026_body && tcp_client_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0028_body && tcp_client_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0030_body && tcp_client_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0032_body && tcp_client_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0034_body && tcp_client_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0035_body && tcp_client_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0036_body && tcp_client_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0037_body && tcp_client_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0038_body && tcp_client_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0040_body && tcp_client_method_delay == 0) begin
        write_data_req_local <= 1'b1;
      end else begin
        write_data_req_local <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      write_data_busy <= 1'b0;
    end else begin
      if (write_data_method == write_data_method_S_0001) begin
        write_data_busy <= write_data_req_flag;
      end
    end
  end

  assign read_data_req_flag = read_data_req_local;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      read_data_req_local <= 1'b0;
    end else begin
      if (tcp_server_open_method == tcp_server_open_method_tcp_server_open_method_S_0016_body && tcp_server_open_method_delay == 0) begin
        read_data_req_local <= 1'b1;
      end else if (tcp_server_listen_method == tcp_server_listen_method_tcp_server_listen_method_S_0007_body && tcp_server_listen_method_delay == 0) begin
        read_data_req_local <= 1'b1;
      end else if (wait_for_established_method == wait_for_established_method_wait_for_established_method_S_0006_body && wait_for_established_method_delay == 0) begin
        read_data_req_local <= 1'b1;
      end else if (wait_for_recv_method == wait_for_recv_method_wait_for_recv_method_S_0010_body && wait_for_recv_method_delay == 0) begin
        read_data_req_local <= 1'b1;
      end else if (wait_for_recv_method == wait_for_recv_method_wait_for_recv_method_S_0015_body && wait_for_recv_method_delay == 0) begin
        read_data_req_local <= 1'b1;
      end else if (wait_for_recv_method == wait_for_recv_method_wait_for_recv_method_S_0020_body && wait_for_recv_method_delay == 0) begin
        read_data_req_local <= 1'b1;
      end else if (pull_recv_data_method == pull_recv_data_method_pull_recv_data_method_S_0023_body && pull_recv_data_method_delay == 0) begin
        read_data_req_local <= 1'b1;
      end else if (pull_recv_data_method == pull_recv_data_method_pull_recv_data_method_S_0030_body && pull_recv_data_method_delay == 0) begin
        read_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0016_body && tcp_client_method_delay == 0) begin
        read_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0043_body && tcp_client_method_delay == 0) begin
        read_data_req_local <= 1'b1;
      end else begin
        read_data_req_local <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      read_data_busy <= 1'b0;
    end else begin
      if (read_data_method == read_data_method_S_0001) begin
        read_data_busy <= read_data_req_flag;
      end
    end
  end

  assign init_req_flag = init_req_local;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      init_req_local <= 1'b0;
    end else begin
      if (test_method == test_method_test_method_S_0002_body && test_method_delay == 0) begin
        init_req_local <= 1'b1;
      end else begin
        init_req_local <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      init_busy <= 1'b0;
    end else begin
      if (init_method == init_method_S_0001) begin
        init_busy <= init_req_flag;
      end
    end
  end

  assign network_configuration_req_flag = network_configuration_req_local;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      network_configuration_req_local <= 1'b0;
    end else begin
      if (test_method == test_method_test_method_S_0003_body && test_method_delay == 0) begin
        network_configuration_req_local <= 1'b1;
      end else begin
        network_configuration_req_local <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      network_configuration_busy <= 1'b0;
    end else begin
      if (network_configuration_method == network_configuration_method_S_0001) begin
        network_configuration_busy <= network_configuration_req_flag;
      end
    end
  end

  assign tcp_server_open_req_flag = tcp_server_open_req_local;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_server_open_req_local <= 1'b0;
    end else begin
      if (tcp_server_method == tcp_server_method_tcp_server_method_S_0005_body && tcp_server_method_delay == 0) begin
        tcp_server_open_req_local <= 1'b1;
      end else if (tcp_server_method == tcp_server_method_tcp_server_method_S_0013_body && tcp_server_method_delay == 0) begin
        tcp_server_open_req_local <= 1'b1;
      end else begin
        tcp_server_open_req_local <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_server_open_busy <= 1'b0;
    end else begin
      if (tcp_server_open_method == tcp_server_open_method_S_0001) begin
        tcp_server_open_busy <= tcp_server_open_req_flag;
      end
    end
  end

  assign tcp_server_listen_req_flag = tcp_server_listen_req_local;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_server_listen_req_local <= 1'b0;
    end else begin
      if (tcp_server_method == tcp_server_method_tcp_server_method_S_0017_body && tcp_server_method_delay == 0) begin
        tcp_server_listen_req_local <= 1'b1;
      end else if (tcp_server_method == tcp_server_method_tcp_server_method_S_0025_body && tcp_server_method_delay == 0) begin
        tcp_server_listen_req_local <= 1'b1;
      end else begin
        tcp_server_listen_req_local <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_server_listen_busy <= 1'b0;
    end else begin
      if (tcp_server_listen_method == tcp_server_listen_method_S_0001) begin
        tcp_server_listen_busy <= tcp_server_listen_req_flag;
      end
    end
  end

  assign wait_for_established_req_flag = wait_for_established_req_local;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_for_established_req_local <= 1'b0;
    end else begin
      if (tcp_server_method == tcp_server_method_tcp_server_method_S_0029_body && tcp_server_method_delay == 0) begin
        wait_for_established_req_local <= 1'b1;
      end else begin
        wait_for_established_req_local <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_for_established_busy <= 1'b0;
    end else begin
      if (wait_for_established_method == wait_for_established_method_S_0001) begin
        wait_for_established_busy <= wait_for_established_req_flag;
      end
    end
  end

  assign wait_for_recv_req_flag = wait_for_recv_req_local;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_for_recv_req_local <= 1'b0;
    end else begin
      if (tcp_server_method == tcp_server_method_tcp_server_method_S_0033_body && tcp_server_method_delay == 0) begin
        wait_for_recv_req_local <= 1'b1;
      end else begin
        wait_for_recv_req_local <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      wait_for_recv_busy <= 1'b0;
    end else begin
      if (wait_for_recv_method == wait_for_recv_method_S_0001) begin
        wait_for_recv_busy <= wait_for_recv_req_flag;
      end
    end
  end

  assign pull_recv_data_req_flag = pull_recv_data_req_local;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      pull_recv_data_req_local <= 1'b0;
    end else begin
      if (tcp_server_method == tcp_server_method_tcp_server_method_S_0034_body && tcp_server_method_delay == 0) begin
        pull_recv_data_req_local <= 1'b1;
      end else begin
        pull_recv_data_req_local <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      pull_recv_data_busy <= 1'b0;
    end else begin
      if (pull_recv_data_method == pull_recv_data_method_S_0001) begin
        pull_recv_data_busy <= pull_recv_data_req_flag;
      end
    end
  end

  assign push_send_data_req_flag = push_send_data_req_local;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      push_send_data_req_local <= 1'b0;
    end else begin
      if (tcp_server_method == tcp_server_method_tcp_server_method_S_0035_body && tcp_server_method_delay == 0) begin
        push_send_data_req_local <= 1'b1;
      end else if (tcp_client_method == tcp_client_method_tcp_client_method_S_0060_body && tcp_client_method_delay == 0) begin
        push_send_data_req_local <= 1'b1;
      end else begin
        push_send_data_req_local <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      push_send_data_busy <= 1'b0;
    end else begin
      if (push_send_data_method == push_send_data_method_S_0001) begin
        push_send_data_busy <= push_send_data_req_flag;
      end
    end
  end

  assign tcp_server_req_flag = tcp_server_req_local;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_server_busy <= 1'b0;
    end else begin
      if (tcp_server_method == tcp_server_method_S_0001) begin
        tcp_server_busy <= tcp_server_req_flag;
      end
    end
  end

  assign tcp_client_req_flag = tcp_client_req_local;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_client_req_local <= 1'b0;
    end else begin
      if (test_method == test_method_test_method_S_0004_body && test_method_delay == 0) begin
        tcp_client_req_local <= 1'b1;
      end else begin
        tcp_client_req_local <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_client_busy <= 1'b0;
    end else begin
      if (tcp_client_method == tcp_client_method_S_0001) begin
        tcp_client_busy <= tcp_client_req_flag;
      end
    end
  end

  assign buildMidiMsg_req_flag = buildMidiMsg_req_local;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      buildMidiMsg_req_local <= 1'b0;
    end else begin
      if (tcp_client_method == tcp_client_method_tcp_client_method_S_0059_body && tcp_client_method_delay == 0) begin
        buildMidiMsg_req_local <= 1'b1;
      end else begin
        buildMidiMsg_req_local <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      buildMidiMsg_busy <= 1'b0;
    end else begin
      if (buildMidiMsg_method == buildMidiMsg_method_S_0001) begin
        buildMidiMsg_busy <= buildMidiMsg_req_flag;
      end
    end
  end

  assign test_req_flag = tmp_0003;

  assign wait_cycles_call_flag_0010 = tmp_0011;

  assign wait_cycles_call_flag_0008 = tmp_0016;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      read_data_return <= 0;
    end else begin
      if (read_data_method == read_data_method_S_0015) begin
        read_data_return <= read_data_v_0108;
      end
    end
  end

  assign wait_cycles_call_flag_0013 = tmp_0022;

  assign write_data_call_flag_0002 = tmp_0027;

  assign write_data_call_flag_0003 = tmp_0032;

  assign write_data_call_flag_0004 = tmp_0037;

  assign write_data_call_flag_0005 = tmp_0042;

  assign write_data_call_flag_0006 = tmp_0047;

  assign write_data_call_flag_0007 = tmp_0052;

  assign write_data_call_flag_0008 = tmp_0057;

  assign write_data_call_flag_0009 = tmp_0062;

  assign write_data_call_flag_0010 = tmp_0067;

  assign write_data_call_flag_0011 = tmp_0072;

  assign write_data_call_flag_0012 = tmp_0077;

  assign write_data_call_flag_0013 = tmp_0082;

  assign write_data_call_flag_0014 = tmp_0087;

  assign write_data_call_flag_0015 = tmp_0092;

  assign write_data_call_flag_0016 = tmp_0097;

  assign write_data_call_flag_0017 = tmp_0102;

  assign write_data_call_flag_0018 = tmp_0107;

  assign write_data_call_flag_0019 = tmp_0112;

  assign read_data_call_flag_0016 = tmp_0121;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_server_open_return <= 0;
    end else begin
      if (tcp_server_open_method == tcp_server_open_method_S_0017) begin
        tcp_server_open_return <= method_result_00150;
      end
    end
  end

  assign read_data_call_flag_0007 = tmp_0137;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      tcp_server_listen_return <= 0;
    end else begin
      if (tcp_server_listen_method == tcp_server_listen_method_S_0008) begin
        tcp_server_listen_return <= method_result_00157;
      end
    end
  end

  assign read_data_call_flag_0006 = tmp_0148;

  assign read_data_call_flag_0010 = tmp_0160;

  assign read_data_call_flag_0015 = tmp_0165;

  assign read_data_call_flag_0020 = tmp_0170;

  assign read_data_call_flag_0023 = tmp_0197;

  assign read_data_call_flag_0030 = tmp_0202;

  assign write_data_call_flag_0035 = tmp_0207;

  assign write_data_call_flag_0024 = tmp_0232;

  assign write_data_call_flag_0031 = tmp_0237;

  assign write_data_call_flag_0040 = tmp_0243;

  assign write_data_call_flag_0045 = tmp_0248;

  assign write_data_call_flag_0050 = tmp_0253;

  assign write_data_call_flag_0053 = tmp_0258;

  assign tcp_server_open_call_flag_0005 = tmp_0294;

  assign tcp_server_open_call_flag_0013 = tmp_0302;

  assign tcp_server_listen_call_flag_0017 = tmp_0307;

  assign tcp_server_listen_call_flag_0025 = tmp_0315;

  assign wait_for_established_call_flag_0029 = tmp_0320;

  assign wait_for_recv_call_flag_0033 = tmp_0327;

  assign pull_recv_data_call_flag_0034 = tmp_0332;

  assign push_send_data_call_flag_0035 = tmp_0337;

  assign write_data_call_flag_0022 = tmp_0358;

  assign write_data_call_flag_0026 = tmp_0364;

  assign write_data_call_flag_0028 = tmp_0369;

  assign write_data_call_flag_0030 = tmp_0374;

  assign write_data_call_flag_0032 = tmp_0379;

  assign write_data_call_flag_0034 = tmp_0384;

  assign write_data_call_flag_0036 = tmp_0390;

  assign write_data_call_flag_0037 = tmp_0395;

  assign write_data_call_flag_0038 = tmp_0400;

  assign read_data_call_flag_0043 = tmp_0406;

  assign wait_cycles_call_flag_0051 = tmp_0415;

  assign buildMidiMsg_call_flag_0059 = tmp_0422;

  assign push_send_data_call_flag_0060 = tmp_0427;

  assign init_call_flag_0002 = tmp_0458;

  assign network_configuration_call_flag_0003 = tmp_0463;

  assign tcp_client_call_flag_0004 = tmp_0468;


  wiz830mj_iface
  class_wiz830mj_0000
  (
    .clk(class_wiz830mj_0000_clk),
    .reset(class_wiz830mj_0000_reset),
    .address(class_wiz830mj_0000_address),
    .wdata(class_wiz830mj_0000_wdata),
    .rdata(class_wiz830mj_0000_rdata),
    .cs(class_wiz830mj_0000_cs),
    .oe(class_wiz830mj_0000_oe),
    .we(class_wiz830mj_0000_we),
    .interrupt(class_wiz830mj_0000_interrupt),
    .module_reset(class_wiz830mj_0000_module_reset),
    .bready0(class_wiz830mj_0000_bready0),
    .bready1(class_wiz830mj_0000_bready1),
    .bready2(class_wiz830mj_0000_bready2),
    .bready3(class_wiz830mj_0000_bready3),
    .ADDR(class_wiz830mj_0000_ADDR),
    .nCS(class_wiz830mj_0000_nCS),
    .nRD(class_wiz830mj_0000_nRD),
    .nWR(class_wiz830mj_0000_nWR),
    .nINT(class_wiz830mj_0000_nINT),
    .nRESET(class_wiz830mj_0000_nRESET),
    .BRDY(class_wiz830mj_0000_BRDY),
    .DATA(class_wiz830mj_0000_DATA_exp)
  );

  dualportram
  #(
    .WIDTH(8),
    .DEPTH(13),
    .WORDS(8192)
  )
  class_buffer_0089
  (
    .clk(class_buffer_0089_clk),
    .reset(class_buffer_0089_reset),
    .length(class_buffer_0089_length),
    .address(class_buffer_0089_address),
    .din(class_buffer_0089_din),
    .dout(class_buffer_0089_dout),
    .we(class_buffer_0089_we),
    .oe(class_buffer_0089_oe),
    .address_b(class_buffer_0089_address_b),
    .din_b(class_buffer_0089_din_b),
    .dout_b(class_buffer_0089_dout_b),
    .we_b(class_buffer_0089_we_b),
    .oe_b(class_buffer_0089_oe_b)
  );


endmodule
