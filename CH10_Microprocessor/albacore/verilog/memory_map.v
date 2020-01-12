module memory_map (
   input                clk,
   input       [15:0]   addr,
   input       [15:0]   din,
   input                we,
   output reg  [15:0]   dout,
   input       [3:0]    io_in,
   output      [3:0]    io_out
   );
   
   wire [15:0] dout_ram;
   reg         we_ram;
   reg         we_io_out;
   
   reg  [3:0]  q_io_out;
   reg  [3:0]  q_io_in;
   
   assign io_out = q_io_out;
   
   always @(posedge clk)
      if (we_io_out)
         q_io_out <= din[3:0];
         
   always @(posedge clk)
      q_io_in <= io_in;
   
   ram32k ram (
      .clk     (clk),
      .addr    (addr[14:0]),
      .din     (din),
      .we      (we_ram),
      .dout    (dout_ram)
   );
   
   always @(*) begin
      we_ram = 0;
      we_io_out = 0;
      if (addr[15] == 0)
         we_ram = we;
      else
         if (addr == 16'h8000)
            we_io_out = we;
   end
   
   always @(*) begin
      if (addr[15] == 0)
         dout = dout_ram;
      else if (addr == 16'h8001)
         dout = {12'h0, q_io_in};
      else
         dout = 16'h0;
   end
   
      
endmodule

