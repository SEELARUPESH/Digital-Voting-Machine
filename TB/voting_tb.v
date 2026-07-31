`timescale 1ns/1ps

module voting_tb;

//=====================================================
// Testbench Signals
//=====================================================

reg clk;
reg reset;
reg vote_button;
reg show_result;
reg [1:0] candidate;

wire [6:0] seg;

wire [7:0] countA;
wire [7:0] countB;
wire [7:0] countC;
wire [7:0] countD;

//=====================================================
// Instantiate DUT
//=====================================================

top DUT(

    .clk(clk),
    .reset(reset),
    .vote_button(vote_button),
    .show_result(show_result),
    .candidate(candidate),

    .seg(seg),

    .countA(countA),
    .countB(countB),
    .countC(countC),
    .countD(countD)

);

//=====================================================
// Clock Generation
//=====================================================

initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

//=====================================================
// Waveform
//=====================================================

initial
begin
    $dumpfile("voting.vcd");
    $dumpvars(0, voting_tb);
end

//=====================================================
// Monitor
//=====================================================

initial
begin

$monitor("Time=%0t | A=%0d B=%0d C=%0d D=%0d | Candidate=%b | Vote=%b | Result=%b",

$time,
countA,
countB,
countC,
countD,
candidate,
vote_button,
show_result);

end

//=====================================================
// Test Cases
//=====================================================

initial
begin

$display("========================================");
$display("Digital Voting Machine Simulation");
$display("========================================");

reset = 1;
vote_button = 0;
show_result = 0;
candidate = 2'b00;

#20;
reset = 0;

//------------------------------------
// Vote Candidate A
//------------------------------------

candidate = 2'b00;
vote_button = 1;
#40;
vote_button = 0;
#40;

//------------------------------------
// Vote Candidate B
//------------------------------------

candidate = 2'b01;
vote_button = 1;
#40;
vote_button = 0;
#40;

//------------------------------------
// Vote Candidate C
//------------------------------------

candidate = 2'b10;
vote_button = 1;
#40;
vote_button = 0;
#40;

//------------------------------------
// Vote Candidate D
//------------------------------------

candidate = 2'b11;
vote_button = 1;
#40;
vote_button = 0;
#40;

//------------------------------------
// Additional Votes
//------------------------------------

candidate = 2'b00;
vote_button = 1;
#40;
vote_button = 0;
#40;

candidate = 2'b00;
vote_button = 1;
#40;
vote_button = 0;
#40;

candidate = 2'b10;
vote_button = 1;
#40;
vote_button = 0;
#40;

//------------------------------------
// Display Result
//------------------------------------

show_result = 1;
#100;

show_result = 0;

#50;

$display("========================================");
$display("Simulation Completed Successfully");
$display("========================================");

$finish;

end

endmodule