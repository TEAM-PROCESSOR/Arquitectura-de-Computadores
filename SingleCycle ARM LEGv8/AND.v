`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:58:16 01/26/2019 
// Design Name: 
// Module Name:    AND 
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
module AND(
    input A,
    input B,
    output reg S
    );
	always @(A, B)
		S <= A & B;
endmodule
