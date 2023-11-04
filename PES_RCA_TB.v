// module PES_RCA_TB ();

// reg [3:0] in0 = 4'b0, in1 = 4'b0;
// wire [3:0] out;
// wire cout;

// PES_RCA rca(.in0(in0), .in1(in1), .out(out), .cout(cout));

// initial repeat(255) #10 {in0,in1} = {in0,in1} + 8'b1;

// initial begin
    // $dumpfile("PES_RCA_TB.vcd");
    // $dumpvars(0, PES_RCA_TB);
    // $monitor($time, ": %b + %b = %b, %b", in0, in1, out, cout);
// end

// endmodule

module PES_RCA_TB;

  reg [3:0] A;
  reg [3:0] B;
  reg clk;
  wire [3:0] S;
  wire Cout;

  // Instantiate the RippleCarryAdder module
  PES_RCA myAdder(
    .A(A),
    .B(B),
    .clk(clk),
    .S(S),
    .Cout(Cout)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Inverting the clock signal every 5 time units
  end

  // Test stimulus
  initial begin
    $dumpfile("PES_RCA.vcd");
    $dumpvars(0, PES_RCA_TB);
    clk = 0;
    A = 4'b1000;  // Input A = 5
    B = 4'b1000;  // Input B = 3
    #20;          // Wait for a few clock cycles
    $display("A = %b, B = %b, S = %b, Cout = %b", A, B, S, Cout);
    $finish;
  end

endmodule
