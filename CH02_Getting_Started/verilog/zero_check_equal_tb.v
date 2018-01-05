module zero_check_equal_tb();
	reg [2:0]	a;
	wire			f;

	zero_check_equal uut(a, f);
	
	initial begin
	    a = 3'b000;		// 3-bit, binary value
	#10 a = 3'b001;
	#10 a = 3'b010;
	#10 a = 3'b011;
	#10 a = 3'b100;
	#10 a = 3'b101;
	#10 a = 3'b110;
	#10 a = 3'b111;
	#10;
	end

endmodule
