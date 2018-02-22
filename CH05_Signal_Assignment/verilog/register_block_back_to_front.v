module register_block_back_to_front (
	input D, CLK,
	output reg Q);
	
	reg R1, R2;
	
	always @(posedge CLK)
		begin
			Q  = R2;
			R2 = R1;
			R1 = D;
		end
      
endmodule
