module add32_gen(/*AUTOARG*/
		 // Outputs
		 sum,
		 // Inputs
		 i0, i1
		 );
   parameter N = 32;
   input [N-1:0] i0, i1;
   output [N-1:0] sum;

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [N:0]	  c;			// From add of fulladder.v
   wire [N-1:0]	  r;			// From add of fulladder.v
   // End of automatics
   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   // End of automatics

   genvar	  i;
   generate
      for(i = 0; i < N; i  = i + 1) 
	begin : adder
	   fulladder add(/*AUTOINST*/
			 // Outputs
			 .r			(sum[i]),
			 .co			(c[i+1]),
			 // Inputs
			 .a			(i0[i]),
			 .b			(i1[i]),
			 .ci			(c[i]));
	end
   endgenerate

   assign c[0] = 0;
endmodule // add32_gen

module fulladder (a, b, ci, r, co);
   input a, b, ci;
   output r, co;

   assign r = a^b^ci;
   assign co = (a&b)|((a^b)&ci);
endmodule

