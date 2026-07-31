module top(

    input clk,
    input reset,
    input vote_button,
    input show_result,
    input [1:0] candidate,

    output [6:0] seg,

    output [7:0] countA,
    output [7:0] countB,
    output [7:0] countC,
    output [7:0] countD

);

//=====================================================
// Internal Signals
//=====================================================

wire debounced_vote;
wire count_enable;
wire result_enable;

wire [7:0] memA;
wire [7:0] memB;
wire [7:0] memC;
wire [7:0] memD;

wire [3:0] winner;

//=====================================================
// Debounce Module
//=====================================================

debounce DB(

    .clk(clk),
    .reset(reset),
    .button(vote_button),
    .button_out(debounced_vote)

);

//=====================================================
// Voting FSM
//=====================================================

vote_fsm FSM(

    .clk(clk),
    .reset(reset),
    .vote_enable(debounced_vote),
    .show_result(show_result),

    .count_enable(count_enable),
    .result_enable(result_enable)

);

//=====================================================
// Vote Counter
//=====================================================

vote_counter VC(

    .clk(clk),
    .reset(reset),
    .vote_enable(count_enable),
    .candidate(candidate),

    .countA(countA),
    .countB(countB),
    .countC(countC),
    .countD(countD)

);

//=====================================================
// Secure Memory
//=====================================================

secure_memory MEM(

    .clk(clk),
    .reset(reset),
    .store_enable(count_enable),

    .countA_in(countA),
    .countB_in(countB),
    .countC_in(countC),
    .countD_in(countD),

    .countA_mem(memA),
    .countB_mem(memB),
    .countC_mem(memC),
    .countD_mem(memD)

);

//=====================================================
// Winner Logic
//=====================================================

winner_logic WL(

    .countA(memA),
    .countB(memB),
    .countC(memC),
    .countD(memD),

    .winner(winner)

);

//=====================================================
// Seven Segment Display
//=====================================================

seven_segment SSD(

    .digit(winner),
    .seg(seg)

);

endmodule