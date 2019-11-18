module frame_buffer( output logic [7:0] q,
							input [7:0] d,
							input [18:0] write_address, read_address,
							input we, clk
						  );
	
	logic [7:0] mem [307200];
	
	always_ff @ (posedge clk) begin
		if (we)
			mem[write_address] <= d;
		q <= mem[read_address];
	end
	
endmodule
