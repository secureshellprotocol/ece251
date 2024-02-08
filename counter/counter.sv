module counter
    #(
        parameter n = 4,
        parameter down = 0
    ) (
    input clk,
    input rst,
    input enable,
    output reg [(n-1):0] count
);

    always @ (posedge clk) begin
        if (rst) begin
            count <= 0;
        end else if (enable) begin
            if (down) begin
                count <= count - 1;
            end else begin
                count <= count + 1;
            end
        end
    end

endmodule
