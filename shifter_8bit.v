`timescale 1ns / 1ps

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
