module Square_Wave_Gen_Demo (
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

   wire				   audio_out_allowed;
   wire     [31:0]   osc_out;   

   square_wave_osc osc (
      .CLOCK_50						(CLOCK_50),
      .reset						   (~KEY[0]),
      .out                       (osc_out)
   );

   Audio_Controller Audio_Controller (
      // Inputs
      .CLOCK_50						(CLOCK_50),
      .reset						   (~KEY[0]),
      .left_channel_audio_out		(osc_out),
      .right_channel_audio_out	(osc_out),
      .write_audio_out			   (audio_out_allowed),
      .AUD_ADCDAT					   (AUD_ADCDAT),
      // Bidirectionals
      .AUD_BCLK					   (AUD_BCLK),
      .AUD_ADCLRCK				   (AUD_ADCLRCK),
      .AUD_DACLRCK				   (AUD_DACLRCK),
      // Outputs
      .audio_out_allowed			(audio_out_allowed),
      .AUD_XCK					      (AUD_XCK),
      .AUD_DACDAT					   (AUD_DACDAT),
   );
   
   avconf avc (
      .I2C_SCLK					(I2C_SCLK),
      .I2C_SDAT					(I2C_SDAT),
      .CLOCK_50					(CLOCK_50),
      .reset						(~KEY[0])
   );

endmodule

