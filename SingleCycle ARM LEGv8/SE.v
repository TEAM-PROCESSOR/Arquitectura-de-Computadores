`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:07:20 01/26/2019 
// Design Name: 
// Module Name:    SIGN EXTEND 
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
`define ADD_OP  11'b10001011000
`define SUB_OP  11'b11001011000
`define AND_OP  11'b10001010000
`define OR_OP   11'b10101010000

// D-Type
`define STUR_OP 11'b11111000000
`define LDUR_OP 11'b11111000010

// I-Type
`define ADDI_OP 10'b1001000100
`define SUBI_OP 10'b1101000100

// CB-Type
`define CBZ_OP 8'b10110100

// B-Type
`define B_OP 6'b000101

module SE(
    input [31:0] Instruction,
    output reg[63:0] S
    );
	wire [11:0] ALU_immediate = Instruction[21:10];
	wire [8:0] DT_address = Instruction[20:12];
	wire [25:0] BR_address = Instruction[25:0];
	wire [18:0] COND_BR_address = Instruction[23:5];
	always @(*)
		if	((Instruction[31:22] == `ADDI_OP) || (Instruction[31:22] == `SUBI_OP))
			S <= {52'b0, ALU_immediate};
		else if ((Instruction[31:21] == `STUR_OP) || (Instruction[31:21] == `LDUR_OP)) 
			S <= {{55{DT_address[8]}}, DT_address};
		else if (Instruction[31:26] == `B_OP)
			S <= {{36{BR_address[25]}}, BR_address, 2'b0};
		else if (Instruction[31:24] == `CBZ_OP)
			S <= {{43{COND_BR_address[18]}}, COND_BR_address, 2'b0};
		else
			S <= {{32{Instruction[31]}},Instruction};
endmodule
