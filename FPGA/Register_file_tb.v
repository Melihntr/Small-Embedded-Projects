`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2024 06:28:40 PM
// Design Name: 
// Module Name: Register_file_tb
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


module Register_file_tb(
    );
    
    reg [4:0] read_register1, read_register2, write_register;
    reg clk, WEn;
    reg [63:0] Write_data;
    wire [63:0] Data1, Data2;
    
    Register_file uut(
        .read1(read_register1),
        .read2(read_register2),
        .write_register(write_register),
        .clk(clk),
        .WEn(WEn),
        .Write_data(Write_data),
        .Data1(Data1),
        .Data2(Data2)
    );
    
    always #10 clk = ~clk;
        
    
    initial
    begin
         clk = 0;
         WEn  = 0;
         write_register = 0;
         Write_data = 0;
         read_register1 = 0;
         read_register2 = 0;
         
         
         #10 WEn = 1;
         #5 write_register = 5;
         #5 Write_data = 64'b0110; 
         #10;
         #5 write_register = 3;
         #5 Write_data = 64'hABCDFE; 
         #10;  
         
         #5 read_register1 = 5;
            read_register2 = 3; 
         #15; 
    
        
         #5 WEn = 0;
         #5 write_register = 7;
         #5 Write_data = 64'd26; 
         #20;
         $finish;
    end
    
    
    
    
endmodule
