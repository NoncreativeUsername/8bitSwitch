`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gunnar Pederson
// 
// Create Date: 05/26/2021 04:11:28 PM
// Design Name: 
// Module Name: shifter_8bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: shift or rotate 8 switch inputs to 8 leds, sw[9:8] : shift ammount, sw[10]: direction, sw[11]: rotate, btn[0]: fill bit
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module shifter_8bit(
    input [11:0] sw,
    input [1:0] btn,
    output reg [7:0] led
    );

always @(sw, btn[0]) begin
    //rotate false
    if (sw[11] == 0) begin
        if (sw[9:8] == 2'b01)         //shift 1
            led <= (sw[10] == 0) ? {sw[6:0], btn[0]} : {btn[0], sw[7:1]};
        else if (sw[9:8] == 2'b10)   //shift 2
            led <= (sw[10] == 0) ? {sw[5:0], btn[0], btn[0]} : {btn[0], btn[0], sw[7:2]};
        else if (sw[9:8] == 2'b11)   //shift 3
            led <= (sw[10] == 0) ? {sw[4:0], btn[0], btn[0], btn[0]} : {btn[0], btn[0], btn[0], sw[7:3]};
        else
            led <= sw;               //no shift
    end
        
    //rotate true
    else begin
        if (sw[9:8] == 2'b01)         //rotate 1
            led <= (sw[10] == 0) ? {sw[6:0], sw[7]} : {sw[0], sw[7:1]};
        else if (sw[9:8] == 2'b10)   //rotate 2
            led <= (sw[10] == 0) ? {sw[5:0], sw[7:6]} : {sw[1:0], sw[7:2]};
        else if (sw[9:8] == 2'b11)   //rotate 3
            led <= (sw[10] == 0) ? {sw[4:0], sw[7:5]} : {sw[2:0], sw[7:3]};
        else
            led <= sw;               //no rotate
    end
end
    
endmodule
