module cmos_inverter_tb ();
	reg 	in;
	wire	out;
	
	cmos_inverter uut (
		.inv_in	(in),
		.inv_out	(out)
	);
	
	initial begin
		in = 0;
		#10 in = 1;
		#10 in = 0;
		#10;
	end
	
endmodule
