module my_dlatch (
	input 	d,
	input 	en,
	output	q);
	
	wire s;
	wire r;
	wire qb;
	
	assign qb = ~(q | s);
	assign q  = ~(qb | r);
	assign s  = en & d;
	assign r  = en & ~d;
	
endmodule
