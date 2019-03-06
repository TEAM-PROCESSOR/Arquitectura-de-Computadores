`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:31:58 01/27/2019 
// Design Name: 
// Module Name:    PROCESSOR 
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
`define four 64'b100

module PROCESSOR(
    input clk,
	 input Reset
    );
	 
wire [63:0] PCOut_wire;
wire [63:0] AdderOut1_wire;
wire [31:0] Instruction_wire;
wire [4:0] MUXOut1_wire;
wire [63:0] ReadDataOut1_wire;
wire [63:0] ReadDataOut2_wire;
wire [63:0] SignExtOut_wire;
wire Reg2Loc_wire;
wire ALUSrc_wire; 
wire Branch_wire; 
wire MemRead_wire; 
wire MemWrite_wire; 
wire MemtoReg_wire; 
wire RegWrite_wire;
wire Uncondbranch_wire;
wire [2:0]ALUOp_wire;  
wire [63:0] LL2Out_wire;
wire [63:0] AdderOut2_wire;
wire [63:0] MUXOut2_wire;
wire [63:0] ALUResult_wire;
wire Zero_wire;
wire ANDOut_wire;
wire OROut_wire;
wire [63:0] MUXOut3_wire;
wire [63:0] DataReadOut_wire;
wire [63:0] MUXOut4_wire;


//=========FETCH============================

PC PROGRAM_COUNTER(
    .D(MUXOut3_wire), 
    .Q(PCOut_wire), 
    .clk(clk), 
    .Reset(Reset)
    );

IM INSTRUCTION_MEMORY (
    .Address(PCOut_wire), 
    .Instruction(Instruction_wire)
    );
	 
ADDER ADDER1 (
	 .A(`four),  
    .B(PCOut_wire), 
    .Out(AdderOut1_wire)
    );	 

//=========DECODE============================

MUX2_1_5 MUX1(
    .A(Instruction_wire[20:16]), 
    .B(Instruction_wire[4:0]), 
    .S(Reg2Loc_wire), 
    .Out(MUXOut1_wire)
    );

RF REGISTER_FILE (
    .ReadReg1(Instruction_wire[9:5]), 
    .ReadReg2(MUXOut1_wire), 
    .WriteReg(Instruction_wire[4:0]), 
    .WriteData(MUXOut4_wire), 
    .RegWrite(RegWrite_wire),
	 .Reset(Reset),	 
    .clk(clk), 
    .ReadData1(ReadDataOut1_wire), 
    .ReadData2(ReadDataOut2_wire)
    );

CU CONTROL_UNIT (
    .Opcode(Instruction_wire[31:21]), 
    .Reg2Loc(Reg2Loc_wire), 
    .ALUSrc(ALUSrc_wire), 
    .ALUOp(ALUOp_wire), 
    .Branch(Branch_wire), 
    .MemRead(MemRead_wire), 
    .MemWrite(MemWrite_wire), 
    .MemtoReg(MemtoReg_wire), 
    .RegWrite(RegWrite_wire),
	 .Uncondbranch(Uncondbranch_wire)
    );
	 
SE SIGN_EXTEND (
    .Instruction(Instruction_wire[31:0]), 
    .S(SignExtOut_wire)
    );

LL2 SHIFT_LEFT_2 (
    .A(SignExtOut_wire), 
    .S(LL2Out_wire)
    );
	 
ADDER ADDER2 (
    .A(PCOut_wire), 
    .B(LL2Out_wire), 
    .Out(AdderOut2_wire)
    );
	 
MUX2_1_64 MUX2 (
    .A(ReadDataOut2_wire), 
    .B(SignExtOut_wire), 
    .S(ALUSrc_wire), 
    .Out(MUXOut2_wire)
    );

//=========EXECUTE============================
	 
ALU ARITHMETIC_LOGIC_UNIT (
    .A(ReadDataOut1_wire), 
    .B(MUXOut2_wire), 
    .ALUOp(ALUOp_wire), 
    .ALUResult(ALUResult_wire), 
    .Zero(Zero_wire)
    );

AND AND_GATE (
    .A(Branch_wire), 
    .B(Zero_wire), 
    .S(ANDOut_wire)
    );
	 
OR OR_GATE (
    .A(Uncondbranch_wire), 
    .B(ANDOut_wire), 
    .S(OROut_wire)
    );	 

MUX2_1_64 MUX3 (
    .A(AdderOut1_wire), 
    .B(AdderOut2_wire), 
    .S(OROut_wire), 
    .Out(MUXOut3_wire)
    );

DM DATA_MEMORY (
    .Address(ALUResult_wire), 
    .DataWrite(ReadDataOut2_wire), 
    .MemRead(MemRead_wire), 
    .MemWrite(MemWrite_wire), 
    .DataRead(DataReadOut_wire)
    );

MUX2_1_64 MUX4 (
    .A(ALUResult_wire), 
    .B(DataReadOut_wire), 
    .S(MemtoReg_wire), 
    .Out(MUXOut4_wire)
    );	 
		 
endmodule
