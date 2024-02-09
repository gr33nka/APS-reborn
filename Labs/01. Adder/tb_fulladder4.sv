//////////////////////////////////////////////////////////////////////////////////
// Company: MIET
// Engineer: Nikita Bulavin

// Module Name:    tb_fulladder4
// Project Name:   RISCV_practicum
// Target Devices: Nexys A7-100T
// Description: tb for 4-bit fulladder
//////////////////////////////////////////////////////////////////////////////////

module tb_fulladder4();

    parameter TIME_OPERATION  = 100;
    parameter TEST_VALUES = 400;

    wire [3:0] tb_a_i;
    wire [3:0] tb_b_i;
    wire       tb_carry_i;
    wire       tb_carry_o;
    wire [3:0] tb_sum_o;

    fulladder4 DUT (
        .a_i(tb_a_i),
        .b_i(tb_b_i),
        .sum_o(tb_sum_o),
        .carry_i(tb_carry_i),
        .carry_o(tb_carry_o)
    );

    integer     i, err_count = 0;
    reg [13:0] running_line;
    reg [14*400:0] line_dump;
    wire [3:0] sum_dump;
    wire       carry_o_dump;

    assign tb_a_i = running_line[13:10];
    assign tb_b_i = running_line[9:6];
    assign tb_carry_i = running_line[5];
    assign sum_dump = running_line[4:1];
    assign carry_o_dump = running_line[0];


    initial begin
        $display( "\nStart test: \n\n==========================\nCLICK THE BUTTON 'Run All'\n==========================\n"); $stop();
        `ifdef __debug__
        for ( i = 0; i < TEST_VALUES; i = i + 1 )
            begin
                running_line = line_dump[i*14+:14];
                #TIME_OPERATION;
                 if( (tb_carry_o !== carry_o_dump) || (tb_sum_o !== sum_dump) ) begin
                    $display("ERROR! carry_i = %b; (a)%h + (b)%h = ", tb_carry_i, tb_a_i, tb_b_i, "(carry_o)%b (sum_o)%h;", tb_carry_o, tb_sum_o, " carry_o_dump: %b, sum_dump: %h", carry_o_dump, sum_dump);
                    err_count = err_count + 1'b1;
                end
            end
        $display("Number of errors: %d", err_count);
        if( !err_count )  $display("\nfulladder4 SUCCESS!!!\n");
        `else
        for ( i = TEST_VALUES-1; i >=0 ; i = i - 1 )
            begin
                running_line = line_dump[i*14+:14];
                #TIME_OPERATION;
            end
        $display("Test has been finished");
        `endif
        $finish();
    end


    initial line_dump = {
    14'h1787,
    14'h1787,
    14'h1f8b,
    14'h0318,
    14'h0c8a,
    14'h0b1c,
    14'h1110,
    14'h0d0e,
    14'h1914,
    14'h0402,
    14'h050a,
    14'h1914,
    14'h1008,
    14'h0402,
    14'h0108,
    14'h050a,
    14'h1218,
    14'h1d16,
    14'h090c,
    14'h090c,
    14'h1c0e,
    14'h0804,
    14'h0318,
    14'h1008,
    14'h1008,
    14'h1a1c,
    14'h1008,
    14'h0e16,
    14'h0210,
    14'h1a1c,
    14'h1a1c,
    14'h0e16,
    14'h0804,
    14'h0612,
    14'h0e16,
    14'h180c,
    14'h163c,
    14'h0826,
    14'h0c06,
    14'h182e,
    14'h102a,
    14'h0804,
    14'h1c0e,
    14'h1008,
    14'h0402,
    14'h0c28,
    14'h0022,
    14'h0000,
    14'h1c0e,
    14'h142c,
    14'h0846,
    14'h0000,
    14'h0064,
    14'h0022,
    14'h0064,
    14'h0804,
    14'h0022,
    14'h0804,
    14'h106c,
    14'h0868,
    14'h0826,
    14'h0804,
    14'h0804,
    14'h180c,
    14'h1008,
    14'h180c,
    14'h0000,
    14'h0804,
    14'h0000,
    14'h00a6,
    14'h1008,
    14'h00c6,
    14'h0022,
    14'h0042,
    14'h102a,
    14'h0064,
    14'h10ce,
    14'h0000,
    14'h104a,
    14'h0022,
    14'h00a6,
    14'h01ae,
    14'h1194,
    14'h014a,
    14'h00a6,
    14'h014a,
    14'h012a,
    14'h0000,
    14'h0064,
    14'h0064,
    14'h00c6,
    14'h012a,
    14'h0108,
    14'h00e8,
    14'h0042,
    14'h014a,
    14'h0318,
    14'h0000,
    14'h0022,
    14'h039c,
    14'h0294,
    14'h033a,
    14'h014a,
    14'h018c,
    14'h0294,
    14'h0210,
    14'h035a,
    14'h0000,
    14'h00c6,
    14'h012a,
    14'h073c,
    14'h00a6,
    14'h0042,
    14'h014a,
    14'h06fa,
    14'h079e,
    14'h0402,
    14'h014a,
    14'h06d8,
    14'h052c,
    14'h0210,
    14'h0084,
    14'h0444,
    14'h0084,
    14'h00a6,
    14'h0108,
    14'h04ea,
    14'h0846,
    14'h0210,
    14'h07e3,
    14'h05f2,
    14'h0846,
    14'h0ccc,
    14'h0b3e,
    14'h0e16,
    14'h0c6a,
    14'h052c,
    14'h0804,
    14'h0696,
    14'h0612,
    14'h1dfe,
    14'h077e,
    14'h018c,
    14'h13a7,
    14'h182e,
    14'h1fad,
    14'h1f49,
    14'h1aa3,
    14'h0b61,
    14'h184e,
    14'h00c6,
    14'h11b6,
    14'h14f2,
    14'h0a78,
    14'h0676,
    14'h1323,
    14'h1f29,
    14'h1dfe,
    14'h0ba3,
    14'h1936,
    14'h161a,
    14'h0e16,
    14'h0e58,
    14'h0888,
    14'h0db4,
    14'h0970,
    14'h058e,
    14'h0990,
    14'h19da,
    14'h146e,
    14'h04ea,
    14'h165c,
    14'h19da,
    14'h033a,
    14'h0210,
    14'h0990,
    14'h144c,
    14'h0c06,
    14'h0108,
    14'h090c,
    14'h039c,
    14'h0b1c,
    14'h0696,
    14'h014a,
    14'h1d58,
    14'h0c48,
    14'h0c48,
    14'h1c50,
    14'h02d6,
    14'h1110,
    14'h0108,
    14'h0e9a,
    14'h0804,
    14'h1914,
    14'h0084,
    14'h0318,
    14'h1c0e,
    14'h1914,
    14'h1110,
    14'h1914,
    14'h1e1e,
    14'h1008,
    14'h0084,
    14'h1a81,
    14'h050a,
    14'h0a14,
    14'h1c0e,
    14'h1b05,
    14'h1008,
    14'h0c06,
    14'h0210,
    14'h071a,
    14'h1e1e,
    14'h1e1e,
    14'h1e1e,
    14'h090c,
    14'h0108,
    14'h0210,
    14'h1c0e,
    14'h0a14,
    14'h0804,
    14'h180c,
    14'h1008,
    14'h0612,
    14'h180c,
    14'h161a,
    14'h0e16,
    14'h1008,
    14'h1e1e,
    14'h0210,
    14'h1a1c,
    14'h140a,
    14'h0634,
    14'h0c06,
    14'h0402,
    14'h0804,
    14'h0424,
    14'h0c06,
    14'h0424,
    14'h0424,
    14'h0826,
    14'h0c06,
    14'h102a,
    14'h0402,
    14'h180c,
    14'h0804,
    14'h0042,
    14'h106c,
    14'h0c48,
    14'h1870,
    14'h1008,
    14'h0868,
    14'h182e,
    14'h0042,
    14'h0042,
    14'h1870,
    14'h1008,
    14'h102a,
    14'h1008,
    14'h102a,
    14'h0022,
    14'h00a6,
    14'h1870,
    14'h0868,
    14'h10f0,
    14'h00c6,
    14'h104a,
    14'h00e8,
    14'h102a,
    14'h108c,
    14'h00a6,
    14'h0064,
    14'h0042,
    14'h0000,
    14'h0022,
    14'h10ae,
    14'h1194,
    14'h102a,
    14'h1132,
    14'h012a,
    14'h0022,
    14'h0042,
    14'h0000,
    14'h00a6,
    14'h00a6,
    14'h01ae,
    14'h0084,
    14'h012a,
    14'h0042,
    14'h0042,
    14'h0022,
    14'h014a,
    14'h0000,
    14'h00a6,
    14'h0000,
    14'h0274,
    14'h012a,
    14'h0274,
    14'h0022,
    14'h00e8,
    14'h014a,
    14'h0000,
    14'h0274,
    14'h0232,
    14'h00a6,
    14'h012a,
    14'h02f8,
    14'h0042,
    14'h079e,
    14'h071a,
    14'h06b8,
    14'h0232,
    14'h0612,
    14'h05b0,
    14'h014a,
    14'h0232,
    14'h0108,
    14'h0084,
    14'h01f0,
    14'h012a,
    14'h018c,
    14'h0990,
    14'h09b2,
    14'h0612,
    14'h0252,
    14'h056e,
    14'h0d72,
    14'h0000,
    14'h04c8,
    14'h0c06,
    14'h0c6a,
    14'h0edc,
    14'h09b2,
    14'h0042,
    14'h00a6,
    14'h0e58,
    14'h13c7,
    14'h094e,
    14'h165c,
    14'h182e,
    14'h0232,
    14'h0dd4,
    14'h0612,
    14'h18b2,
    14'h1f29,
    14'h1a61,
    14'h016c,
    14'h0afc,
    14'h140a,
    14'h05d0,
    14'h1110,
    14'h06b8,
    14'h05f2,
    14'h1e1e,
    14'h184e,
    14'h1301,
    14'h0e9a,
    14'h1787,
    14'h094e,
    14'h02d6,
    14'h08ca,
    14'h11b6,
    14'h06fa,
    14'h0f21,
    14'h0424,
    14'h16e3,
    14'h1aa3,
    14'h039c,
    14'h1194,
    14'h073c,
    14'h108c,
    14'h108c,
    14'h1b05,
    14'h108c,
    14'h1512,
    14'h184e,
    14'h0210,
    14'h0b5e,
    14'h0804,
    14'h180c,
    14'h090c,
    14'h1fcd,
    14'h148e,
    14'h0dd4,
    14'h129c,
    14'h079e,
    14'h0000,
    14'h0888,
    14'h108c,
    14'h1194,
    14'h1787,
    14'h0b1c,
    14'h0f83,
    14'h1f07,
    14'h0084,
    14'h0402,
    14'h0000,
    14'h1110,
    14'h108c,
    14'h1512};

endmodule
