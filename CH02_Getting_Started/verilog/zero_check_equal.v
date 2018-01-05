module zero_check_equal(
	input [2:0]	a,
	output		f
	);
	
	assign f = a == 3'b0;
	
endmodule
