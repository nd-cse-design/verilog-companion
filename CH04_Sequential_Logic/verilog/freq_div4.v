module freq_div4 (
   input clkin,
   output clkout
   );
   
   reg [1:0] count = 0;
   
   assign clkout = count[1];
   
   always @(posedge clkin)
      count <= count + 1;
      
endmodule
