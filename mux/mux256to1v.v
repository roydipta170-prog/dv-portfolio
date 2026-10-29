
module tb;
reg [1023:0] in;
reg [7:0] sel;
wire [3:0] out;
integer i, errors;
reg [3:0] expected;
top_module dut ( .in(in), .sel(sel), .out(out) );
initial begin
errors=0;
for ( i=0; i<256; i=i+1) begin

{sel}=i;
in=0; in[i*4+:4]=4'b1010;
expected=4'b1010;
#1
if (out!==expected)begin
errors=errors+1;
$display ("FAIL expected=%b sel=%b out=%b", expected, sel, out);
end 
end
for ( i=0; i<256; i=i+1) begin
{sel}=i;
in={1024{1'b1}}; in[i*4+:4]=4'b0101;
expected=4'b0101;
#1
if (out!==expected)begin
errors=errors+1;
$display ("FAIL expected=%b sel=%b out=%b", expected, sel, out);
end 
end
$display("tests:512, Errors=%0d", errors);
end 
endmodule
