module shift_left (
   input  [7:0] a,
   output [7:0] y
   );
   
   assign y = {a[5:0], 2'b00};
   
endmodule
