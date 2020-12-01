# FPGA-DigitalClock

Contributors:
Keven DeOliveira (U34670785)
Seifallah Ibrahim (U98999853)

This project was made for EC311 Lab 4, where we were tasked with designing a digital clock and implementing it on to a Nexys A7 FPGA board.
The digital clock makes use of combinational and sequential logic components such as logic gates, counters, clocks and clock dividers, and more.
Our digital clock offers several "modes":
  - Current time: 12 hour & 24 hour formats supported
  - Set Time: Allows user to set the desired time
  - Set Alarm: Allows user to set an alarm that will turn on an LED light once it is time.
All of these modes display on the seven-segment display, and the current time clock does not stop while the user is in the other modes (until a new
time is set, then the clock resets to the new given time).

The project consists of many modules accomplishing smaller tasks, such as debouncing push buttons or dividing the clock time from 100MHz to 1Hz.
There is a single "top" module that instantiates these smaller modules, and performs other tasks to output the correct information on to the
seven-segment display.

Seifallah designed the set time module, the set alarm module, the clock divider module, the debouncer module, and assisted with the current time module.
Keven designed the current time module (with input from Seifallah), debugged modules created by Seifallah, designed a seven-segment display controller,
and implemented the design on to the board.

Keven DeOliveira

Seifallah Ibrahim
