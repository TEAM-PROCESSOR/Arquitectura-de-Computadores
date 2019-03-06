`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:23:45 01/28/2019
// Design Name:   PROCESSOR
// Module Name:   C:/Users/Cristian/Documents/ISE/PROCESSOR/PROCESSOR_TF.v
// Project Name:  PROCESSOR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PROCESSOR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PROCESSOR_TF;

	// Inputs
	reg clk;
	reg Reset;

	// Instantiate the Unit Under Test (UUT)
	PROCESSOR uut (
		.clk(clk), 
		.Reset(Reset)
	);
	parameter PERIOD = 200;
	initial 
		begin
		
			clk = 0;
			#(PERIOD/2);
			
			forever
			#(PERIOD/2) clk = ~clk;
			
		end
	initial
		begin
		
			Reset = 0;
			#(PERIOD);
			
			Reset = 1;
			#(PERIOD/2);
			
			Reset = 0;
			#(PERIOD);
			
		end	     
endmodule

