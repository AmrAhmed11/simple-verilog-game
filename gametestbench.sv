module testgame();
  parameter INPUT=4;
  parameter TARGET=15;
  reg [1:0]controlValue = 2'b00;
  reg [INPUT-1:0]initialValue = 4'b1000;
  reg INIT=1'b0;
  wire WINNER,LOSER,GAMEOVER,clk;
  wire [1:0]WHO;
  reg rst=1;

  initial begin
  	#1 INIT=1;
    #1 rst=0;
    #1 INIT=0;
    #14 
    INIT=1;
    controlValue = 2'b01;
    #2 INIT=0;
    #6 
    INIT=1;
    controlValue=2'b10;
    #2 INIT=0;
    #14 
    INIT=1;
    controlValue=2'b11;
    #2 INIT=0;
    #6 
    INIT=1;
    controlValue=2'b00;
    #2 INIT=0;
    #14 
    INIT=1;
    initialValue = 4'b1110;
    #2 INIT=0;
    #13 rst=1;
    #20 rst=0;
    #10 INIT=1;
    #10 INIT=0;
    #30 
    rst=1;
    controlValue=2'b01;
    #2 rst=0;
    #248 
    rst=1;
	initialValue=4'b0001;
    controlValue=2'b11;
    #2 
    INIT=1;
    rst=0;
    #2 INIT=0;
  end
  clock c(clk);
  GAME #(INPUT,TARGET) GSB(controlValue,initialValue,INIT,WINNER,LOSER,GAMEOVER,WHO,clk,rst);
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
    #700 $finish;
  end
endmodule

module clock#(CYCLE=1)(clk);
  output reg clk=1'b0;
  always begin
    #CYCLE clk = ~clk;
  end
endmodule