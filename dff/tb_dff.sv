module tb_dff;
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
    logic [N-1:0] D;
    logic [N-1:0] Q;
    logic [N-1:0] Qn;

    //
    // ---------------- INITIALIZE TEST BENCH ----------------
    //
    initial begin : initialize_signals
        CLK = 1'b0;
        RST = 1'b0;
        EN = 1'b0;
        D = N-1'd0;
    end

    initial begin
//        $monitor ($time,"\tCLK=%b EN=%b RST=%b Z1=%b", CLK, RST, EN, Z1);
        $monitor (
            $time,
            "\tCLK=%b EN=%b RST=%b \n\tD=%04b_%04b_%04b_%04b_%04b_%04b_%04b_%04b\n\tQ==%04b_%04b_%04b_%04b_%04b_%04b_%04b_%04b\n\tQn=%04b_%04b_%04b_%04b_%04b_%04b_%04b_%04b",
            CLK, RST, EN,
            D[31:28], D[27:24], D[23:20], D[19:16], D[15:12], D[11:8], D[7:4], D[3:0],
            Q[31:28], Q[27:24], Q[23:20], Q[19:16], Q[15:12], Q[11:8], Q[7:4], Q[3:0],
            Qn[31:28], Qn[27:24], Qn[23:20], Qn[19:16], Qn[15:12], Qn[11:8], Qn[7:4], Qn[3:0]
        );
//        $display("0x%04h_%04h_%04h_%04h", d[63:48], d[47:32], d[31:16], d[15:0]);
    end

    initial begin
        $dumpfile("tb_dff.vcd"); // for Makefile, make dump file same as module name
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
    #10 D = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
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
    dff #(.n(N)) dut(
        .d(D), .clk(CLK), .rst(RST), .q(Q), .qn(Qn), .en(EN)
    );

endmodule
