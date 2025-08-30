`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2024 01:46:50 PM
// Design Name: 
// Module Name: EVM
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
module freq(clk,clkout);
input clk;
output reg clkout =0;
reg[31:0]count=0;
always @ (posedge clk)
begin
if(count == 100000000)
begin
clkout = ~ clkout;
count = 0;
end
else 
count = count +1;
end
endmodule 

module EVM(
    input clk,            // Clock signal
    input reset,          // Reset signal
    input [1:0] candidate, // Candidate selection (2 bits for 4 candidates)
    input vote,           // Vote button press (active high)
    output reg [2:0] vote_count_1, // Vote count for candidate 1
    output reg [2:0] vote_count_2, // Vote count for candidate 2
    output reg [2:0] vote_count_3, // Vote count for candidate 3
    output reg [2:0] vote_count_4, // Vote count for candidate 4
    output reg [1:0] winner  ,// Winner (1: candidate 1, 2: candidate 2, etc.)
    output clkout     
);
 freq m1(clk,clkout);

    // Register to hold the number of votes
    always @(posedge clkout or posedge reset) begin
        if (reset) begin
            // Reset vote counts
            vote_count_1 <= 3'b000;
            vote_count_2 <= 3'b000;
            vote_count_3 <= 3'b000;
            vote_count_4 <= 3'b000;
            winner <= 2'b00;  // No winner
        end else if (vote) begin
            // Increment vote count based on the candidate
            case (candidate)
                2'b00: vote_count_1 <= vote_count_1 + 1;
                2'b01: vote_count_2 <= vote_count_2 + 1;
                2'b10: vote_count_3 <= vote_count_3 + 1;
                2'b11: vote_count_4 <= vote_count_4 + 1;
                default: ;
            endcase
        end
    end

    // Determine winner
    always @(*) begin
        if (vote_count_1 >= vote_count_2 && vote_count_1 >= vote_count_3 && vote_count_1 >= vote_count_4)
            winner = 2'b00;  // Candidate 1 wins
        else if (vote_count_2 >= vote_count_1 && vote_count_2 >= vote_count_3 && vote_count_2 >= vote_count_4)
            winner = 2'b01;  // Candidate 2 wins
        else if (vote_count_3 >= vote_count_1 && vote_count_3 >= vote_count_2 && vote_count_3 >= vote_count_4)
            winner = 2'b10;  // Candidate 3 wins
        else if (vote_count_4 >= vote_count_1 && vote_count_4 >= vote_count_2 && vote_count_4 >= vote_count_3)
            winner = 2'b11;  // Candidate 4 wins
        else
            winner = 2'b00;  // Default to candidate 1 if there's a tie
    end
endmodule

