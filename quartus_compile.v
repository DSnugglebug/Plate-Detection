module quartus_compile (
	  input logic resetn
	, input logic clock
	, input logic [0:0] detect_edges_start
	, output logic [0:0] detect_edges_busy
	, output logic [0:0] detect_edges_done
	, input logic [0:0] detect_edges_stall
	, input logic [63:0] detect_edges_the_image
	, input logic [63:0] detect_edges_out_image
	, input logic [31:0] detect_edges_threshold
	, input logic [31:0] detect_edges_high
	, input logic [31:0] detect_edges_rows
	, input logic [31:0] detect_edges_cols
	, input logic [31:0] detect_edges_bits_per_pixel
	, input logic [63:0] detect_edges_sobel_mask_0_3
	, input logic [63:0] detect_edges_sobel_mask_1_3
	, input logic [63:0] detect_edges_sobel_mask_2_3
	, input logic [63:0] detect_edges_sobel_mask_3_3
	, input logic [63:0] detect_edges_sobel_mask_4_3
	, input logic [63:0] detect_edges_sobel_mask_5_3
	, input logic [63:0] detect_edges_sobel_mask_6_3
	, input logic [63:0] detect_edges_sobel_mask_7_3
	, output logic [63:0] detect_edges_avmm_0_rw_address
	, output logic [7:0] detect_edges_avmm_0_rw_byteenable
	, output logic [0:0] detect_edges_avmm_0_rw_read
	, input logic [63:0] detect_edges_avmm_0_rw_readdata
	, output logic [0:0] detect_edges_avmm_0_rw_write
	, output logic [63:0] detect_edges_avmm_0_rw_writedata
	, input logic [0:0] dilation_start
	, output logic [0:0] dilation_busy
	, output logic [0:0] dilation_done
	, input logic [0:0] dilation_stall
	, input logic [63:0] dilation_the_image
	, input logic [63:0] dilation_out_image
	, input logic [31:0] dilation_rows
	, input logic [31:0] dilation_cols
	, output logic [63:0] dilation_avmm_0_rw_address
	, output logic [7:0] dilation_avmm_0_rw_byteenable
	, output logic [0:0] dilation_avmm_0_rw_read
	, input logic [63:0] dilation_avmm_0_rw_readdata
	, output logic [0:0] dilation_avmm_0_rw_write
	, output logic [63:0] dilation_avmm_0_rw_writedata
	, input logic [0:0] get_text_as_binary_start
	, output logic [0:0] get_text_as_binary_busy
	, output logic [0:0] get_text_as_binary_done
	, input logic [0:0] get_text_as_binary_stall
	, input logic [63:0] get_text_as_binary_the_image
	, input logic [63:0] get_text_as_binary_out_image
	, input logic [31:0] get_text_as_binary_rows
	, input logic [31:0] get_text_as_binary_cols
	, output logic [63:0] get_text_as_binary_avmm_0_rw_address
	, output logic [7:0] get_text_as_binary_avmm_0_rw_byteenable
	, output logic [0:0] get_text_as_binary_avmm_0_rw_read
	, input logic [63:0] get_text_as_binary_avmm_0_rw_readdata
	, output logic [0:0] get_text_as_binary_avmm_0_rw_write
	, output logic [63:0] get_text_as_binary_avmm_0_rw_writedata
	, input logic [0:0] invert_start
	, output logic [0:0] invert_busy
	, output logic [0:0] invert_done
	, input logic [0:0] invert_stall
	, input logic [63:0] invert_image
	, input logic [31:0] invert_h
	, input logic [31:0] invert_w
	, output logic [63:0] invert_avmm_0_rw_address
	, output logic [7:0] invert_avmm_0_rw_byteenable
	, output logic [0:0] invert_avmm_0_rw_read
	, input logic [63:0] invert_avmm_0_rw_readdata
	, output logic [0:0] invert_avmm_0_rw_write
	, output logic [63:0] invert_avmm_0_rw_writedata
	, input logic [0:0] label_blobs_start
	, output logic [0:0] label_blobs_busy
	, output logic [0:0] label_blobs_done
	, input logic [0:0] label_blobs_stall
	, output logic [31:0] label_blobs_returndata
	, input logic [63:0] label_blobs_dilated_image
	, input logic [63:0] label_blobs_lab
	, input logic [31:0] label_blobs_rows
	, input logic [31:0] label_blobs_cols
	, output logic [63:0] label_blobs_avmm_0_rw_address
	, output logic [7:0] label_blobs_avmm_0_rw_byteenable
	, output logic [0:0] label_blobs_avmm_0_rw_read
	, input logic [63:0] label_blobs_avmm_0_rw_readdata
	, output logic [0:0] label_blobs_avmm_0_rw_write
	, output logic [63:0] label_blobs_avmm_0_rw_writedata
	, input logic [0:0] sum_pixel_start
	, output logic [0:0] sum_pixel_busy
	, output logic [0:0] sum_pixel_done
	, input logic [0:0] sum_pixel_stall
	, output logic [31:0] sum_pixel_returndata
	, input logic [63:0] sum_pixel_the_image
	, input logic [31:0] sum_pixel_r_s
	, input logic [31:0] sum_pixel_r_e
	, input logic [31:0] sum_pixel_cols
	, output logic [63:0] sum_pixel_avmm_0_rw_address
	, output logic [7:0] sum_pixel_avmm_0_rw_byteenable
	, output logic [0:0] sum_pixel_avmm_0_rw_read
	, input logic [63:0] sum_pixel_avmm_0_rw_readdata
	, output logic [0:0] sum_pixel_avmm_0_rw_write
	, output logic [63:0] sum_pixel_avmm_0_rw_writedata
	);

	logic [0:0] detect_edges_start_reg;
	logic [0:0] detect_edges_busy_reg;
	logic [0:0] detect_edges_done_reg;
	logic [0:0] detect_edges_stall_reg;
	logic [63:0] detect_edges_the_image_reg;
	logic [63:0] detect_edges_out_image_reg;
	logic [31:0] detect_edges_threshold_reg;
	logic [31:0] detect_edges_high_reg;
	logic [31:0] detect_edges_rows_reg;
	logic [31:0] detect_edges_cols_reg;
	logic [31:0] detect_edges_bits_per_pixel_reg;
	logic [63:0] detect_edges_sobel_mask_0_3_reg;
	logic [63:0] detect_edges_sobel_mask_1_3_reg;
	logic [63:0] detect_edges_sobel_mask_2_3_reg;
	logic [63:0] detect_edges_sobel_mask_3_3_reg;
	logic [63:0] detect_edges_sobel_mask_4_3_reg;
	logic [63:0] detect_edges_sobel_mask_5_3_reg;
	logic [63:0] detect_edges_sobel_mask_6_3_reg;
	logic [63:0] detect_edges_sobel_mask_7_3_reg;
	logic [63:0] detect_edges_avmm_0_rw_address_reg;
	logic [7:0] detect_edges_avmm_0_rw_byteenable_reg;
	logic [0:0] detect_edges_avmm_0_rw_read_reg;
	logic [63:0] detect_edges_avmm_0_rw_readdata_reg;
	logic [0:0] detect_edges_avmm_0_rw_write_reg;
	logic [63:0] detect_edges_avmm_0_rw_writedata_reg;
	logic [0:0] dilation_start_reg;
	logic [0:0] dilation_busy_reg;
	logic [0:0] dilation_done_reg;
	logic [0:0] dilation_stall_reg;
	logic [63:0] dilation_the_image_reg;
	logic [63:0] dilation_out_image_reg;
	logic [31:0] dilation_rows_reg;
	logic [31:0] dilation_cols_reg;
	logic [63:0] dilation_avmm_0_rw_address_reg;
	logic [7:0] dilation_avmm_0_rw_byteenable_reg;
	logic [0:0] dilation_avmm_0_rw_read_reg;
	logic [63:0] dilation_avmm_0_rw_readdata_reg;
	logic [0:0] dilation_avmm_0_rw_write_reg;
	logic [63:0] dilation_avmm_0_rw_writedata_reg;
	logic [0:0] get_text_as_binary_start_reg;
	logic [0:0] get_text_as_binary_busy_reg;
	logic [0:0] get_text_as_binary_done_reg;
	logic [0:0] get_text_as_binary_stall_reg;
	logic [63:0] get_text_as_binary_the_image_reg;
	logic [63:0] get_text_as_binary_out_image_reg;
	logic [31:0] get_text_as_binary_rows_reg;
	logic [31:0] get_text_as_binary_cols_reg;
	logic [63:0] get_text_as_binary_avmm_0_rw_address_reg;
	logic [7:0] get_text_as_binary_avmm_0_rw_byteenable_reg;
	logic [0:0] get_text_as_binary_avmm_0_rw_read_reg;
	logic [63:0] get_text_as_binary_avmm_0_rw_readdata_reg;
	logic [0:0] get_text_as_binary_avmm_0_rw_write_reg;
	logic [63:0] get_text_as_binary_avmm_0_rw_writedata_reg;
	logic [0:0] invert_start_reg;
	logic [0:0] invert_busy_reg;
	logic [0:0] invert_done_reg;
	logic [0:0] invert_stall_reg;
	logic [63:0] invert_image_reg;
	logic [31:0] invert_h_reg;
	logic [31:0] invert_w_reg;
	logic [63:0] invert_avmm_0_rw_address_reg;
	logic [7:0] invert_avmm_0_rw_byteenable_reg;
	logic [0:0] invert_avmm_0_rw_read_reg;
	logic [63:0] invert_avmm_0_rw_readdata_reg;
	logic [0:0] invert_avmm_0_rw_write_reg;
	logic [63:0] invert_avmm_0_rw_writedata_reg;
	logic [0:0] label_blobs_start_reg;
	logic [0:0] label_blobs_busy_reg;
	logic [0:0] label_blobs_done_reg;
	logic [0:0] label_blobs_stall_reg;
	logic [31:0] label_blobs_returndata_reg;
	logic [63:0] label_blobs_dilated_image_reg;
	logic [63:0] label_blobs_lab_reg;
	logic [31:0] label_blobs_rows_reg;
	logic [31:0] label_blobs_cols_reg;
	logic [63:0] label_blobs_avmm_0_rw_address_reg;
	logic [7:0] label_blobs_avmm_0_rw_byteenable_reg;
	logic [0:0] label_blobs_avmm_0_rw_read_reg;
	logic [63:0] label_blobs_avmm_0_rw_readdata_reg;
	logic [0:0] label_blobs_avmm_0_rw_write_reg;
	logic [63:0] label_blobs_avmm_0_rw_writedata_reg;
	logic [0:0] sum_pixel_start_reg;
	logic [0:0] sum_pixel_busy_reg;
	logic [0:0] sum_pixel_done_reg;
	logic [0:0] sum_pixel_stall_reg;
	logic [31:0] sum_pixel_returndata_reg;
	logic [63:0] sum_pixel_the_image_reg;
	logic [31:0] sum_pixel_r_s_reg;
	logic [31:0] sum_pixel_r_e_reg;
	logic [31:0] sum_pixel_cols_reg;
	logic [63:0] sum_pixel_avmm_0_rw_address_reg;
	logic [7:0] sum_pixel_avmm_0_rw_byteenable_reg;
	logic [0:0] sum_pixel_avmm_0_rw_read_reg;
	logic [63:0] sum_pixel_avmm_0_rw_readdata_reg;
	logic [0:0] sum_pixel_avmm_0_rw_write_reg;
	logic [63:0] sum_pixel_avmm_0_rw_writedata_reg;


	always @(posedge clock) begin
		detect_edges_start_reg <= detect_edges_start;
		detect_edges_busy <= detect_edges_busy_reg;
		detect_edges_done <= detect_edges_done_reg;
		detect_edges_stall_reg <= detect_edges_stall;
		detect_edges_the_image_reg <= detect_edges_the_image;
		detect_edges_out_image_reg <= detect_edges_out_image;
		detect_edges_threshold_reg <= detect_edges_threshold;
		detect_edges_high_reg <= detect_edges_high;
		detect_edges_rows_reg <= detect_edges_rows;
		detect_edges_cols_reg <= detect_edges_cols;
		detect_edges_bits_per_pixel_reg <= detect_edges_bits_per_pixel;
		detect_edges_sobel_mask_0_3_reg <= detect_edges_sobel_mask_0_3;
		detect_edges_sobel_mask_1_3_reg <= detect_edges_sobel_mask_1_3;
		detect_edges_sobel_mask_2_3_reg <= detect_edges_sobel_mask_2_3;
		detect_edges_sobel_mask_3_3_reg <= detect_edges_sobel_mask_3_3;
		detect_edges_sobel_mask_4_3_reg <= detect_edges_sobel_mask_4_3;
		detect_edges_sobel_mask_5_3_reg <= detect_edges_sobel_mask_5_3;
		detect_edges_sobel_mask_6_3_reg <= detect_edges_sobel_mask_6_3;
		detect_edges_sobel_mask_7_3_reg <= detect_edges_sobel_mask_7_3;
		detect_edges_avmm_0_rw_address <= detect_edges_avmm_0_rw_address_reg;
		detect_edges_avmm_0_rw_byteenable <= detect_edges_avmm_0_rw_byteenable_reg;
		detect_edges_avmm_0_rw_read <= detect_edges_avmm_0_rw_read_reg;
		detect_edges_avmm_0_rw_readdata_reg <= detect_edges_avmm_0_rw_readdata;
		detect_edges_avmm_0_rw_write <= detect_edges_avmm_0_rw_write_reg;
		detect_edges_avmm_0_rw_writedata <= detect_edges_avmm_0_rw_writedata_reg;
	end


	always @(posedge clock) begin
		dilation_start_reg <= dilation_start;
		dilation_busy <= dilation_busy_reg;
		dilation_done <= dilation_done_reg;
		dilation_stall_reg <= dilation_stall;
		dilation_the_image_reg <= dilation_the_image;
		dilation_out_image_reg <= dilation_out_image;
		dilation_rows_reg <= dilation_rows;
		dilation_cols_reg <= dilation_cols;
		dilation_avmm_0_rw_address <= dilation_avmm_0_rw_address_reg;
		dilation_avmm_0_rw_byteenable <= dilation_avmm_0_rw_byteenable_reg;
		dilation_avmm_0_rw_read <= dilation_avmm_0_rw_read_reg;
		dilation_avmm_0_rw_readdata_reg <= dilation_avmm_0_rw_readdata;
		dilation_avmm_0_rw_write <= dilation_avmm_0_rw_write_reg;
		dilation_avmm_0_rw_writedata <= dilation_avmm_0_rw_writedata_reg;
	end


	always @(posedge clock) begin
		get_text_as_binary_start_reg <= get_text_as_binary_start;
		get_text_as_binary_busy <= get_text_as_binary_busy_reg;
		get_text_as_binary_done <= get_text_as_binary_done_reg;
		get_text_as_binary_stall_reg <= get_text_as_binary_stall;
		get_text_as_binary_the_image_reg <= get_text_as_binary_the_image;
		get_text_as_binary_out_image_reg <= get_text_as_binary_out_image;
		get_text_as_binary_rows_reg <= get_text_as_binary_rows;
		get_text_as_binary_cols_reg <= get_text_as_binary_cols;
		get_text_as_binary_avmm_0_rw_address <= get_text_as_binary_avmm_0_rw_address_reg;
		get_text_as_binary_avmm_0_rw_byteenable <= get_text_as_binary_avmm_0_rw_byteenable_reg;
		get_text_as_binary_avmm_0_rw_read <= get_text_as_binary_avmm_0_rw_read_reg;
		get_text_as_binary_avmm_0_rw_readdata_reg <= get_text_as_binary_avmm_0_rw_readdata;
		get_text_as_binary_avmm_0_rw_write <= get_text_as_binary_avmm_0_rw_write_reg;
		get_text_as_binary_avmm_0_rw_writedata <= get_text_as_binary_avmm_0_rw_writedata_reg;
	end


	always @(posedge clock) begin
		invert_start_reg <= invert_start;
		invert_busy <= invert_busy_reg;
		invert_done <= invert_done_reg;
		invert_stall_reg <= invert_stall;
		invert_image_reg <= invert_image;
		invert_h_reg <= invert_h;
		invert_w_reg <= invert_w;
		invert_avmm_0_rw_address <= invert_avmm_0_rw_address_reg;
		invert_avmm_0_rw_byteenable <= invert_avmm_0_rw_byteenable_reg;
		invert_avmm_0_rw_read <= invert_avmm_0_rw_read_reg;
		invert_avmm_0_rw_readdata_reg <= invert_avmm_0_rw_readdata;
		invert_avmm_0_rw_write <= invert_avmm_0_rw_write_reg;
		invert_avmm_0_rw_writedata <= invert_avmm_0_rw_writedata_reg;
	end


	always @(posedge clock) begin
		label_blobs_start_reg <= label_blobs_start;
		label_blobs_busy <= label_blobs_busy_reg;
		label_blobs_done <= label_blobs_done_reg;
		label_blobs_stall_reg <= label_blobs_stall;
		label_blobs_returndata <= label_blobs_returndata_reg;
		label_blobs_dilated_image_reg <= label_blobs_dilated_image;
		label_blobs_lab_reg <= label_blobs_lab;
		label_blobs_rows_reg <= label_blobs_rows;
		label_blobs_cols_reg <= label_blobs_cols;
		label_blobs_avmm_0_rw_address <= label_blobs_avmm_0_rw_address_reg;
		label_blobs_avmm_0_rw_byteenable <= label_blobs_avmm_0_rw_byteenable_reg;
		label_blobs_avmm_0_rw_read <= label_blobs_avmm_0_rw_read_reg;
		label_blobs_avmm_0_rw_readdata_reg <= label_blobs_avmm_0_rw_readdata;
		label_blobs_avmm_0_rw_write <= label_blobs_avmm_0_rw_write_reg;
		label_blobs_avmm_0_rw_writedata <= label_blobs_avmm_0_rw_writedata_reg;
	end


	always @(posedge clock) begin
		sum_pixel_start_reg <= sum_pixel_start;
		sum_pixel_busy <= sum_pixel_busy_reg;
		sum_pixel_done <= sum_pixel_done_reg;
		sum_pixel_stall_reg <= sum_pixel_stall;
		sum_pixel_returndata <= sum_pixel_returndata_reg;
		sum_pixel_the_image_reg <= sum_pixel_the_image;
		sum_pixel_r_s_reg <= sum_pixel_r_s;
		sum_pixel_r_e_reg <= sum_pixel_r_e;
		sum_pixel_cols_reg <= sum_pixel_cols;
		sum_pixel_avmm_0_rw_address <= sum_pixel_avmm_0_rw_address_reg;
		sum_pixel_avmm_0_rw_byteenable <= sum_pixel_avmm_0_rw_byteenable_reg;
		sum_pixel_avmm_0_rw_read <= sum_pixel_avmm_0_rw_read_reg;
		sum_pixel_avmm_0_rw_readdata_reg <= sum_pixel_avmm_0_rw_readdata;
		sum_pixel_avmm_0_rw_write <= sum_pixel_avmm_0_rw_write_reg;
		sum_pixel_avmm_0_rw_writedata <= sum_pixel_avmm_0_rw_writedata_reg;
	end


	reg [2:0] sync_resetn;
	always @(posedge clock or negedge resetn) begin
		if (!resetn) begin
			sync_resetn <= 3'b0;
		end else begin
			sync_resetn <= {sync_resetn[1:0], 1'b1};
		end
	end


	detect_edges detect_edges_inst (
		  .resetn(sync_resetn[2])
		, .clock(clock)
		, .start(detect_edges_start_reg)
		, .busy(detect_edges_busy_reg)
		, .done(detect_edges_done_reg)
		, .stall(detect_edges_stall_reg)
		, .the_image(detect_edges_the_image_reg)
		, .out_image(detect_edges_out_image_reg)
		, .threshold(detect_edges_threshold_reg)
		, .high(detect_edges_high_reg)
		, .rows(detect_edges_rows_reg)
		, .cols(detect_edges_cols_reg)
		, .bits_per_pixel(detect_edges_bits_per_pixel_reg)
		, .sobel_mask_0_3(detect_edges_sobel_mask_0_3_reg)
		, .sobel_mask_1_3(detect_edges_sobel_mask_1_3_reg)
		, .sobel_mask_2_3(detect_edges_sobel_mask_2_3_reg)
		, .sobel_mask_3_3(detect_edges_sobel_mask_3_3_reg)
		, .sobel_mask_4_3(detect_edges_sobel_mask_4_3_reg)
		, .sobel_mask_5_3(detect_edges_sobel_mask_5_3_reg)
		, .sobel_mask_6_3(detect_edges_sobel_mask_6_3_reg)
		, .sobel_mask_7_3(detect_edges_sobel_mask_7_3_reg)
		, .avmm_0_rw_address(detect_edges_avmm_0_rw_address_reg)
		, .avmm_0_rw_byteenable(detect_edges_avmm_0_rw_byteenable_reg)
		, .avmm_0_rw_read(detect_edges_avmm_0_rw_read_reg)
		, .avmm_0_rw_readdata(detect_edges_avmm_0_rw_readdata_reg)
		, .avmm_0_rw_write(detect_edges_avmm_0_rw_write_reg)
		, .avmm_0_rw_writedata(detect_edges_avmm_0_rw_writedata_reg)
	);



	dilation dilation_inst (
		  .resetn(sync_resetn[2])
		, .clock(clock)
		, .start(dilation_start_reg)
		, .busy(dilation_busy_reg)
		, .done(dilation_done_reg)
		, .stall(dilation_stall_reg)
		, .the_image(dilation_the_image_reg)
		, .out_image(dilation_out_image_reg)
		, .rows(dilation_rows_reg)
		, .cols(dilation_cols_reg)
		, .avmm_0_rw_address(dilation_avmm_0_rw_address_reg)
		, .avmm_0_rw_byteenable(dilation_avmm_0_rw_byteenable_reg)
		, .avmm_0_rw_read(dilation_avmm_0_rw_read_reg)
		, .avmm_0_rw_readdata(dilation_avmm_0_rw_readdata_reg)
		, .avmm_0_rw_write(dilation_avmm_0_rw_write_reg)
		, .avmm_0_rw_writedata(dilation_avmm_0_rw_writedata_reg)
	);



	get_text_as_binary get_text_as_binary_inst (
		  .resetn(sync_resetn[2])
		, .clock(clock)
		, .start(get_text_as_binary_start_reg)
		, .busy(get_text_as_binary_busy_reg)
		, .done(get_text_as_binary_done_reg)
		, .stall(get_text_as_binary_stall_reg)
		, .the_image(get_text_as_binary_the_image_reg)
		, .out_image(get_text_as_binary_out_image_reg)
		, .rows(get_text_as_binary_rows_reg)
		, .cols(get_text_as_binary_cols_reg)
		, .avmm_0_rw_address(get_text_as_binary_avmm_0_rw_address_reg)
		, .avmm_0_rw_byteenable(get_text_as_binary_avmm_0_rw_byteenable_reg)
		, .avmm_0_rw_read(get_text_as_binary_avmm_0_rw_read_reg)
		, .avmm_0_rw_readdata(get_text_as_binary_avmm_0_rw_readdata_reg)
		, .avmm_0_rw_write(get_text_as_binary_avmm_0_rw_write_reg)
		, .avmm_0_rw_writedata(get_text_as_binary_avmm_0_rw_writedata_reg)
	);



	invert invert_inst (
		  .resetn(sync_resetn[2])
		, .clock(clock)
		, .start(invert_start_reg)
		, .busy(invert_busy_reg)
		, .done(invert_done_reg)
		, .stall(invert_stall_reg)
		, .image(invert_image_reg)
		, .h(invert_h_reg)
		, .w(invert_w_reg)
		, .avmm_0_rw_address(invert_avmm_0_rw_address_reg)
		, .avmm_0_rw_byteenable(invert_avmm_0_rw_byteenable_reg)
		, .avmm_0_rw_read(invert_avmm_0_rw_read_reg)
		, .avmm_0_rw_readdata(invert_avmm_0_rw_readdata_reg)
		, .avmm_0_rw_write(invert_avmm_0_rw_write_reg)
		, .avmm_0_rw_writedata(invert_avmm_0_rw_writedata_reg)
	);



	label_blobs label_blobs_inst (
		  .resetn(sync_resetn[2])
		, .clock(clock)
		, .start(label_blobs_start_reg)
		, .busy(label_blobs_busy_reg)
		, .done(label_blobs_done_reg)
		, .stall(label_blobs_stall_reg)
		, .returndata(label_blobs_returndata_reg)
		, .dilated_image(label_blobs_dilated_image_reg)
		, .lab(label_blobs_lab_reg)
		, .rows(label_blobs_rows_reg)
		, .cols(label_blobs_cols_reg)
		, .avmm_0_rw_address(label_blobs_avmm_0_rw_address_reg)
		, .avmm_0_rw_byteenable(label_blobs_avmm_0_rw_byteenable_reg)
		, .avmm_0_rw_read(label_blobs_avmm_0_rw_read_reg)
		, .avmm_0_rw_readdata(label_blobs_avmm_0_rw_readdata_reg)
		, .avmm_0_rw_write(label_blobs_avmm_0_rw_write_reg)
		, .avmm_0_rw_writedata(label_blobs_avmm_0_rw_writedata_reg)
	);



	sum_pixel sum_pixel_inst (
		  .resetn(sync_resetn[2])
		, .clock(clock)
		, .start(sum_pixel_start_reg)
		, .busy(sum_pixel_busy_reg)
		, .done(sum_pixel_done_reg)
		, .stall(sum_pixel_stall_reg)
		, .returndata(sum_pixel_returndata_reg)
		, .the_image(sum_pixel_the_image_reg)
		, .r_s(sum_pixel_r_s_reg)
		, .r_e(sum_pixel_r_e_reg)
		, .cols(sum_pixel_cols_reg)
		, .avmm_0_rw_address(sum_pixel_avmm_0_rw_address_reg)
		, .avmm_0_rw_byteenable(sum_pixel_avmm_0_rw_byteenable_reg)
		, .avmm_0_rw_read(sum_pixel_avmm_0_rw_read_reg)
		, .avmm_0_rw_readdata(sum_pixel_avmm_0_rw_readdata_reg)
		, .avmm_0_rw_write(sum_pixel_avmm_0_rw_write_reg)
		, .avmm_0_rw_writedata(sum_pixel_avmm_0_rw_writedata_reg)
	);



endmodule
