// D Flip Flop

module MyDFF 
				(
				input clk,reset_n,D,
				output reg q
				);
				
				always @ (posedge clk , negedge reset_n)
				begin
					if (~reset_n)
						q <= 1'b0;
					else
					   q <= D;
				end
endmodule

					