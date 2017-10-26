module debounce_demo (
   input          CLOCK_50,
   input    [0:0] KEY,
   output   [6:0] HEX0,
   output   [6:0] HEX1
   );
   
   wire       key_debounced;
   wire [3:0] bounce_count;
   wire [3:0] debounce_count;
   
   debounce (
      .CLOCK_50   (CLOCK_50),
      .in         (KEY[0]),
      .out        (key_debounced)
   );
   
   count4 bounce_counter (
      .clk        (~KEY[0]),
      .q          (bounce_count)
   );
   
   count4 debounce_counter (
      .clk        (~key_debounced),
      .q          (debounce_count)
   );
   
   hexdigit bounce_display (
      .in         (bounce_count),
      .out        (HEX0)
   );
   
   hexdigit debounce_display (
      .in         (debounce_count),
      .out        (HEX1)
   );
   
endmodule
