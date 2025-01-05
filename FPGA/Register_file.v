`timescale 1ns / 1ps


module Register_file (
    input [4:0] read1, read2, write_register,
    input clk, WEn,
    input [63:0] Write_data,
    output reg [63:0] Data1, Data2
);
    reg [63:0] registers [31:0];
   
   
    always @(posedge clk)
    begin
        if (WEn)
        begin
            registers[write_register] <= Write_data;
        end
        else
        begin
            registers[write_register] <= registers[write_register];
        end
    end
       
    always@(*)
    begin
        Data1 = registers[read1];
        Data2 = registers[read2];
    end
    


endmodule
