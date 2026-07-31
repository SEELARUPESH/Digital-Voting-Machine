module secure_memory(

    input clk,
    input reset,
    input store_enable,

    input [7:0] countA_in,
    input [7:0] countB_in,
    input [7:0] countC_in,
    input [7:0] countD_in,

    output reg [7:0] countA_mem,
    output reg [7:0] countB_mem,
    output reg [7:0] countC_mem,
    output reg [7:0] countD_mem

);

always @(posedge clk or posedge reset)
begin

    if(reset)
    begin
        countA_mem <= 8'd0;
        countB_mem <= 8'd0;
        countC_mem <= 8'd0;
        countD_mem <= 8'd0;
    end

    else if(store_enable)
    begin
        countA_mem <= countA_in;
        countB_mem <= countB_in;
        countC_mem <= countC_in;
        countD_mem <= countD_in;
    end

end

endmodule