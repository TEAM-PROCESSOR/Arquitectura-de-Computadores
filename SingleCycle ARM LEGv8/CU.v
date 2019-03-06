`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:29:37 01/27/2019 
// Design Name: 
// Module Name:    CONTROL UNIT
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

// R-Type
`define OP_ADD  11'b10001011000
`define OP_SUB  11'b11001011000
`define OP_AND  11'b10001010000
`define OP_OR   11'b10101010000

// D-Type
`define OP_STUR 11'b11111000000
`define OP_LDUR 11'b11111000010

// I-Type
`define OP_ADDI 11'b1001000100x
`define OP_SUBI 11'b1101000100x

// CB-Type
`define OP_CBZ 11'b10110100xxx

// B-Type
`define OP_B 11'b000101xxxxx

module CU(
    input [10:0] Opcode,
    output reg Reg2Loc,
    output reg ALUSrc,
    output reg [2:0] ALUOp,
    output reg Branch,
    output reg MemRead,
    output reg MemWrite,
    output reg MemtoReg,
	 output reg RegWrite,
	 output reg Uncondbranch
    );
	always @(Opcode)
			casex (Opcode)
				`OP_ADD: begin 
								Reg2Loc  	 <= 1'b0;
								ALUSrc   	 <= 1'b0;
								Branch   	 <= 1'b0;
								MemRead  	 <= 1'b0;
								MemWrite 	 <= 1'b0;
								MemtoReg 	 <= 1'b0;
								RegWrite     <= 1'b1;
								Uncondbranch <= 1'b0;
								ALUOp        <= 3'b000;
							end
				`OP_SUB: begin 
								Reg2Loc  	 <= 1'b0;
								ALUSrc   	 <= 1'b0;
								Branch   	 <= 1'b0;
								MemRead  	 <= 1'b0;
								MemWrite 	 <= 1'b0;
								MemtoReg 	 <= 1'b0;
								RegWrite 	 <= 1'b1;
								Uncondbranch <= 1'b0;
								ALUOp    	 <= 3'b001;
							end
				`OP_AND: begin 
								Reg2Loc  	 <= 1'b0;
								ALUSrc   	 <= 1'b0;
								Branch   	 <= 1'b0;
								MemRead  	 <= 1'b0;
								MemWrite 	 <= 1'b0;
								MemtoReg 	 <= 1'b0;
								RegWrite 	 <= 1'b1;
								Uncondbranch <= 1'b0;
								ALUOp    	 <= 3'b010;
							end
				`OP_OR: begin 
								Reg2Loc  	 <= 1'b0;
								ALUSrc   	 <= 1'b0;
								Branch   	 <= 1'b0;
								MemRead  	 <= 1'b0;
								MemWrite 	 <= 1'b0;
								MemtoReg 	 <= 1'b0;
								RegWrite 	 <= 1'b1;
								Uncondbranch <= 1'b0;
								ALUOp    	 <= 3'b011;
							end
				`OP_STUR: begin 
								Reg2Loc  	 <= 1'b1;
								ALUSrc   	 <= 1'b1;
								Branch   	 <= 1'b0;
								MemRead  	 <= 1'b0;
								MemWrite 	 <= 1'b1;
								MemtoReg 	 <= 1'b0;
								RegWrite 	 <= 1'b0;
								Uncondbranch <= 1'b0;
								ALUOp    	 <= 3'b000;
							 end
				`OP_LDUR: begin 
								Reg2Loc  	 <= 1'b0;
								ALUSrc   	 <= 1'b1;
								Branch   	 <= 1'b0;
								MemRead  	 <= 1'b1;
								MemWrite 	 <= 1'b0;
								MemtoReg 	 <= 1'b1;
								RegWrite 	 <= 1'b1;
								Uncondbranch <= 1'b0;
								ALUOp    	 <= 3'b000;
							 end
				
				`OP_ADDI: begin 
								Reg2Loc  	 <= 1'b1;
								ALUSrc   	 <= 1'b1;
								Branch   	 <= 1'b0;
								MemRead  	 <= 1'b0;
								MemWrite 	 <= 1'b0;
								MemtoReg 	 <= 1'b0;
								RegWrite 	 <= 1'b1;
								Uncondbranch <= 1'b0;
								ALUOp    	 <= 3'b000;
							 end
				`OP_SUBI: begin 
								Reg2Loc  	 <= 1'b1;
								ALUSrc   	 <= 1'b1;
								Branch   	 <= 1'b0;
								MemRead  	 <= 1'b0;
								MemWrite 	 <= 1'b0;
								MemtoReg 	 <= 1'b0;
								RegWrite 	 <= 1'b1;
								Uncondbranch <= 1'b0;
								ALUOp    	 <= 3'b001;
							 end
				`OP_CBZ: begin 
								Reg2Loc  	 <= 1'b1;
								ALUSrc   	 <= 1'b0;
								Branch   	 <= 1'b1;
								MemRead  	 <= 1'b0;
								MemWrite 	 <= 1'b0;
								MemtoReg 	 <= 1'b0;
								RegWrite 	 <= 1'b0;
								Uncondbranch <= 1'b0;
								ALUOp    	 <= 3'b100;
							end
				`OP_B: begin 
							Reg2Loc  	 <= 1'b1;
							ALUSrc   	 <= 1'b0;
							Branch   	 <= 1'b0;
							MemRead  	 <= 1'b0;
							MemWrite 	 <= 1'b0;
							MemtoReg 	 <= 1'b0;
							RegWrite 	 <= 1'b0;
							Uncondbranch <= 1'b1;
							ALUOp    	 <= 3'b100;
						end		
			endcase				
endmodule
