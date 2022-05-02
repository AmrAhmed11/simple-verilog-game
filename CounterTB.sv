module tbCounter();
  reg WINNER=1'b0;
  reg LOSER =1'b0;
  reg rst=1'b1;
  wire GAMEOVER;
  wire [1:0] WHO;
  
  clock #(1) c(clk);
  counter #(15) C1(WINNER ,LOSER ,clk,GAMEOVER,WHO,rst);
  always begin
    #2
    rst=0;
  end
  
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars;
    #70 $finish;
  end
endmodule