module keycode_recognizer_with_buffer (
   input			   clk,
   input          reset_n,
	input			   clear,
	input			   scan_ready,
	input	   [7:0]	scan_code,
	output	[7:0]	keycode,
	output			ext,
	output			make,
	output			got_one
   );
   
   wire  keycode_ready;
   
   keycode_recognizer recognizer (
		.clk					(clk),
      .reset_n          (reset_n),
		.ps2_key_en			(scan_ready),
		.ps2_key_data		(scan_code),
		.keycode				(keycode),
		.ext					(ext),
		.make					(make),
		.keycode_ready		(keycode_ready)
	);
   
   keypress_buffer buffer (
      .clk              (clk          ),
      .en               (keycode_ready),
      .clear            (clear        ),
      .q                (got_one      )
   );
   
endmodule
