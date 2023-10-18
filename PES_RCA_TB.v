module PES_RCA_TB ();

reg [3:0] in0 = 4'b0, in1 = 4'b0;
wire [3:0] out;
wire cout;

PES_RCA rca(.in0(in0), .in1(in1), .out(out), .cout(cout));

initial repeat(255) #10 {in0,in1} = {in0,in1} + 8'b1;

initial begin
    $dumpfile("PES_RCA_TB.vcd");
    $dumpvars(0, PES_RCA_TB);
    //$monitor($time, ": %b + %b = %b, %b", in0, in1, out, cout);
end

endmodule
