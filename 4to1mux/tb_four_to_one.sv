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
	//outputs are wire for test bench - or use logic
	logic Z1;

    //
    // ---------------- INITIALIZE TEST BENCH ----------------
    //
    initial begin : initialize_variables
    	D = 4'b1010;
		S = 2'b00;
		EN = 1'b0;
	end

    initial begin
        $monitor ($time,"ns, select:s=%b, inputs:d=%b, output:z1=%b", S, D, Z1);
    end

    initial begin : dump_variables
        $dumpfile("four_to_one.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, dut);
    end

    /*
    * display variables
    */
//    initial begin: display_variables
        // note: currently only simple signals or constant expressions may be passed to $monitor.
//        $monitor ("X1-X2-X4-X4 = %b, Z1 = %b", {X1,X2,X3,X4}, Z1);
//    end

    //
    // ---------------- APPLY INPUT VECTORS ----------------
    //
    // note: following the keyword begin is the name of the block: apply_stimulus
    initial begin : apply_stimuli
    #0  S = 2'b00; // S[0]=1'b0; S[1]=1'b0;
        D = 4'b1010; // D[0]=1'b0; D[1]=1'b1; D[2]=1'b0; D[3]=1'b1;
        EN = 1'b1; // EN=1'b1;
    #10 S = 2'b00; // S[0]=1'b0; S[1]=1'b0;
        D = 4'b1011; // D[0]=1'b1; D[1]=1'b1; D[2]=1'b0; D[3]=1'b1;
        EN = 1'b1; // EN=1'b1;
    #10 S = 2'b01; // S[0]=1'b1; S[1]=1'b0;
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
        .d(D), .s(S), .z1(Z1), .en(EN)
    );

endmodule
