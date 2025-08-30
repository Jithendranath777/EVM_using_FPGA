`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2024 01:47:21 PM
// Design Name: 
// Module Name: EVM_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module EVM_tb;

    reg clk;
    reg reset;
    reg [1:0] candidate;
    reg vote;
    wire [2:0] vote_count_1;
    wire [2:0] vote_count_2;
    wire [2:0] vote_count_3;
    wire [2:0] vote_count_4;
    wire [1:0] winner;

    // Instantiate the EVM module
    EVM uut (
        .clk(clk),
        .reset(reset),
        .candidate(candidate),
        .vote(vote),
        .vote_count_1(vote_count_1),
        .vote_count_2(vote_count_2),
        .vote_count_3(vote_count_3),
        .vote_count_4(vote_count_4),
        .winner(winner)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // 100 MHz clock
    end

    // Test procedure
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        candidate = 2'b00;
        vote = 0;

        // Apply reset
        reset = 1;
        #10 reset = 0;

        // Simulate voting
        #10 candidate = 2'b00; vote = 1;  // Vote for candidate 1
        #10 vote = 0;  // Reset vote
        #10 candidate = 2'b01; vote = 1;  // Vote for candidate 2
        #10 vote = 0;  // Reset vote
        #10 candidate = 2'b01; vote = 1;  // Vote for candidate 2
        #10 vote = 0;  // Reset vote
        #10 candidate = 2'b10; vote = 1;  // Vote for candidate 3
        #10 vote = 0;  // Reset vote
        #10 candidate = 2'b10; vote = 1;  // Vote for candidate 3
        #10 vote = 0;  // Reset vote
        #10 candidate = 2'b10; vote = 1;  // Vote for candidate 3
        #10 vote = 0;  // Reset vote
        #10 candidate = 2'b10; vote = 1;  // Vote for candidate 3
        #10 vote = 0;  // Reset vote
        #10 candidate = 2'b11; vote = 1;  // Vote for candidate 3
        #10 vote = 0;  // Reset vote
        // Check vote counts and winner
        #10 $display("Vote counts: C1=%d, C2=%d, C3=%d, C4=%d", vote_count_1, vote_count_2, vote_count_3, vote_count_4);
        #10 $display("Winner: Candidate %d", winner);

        // Finish simulation
        #10 $finish;
    end

endmodule
