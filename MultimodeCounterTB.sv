module tbMMCounter();
  reg [1:0]controlValue=0;
  reg [3:0]initialValue=2;
  reg INIT=0;
  reg rst=1;
  wire WINNER,LOSER;
  
  clock #(1) c(clk);
  multimodeCounter#(4) mmc(controlValue,initialValue,INIT,WINNER,LOSER,clk,rst);
  
  initial begin
    #2
    rst=0;
    INIT=1;
    initialValue=10;
    #2
    INIT=0;
    #10
    controlValue=1;
    #16
    controlValue=2;
    #30
    controlValue=3;
    
  end
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
    #80 $finish;
  end
endmodule