
module Mic_to_Line_Out_Demo (
	// Inputs
	input       CLOCK_50,
	input       CLOCK_27,
	input [3:0] KEY,
	input [3:0] SW,
   
	input       AUD_ADCDAT,

	// Bidirectionals
	inout       AUD_BCLK,
	inout       AUD_ADCLRCK,
	inout       AUD_DACLRCK,

	inout       I2C_SDAT,

	// Outputs
	output      AUD_XCK,
	output      AUD_DACDAT,

	output      I2C_SCLK
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

 
/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/
// Internal Wires
wire				   audio_in_available;
wire		[31:0]	left_channel_audio_in;
wire		[31:0]	right_channel_audio_in;
wire				   read_audio_in;

wire				   audio_out_allowed;
wire		[31:0]	left_channel_audio_out;
wire		[31:0]	right_channel_audio_out;
wire				   write_audio_out;
wire     [18:0]   delay;

// Internal Registers


// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/


/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

assign read_audio_in			      = audio_in_available & audio_out_allowed;
assign left_channel_audio_out	   = left_channel_audio_in;
assign right_channel_audio_out	= right_channel_audio_in;
assign write_audio_out			   = audio_in_available & audio_out_allowed;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

Audio_Controller Audio_Controller (
	// Inputs
	.CLOCK_50						(CLOCK_50),
	.reset						   (~KEY[0]),

	.clear_audio_in_memory		(),
	.read_audio_in				   (read_audio_in),
	
	.clear_audio_out_memory		(),
	.left_channel_audio_out		(left_channel_audio_out),
	.right_channel_audio_out	(right_channel_audio_out),
	.write_audio_out			   (write_audio_out),

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
	.I2C_SCLK					(I2C_SCLK),
	.I2C_SDAT					(I2C_SDAT),
	.CLOCK_50					(CLOCK_50),
	.reset						(~KEY[0])
);

endmodule

