// module PES_RCA(in0, in1, out, cout);
	// input [3:0] in0;
	// input [3:0] in1;
	// output [3:0] out;
	// output cout;

	// wire c1, c2, c3;
	// PES_FA fa0(in0[0], in1[0], 0, out[0], c1);
	// PES_FA fa1(in0[1], in1[1], c1, out[1], c2);
	// PES_FA fa2(in0[2], in1[2], c2, out[2], c3);
	// PES_FA fa3(in0[3], in1[3], c3, out[3], cout);

//endmodule


module PES_RCA(
  input wire [3:0] A,
  input wire [3:0] B,
  input wire clk,
  output wire [3:0] S,
  output wire Cout
);

  wire [3:0] carry;
  
  assign S = A + B;
  
  assign carry[0] = A[0] & B[0];
  assign carry[1] = (A[1] & B[1]) | (A[0] & B[1]) | (A[1] & B[0]);
  assign carry[2] = (A[2] & B[2]) | (A[1] & B[2]) | (A[2] & B[1]) | (A[0] & B[2]) | (A[2] & B[0]);
  assign carry[3] = (A[3] & B[3]) | (A[2] & B[3]) | (A[3] & B[2]) | (A[1] & B[3]) | (A[3] & B[1]) | (A[0] & B[3]) | (A[3] & B[0]);

  assign Cout = carry[3];

endmodule

