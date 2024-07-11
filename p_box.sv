
module p_box(
   output logic [63:0] odat,
   input  logic [63:0] plaintext
);

assign odat[0 ] = plaintext[0 ];
assign odat[16] = plaintext[1 ];
assign odat[32] = plaintext[2 ];
assign odat[48] = plaintext[3 ];
assign odat[1 ] = plaintext[4 ];
assign odat[17] = plaintext[5 ];
assign odat[33] = plaintext[6 ];
assign odat[49] = plaintext[7 ];
assign odat[2 ] = plaintext[8 ];
assign odat[18] = plaintext[9 ];
assign odat[34] = plaintext[10];
assign odat[50] = plaintext[11];
assign odat[3 ] = plaintext[12];
assign odat[19] = plaintext[13];
assign odat[35] = plaintext[14];
assign odat[51] = plaintext[15];

assign odat[4 ] = plaintext[16];
assign odat[20] = plaintext[17];
assign odat[36] = plaintext[18];
assign odat[52] = plaintext[19];
assign odat[5 ] = plaintext[20];
assign odat[21] = plaintext[21];
assign odat[37] = plaintext[22];
assign odat[53] = plaintext[23];
assign odat[6 ] = plaintext[24];
assign odat[22] = plaintext[25];
assign odat[38] = plaintext[26];
assign odat[54] = plaintext[27];
assign odat[7 ] = plaintext[28];
assign odat[23] = plaintext[29];
assign odat[39] = plaintext[30];
assign odat[55] = plaintext[31];

assign odat[8 ] = plaintext[32];
assign odat[24] = plaintext[33];
assign odat[40] = plaintext[34];
assign odat[56] = plaintext[35];
assign odat[9 ] = plaintext[36];
assign odat[25] = plaintext[37];
assign odat[41] = plaintext[38];
assign odat[57] = plaintext[39];
assign odat[10] = plaintext[40];
assign odat[26] = plaintext[41];
assign odat[42] = plaintext[42];
assign odat[58] = plaintext[43];
assign odat[11] = plaintext[44];
assign odat[27] = plaintext[45];
assign odat[43] = plaintext[46];
assign odat[59] = plaintext[47];

assign odat[12] = plaintext[48];
assign odat[28] = plaintext[49];
assign odat[44] = plaintext[50];
assign odat[60] = plaintext[51];
assign odat[13] = plaintext[52];
assign odat[29] = plaintext[53];
assign odat[45] = plaintext[54];
assign odat[61] = plaintext[55];
assign odat[14] = plaintext[56];
assign odat[30] = plaintext[57];
assign odat[46] = plaintext[58];
assign odat[62] = plaintext[59];
assign odat[15] = plaintext[60];
assign odat[31] = plaintext[61];
assign odat[47] = plaintext[62];
assign odat[63] = plaintext[63];

endmodule
