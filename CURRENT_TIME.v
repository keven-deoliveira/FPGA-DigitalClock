`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 02:07:38 PM
// Design Name: 
// Module Name: CURRENT_TIME
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


module CURRENT_TIME(
    input [4:0] H_IN,
    input [5:0] M_IN,
    input [5:0] S_IN,
    output reg [4:0] H_OUT,
    output reg [5:0] M_OUT,
    output reg [5:0] S_OUT,
    input slowclk,
    input reset
    );
    
    always@(posedge slowclk or posedge reset) begin
    if(reset) begin 
    H_OUT <= H_IN; M_OUT <= M_IN; S_OUT <= S_IN;
    end 
    
    else begin 
    if (S_OUT < 59) S_OUT <= S_OUT + 1;
    else begin 
        S_OUT <= 0; 
        if (M_OUT < 59) M_OUT <= M_OUT + 1;
        else begin
            M_OUT <= 0; 
            if (H_OUT < 23) H_OUT <= H_OUT +1;
            else H_OUT <= 0;
        end
    end
    end
    end
    
endmodule
