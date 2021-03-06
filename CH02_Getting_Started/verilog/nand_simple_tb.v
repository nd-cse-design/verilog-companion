`timescale 1ns/1ns
module nand_simple_tb ();
	reg	a;
	reg	b;
	wire	y;
	
	nand_simple uut (
		.a	(a),
		.b	(b),
		.y	(y)
	);
	
	initial begin
		    a = 0;  b = 0;
		#10 a = 0;  b = 1;
		#10 a = 1;  b = 0;
		#10 a = 1;  b = 1;
		#10;
	end

endmodule
