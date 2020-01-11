module demux4 (
   input       d,
   input [1:0] s,
   output reg  y0,
   output reg  y1,
   output reg  y2,
   output reg  y3
   );
   
   always @(*) begin
      y0 = 0;  y1 = 0;  y2 = 0;  y3 = 0;
      case (s)
         0: y0 = d;
         1: y1 = d;
         2: y2 = d;
         3: y3 = d;
      endcase
   end
      
endmodule
   