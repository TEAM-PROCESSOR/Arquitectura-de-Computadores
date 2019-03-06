`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:44:33 01/25/2019 
// Design Name: 
// Module Name:    SHIFT LEFT 2 
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
module LL2(
    input [63:0] A,
    output reg[63:0] S
    );
	 always @(A)
		S <= A << 2;
endmodule
