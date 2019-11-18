module frame_writer(input logic clk, r,
							input logic [9:0] DrawX,DrawY,sprite_x,sprite_y,
							output logic we,
							output logic [18:0] addr,
							output logic [7:0] color);
							
	 logic thing;
	 int x, y, y_thing;
	 
	 assign x = DrawX;
	 assign y = DrawY;
	 
	 
	 logic [9:0] sd_x, sd_y;
	 
	 logic sprite_flag;
	 
	 //assign sprite_x = 10'b0;
	 //assign sprite_y = 10'b0;
	 
	 parameter [9:0] Sprite_X_Size = 10'd10;
	 parameter [9:0] Sprite_Y_Size = 10'd10;

	int X_Size = 640;			
	assign y_thing = sprite_y + sd_y;						
				
	always_comb begin
		we = 1'b0;
		addr = 19'b0;
		color = 8'b0;
		if (y >= 10'd1 && y <= 10'd480 && x < 640 ) begin
			addr = x + y*X_Size;
			we = 1'b1;
			color = 8'b11100000;
		end
		if (y == 10'd481 && thing < 100) begin
			addr = sprite_x + sd_x + (y_thing)*X_Size;
			we = 1'b1;
			color = 8'b00000011;
		end
	end
	
	always_ff @ (posedge clk) begin
		if (y == 10'd481 && thing < 100) begin
			thing <= thing + 1;
			if (sd_x < (Sprite_X_Size)) 
				sd_x <= sd_x + 1;
			else if (sd_y < (Sprite_Y_Size)) begin
				sd_x <= 0;
				sd_y <= sd_y + 1;
			end else begin
				sd_x <= 0;
				sd_y <= 0;
			end
		end else begin
			sd_x <= 0;
			sd_y <= 0;
			thing <= 0;
		end
	end

endmodule
