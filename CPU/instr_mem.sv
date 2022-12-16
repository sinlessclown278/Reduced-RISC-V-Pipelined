module instr_mem #(
    parameter D_WIDTH = 8, // For byte addressing
//              A_WIDTH = 12, //Due to memory map, instr mem has 000 to FFF, so 12 bits
              EXT_WIDTH = 32 //Signals from PC and the output are both 32 bits
) (
    input logic [EXT_WIDTH-1:0] A,
    output logic [EXT_WIDTH-1:0] RD //output is 32 bits
);

//logic [A_WIDTH-1:0] Addr = A[A_WIDTH-1:0];
//logic [D_WIDTH-1:0] rom_array [2**A_WIDTH-1:0]; //each data stored is 8bits, and the rom size is 2^12 bits
logic [D_WIDTH-1:0] rom_array [32'hBFC00FFF : 32'hBFC00000]; //each data stored is 8bits, and the rom size is 2^12 bits

initial begin
    //$readmemh("assembly.s.hex", rom_array); //read from this hex file
    $readmemh("pdf.hex", rom_array); //read from this hex file
end

//assign RD = {rom_array [Addr + 3], rom_array [Addr + 2], rom_array [Addr + 1], rom_array [Addr]};
assign RD = {rom_array [A + 3], rom_array [A + 2], rom_array [A + 1], rom_array [A]};

endmodule