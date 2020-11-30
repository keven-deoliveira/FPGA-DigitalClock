`timescale 1ns / 1ps

module dig_clock_current(
    input clk,  //Clock with 1 Hz frequency
    input reset,     //active high reset
    input mode,     // default 1'b0 = 24 hr clock, 1'b1 = 12 hr clock
    input [5:0] s_in,
    input [5:0] m_in,
    input [4:0] h_in,
    output reg [5:0] seconds,
    output reg [5:0] minutes,
    output reg [4:0] hours    
    );
    
    always @(posedge(clk) or posedge(reset) or posedge mode)
    begin
            if (mode == 1'b1 && hours > 12) begin
                hours = hours - 12;
            end
                
            if(reset == 1'b1) begin  //check for active high reset.
                //reset the time.
                seconds = s_in;
                minutes = m_in;
                hours = h_in;  end
            else if(clk == 1'b1) begin  //at the beginning of each second
                seconds = seconds + 1; //increment sec
                if(seconds == 60) begin //check for max value of sec
                    seconds = 0;  //reset seconds
                    minutes = minutes + 1; //increment minutes
                    if(minutes == 60) begin //check for max value of min
                        minutes = 0;  //reset minutes
                        hours = hours + 1;  //increment hours
                        if(mode == 1'b0) begin
                            if(hours == 24) begin
                                hours = 0;
                            end
                        end
                        else if (mode == 1'b1) begin
                            if (hours == 12) begin
                                hours = 0;
                            end
                            if (hours > 12) begin
                                hours = hours - 12;
                            end    
                        end        
                    end
                end     
            end

    end // always end     

endmodule
