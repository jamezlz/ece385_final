module pallete(
	input  logic clk,
	input  logic [7:0] in,
	output logic [7:0] red,
	output logic [7:0] green,
	output logic [7:0] blue
);

// This module will be synthesized into a RAM
always_ff @ (negedge clk) begin
	case (in)
	8'd0: begin red <= 8'd255; green <= 8'd0; blue <= 8'd255; end
	8'd1: begin red <= 8'd0; green <= 8'd0; blue <= 8'd0; end
	8'd2: begin red <= 8'd60; green <= 8'd188; blue <= 8'd252; end
	8'd3: begin red <= 8'd0; green <= 8'd88; blue <= 8'd248; end
	8'd4: begin red <= 8'd255; green <= 8'd255; blue <= 8'd255; end
	8'd5: begin red <= 8'd216; green <= 8'd216; blue <= 8'd216; end
	8'd6: begin red <= 8'd252; green <= 8'd252; blue <= 8'd252; end
	8'd7: begin red <= 8'd88; green <= 8'd248; blue <= 8'd152; end
	8'd8: begin red <= 8'd0; green <= 8'd136; blue <= 8'd136; end
	8'd9: begin red <= 8'd188; green <= 8'd188; blue <= 8'd188; end
	8'd10: begin red <= 8'd248; green <= 8'd184; blue <= 8'd0; end
	8'd11: begin red <= 8'd80; green <= 8'd48; blue <= 8'd0; end
	8'd12: begin red <= 8'd240; green <= 8'd208; blue <= 8'd176; end
	8'd13: begin red <= 8'd104; green <= 8'd136; blue <= 8'd252; end
	8'd14: begin red <= 8'd0; green <= 8'd64; blue <= 8'd88; end
	default: begin red <= 8'd0; green <= 8'd255; blue <= 8'd0; end
	endcase
end


endmodule
