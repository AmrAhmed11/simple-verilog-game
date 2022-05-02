/*Counter: counts the number of times a signal goes high for two signals
**WINNER/LOSER: signals to count when hit high
**GAMEOVER: set high when one of the two signals WINNER/LOSER hit high 15 times
**WHO: signal indicates who won the game
**		00:no one yet
**      01:LOSER won
**      10:WINNER won
*/
module counter#(parameter TARGET=15)(WINNER,LOSER,clk,GAMEOVER,WHO,rst);
  input wire WINNER,LOSER,rst,clk;
  output reg GAMEOVER=1'b0;
  output reg [1:0]WHO=2'b00;
  
  //the value of the counter for signal1 "WINNER"
  reg [3:0]countW = 0;
  
  //the value of the counter for signal2 "LOSER"
  reg [3:0]countL = 0;
  
  //checking the inputs and setting the outputs
  always@(posedge clk or posedge rst) begin
    if(rst | GAMEOVER) begin
      countW=0;
      countL=0;
      GAMEOVER=0;
      WHO=0;
    end
    else if(WINNER)begin
      countW = countW+1;
      if (countW == TARGET) begin
        GAMEOVER=1'b1;
        WHO = 2'b10;
      end
    end
    else if(LOSER)begin
      countL=countL+1;
      if(countL==TARGET)begin
        GAMEOVER=1'b1;
        WHO=2'b01;
      end
    end
  end
endmodule