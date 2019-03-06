`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:54:28 01/26/2019 
// Design Name: 
// Module Name:    ISTRUCTION MEMORY 
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
module IM(
    input [63:0] Address,
    output reg[31:0] Instruction
    );
	reg [31:0] instr_mem [0:1023];
	initial 
		$readmemb("memory/instruction.mem", instr_mem);
	always @(Address)
		Instruction <= instr_mem[Address];
endmodule
