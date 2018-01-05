`timescale 1 ns/1 ns

module ripple3_tb();
	reg [2:0] a;
	reg [2:0] b;
	wire [2:0] s;
	wire cout;
	
	ripple3 uut (
		.a(a),
		.b(b),
		.s(s),
		.cout(cout)
	);
	
	initial begin
		    a = 3'd0;  b = 3'd0;
		#10 a = 3'd0;  b = 3'd0;
		#10 a = 3'd1;  b = 3'd0;
		#10 a = 3'd1;  b = 3'd1;
		#10 a = 3'd0;  b = 3'd1;
		#10 a = 3'd3;  b = 3'd4;
		#10 a = 3'd3;  b = 3'd2;
		#10 a = 3'd4;  b = 3'd3;
		#10 a = 3'd4;  b = 3'd5;
		#10;
	end

endmodule
