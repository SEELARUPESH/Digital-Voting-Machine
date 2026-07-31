module vote_fsm(
    input clk,
    input reset,
    input vote_enable,
    input show_result,

    output reg count_enable,
    output reg result_enable
);

// State Encoding
parameter IDLE        = 2'b00;
parameter WAIT_VOTE   = 2'b01;
parameter STORE_VOTE  = 2'b10;
parameter SHOW_RESULT = 2'b11;

reg [1:0] current_state;
reg [1:0] next_state;

// State Register
always @(posedge clk or posedge reset)
begin
    if(reset)
        current_state <= IDLE;
    else
        current_state <= next_state;
end

// Next State Logic
always @(*)
begin
    case(current_state)

        IDLE:
        begin
            if(vote_enable)
                next_state = STORE_VOTE;
            else if(show_result)
                next_state = SHOW_RESULT;
            else
                next_state = IDLE;
        end

        STORE_VOTE:
            next_state = WAIT_VOTE;

        WAIT_VOTE:
        begin
            if(!vote_enable)
                next_state = IDLE;
            else
                next_state = WAIT_VOTE;
        end

        SHOW_RESULT:
        begin
            if(!show_result)
                next_state = IDLE;
            else
                next_state = SHOW_RESULT;
        end

        default:
            next_state = IDLE;

    endcase
end

// Output Logic
always @(*)
begin

    count_enable  = 0;
    result_enable = 0;

    case(current_state)

        STORE_VOTE:
            count_enable = 1;

        SHOW_RESULT:
            result_enable = 1;

    endcase

end

endmodule