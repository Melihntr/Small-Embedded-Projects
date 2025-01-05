`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2024 05:18:03 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
    input [10 : 0] opCode,
    input isZero,
    output reg M1, M2, M3, M4, M5, RwEn, DwEn, DrEn,
    output  reg [1 : 0] ALUop
    );
    
    localparam ADD = 11'b 10001011000; 
    localparam SUB = 11'b 11001011000;
    localparam AND = 11'b 10001010000;
    localparam ORR = 11'b 10101010000;
    localparam LDUR = 11'b 11111000010;
    localparam STUR = 11'b 11111000000;
    localparam CBZ = 8'b 10110100;
    localparam B = 6'b 000101;
    
    always@(*)
    begin
        case(opCode)
            ADD: begin
                M1 = 0; M2 = 1; M3 = 0; M5 = 0; RwEn = 1; DwEn = 0; DrEn = 0; ALUop = 2'B00;
                end
            SUB: begin
                M1 = 0; M2 = 1; M3 = 0; M5 = 0; RwEn = 1; DwEn = 0; DrEn = 0; ALUop = 2'B01;
                end
            AND: begin
                M1 = 0; M2 = 1; M3 = 0; M5 = 0; RwEn = 1; DwEn = 0; DrEn = 0; ALUop = 2'B10;
                end
            ORR: begin
                M1 = 0; M2 = 1; M3 = 0; M5 = 0; RwEn = 1; DwEn = 0; DrEn = 0; ALUop = 2'B11;
                end
            LDUR: begin
                M1 = 1; M2 = 0; M4 = 2'b00; M5 = 0; RwEn = 1; DwEn = 0; DrEn = 1; ALUop = 2'B00;
                end
            STUR: begin
                M1 = 1; M3 = 1; M4 = 2'b00; M5 = 0; RwEn = 0; DwEn = 1; DrEn = 0; ALUop = 2'B00;
                end
            CBZ: begin
                M1 = 0; M3 = 1; M4 = 2'b01; M5 = isZero; RwEn = 0; DwEn = 0; DrEn = 0;
                end
            B: begin
                M4 = 2'b10; M5 = 1; RwEn = 0; DwEn = 0; DrEn = 0;
                end
            
            
        endcase
    end
    
    
endmodule
