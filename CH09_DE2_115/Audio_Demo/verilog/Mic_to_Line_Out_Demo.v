module Mic_to_Line_Out_Demo (
	input       CLOCK_50,
	input [0:0] KEY,
	input       AUD_ADCDAT,
	inout       AUD_BCLK,
	inout       AUD_ADCLRCK,
	inout       AUD_DACLRCK,
	inout       I2C_SDAT,
	output      AUD_XCK,
	output      AUD_DACDAT,
	output      I2C_SCLK
   );
   
   wire				   audio_in_available;
   wire		[31:0]	left_channel_audio_in;
   wire		[31:0]	right_channel_audio_in;
   wire				   audio_out_allowed;
   wire		[31:0]	left_channel_audio_out;
   wire		[31:0]	right_channel_audio_out;
   
   reg32 audio_buffer_left (
      .clk                       (CLOCK_50),
      .en                        (audio_in_available),
      .d                         (left_channel_audio_in),
      .q                         (left_channel_audio_out)
   );
   
   reg32 audio_buffer_right (
      .clk                       (CLOCK_50),
      .en                        (audio_in_available),
      .d                         (right_channel_audio_in),
      .q                         (right_channel_audio_out)
   );
   
   Audio_Controller Audio_Controller (
      // Inputs
      .CLOCK_50						(CLOCK_50),
      .reset						   (~KEY[0]),
      .read_audio_in				   (audio_in_available),
      .left_channel_audio_out		(left_channel_audio_out),
      .right_channel_audio_out	(right_channel_audio_out),
      .write_audio_out			   (audio_out_allowed),
      .AUD_ADCDAT					   (AUD_ADCDAT),
      // Bidirectionals
      .AUD_BCLK					   (AUD_BCLK),
      .AUD_ADCLRCK				   (AUD_ADCLRCK),
      .AUD_DACLRCK				   (AUD_DACLRCK),
      // Outputs
      .audio_in_available			(audio_in_available),
      .left_channel_audio_in		(left_channel_audio_in),
      .right_channel_audio_in		(right_channel_audio_in),
      .audio_out_allowed			(audio_out_allowed),
      .AUD_XCK					      (AUD_XCK),
      .AUD_DACDAT					   (AUD_DACDAT),
   
   );
   
   avconf #(.USE_MIC_INPUT(1)) avc (
      .I2C_SCLK					   (I2C_SCLK),
      .I2C_SDAT					   (I2C_SDAT),
      .CLOCK_50					   (CLOCK_50),
      .reset						   (~KEY[0])
   );

endmodule

