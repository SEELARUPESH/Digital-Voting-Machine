module vote_counter(
    input clk,
    input reset,
    input vote_enable,
    input [1:0] candidate,

    output reg [7:0] countA,
    output reg [7:0] countB,
    output reg [7:0] countC,
    output reg [7:0] countD
);

always @(posedge clk or posedge reset)
begin

    if(reset)
    begin
        countA <= 8'd0;
        countB <= 8'd0;
        countC <= 8'd0;
        countD <= 8'd0;
    end

    else if(vote_enable)
    begin

        case(candidate)

            2'b00:
                countA <= countA + 1;

            2'b01:
                countB <= countB + 1;

            2'b10:
                countC <= countC + 1;

            2'b11:
                countD <= countD + 1;

            default:
            begin
                countA <= countA;
                countB <= countB;
                countC <= countC;
                countD <= countD;
            end

        endcase

    end

end

endmodule