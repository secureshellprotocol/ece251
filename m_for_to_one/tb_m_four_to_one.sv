///////////////////////////////////////////////////////////////////////////////
//
// Module: Testbench for module module
//
// Testbench for four_to_one
//
// module: tb_four_to_one
// hdl: SystemVerilog
//
// author: James Ryan <james.ryan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

`include "four_to_one.sv"

module tb_four_to_one;
    //
    // ---------------- DECLARATIONS OF DATA TYPES ----------------
    //
    //inputs are reg for test bench - or use logic
	reg [3:0] D;
	reg [1:0] S;
    reg EN;
	reg CLK;

	//outputs are wire for test bench - or use logic
	logic Z1;

    //
    // ---------------- INITIALIZE TEST BENCH ----------------
    //
    initial begin : initialize_variables
    	D = 4'b1010;
		S = 2'b00;
		EN = 1'b0;
		CLK = 1'b1;
	end
	
	// Display relevant variables while simulating
    initial begin
        $monitor ($time,"ns, select:s=%b, inputs:d=%b, output:z1=%b, enable:en=%b, clk=%b", S, D, Z1, EN, CLK);
    end

    initial begin : dump_variables
        $dumpfile("four_to_one.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, dut);
    end
    
	always begin: clock
		#5 CLK = ~CLK;
	end

	// ---------------- APPLY INPUT VECTORS ----------------
    //
    // note: following the keyword begin is the name of the block: apply_stimulus
    initial begin : apply_stimuli
	#10  S = 2'b00; // S[0]=1'b0; S[1]=1'b0;
        D = 4'b1010; // D[0]=1'b0; D[1]=1'b1; D[2]=1'b0; D[3]=1'b1;
        EN = 1'b1; // EN=1'b1;
    #10 S = 2'b00; // S[0]=1'b0; S[1]=1'b0;
        D = 4'b1011; // D[0]=1'b1; D[1]=1'b1; D[2]=1'b0; D[3]=1'b1;
        EN = 1'b1; // EN=1'b1;
    #5
	#2.5 S = 2'b10; // S[0]=1'b1; S[1]=1'b0;
        D = 4'b1011; // D[0]=1'b1; D[1]=1'b1; D[2]=1'b0; D[3]=1'b1;
        EN = 1'b1; // EN=1'b1;
	#2.5
	#10 S = 2'b10; // S[0]=1'b1; S[1]=1'b0;
        D = 4'b1011; // D[0]=1'b1; D[1]=1'b1; D[2]=1'b0; D[3]=1'b1;
        EN = 1'b1; // EN=1'b1;
    #10 S = 2'b10; // S[0]=1'b0; S[1]=1'b0;
        D = 4'b1011; // D[0]=1'b1; D[1]=1'b1; D[2]=1'b0; D[3]=1'b1;
        EN = 1'b1; // EN=1'b1;
    #10 S = 2'b01; // S[0]=1'b1; S[1]=1'b0;
        D = 4'b1001; // D[0]=1'b1; D[1]=1'b1; D[2]=1'b0; D[3]=1'b1;
        EN = 1'b1; // EN=1'b1;
    #10 S = 2'b11; // S[0]=1'b1; S[1]=1'b0;
        D = 4'b1011; // D[0]=1'b1; D[1]=1'b1; D[2]=1'b0; D[3]=1'b1;
        EN = 1'b1; // EN=1'b1;
    #10 S = 2'b11; // S[0]=1'b1; S[1]=1'b0;
        D = 4'b0011; // D[0]=1'b1; D[1]=1'b1; D[2]=1'b0; D[3]=1'b1;
        EN = 1'b1; // EN=1'b1;
    #10 S = 2'b11; // S[0]=1'b1; S[1]=1'b0;
        D = 4'b0011; // D[0]=1'b1; D[1]=1'b1; D[2]=1'b0; D[3]=1'b1;
        EN = 1'b0; // EN=1'b1;
    #10 $finish;
    end
    //$finish;
    // note: do not need $finish, since the simulation runs for the set increments and ends.

    //
    // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
    //
    four_to_one dut(
        .d(D), .s(S), .z1(Z1), .en(EN), .clk(CLK)
    );

endmodule
