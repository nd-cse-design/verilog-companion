module my_dlatch_tb ();
	reg	d;
	reg	en;
	wire	q;
	
	my_dlatch uut (
		.d		(d),
		.en	(en),
		.q		(q)
	);
	
	initial begin
		d = 0;  en = 0;
		#10 en = 1;
		#10 en = 0;
		#10 d = 1;
		#10 en = 1;
		#10 en = 0;
		#10 d = 0;
		#10 $stop;
	end
	
endmodule
