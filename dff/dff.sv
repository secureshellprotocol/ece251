module dff
	# (
		parameter n = 32
	)(
	input logic [n-1:0] d, 
	input clk, 
	input rst,
	input en,
	output logic [n-1:0] q, 
	output logic [n-1:0] qn
);

	always_ff @(posedge clk, posedge rst) begin
		if (rst) begin
			q  <= 0;
			qn <= -1;
		end else if (en) begin
			q  <= d;
			qn <= ~d;
		end else begin
			q <= z;
			qn <= z;
		end
	end
endmodule
