`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2024 05:12:11 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [63 : 0] data1, data2,
    input [1 : 0] ALUop,
    output reg isZero,
    output reg [63 : 0] result
    );
    
    always@(*)
    begin
      if(data2 ==0)
        isZero = 1;
      else
        isZero = 0;
      
      case(ALUop)
        2'b00: result = data1 + data2;
        2'b01: result = data1 - data2;
        2'b10: result = data1 & data2;
        2'b11: result = data1 | data2;
      endcase
        
    end
    
endmodule
