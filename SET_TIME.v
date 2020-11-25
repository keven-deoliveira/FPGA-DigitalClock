`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 02:42:10 PM
// Design Name: 
// Module Name: SET_TIME
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


module SET_TIME(
    input PB,
    input [1:0] SWITCH,
    output reg [4:0] H_IN,
    output reg [5:0] M_IN,
    output reg [5:0] S_IN,
    input clk,
    input reset
    );
    
    always@(posedge clk or posedge reset)begin
    if(reset)begin
    H_IN <=0; M_IN <= 0; S_IN <= 0;
    end
    
    else begin 
    if(PB)begin 
    case(SWITCH) 
    2'b00: H_IN <= H_IN +1;
    2'b01: M_IN <= M_IN +1;
    2'b10: S_IN <= S_IN +1;
    default: begin H_IN <= H_IN; M_IN <= M_IN; S_IN <= S_IN; end
    endcase
    end 
    end
    end
    
   
    
    
endmodule
