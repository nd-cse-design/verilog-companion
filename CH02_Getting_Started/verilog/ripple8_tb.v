`timescale 1 ns/1 ns

module ripple8_tb();
	reg  [7:0] a;
	reg  [7:0] b;
	wire [7:0] s;
	wire       cout;
	
	ripple8 uut (
		.a(a),
		.b(b),
		.s(s),
		.cout(cout)
	);
	
	initial begin
		    a = 8'hff;  b = 8'h0;
		#50 a = 8'hff;  b = 8'h1;
		#50;
	end

endmodule
