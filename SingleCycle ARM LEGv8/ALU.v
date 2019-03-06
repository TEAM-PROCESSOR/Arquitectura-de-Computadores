`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:06:33 01/25/2019 
// Design Name: 
// Module Name:    ARITHMETIC LOGIC UNIT 
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
`define ADD     3'b000
`define SUB     3'b001
`define AND     3'b010
`define OR      3'b011
`define PassB   3'b100

module ALU(
    input [63:0] A,
    input [63:0] B,
    input [2:0] ALUOp,
    output reg [63:0] ALUResult,
    output Zero
    );
	assign Zero = (ALUResult == 0);
	always @(ALUOp, A, B)
		case (ALUOp)
		   `ADD: ALUResult <= A+B;
			`SUB: ALUResult <= A-B;
			`AND: ALUResult <= A&B;
			`OR: ALUResult <= A|B;
			`PassB: ALUResult <= B;
		endcase
endmodule
