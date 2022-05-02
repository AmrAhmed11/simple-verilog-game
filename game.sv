`include "MultimodeCounter.sv"
`include "Counter.sv"

/*Main Game Module
**calls multimodeCounter and counter modules
*/
module GAME#(parameter mmcINPUT = 4,parameter TARGET=15)(controlValue,initialValue,INIT,WINNER,LOSER,GAMEOVER,WHO,clk,rst);
  input wire INIT,clk;
  input wire [1:0] controlValue;
  input wire [mmcINPUT-1:0] initialValue;
  input wire rst;
  output reg WINNER,LOSER,GAMEOVER;
  output reg [1:0]WHO;
  
  multimodeCounter #(mmcINPUT) mmc(controlValue,initialValue,INIT,WINNER,LOSER,clk,rst);
  counter #(TARGET) C(WINNER,LOSER,clk,GAMEOVER,WHO,rst);
  
endmodule