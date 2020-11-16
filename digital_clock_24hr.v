`timescale 1ns / 1ps


module digital_clock_24hr(
    input clk,  //Clock with 1 Hz frequency
    input reset,     //active high reset
    output reg [5:0] seconds,
    output reg [5:0] minutes,
    output reg [4:0] hours    
    );
    
    always @(posedge(clk) or posedge(reset))
    begin
        if(reset == 1'b1) begin  //check for active high reset.
            //reset the time.
            seconds = 0;
            minutes = 0;
            hours = 0;  end
        else if(clk == 1'b1) begin  //at the beginning of each second
            seconds = seconds + 1; //increment sec
            if(seconds == 60) begin //check for max value of sec
                seconds = 0;  //reset seconds
                minutes = minutes + 1; //increment minutes
                if(minutes == 60) begin //check for max value of min
                    minutes = 0;  //reset minutes
                    hours = hours + 1;  //increment hours
                   if(hours ==  24) begin  //check for max value of hours
                        hours = 0; //reset hours
                    end 
                end
            end     
        end
    end
endmodule
