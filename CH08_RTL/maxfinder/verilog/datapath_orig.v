module datapath_orig (
   input clk,
   input reset,
   input en_mar,
   input en_mdr,
   input en_max,
   input sel_mar,
   input sel_max,
   input [3:0] din,
   output reg [3:0] mar,
   output reg [3:0] max,
   output mdr_gt_max,
   output mar_eq_maxaddr
   );
   

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/
   parameter MAXADDR = 4'hf;
 

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
   wire [3:0] d_mar;
   wire [3:0] d_mdr;
   wire [3:0] d_max;

// Internal Registers
   reg [3:0] mdr;

/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/
 
   always @(posedge clk)
      if (reset)
         mar <= 0;
      else if (en_mar)
         mar <= d_mar;
 
   always @(posedge clk)
      if (reset)
         mdr <= 0;
      else if (en_mdr)
         mdr <= d_mdr;
 
   always @(posedge clk)
      if (reset)
         max <= 0;
      else if (en_max)
         max <= d_max;


/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
 
   assign d_mar =
      sel_mar == 0 ? 0 :
      mar + 1;
      
   assign d_max =
      sel_max == 0 ? 0 :
      mdr;
      
   assign d_mdr            = din;
   assign mdr_gt_max       = mdr > max;
   assign mar_eq_maxaddr   = mar == MAXADDR;


/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule
