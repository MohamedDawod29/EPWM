// enhanced PWM 

module EPWM 
					#(parameter n = 8 , TimerCn = 16)
					(
					input clk,reset_n,
					output  PWM_out,
					input [n:0] duty,
					input [TimerCn-1:0] final_value 
					
					);
					
					
					reg [n-1:0] Q;
					wire done_enable,PWM_out_C;
					
					
					TimerC #(.n(TimerCn)) Timer0
					(
					.clk(clk),
					.reset_n(reset_n),
					.final_value(final_value),
					.done(done_enable)
					);
					
					
					always @ (posedge clk,negedge reset_n)
					begin
					  if (~reset_n)
					   Q <= 'b0;
					  else if (done_enable)
					   Q <= Q+1;
					  else
					   Q <= Q;
					end
					
					assign PWM_out_C = (Q < duty) ? 1'b1:1'b0;
					
					MyDFF DFF0
					(
					.clk(clk),
					.reset_n(reset_n),
					.D(PWM_out_C),
					.q(PWM_out)
					);
endmodule
