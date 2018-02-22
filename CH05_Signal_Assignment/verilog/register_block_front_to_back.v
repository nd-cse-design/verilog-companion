module register_block_front_to_back (
	input D, CLK,
	output reg Q);
	
	reg R1, R2;
	
	always @(posedge CLK)
		begin
			R1 = D;
			R2 = R1;
			Q  = R2;
		end

endmodule
