module demux4_verbose (
   input       d,
   input [1:0] s,
   output reg  y0,
   output reg  y1,
   output reg  y2,
   output reg  y3
   );
   
   always @(d, s) begin
      case (s)
         0: begin y0 = d;  y1 = 0;  y2 = 0;  y3 = 0; end
         1: begin y0 = 0;  y1 = d;  y2 = 0;  y3 = 0; end
         2: begin y0 = 0;  y1 = 0;  y2 = d;  y3 = 0; end
         3: begin y0 = 0;  y1 = 0;  y2 = 0;  y3 = d; end
      endcase
   end
      
endmodule
   