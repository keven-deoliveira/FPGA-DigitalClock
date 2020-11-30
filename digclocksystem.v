`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 02:41:02 PM
// Design Name: 
// Module Name: digclocksystem
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


module digclocksystem(
    input time_format, // 0 = 24hr, 1 = 12hr
    input [1:0] mode, // current time, set time, set alarm
    input [1:0] SWITCH, // for setting time
    input PB, // push button
    input reset, // reset button
    input clk,
    output reg [1:0] H_out1_f,
    output reg [3:0] H_out0_f,
    output reg [3:0] M_out1_f,
    output reg [3:0] M_out0_f,
    output reg [3:0] S_out1_f,
    output reg [3:0] S_out0_f,
    output alarm_led,
    output reg [7:0] Anode_Activate
    );
    
    wire [1:0] H_out1;
    wire [3:0] H_out0;
    wire [3:0] M_out1;
    wire [3:0] M_out0;
    wire [3:0] S_out1;
    wire [3:0] S_out0; 
    
    wire [4:0] HH_C, HH_S;
    wire [5:0] MM_C, MM_S;
    wire [5:0] SS_C, SS_S;
    reg [1:0] c_hour1;
    reg [3:0] c_hour0, c_min1, c_min0, c_sec1, c_sec0;
    wire clean;
    wire slowclk;
    
    clkDivider CD1(.clk(clk), .reset(reset), .slowclk(slowclk));
    debouncePB DB1(.PB(PB), .clk(clk), .reset(reset), .clean(clean));
    
    SET_TIME ST1(.mode(mode), .PB(clean), .SWITCH(SWITCH), .H_IN(HH_S), .M_IN(MM_S), .S_IN(SS_S), .clk(clk), .reset(reset));
    SET_ALARAM SA1(.mode(mode), .PB(clean), .SWITCH(SWITCH), .clk(clk), .reset(reset), .H_OUT(HH_C), .M_OUT(MM_C), .S_OUT(SS_C), .OUT_LED(alarm_led));
    dig_clock_current CC1(.clk(slowclk), .reset(reset), .mode(time_format), .s_in(SS_S), .m_in(MM_S), .h_in(HH_S), .seconds(SS_C), .minutes(MM_C), .hours(HH_C));
    
    function [3:0] mod_10;
    input [5:0] number;
    begin
    mod_10 = (number >=50) ? 5: ((number>=40)? 4 :((number >= 30)? 3 : ((number >= 20)? 2 : ((number >= 10)? 1 : 0))));
    end
    endfunction
    
    always @ (*) begin
        if (HH_C >= 20)
            c_hour1 = 2;
        else begin
            if (HH_C >= 10)
                c_hour1 = 1;
            else
                c_hour1 = 0;       
        end
        c_hour0 = HH_C - c_hour1*10;
        c_min1 = mod_10(MM_C);
        c_min0 = MM_C - c_min1*10;
        c_sec1 = mod_10(SS_C);
        c_sec0 = SS_C - c_sec1*10;
    end
    
    assign H_out1 = c_hour1;
    assign H_out0 = c_hour0;
    assign M_out1 = c_min1;
    assign M_out0 = c_min0;
    assign S_out1 = c_sec1;
    assign S_out0 = c_sec0;
    
    reg[19:0] refresh;
    wire[1:0] counter;

   
    always @(posedge clk )
    begin 
        if(refresh ==1048576 )
            refresh <= 0;
        else
            refresh <= refresh + 1;
    end 
     assign counter = refresh[19:17];
    // anode activating signals for 8 LEDs, digit period of 2.6ms
    // decoder to generate anode signals 
    always @(*)
    begin 
        case(counter)
        
          3'b000: begin
            Anode_Activate = 8'b01111111; 
            // activate LED8 and Deactivate rest
               end
               
        3'b001: begin
          Anode_Activate = 8'b10111111; 
            // activate LED7 and Deactivate res
              end
        3'b010: begin
            Anode_Activate = 8'b11011111; 
            // activate LED6 and Deactivate the rest
              end
        3'b011: begin
           Anode_Activate = 8'b11101111; 
            // activate LED5 and Deactivate the rest    
                end
        3'b100: begin
           Anode_Activate = 8'b11110111; 
            // activate LED4 and Deactivate the rest    
                end
        3'b101: begin
           Anode_Activate = 8'b11111011; 
            // activate LED3 and Deactivate the rest    
                end
        3'b110: begin
           Anode_Activate = 8'b11111101; 
            // activate LED2 and Deactivate the rest    
                end
        3'b111: begin
           Anode_Activate = 8'b11111110; 
            // activate LED1 and Deactivate the rest    
                end                                                                
      
        endcase
        end
    
    always @(*)
    begin
        case(H_out1)
        2'b00 : H_out1_f = 7'b0000001;
        2'b01 : H_out1_f = 7'b1001111;
        2'b10 : H_out1_f = 7'b0010010;
        default : H_out1_f = 7'b0000001;
        endcase
     end
     
     always@(*)
     begin
        case(H_out0)
        4'b0000: H_out0_f = 7'b0000001;
        4'b0001: H_out0_f = 7'b1001111;
        4'b0010: H_out0_f = 7'b0010010;
        4'b0011: H_out0_f = 7'b0000110;
        4'b0100: H_out0_f = 7'b1001100;
        4'b0101: H_out0_f = 7'b0100100;
        4'b0110: H_out0_f = 7'b0100000;
        4'b0111: H_out0_f = 7'b0001111;
        4'b1000: H_out0_f = 7'b0000000;
        4'b1001: H_out0_f = 7'b0000100;   
        default: H_out0_f = 7'b0000001;
        endcase
     end
     
     always@(*)
     begin
        case(M_out1)
        4'b0000: M_out1_f = 7'b0000001;
        4'b0001: M_out1_f = 7'b1001111;
        4'b0010: M_out1_f = 7'b0010010;
        4'b0011: M_out1_f = 7'b0000110;
        4'b0100: M_out1_f = 7'b1001100;
        4'b0101: M_out1_f = 7'b0100100;
        4'b0110: M_out1_f = 7'b0100000;
        4'b0111: M_out1_f = 7'b0001111;
        4'b1000: M_out1_f = 7'b0000000;
        4'b1001: M_out1_f = 7'b0000100;   
        default: M_out1_f = 7'b0000001;
        endcase
     end
     
     always@(*)
     begin
        case(M_out0)
        4'b0000: M_out0_f = 7'b0000001;
        4'b0001: M_out0_f = 7'b1001111;
        4'b0010: M_out0_f = 7'b0010010;
        4'b0011: M_out0_f = 7'b0000110;
        4'b0100: M_out0_f = 7'b1001100;
        4'b0101: M_out0_f = 7'b0100100;
        4'b0110: M_out0_f = 7'b0100000;
        4'b0111: M_out0_f = 7'b0001111;
        4'b1000: M_out0_f = 7'b0000000;
        4'b1001: M_out0_f = 7'b0000100;   
        default: M_out0_f = 7'b0000001;
        endcase
     end     
    
     always@(*)
     begin
        case(S_out1)
        4'b0000: S_out1_f = 7'b0000001;
        4'b0001: S_out1_f = 7'b1001111;
        4'b0010: S_out1_f = 7'b0010010;
        4'b0011: S_out1_f = 7'b0000110;
        4'b0100: S_out1_f = 7'b1001100;
        4'b0101: S_out1_f = 7'b0100100;
        4'b0110: S_out1_f = 7'b0100000;
        4'b0111: S_out1_f = 7'b0001111;
        4'b1000: S_out1_f = 7'b0000000;
        4'b1001: S_out1_f = 7'b0000100;   
        default: S_out1_f = 7'b0000001;
        endcase
     end    

     always@(*)
     begin
        case(S_out0)
        4'b0000: S_out0_f = 7'b0000001;
        4'b0001: S_out0_f = 7'b1001111;
        4'b0010: S_out0_f = 7'b0010010;
        4'b0011: S_out0_f = 7'b0000110;
        4'b0100: S_out0_f = 7'b1001100;
        4'b0101: S_out0_f = 7'b0100100;
        4'b0110: S_out0_f = 7'b0100000;
        4'b0111: S_out0_f = 7'b0001111;
        4'b1000: S_out0_f = 7'b0000000;
        4'b1001: S_out0_f = 7'b0000100;   
        default: S_out0_f = 7'b0000001;
        endcase
     end  

endmodule
