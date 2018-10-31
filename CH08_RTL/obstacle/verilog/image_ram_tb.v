module image_ram_tb ();
   reg            wren_a;  
   reg            clk;   
   reg   [7:0]    app_x;
   reg   [6:0]    app_y;
   reg   [7:0]    vga_x;
   reg   [6:0]    vga_y;
   reg   [2:0]    data_a;   
   wire  [2:0]    q_a;   
   wire  [2:0]    q_b;
      
   image_ram uut (
      .wren_a  (wren_a),  
      .clock0  (clk),   
      .clock1  (clk),    			
      .app_x   (app_x ),
      .app_y   (app_y ),
      .vga_x   (vga_x ),
      .vga_y   (vga_y ),
      .data_a  (data_a),   
      .q_a     (q_a   ),   
      .q_b     (q_b   )
   );
   defparam uut.IMAGE_FILE = "tiny.txt";
   
   always #5 clk = ~clk;
   
   initial begin
      clk = 0;  wren_a = 0;  app_x = 0;  app_y = 0;  vga_x = 0;  vga_y = 0;  data_a = 0;
      #10 wren_a = 1;
      #10 wren_a = 0;
      #20 $stop;
   end
 
endmodule 
   