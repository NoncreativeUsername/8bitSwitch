`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gunnar Pederson
// 
// Create Date: 05/27/2021 10:40:25 PM
// Design Name: 
// Module Name: shifter_8bit_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module shifter_8bit_tb;

//inputs
reg [1:0] btn;
reg [11:0] sw;

//output
wire [7:0] led;

//circuit under test
shifter_8bit CUT (.btn(btn), .sw(sw), .led(led));

integer k;


initial
begin
    btn[0] = 0;
    btn[1] = 0;
    
    sw[11] = 0;
    sw[10] = 0;
    sw[9] = 0;
    sw[8] = 1;
    
    for (k=0; k<255; k=k+1)
        #20 sw[7:0] = k;
end

endmodule
