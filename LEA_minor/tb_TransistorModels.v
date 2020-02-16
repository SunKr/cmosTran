////////////////////////////////////////////////////////////////////////////////////////////////////
// Filename:         tb_TransistorModels.v
// Author:           Addison Ferrari
// Created:          30 May 2019
// Version:          3 (Modified on 7 January 2020 by KLC)
// Description:      Test bench for the transistor models of your logic gates and the SOP function
////////////////////////////////////////////////////////////////////////////////////////////////////

/* Test Bench Instructions for Students:
   - Compile and simulate this file to test the modules that you wrote in your source file.
   - You SHOULD NOT MAKE ANY ADDITIONS OR CHANGES to this file.
*/

module tb_TransistorModels();

// The regs below act like probes that are connected to drive the inputs of your modules.
// abc is a 3-bit input, ab is a 2-bit input, and a is a 1-bit input.
// STUDENT: DO NOT ALTER ANY OF THE reg DECLARATIONS MADE BELOW!

   reg [3:0] count;
   reg       a;		// A scalar that represents the input to your inverter.
   reg [1:0] ab;	// A 2-bit vector whose components represent the common inputs to your 2-input gates
   reg [2:0] abc;	// A 3-bit vector whose components represent the inputs to your SOP circuit.

// The wires below act like probes that are connected to read the outputs of the modules.
// STUDENT: DO NOT ALTER THE wire DECLARATIONS ALREADY MADE BELOW!

   wire      notOut, nandOut, norOut, andOut, orOut, xnorOut, sopOut;

// Module Instances: The modules of your source file are already instantiated here.
// Each instance represents one of the CMOS circuits you made in your Verilog source file.
// The instances declared here have already been connected to the components of the appropriate reg as inputs.
// Each instance already drives a wire that corresponds to the output for that instance.
// STUDENT: DO NOT ALTER ANY OF THE MODULE INSTANCES SHOWN BELOW

   not_t  g1(notOut, a);
   nand_t g2(nandOut, ab[1], ab[0]);
   nor_t  g3(norOut, ab[1], ab[0]);
   and_t  g4(andOut, ab[1], ab[0]);
   or_t   g5(orOut, ab[1], ab[0]);
   xnor_t g6(xnorOut, ab[1], ab[0]);
   sop_t  g7(sopOut, abc[2], abc[1], abc[0]);

// STUDENT: DO NOT MODIFY ANY OF THE CODE BELOW THIS COMMENT
   initial begin
      abc = 3'b000;
      for(count = 0; count < 8; count = count + 1) begin
         abc = count[2:0];
         ab  = count[2:1];
         a   = count[2];
         #100;
      end
   end

endmodule
