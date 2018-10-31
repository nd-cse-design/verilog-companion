`timescale 1ns/1ns

module processor_tb ();
   reg            clk;
   reg            reset;
   wire	[7:0]		x;
   wire	[6:0]		y;
   wire	[2:0]		plot_color;
   wire           plot;
   wire  [2:0]    image_color;
   wire  [2:0]    vga_color;
   
   processor processor (
		.clk		      (clk),
		.reset	      (reset),
		.x		         (x),
		.y		         (y),
		.plot_color	   (plot_color),
		.plot		      (plot),
      .image_color   (image_color)
	);
   
   image_ram image_ram (
      .wren          (plot),  
      .clk_proc      (clk),   
      .clk_vga       (1'b0),    			
      .x_proc        (x),
      .y_proc        (y),
      .x_vga         (8'b0),
      .y_vga         (7'b0),
      .din           (plot_color),   
      .dout_proc     (image_color),   
      .dout_vga      (vga_color)
   );
   defparam image_ram.IMAGE_FILE = "tiny_obstacle.mem";
	
	always #5 clk = ~clk;
	
	initial begin
		clk = 0;  reset = 1;
		#10 reset = 0;
		#10000 $stop;
	end
	
endmodule
