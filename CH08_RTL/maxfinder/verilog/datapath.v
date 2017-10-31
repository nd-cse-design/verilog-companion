module datapath (
   input             clk,
   input             en_mar,
   input             en_mdr,
   input             en_max,
   input             s_mar,
   input             s_max,
   input       [3:0] din,
   output reg  [3:0] mar,
   output reg  [3:0] max,
   output            mdr_gt_max,
   output            mar_eq_maxaddr
   );
   

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/
   parameter MAXADDR = 4'hf;
 

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires


// Internal Registers
   reg [3:0] mdr;

/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/
 
   always @(posedge clk)
      if (en_mar)
         if (s_mar)
            mar <= mar + 1;
         else
            mar <= 0;
 
   always @(posedge clk)
      if (en_mdr)
         mdr <= din;
 
   always @(posedge clk) 
      if (en_max)
         if (s_max)
            max <= mdr;
         else
            max <= 0;


/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
   assign mdr_gt_max       = mdr > max;
   assign mar_eq_maxaddr   = mar == MAXADDR;


/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule