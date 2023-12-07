module timer (clk, sw, reset, pause, hex0, hex1); //this is the top_module.. feel free to make it a different folder 
input clk;
input sw;
input reset;
input pause;
wire clk_out;
wire [4 : 0] seconds_counter;
wire [3 : 0] ones, tens;
output [6 : 0] hex0;
output [6 : 0] hex1;
  
ClockDivider instance1(clk, clk_out);
clock_timer instance2(clk_out, seconds_counter, sw, reset, pause);
bcd instance3(seconds_counter, ones, tens, hundreds);

assign hex0[0] = ~((~ones[3] & ~ones[2] & ones[1] & ~ones[0]) | (~ones[3] & ~ones[2] & ones[1] &
ones[0]) | (~ones[3] & ones[2] & ~ones[1] & ones[0]) | (~ones[3] & ones[2] & ones[1] & ~ones[0]) |
(~ones[3] & ones[2] & ones[1] & ones[0]) | (ones[3] & ~ones[2] & ~ones[1] & ~ones[0]) | (ones[3] &
~ones[2] & ~ones[1] & ones[0]) | (ones[3] & ~ones[2] & ones[1] & ~ones[0]) | (ones[3] & ones[2] &
~ones[1] & ~ones[0]) | (ones[3] & ones[2] & ones[1] & ~ones[0]) | (ones[3] & ones[2] & ones[1] &
ones[0]) | (~ones[3] & ~ones[2] & ~ones[1] & ~ones[0]));
assign hex0[1] = ~((~ones[3] & ~ones[2] & ~ones[1] & ones[0]) | (~ones[3] & ~ones[2] & ones[1] &
~ones[0]) | (~ones[3] & ~ones[2] & ones[1] & ones[0]) | (~ones[3] & ones[2] & ~ones[1] & ~ones[0]) |
(~ones[3] & ones[2] & ones[1] & ones[0]) | (ones[3] & ~ones[2] & ~ones[1] & ~ones[0]) | (ones[3] &
~ones[2] & ~ones[1] & ones[0]) | (ones[3] & ~ones[2] & ones[1] & ~ones[0]) | (ones[3] & ones[2] &
~ones[1] & ones[0]) | (~ones[3] & ~ones[2] & ~ones[1] & ~ones[0]));
assign hex0[2] = ~((~ones[3] & ~ones[2] & ~ones[1] & ones[0]) | (~ones[3] & ~ones[2] & ones[1] &
ones[0]) | (~ones[3] & ones[2] & ~ones[1] & ~ones[0]) | (~ones[3] & ones[2] & ~ones[1] & ones[0]) |
(~ones[3] & ones[2] & ones[1] & ~ones[0]) | (~ones[3] & ones[2] & ones[1] & ones[0]) | (ones[3] &
~ones[2] & ~ones[1] & ~ones[0]) | (ones[3] & ~ones[2] & ~ones[1] & ones[0]) | (ones[3] & ~ones[2] &
ones[1] & ~ones[0]) | (ones[3] & ~ones[2] & ones[1] & ones[0]) | (ones[3] & ones[2] & ~ones[1] &
ones[0]) | (~ones[3] & ~ones[2] & ~ones[1] & ~ones[0]));
assign hex0[3] = ~((~ones[3] & ~ones[2] & ones[1] & ~ones[0]) | (~ones[3] & ~ones[2] & ones[1] &
ones[0]) | (~ones[3] & ones[2] & ~ones[1] & ones[0]) | (~ones[3] & ones[2] & ones[1] & ~ones[0]) |
(ones[3] & ~ones[2] & ~ones[1] & ~ones[0]) | (ones[3] & ~ones[2] & ~ones[1] & ones[0]) | (ones[3] &
~ones[2] & ones[1] & ones[0]) | (ones[3] & ones[2] & ~ones[1] & ~ones[0]) | (ones[3] & ones[2] &
~ones[1] & ones[0]) | (ones[3] & ones[2] & ones[1] & ~ones[0]) | (~ones[3] & ~ones[2] & ~ones[1] &
~ones[0]));
assign hex0[4] = ~((~ones[3] & ~ones[2] & ones[1] & ~ones[0]) | (~ones[3] & ones[2] & ones[1] &
~ones[0]) | (ones[3] & ~ones[2] & ~ones[1] & ~ones[0]) | (ones[3] & ~ones[2] & ones[1] & ~ones[0]) |
(ones[3] & ~ones[2] & ones[1] & ones[0]) | (ones[3] & ones[2] & ~ones[1] & ~ones[0]) | (ones[3] &
ones[2] & ~ones[1] & ones[0]) | (ones[3] & ones[2] & ones[1] & ~ones[0]) | (ones[3] & ones[2] &
ones[1] & ones[0]) | (~ones[3] & ~ones[2] & ~ones[1] & ~ones[0]));
assign hex0[5] = ~((~ones[3] & ones[2] & ~ones[1] & ~ones[0]) | (~ones[3] & ones[2] & ~ones[1] &
ones[0]) | (~ones[3] & ones[2] & ones[1] & ~ones[0]) | (ones[3] & ~ones[2] & ~ones[1] & ~ones[0]) |
(ones[3] & ~ones[2] & ~ones[1] & ones[0]) | (ones[3] & ~ones[2] & ones[1] & ~ones[0]) | (ones[3] &
~ones[2] & ones[1] & ones[0]) | (ones[3] & ones[2] & ~ones[1] & ~ones[0]) | (ones[3] & ones[2] &
ones[1] & ~ones[0]) | (ones[3] & ones[2] & ones[1] & ones[0]) | (~ones[3] & ~ones[2] & ~ones[1] &
~ones[0]));
assign hex0[6] = (~ones[3] & ~ones[2] & ~ones[1]) | (~ones[3] & ones[2] & ones[1] & ones[0]) |
(ones[3] & ones[2] & ~ones[1] & ~ones[0]);
assign hex1[0] = ~((~tens[3] & ~tens[2] & tens[1] & ~tens[0]) | (~tens[3] & ~tens[2] & tens[1] &
tens[0]) | (~tens[3] & tens[2] & ~tens[1] & tens[0]) | (~tens[3] & tens[2] & tens[1] & ~tens[0]) |
(~tens[3] & tens[2] & tens[1] & tens[0]) | (tens[3] & ~tens[2] & ~tens[1] & ~tens[0]) | (tens[3] &
~tens[2] & ~tens[1] & tens[0]) | (tens[3] & ~tens[2] & tens[1] & ~tens[0]) | (tens[3] & tens[2] &
~tens[1] & ~tens[0]) | (tens[3] & tens[2] & tens[1] & ~tens[0]) | (tens[3] & tens[2] & tens[1] &
tens[0]));
assign hex1[1] = ~((~tens[3] & ~tens[2] & ~tens[1] & tens[0]) | (~tens[3] & ~tens[2] & tens[1] &
~tens[0]) | (~tens[3] & ~tens[2] & tens[1] & tens[0]) | (~tens[3] & tens[2] & ~tens[1] & ~tens[0]) |
(~tens[3] & tens[2] & tens[1] & tens[0]) | (tens[3] & ~tens[2] & ~tens[1] & ~tens[0]) | (tens[3] &
~tens[2] & ~tens[1] & tens[0]) | (tens[3] & ~tens[2] & tens[1] & ~tens[0]) | (tens[3] & tens[2] &
~tens[1] & tens[0]));
assign hex1[2] = ~((~tens[3] & ~tens[2] & ~tens[1] & tens[0]) | (~tens[3] & ~tens[2] & tens[1] &
tens[0]) | (~tens[3] & tens[2] & ~tens[1] & ~tens[0]) | (~tens[3] & tens[2] & ~tens[1] & tens[0]) |
(~tens[3] & tens[2] & tens[1] & ~tens[0]) | (~tens[3] & tens[2] & tens[1] & tens[0]) | (tens[3] &
~tens[2] & ~tens[1] & ~tens[0]) | (tens[3] & ~tens[2] & ~tens[1] & tens[0]) | (tens[3] & ~tens[2] &
tens[1] & ~tens[0]) | (tens[3] & ~tens[2] & tens[1] & tens[0]) | (tens[3] & tens[2] & ~tens[1] &
tens[0]));
assign hex1[3] = ~((~tens[3] & ~tens[2] & tens[1] & ~tens[0]) | (~tens[3] & ~tens[2] & tens[1] &
tens[0]) | (~tens[3] & tens[2] & ~tens[1] & tens[0]) | (~tens[3] & tens[2] & tens[1] & ~tens[0]) |
(tens[3] & ~tens[2] & ~tens[1] & ~tens[0]) | (tens[3] & ~tens[2] & ~tens[1] & tens[0]) | (tens[3] &
~tens[2] & tens[1] & tens[0]) | (tens[3] & tens[2] & ~tens[1] & ~tens[0]) | (tens[3] & tens[2] &
~tens[1] & tens[0]) | (tens[3] & tens[2] & tens[1] & ~tens[0]));
assign hex1[4] = ~((~tens[3] & ~tens[2] & tens[1] & ~tens[0]) | (~tens[3] & tens[2] & tens[1] &
~tens[0]) | (tens[3] & ~tens[2] & ~tens[1] & ~tens[0]) | (tens[3] & ~tens[2] & tens[1] & ~tens[0]) |
(tens[3] & ~tens[2] & tens[1] & tens[0]) | (tens[3] & tens[2] & ~tens[1] & ~tens[0]) | (tens[3] &
tens[2] & ~tens[1] & tens[0]) | (tens[3] & tens[2] & tens[1] & ~tens[0]) | (tens[3] & tens[2] & tens[1]
& tens[0]));
assign hex1[5] = ~((~tens[3] & tens[2] & ~tens[1] & ~tens[0]) | (~tens[3] & tens[2] & ~tens[1] &
tens[0]) | (~tens[3] & tens[2] & tens[1] & ~tens[0]) | (tens[3] & ~tens[2] & ~tens[1] & ~tens[0]) |
(tens[3] & ~tens[2] & ~tens[1] & tens[0]) | (tens[3] & ~tens[2] & tens[1] & ~tens[0]) | (tens[3] &
~tens[2] & tens[1] & tens[0]) | (tens[3] & tens[2] & ~tens[1] & ~tens[0]) | (tens[3] & tens[2] & tens[1]
& ~tens[0]) | (tens[3] & tens[2] & tens[1] & tens[0]));
assign hex1[6] = (~tens[3] & ~tens[2] & ~tens[1]) | (~tens[3] & tens[2] & tens[1] & tens[0]) | (tens[3]
& tens[2] & ~tens[1] & ~tens[0]);
endmodule


module ClockDivider(cin,cout);

input cin;
output reg cout;
reg[31:0] count;
parameter D = 32'd25000000;
always @(posedge cin)
begin
count <= count + 32'd1;
if (count >= (D-1)) begin
cout <= ~cout;
count <= 32'd0;
end
end
endmodule

module bcd(value, ones, tens);
input [4:0] value; // 5 bits
output reg [3:0] tens; // 4 bits
output reg [3:0] ones; // 4 bits
reg [6:0] temp_reg; //temporary storage
always @(*)
begin //example 255 as our input value
temp_reg=value%100; // remainder 55
tens=temp_reg/10; // the rest is ignored except 5
ones=temp_reg%10; // 5 is the remainder
end
endmodule

module clock_timer
//#(parameter clockfreq =32'd50000000)
(clk, seconds_counter, sw, reset, pause);
input clk;
input sw;
input reset;
input pause;
//localparam one_sec =clockfreq-1;
reg enable = 1;
reg [4:0] seconds; // 0-24/0-30 seconds
// creating the code for the timer
output reg [4:0] seconds_counter; //counts every clock
initial
begin
seconds_counter <= 5'd24;
//5’d24 or 24 seconds is the maximum value for the seven segment display
end
always @(*)
begin
seconds <= (~sw) ? 24:30;
end
always @(negedge pause)
begin
if (~pause)
begin
enable <= ~enable;
end
end
always @(posedge clk or negedge reset)
begin
if(~reset)
begin
seconds_counter <= seconds;
end else begin
if(enable & seconds_counter > 0) begin
seconds_counter <= seconds_counter -
1'b1;
end
end
end
endmodule
