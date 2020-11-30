`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 03:48:04 PM
// Design Name: 
// Module Name: debouncePB
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


module debouncePB(
    input PB,
    input clk,
    input reset,
    output reg clean
    );
    
    reg output_exist;
    reg [19:0] deb_count;
    reg [19:0] max_count = 20'd1000000;
    
    always @ (posedge clk or posedge reset) begin
        if(reset) begin
            clean <=1'b0;
            output_exist <= 1'b0;
            deb_count <= 1'b0;
        end
        else begin
            if(PB) begin
                if(~output_exist) begin
                    if(deb_count < max_count)
                        deb_count <= deb_count + 20'b1;
                    else begin
                        clean <= 1'b1;
                        output_exist <= 1'b1;
                        deb_count <= 1'b0;
                    end
                  end
                  else
                    clean <= 1'b0;
                  end
                else begin
                    clean <= 1'b0;
                    output_exist <=1'b0;
                    deb_count <= 1'b0;
                  end
                end
              end              
endmodule
