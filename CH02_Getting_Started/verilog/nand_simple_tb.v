module nand_simple_tb ();
	reg	a;
	reg	b;
	wire	y;
	
	nand_expression uut (
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
