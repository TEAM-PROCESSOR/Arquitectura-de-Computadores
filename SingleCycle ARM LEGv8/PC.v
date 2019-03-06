`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:05 01/25/2019 
// Design Name: 
// Module Name:    PROGRAM COUNTER 
// Project Name:	 Design ARM Architecture 		
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PC(
    input [63:0] D,
    output reg [63:0] Q,
    input clk,
    input Reset
    );
	always @(posedge clk)
		if (Reset)
			Q <= 0;
		else
			Q <= D;
endmodule
