`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 03:43:16 PM
// Design Name: 
// Module Name: clkDivider
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


module clkDivider(
    input clk,
    input reset,
    output reg slowclk
    );
    
    reg [23:0] clk_count;
    reg [23:0] max_count = 24'd2;
    always @ (posedge clk or posedge reset) begin
        if(reset) begin
            clk_count <= 1'b0;
            slowclk <= 1'b0;
        end
        else begin
            if (clk_count < (max_count-24'd1)) begin
                clk_count <= clk_count +24'd1;
                if(clk_count<(max_count/2))
                    slowclk <=1'b0;
                else
                    slowclk <=1'b1;     
            end
        end
    end        
endmodule
