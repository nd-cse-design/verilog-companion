module zero_check (
	input [2:0]	a,
	output		f
	);
	
	assign f = ~a[2] & ~a[1] & ~a[0];
	
endmodule
