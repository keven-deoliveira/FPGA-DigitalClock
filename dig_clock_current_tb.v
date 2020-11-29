`timescale 1ns / 1ps

module dig_clock_current_tb;

    // Inputs
    reg clk;
    reg reset;
    reg mode;
    reg [5:0] s_in;
    reg [5:0] m_in;
    reg [4:0] h_in;

    // Outputs
    wire [5:0] seconds;
    wire [5:0] minutes;
    wire [4:0] hours;

    // Instantiate the Unit Under Test (UUT)
    dig_clock_current uut (
        .clk(clk), 
        .reset(reset), 
        .mode(mode),
        .seconds(seconds), 
        .minutes(minutes), 
        .hours(hours)
    );
    
    //Generating the Clock with `1 Hz frequency
    initial clk = 0;
    always #0.001 clk = ~clk;  // 50000000 for more accurate timing

    initial begin
        reset = 1;
        // Wait 100 ns for global reset to finish
        #100;
        mode = 0;
        reset = 0;
        #500 mode = 1;  
    end
      
endmodule

