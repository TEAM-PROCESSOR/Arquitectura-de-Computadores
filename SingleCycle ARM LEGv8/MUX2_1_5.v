`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:05:53 01/25/2019 
// Design Name: 
// Module Name:    MULTIPLEXOR(2 TO 1), 5 Bits 
// Project Name:   Design ARM Architecture 
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
module MUX2_1_5(
    input [4:0] A,
    input [4:0] B,
    input S,
    output reg [4:0] Out
    );
	always @(A, B, S)
		case (S)
			1'b0: Out <= A;
			default: Out <= B;
		endcase
endmodule
