// STAGE 3: EXECUTION UNIT:
// Performs suitable operations on data arriving from the instruction decode unit
// Control signals in this unit are ALU Src, ALU operation
// PC source for program counter control will be implemented in another module

module Execution_Unit(Read_Data_1,Read_Data_2, Gen_Imm_Data, ALU_Src, ALU_op, ALU_result);

//Declare input signals
input [7:0] Read_Data_1;
input [7:0] Read_Data_2;
input [7:0] Gen_Imm_Data;
input ALU_Src; // Generated by the control unit;
input ALU_op; // Generated by the arithmetic control unit; controls which operation to perform in the ALU

//Declare output signals
output [7:0] ALU_result;

// Declare intermediate signals
wire [7:0] Read_Dat_2;

assign Read_Dat_2=ALU_Src?Gen_Imm_Data:Read_Data_2; // implement the MUX to select which line goes as second ALU input

// instantiate the ALU module to generate the ALU result and zero signals
ALU_design EX(Read_Data_1, Read_Dat_2, ALU_op, ALU_result);

endmodule