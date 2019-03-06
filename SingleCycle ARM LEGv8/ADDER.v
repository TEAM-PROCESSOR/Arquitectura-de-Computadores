`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:52 01/25/2019 
// Design Name: 
// Module Name:    ADDER 
// Project Name: 	 Design ARM Architecture 	
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
module ADDER(
    input [63:0] A,
    input [63:0] B,
    output reg[63:0] Out
    );
	always @(A, B)	
		Out <= A + B;
endmodule
