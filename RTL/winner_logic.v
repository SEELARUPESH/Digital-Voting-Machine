module winner_logic(

    input [7:0] countA,
    input [7:0] countB,
    input [7:0] countC,
    input [7:0] countD,

    output reg [3:0] winner

);

always @(*)
begin

    winner = 4'd1;

    if(countB > countA && countB > countC && countB > countD)
        winner = 4'd2;

    else if(countC > countA && countC > countB && countC > countD)
        winner = 4'd3;

    else if(countD > countA && countD > countB && countD > countC)
        winner = 4'd4;

end

endmodule