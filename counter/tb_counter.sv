module tb_counter;
    //
    // ---------------- DECLARATIONS OF PARAMETERS ----------------
    //
    parameter N = 32;
    //
    // ---------------- DECLARATIONS OF DATA TYPES ----------------
    //
    //inputs are reg for test bench - or use logic
    reg CLK;
    reg RST;
    reg EN;
    //outputs are wire for test bench - or use logic
    wire [N-1:0] Z1;

    //
    // ---------------- INITIALIZE TEST BENCH ----------------
    //
    initial begin : initialize_signals
        CLK = 1'b0;
        RST = 1'b0;
        EN = 1'b0;
    end

    initial begin
//        $monitor ($time,"\tCLK=%b EN=%b RST=%b Z1=%b", CLK, RST, EN, Z1);
        $monitor ($time,"\tCLK=%b RST=%b EN=%b Z1=%04b_%04b_%04b_%04b_%04b_%04b_%04b_%04b", CLK, RST, EN, Z1[31:28], Z1[27:24], Z1[23:20], Z1[19:16], Z1[15:12], Z1[11:8], Z1[7:4], Z1[3:0]);
//        $display("0x%04h_%04h_%04h_%04h", d[63:48], d[47:32], d[31:16], d[15:0]);
    end

    initial begin
        $dumpfile("tb_counter.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, dut);
    end
  
    // a simple clock with 50% duty cycle
    always begin: clock
        #10 CLK = ~CLK;
    end

    //
    // ---------------- APPLY INPUT VECTORS ----------------
    //

    initial begin: prog_apply_stimuli
    #0
    #10	RST = 1'b1;
    #10 RST = 1'b0;
    #10 EN = 1'b1;
    #10
    #10
    #10 
    #10
    #10
    #100 EN = 1'b0;
    #10
    #10
    #10
    $finish;
    end


    //
    // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
    //
    counter #(.n(N)) dut(
        .clk(CLK), .rst(RST), .enable(EN), .count(Z1)
    );

endmodule
