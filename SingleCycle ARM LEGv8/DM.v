`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:44:18 01/26/2019 
// Design Name: 
// Module Name:    DM 
// Project Name: 
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
module DM(
    input [63:0] Address,
    input [63:0] DataWrite,
    input MemRead,
    input MemWrite,
    output reg [63:0] DataRead
    );
	reg [7:0] data_mem [1023:0];
	initial 
		$readmemb("memory/data.mem", data_mem);
	always @(Address, DataWrite, MemRead, MemWrite)
		begin
			if (MemRead)			
				DataRead <= {data_mem[Address], data_mem[Address+1], data_mem[Address+2], data_mem[Address+3], data_mem[Address+4], data_mem[Address+5], data_mem[Address+6], data_mem[Address+7]};
			if (MemWrite)
				data_mem[Address] <= DataWrite[7:0];
				data_mem[Address+1]	<= DataWrite[15:8];
				data_mem[Address+2]	<= DataWrite[23:16];
				data_mem[Address+3]	<= DataWrite[31:24];
				data_mem[Address+4]	<= DataWrite[39:32];
				data_mem[Address+5]	<= DataWrite[47:40];
				data_mem[Address+6]	<= DataWrite[55:48];
				data_mem[Address+7]	<= DataWrite[63:56];		
		end
endmodule
