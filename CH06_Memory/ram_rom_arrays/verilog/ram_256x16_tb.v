`timescale 1ns/1ns

module ram_256x16_tb ();
	reg 	[7:0] 	read_addr;
	reg 	[7:0] 	write_addr;
	reg 	[15:0] 	din;
	reg 				clk;
	reg 				we;
	wire	[15:0]	dout;
	
	ram_256x16 uut (
		.read_addr	(read_addr),
		.write_addr	(write_addr),
		.din			(din),
		.clk			(clk),
		.we			(we),
		.dout			(dout)
	);
	
	always
		#5 clk = ~clk;
	
	initial begin
		clk = 0;  
		we = 1;  write_addr = 0;  din = 16'haaaa;  read_addr = 0;
		#10 read_addr = 8'h0;  write_addr = 8'h1;  din = 16'hbbbb;
		#10 read_addr = 8'h1;  write_addr = 8'h2;  din = 16'hcccc;
		#10 read_addr = 8'h2;  write_addr = 8'h3;  din = 16'hdddd;
		#10 $stop;
	end
	
endmodule
