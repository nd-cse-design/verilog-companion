module square_wave_generator_v2 (
   input clk,
   output reg q
   );
   
   parameter HALF_PERIOD = 3'd5;

   initial q = 0;
   reg [3:0] count = 0;
   
   always @(posedge clk) begin
      if (count == HALF_PERIOD) begin
         count <= 0;
         q <= ~q;
      end
      else begin
         count <= count + 1;
      end
   end
   
endmodule
