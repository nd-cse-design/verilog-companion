module unsigned_comparator (
	input [3:0] x, y,
	output reg gt, lt, eq
	); 

	always @(x, y)
		if (x < y) begin
			gt = 0;  lt = 1;  eq = 0;
		end
		else if (x > y) begin
			gt = 1;  lt = 0;  eq = 0;
		end
		else begin
			gt = 0;  lt = 0;  eq = 1;
		end

endmodule
