module vga_adapter_mux (
   input       s,
   input [9:0] VGA_R_0,
   input [9:0] VGA_G_0,
   input [9:0] VGA_B_0,
   input       VGA_HS_0,
   input       VGA_VS_0,
   input       VGA_BLANK_0,
   input       VGA_SYNC_0,
   input       VGA_CLK_0,

   input [9:0] VGA_R_1,
   input [9:0] VGA_G_1,
   input [9:0] VGA_B_1,
   input       VGA_HS_1,
   input       VGA_VS_1,
   input       VGA_BLANK_1,
   input       VGA_SYNC_1,
   input       VGA_CLK_1, 
 
   output reg [9:0] VGA_R,
   output reg [9:0] VGA_G,	
   output reg [9:0] VGA_B,
   output reg       VGA_HS,
   output reg       VGA_VS,		
   output reg       VGA_BLANK,
   output reg       VGA_SYNC,
   output reg       VGA_CLK
   );
   
   always @(*)
      if (s) begin
         VGA_R     = VGA_R_1;		   		
         VGA_G     = VGA_G_1;		   		
         VGA_B     = VGA_B_1;		      		
         VGA_HS    = VGA_HS_1;		   
         VGA_VS    = VGA_VS_1;		   
         VGA_BLANK = VGA_BLANK_1;	   
         VGA_SYNC  = VGA_SYNC_1;	   
         VGA_CLK   = VGA_CLK_1;		   
      end
      else begin
         VGA_R     = VGA_R_0;		   		
         VGA_G     = VGA_G_0;		   		
         VGA_B     = VGA_B_0;		      		
         VGA_HS    = VGA_HS_0;		   
         VGA_VS    = VGA_VS_0;		   
         VGA_BLANK = VGA_BLANK_0;	   
         VGA_SYNC  = VGA_SYNC_0;	   
         VGA_CLK   = VGA_CLK_0;		   
      end
      
endmodule
