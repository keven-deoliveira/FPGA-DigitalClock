`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 03:00:57 PM
// Design Name: 
// Module Name: SET_TIME_TB
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


module SET_TIME_TB;
    reg PB;
    reg [1:0] SWITCH;
    wire  [4:0] H_IN;
    wire  [5:0] M_IN;
    wire  [5:0] S_IN;
    reg clk;
    reg reset;
    
    SET_TIME M1(PB,SWITCH,H_IN,M_IN,S_IN,clk,reset);
    always #10 clk = ~clk;
    
    initial begin
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
