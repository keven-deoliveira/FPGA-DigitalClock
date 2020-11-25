`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 03:31:22 PM
// Design Name: 
// Module Name: SET_ALARAM
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


module SET_ALARAM(
    input PB,
    input [1:0] SWITCH,
    input clk,
    input reset,
    input [4:0] H_OUT,
    input [5:0] M_OUT,
    input [5:0] S_OUT,
    output reg OUT_LED
    );
    
   wire [4:0] H_ALARM;
   wire [5:0] M_ALARM;
   wire [5:0] S_ALARM;
   
    SET_TIME M1 (PB,SWITCH,H_ALARM,M_ALARM,S_ALARM,clk,reset);
    
    always@(posedge clk or posedge reset)begin
    if(reset) OUT_LED <= 1'b0;
    else begin 
    if(H_ALARM == H_OUT && M_ALARM == M_OUT && S_ALARM == S_OUT) 
    OUT_LED <= 1'b1;
    else 
   OUT_LED <=1'b0;
    end 
    end 
    
   
endmodule
