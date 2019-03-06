`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:26:24 01/25/2019 
// Design Name: 
// Module Name:    REGISTER FILE 
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
module RF(
    input [4:0] ReadReg1,
    input [4:0] ReadReg2,
    input [4:0] WriteReg,
    input [63:0] WriteData,
    input RegWrite,
	 input Reset,
	 input clk,
    output [63:0] ReadData1,
    output [63:0] ReadData2
    ); 
	reg [63:0] RF [31:0];
	initial 
		$readmemb("memory/register.mem", RF);
	assign ReadData1 = RF[ReadReg1];
	assign ReadData2 = RF[ReadReg2];
	always @(posedge clk)
		if (RegWrite)
			RF[WriteReg] <= WriteData;				
endmodule
