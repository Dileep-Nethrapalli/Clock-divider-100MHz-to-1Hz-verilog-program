`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company:  RUAS
// Engineer: Dileep Nethrapalli
// 
// Create Date: 26.09.2021 15:00:05
// Design Name: 
// Module Name: Clock_divider_100MHz_to_1Hz_tb
// Project Name: 
// Target Devices: Device Independent 
// Tool Versions: 
// Description: 
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Clock_divider_100MHz_to_1Hz_tb(  );

  reg  enable_tb, clear_n_tb, clock_tb;

  wire clock_1Hz_tb;
  wire [25:0] count_tb;


  Clock_divider_100MHz_to_1Hz clk_1Hz_DUT(
       clock_1Hz_tb, enable_tb, clock_tb, clear_n_tb);
  
  
  assign count_tb = clk_1Hz_DUT.count_50000000;
  
  initial   clock_tb = 1'b1;
  always #5 clock_tb = ~clock_tb;
  
  initial
    begin    
          clear_n_tb = 0; 
      #97 clear_n_tb = 1; enable_tb = 1; 
      #2000000000 $finish;
    end
    
endmodule
