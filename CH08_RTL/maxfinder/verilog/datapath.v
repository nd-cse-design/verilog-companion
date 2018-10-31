module datapath (
   input             clk,
   input             en_addr,
   input             en_max,
   input             s_addr,
   input             s_max,
   input       [3:0] din,
   output reg  [3:0] addr,
   output reg  [3:0] max,
   output            din_gt_max,
   output            addr_eq_last
   );
   

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/
   parameter LASTADDR = 4'hf;
 

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires

// Internal Registers

/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/
 
   always @(posedge clk)
      if (en_addr)
         if (s_addr)
            addr <= addr + 1;
         else
            addr <= 0;
 
   always @(posedge clk) 
      if (en_max)
         if (s_max)
            max <= din;
         else
            max <= 0;


/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/
   assign din_gt_max    = din > max;
   assign addr_eq_last  = addr == LASTADDR;


/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule
