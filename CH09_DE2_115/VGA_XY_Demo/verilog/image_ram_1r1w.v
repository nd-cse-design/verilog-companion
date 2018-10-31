module image_ram_1r1w ( 
   input                CLOCK_50,
   input                VGA_CLK,
   input                we,
   input          [2:0] din,
   input          [7:0] xw,
   input          [6:0] yw,
   input          [7:0] xr,
   input          [6:0] yr,  
   output   reg   [2:0] dout
   );
   
   parameter IMAGE_FILE = "blank.mem";
   
   wire [14:0] waddr  = 160*yw + xw;
   wire [14:0] raddr  = 160*yr + xr;
   
   reg [2:0] mem [0:19199];
   initial $readmemh(IMAGE_FILE, mem);

   always @(posedge CLOCK_50)
      if (we)
         mem[waddr] <= din;
   
   always @(posedge VGA_CLK)
      dout <= mem[raddr];
   
endmodule
