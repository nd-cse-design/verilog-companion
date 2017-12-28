module nand_tb ();
	reg	a;
	reg	b;
	wire	y_simple;
	wire	y_wired;
	wire	y_wired_shortcut;
	wire 	y_structural;
	
	nand_simple uut_simple (
		.a	(a),
		.b	(b),
		.y	(y_simple)
	);
	
	nand_wired uut_wired (
		.a	(a),
		.b	(b),
		.y	(y_wired)
	);
	
	nand_wired_shortcut uut_wired_shortcut (
		.a	(a),
		.b	(b),
		.y	(y_wired_shortcut)
	);
	
	nand_structural uut_structural (
		.a	(a),
		.b	(b),
		.y	(y_structural)
	);
	
	initial begin
		    a = 0;  b = 0;
		#10 a = 0;  b = 1;
		#10 a = 1;  b = 0;
		#10 a = 1;  b = 1;
		#10;
	end

endmodule
