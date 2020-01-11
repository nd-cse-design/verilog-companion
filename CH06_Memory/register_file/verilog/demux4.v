module demux4 (
	input [1:0] s,
	input en,
	output reg [0:3] y
	);
	
	always @(*) begin
		y = 4'b0000;
		if (en) begin
			case (s)
				0: y = 4'b1000;
				1: y = 4'b0100;
				2: y = 4'b0010;
				3: y = 4'b0001;
			endcase
		end
	end
		
endmodule
