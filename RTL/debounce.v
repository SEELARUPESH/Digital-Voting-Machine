module debounce(

    input clk,
    input reset,
    input button,

    output reg button_out

);

reg [2:0] shift_reg;

always @(posedge clk or posedge reset)
begin

    if(reset)
    begin
        shift_reg  <= 3'b000;
        button_out <= 1'b0;
    end

    else
    begin
        // Shift in the latest button value
        shift_reg <= {shift_reg[1:0], button};

        // Button considered valid only after 3 stable samples
        if(shift_reg == 3'b111)
            button_out <= 1'b1;
        else if(shift_reg == 3'b000)
            button_out <= 1'b0;
    end

end

endmodule