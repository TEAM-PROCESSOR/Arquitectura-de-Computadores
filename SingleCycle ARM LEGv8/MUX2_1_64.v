`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:05:53 01/25/2019 
// Design Name: 
// Module Name:     MULTIPLEXOR(2 TO 1), 64 Bits 
// Project Name: 
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
module MUX2_1_64(
    input [63:0] A,
    input [63:0] B,
    input S,
    output reg [63:0] Out
    );
	always @(A, B, S)
		case (S)
			1'b0: Out <= A;
			default: Out <= B;
		endcase
endmodule
