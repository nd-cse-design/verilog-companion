module numbers_tb();
	reg [7:0] n;
	
	initial begin
		    n = 8'b10101010;
		#10 n = 8'b1010_1011;
		#10 n = 8'hcd;
		#10 n = 8'd33;
		#10 n = -8'd1;
		#10 n = "a";
		#10 n = "A";
		#10;
	end
	
endmodule
