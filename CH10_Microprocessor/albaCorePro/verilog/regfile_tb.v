`timescale 1ns/1ns
module regfile_tb ();
   reg             clk;
   reg [15:0]      din;
   reg [3:0]       waddr;
   reg [3:0]       raddra;   
   reg [3:0]       raddrb;
   reg             we;
   wire [15:0]     douta;   
   wire [15:0]     doutb;

   regfile uut (
      .clk     (clk),
      .din     (din),
      .waddr   (waddr),
      .raddra  (raddra),   
      .raddrb  (raddrb),
      .we      (we),
      .douta   (douta),   
      .doutb   (doutb)
   );
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;  din = 16'ha;  waddr = 4'h0;  raddra = 4'h0;  raddrb = 4'h0;  we = 1;
      #10 waddr = 4'h1;  din = 16'hb;
      #10 waddr = 4'h2;  din = 16'hc;
      #10 waddr = 4'h3;  din = 16'hd;
      #10 raddra = 4'h0;  raddrb = 4'h0;  we = 0;
      #10 raddra = 4'h1;  raddrb = 4'h1;  we = 0;
      #10 raddra = 4'h2;  raddrb = 4'h2;  we = 0;
      #10 raddra = 4'h3;  raddrb = 4'h3;  we = 0;
      #10 $stop;
   end

endmodule
