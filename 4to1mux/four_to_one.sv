//////////////////////////////////////////////////////////////////////////////
//
// Module: four_to_one
//
// 4:1 Multiplexer
//
// module: four_to_one
// hdl: SystemVerilog
// modeling: Gate Level Modeling
//
// author: James Ryan <james.ryan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////
`ifndef FOUR_TO_ONE
`define FOUR_TO_ONE
// DO NOT FORGET TO RENAME four_to_one to match your four_to_one

module four_to_one (
	//
    // ---------------- declarations of port in/out & data types ----------------
    //
	input [3:0] d,
	input [1:0] s,
  	input en,

	output reg z1);


    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
	always @(*) begin
		if(en == 1) begin
			case(s)
				2'b00:		z1 = d[0];
				2'b01:		z1 = d[1];
				2'b10:		z1 = d[2];
				2'b11:		z1 = d[3];
				default:	z1 = d[0];
			endcase
		end
	end
endmodule

`endif // four_to_one