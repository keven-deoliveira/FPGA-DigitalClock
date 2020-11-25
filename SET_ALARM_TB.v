`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 03:46:47 PM
// Design Name: 
// Module Name: SET_ALARM_TB
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


module SET_ALARM_TB;
    reg PB;
    reg [1:0] SWITCH;
    reg clk;
    reg reset;
    reg [4:0] H_OUT;
    reg [5:0] M_OUT;
    reg [5:0] S_OUT;
    wire  OUT_LED;
    
    
    SET_ALARAM M1(PB,SWITCH,clk,reset,H_OUT,M_OUT,S_OUT,OUT_LED);
    always #10 clk = ~clk;
    
    
    initial begin
    H_OUT=5'd9;
    M_OUT=5'd4;
    S_OUT=5'd6;
    PB= 1'b0;
    SWITCH = 2'b0;
    clk =0;
    reset =1;
    #100;
    reset = 0;
    #10;
     PB= 1'b1;
    #15;
     PB= 1'b0;
     #15;
     PB= 1'b1;
    #15;
     PB= 1'b0;
     #15;
     PB= 1'b1;
    #15;
     PB= 1'b0;
     #15;
     PB= 1'b1;
    #15;
     PB= 1'b0;
     #15;
     PB= 1'b1;
    #15;
     PB= 1'b0;
     #15;
     PB= 1'b1;
    #15;
     PB= 1'b0;
     #15;
     PB= 1'b1;
    #15;
     PB= 1'b0;
     #15;
     PB= 1'b1;
    #15;
     PB= 1'b0;
     #15;
     PB= 1'b1;
    #15;
     PB= 1'b0;
     #15
     SWITCH = 2'b1; PB= 1'b1;
     #15;
     PB= 1'b0;
    #15;
     PB= 1'b1;
     #15;
     PB= 1'b0;
     #15;
      PB= 1'b1;
    #15;
     PB= 1'b0;
     #15;
     PB= 1'b1;
     #15;
     PB= 1'b0;
     #15;
     SWITCH = 2'b10; PB = 1'b1;
     #15;
     PB = 1'b0;
     #15;
     PB = 1'b1;
     #15;
     PB = 1'b0;
     #15
     PB = 1'b1;
     #15;
     PB = 1'b0;
     #15;
     PB = 1'b1;
     #15;
     PB = 1'b0;
    #15;
    PB = 1'b1;
     #15;
     PB = 1'b0;
     #15;
     PB = 1'b1;
     #15;
     PB = 1'b0;
    #15;
    $stop;
    end 
    
    
endmodule

    
    
  
