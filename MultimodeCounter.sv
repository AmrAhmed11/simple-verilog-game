/*Multimode Counter: counter can count up/down by one/two
**controlValue: the value that controls the counter modes
**			 	0: count up by one
**			 	1: count up by two
**			 	2: count down by one
**			 	3: count down by two
**initialValue: the value to be loaded in the counter if INIT is high
**INIT: signal indicate when to load initialValue
**		high:load initialValue to the counter buffer
**WINNER: signal indicates when the counter hits all 1s
**LOSER: signal indicates when the counter hits all 0s
**clk: input clock to the module
**rst: high reset signal
**		high: reset
*/
module multimodeCounter#(parameter INPUT=4)(controlValue,initialValue,INIT,WINNER,LOSER,clk,rst);
  input wire [1:0]controlValue;
  input wire [INPUT-1:0]initialValue;
  input wire INIT,clk,rst;
  output reg LOSER=1'b0;
  output reg WINNER=1'b0;
  
  //the value of the counter
  reg [INPUT-1:0]count ={INPUT{1'b0}};
  
  //setting the initial value after a reset
  always @(negedge rst)begin
    if(INIT)begin
      count = initialValue;
    end
  end
  
  //checking the inputs and setting the outputs
  always @(posedge clk or posedge rst or posedge INIT)begin
    if (rst) begin
      count={INPUT{1'b0}};
    end
    else if (INIT)begin
      count = initialValue;
    end
    else begin
      case (controlValue)
        2'b00:count =count + 1;
        2'b01:count =count + 2;
        2'b10:count =count - 1;
        2'b11:count =count - 2;
      endcase
  	end
    if(rst)begin
      LOSER=0;
      WINNER=0;
    end
    else if(count=={INPUT{1'b0}})begin
      LOSER=1;
      WINNER=0;
    end
    else if(count=={INPUT{1'b1}})begin
      LOSER=0;
      WINNER=1;
    end
    else begin
      LOSER=0;
      WINNER=0;
    end
  end
endmodule