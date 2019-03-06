`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:05:04 01/26/2019 
// Design Name: 
// Module Name:    OR 
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
module OR(
    input A,
    input B,
    output reg S
    );
	always @(A, B)
		S <= A | B;
endmodule
