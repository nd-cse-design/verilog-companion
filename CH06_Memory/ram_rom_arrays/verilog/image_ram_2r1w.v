module image_ram_2r1w (
   input                wren,  
   input                clk_proc,   
   input                clk_vga,    			
   input          [7:0] x_proc,
   input          [6:0] y_proc,
   input          [7:0] x_vga,
   input          [6:0] y_vga,
   input          [2:0] din,   
   output   reg   [2:0] dout_proc,   
   output   reg   [2:0] dout_vga
   );
   
   parameter IMAGE_FILE = "blank.mem";
   
   wire [14:0] addr_proc = 160*y_proc + x_proc;
   wire [14:0] addr_vga  = 160*y_vga + x_vga;
   
   reg [2:0] ram [0:19199];
   initial $readmemh(IMAGE_FILE, ram);
   
   always @(posedge clk_proc) begin
      if (wren)
         ram[addr_proc] <= din;
         
      dout_proc <= ram[addr_proc];
   end
   
   always @(posedge clk_vga) begin
         dout_vga <= ram[addr_vga];
   end
   
endmodule
