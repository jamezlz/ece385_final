//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Po-Han Huang  10-06-2017                               --
//                                                                       --
//    Fall 2017 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 8                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------

// color_mapper: Decide which color to be output to VGA for each pixel.
module  color_mapper ( input       [7:0]   color,            // Whether current pixel belongs to ball 
                                                             //   or background (computed in ball.sv)
                       input        [9:0] DrawX, DrawY,       // Current pixel coordinates
                       output logic [7:0] VGA_R, VGA_G, VGA_B, // VGA RGB output
							  output logic [18:0] read_address
                     );
    
    logic [7:0] Red, Green, Blue;
	 
	 int X_Size = 640;
    
    // Output colors to VGA
    assign VGA_R = Red;
    assign VGA_G = Green;
    assign VGA_B = Blue;
	 
	 int x, y;
	 
	 assign x = DrawX;
	 assign y = DrawY;
	 
	 
	 assign read_address = x + y*X_Size;
    
    // Assign color based on is_ball signal
    always_comb
    begin
        Red = {color[7:5],5'b00000};
		  Green = {color[4:2],5'b00000};
		  Blue = {color[1:0],6'b00000};
    end 
    
endmodule
