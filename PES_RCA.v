module PES_RCA(in0, in1, out, cout);
	input [3:0] in0;
	input [3:0] in1;
	output [3:0] out;
	output cout;

	wire c1, c2, c3;
	PES_FA fa0(in0[0], in1[0], 0, out[0], c1);
	PES_FA fa1(in0[1], in1[1], c1, out[1], c2);
	PES_FA fa2(in0[2], in1[2], c2, out[2], c3);
	PES_FA fa3(in0[3], in1[3], c3, out[3], cout);

endmodule
