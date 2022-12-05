module control #(
    parameter A_WIDTH = 32
)(
    input logic Zero, //what does this do?
    input logic [A_WIDTH-1:0] Instr, //will need more than this later , for fn3 and 7

    output logic PCSrc, 
    output logic ResultSrc,
    output logic MemWrite,
    output logic [2:0] ALUControl,
    output logic ALUSrc,
    output logic [1:0] ImmSrc,  
    output logic RegWrite                
);

logic [1:0] ALUOp; 

decodemain dmain(
    .opcode(Instr[6:0]),
    .Zero(Zero),
    .PCSrc(PCSrc), 
    .ResultSrc(ResultSrc),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .ImmSrc(ImmSrc),  
    .RegWrite(RegWrite),
    .ALUOp(ALUOp)
);

decodealu dalu(
    .opcode(Instr[6:0]),
    .ALUOp(ALUOp),
    .fn3(Instr[14:12]),
    .fn7(Instr[31:25]),
    .ALUControl(ALUControl)
);

endmodule
