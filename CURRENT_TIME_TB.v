`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 02:08:31 PM
// Design Name: 
// Module Name: CURRENT_TIME_TB
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


module CURRENT_TIME_TB;
    reg [4:0] H_IN;
    reg [5:0] M_IN;
    reg [5:0] S_IN;
    wire  [4:0] H_OUT;
    wire  [5:0] M_OUT;
    wire  [5:0] S_OUT;
    reg slowclk;
    reg reset;
    
    CURRENT_TIME M1 (H_IN,M_IN,S_IN,H_OUT,M_OUT,S_OUT,slowclk,reset);
    
    initial begin 
    H_IN = 0;  S_IN = 0;  M_IN = 0; slowclk = 0; reset = 1; 
    #100;
    reset = 0;
    #550;
    H_IN =9;  S_IN = 22;  M_IN = 16; reset = 1;
    #100;
    reset=0;
    #550;
    $stop;
    
    end
    
    always #0.5 slowclk = ~slowclk;
    
    
    
    
    
    
    
    
    
    
    
endmodule
