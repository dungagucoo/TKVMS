`timescale 1ns/1ps

`define PLAINTEXT0 64'h0000000000000000
`define PLAINTEXT1 64'h834349fd8e99a23b
`define PLAINTEXT2 64'h9281dcb8a883a38c
`define PLAINTEXT3 64'hd392f4ec58356aeb
`define PLAINTEXT4 64'h3e5380018fc28d70
`define PLAINTEXT5 64'hFFFFFFFFFFFFFFFF

`define KEY0   80'h00000000000000000000
`define KEY1   80'h3014f4d8c37d9cc7e689
`define KEY2   80'h88239f8276ec927c8dec
`define KEY3   80'h610dcecce9a001117102
`define KEY4   80'h01f43bbc9b2001545339
`define KEY5   80'hFFFFFFFFFFFFFFFFFFFF

`define IV0   64'h0000000000000000
`define IV1   64'h834349fd8e99a23b
`define IV2   64'h9281dcb8a883a38c
`define IV3   64'hd392f4ec58356aeb
`define IV4   64'h3e5380018fc28d70
`define IV5   64'hFFFFFFFFFFFFFFFF

`define PLAINTEXT 64'hF1F1FFFFFFFF1111
`define KEY 80'h00000000000000000000

// Testbench module
module PRESENT_ENCRYPT_TB;

   // internal signals and registers
   //wire [63:0] odat;
   wire        load_encrypt;
   wire [63:0] ciphertext;
   reg [63:0] plaintext = 0;
   reg [79:0] key  = 0;
   reg load        = 1'b0;
   reg clk         = 1'b0;
   reg reset       = 1'b0;
   reg load_IV     = 1'b0;
   reg [63:0] IV   = 1'b0;

   // instantiate design under test
   PRESENT_ENCRYPT dut(load_encrypt, ciphertext, plaintext, key, load, clk, load_IV, IV);

   // clock generator
   always #5 clk = ~clk;

   initial begin
      #10   load = 1'b1; IV = `IV0; load_IV = 1'b1; plaintext = `PLAINTEXT; key = `KEY0;
      #10   load_IV = 1'b0;
      #10   load = 1'b0;
      
      #400  load = 1'b1;
      #10   load = 1'b0;
      
      #400  load = 1'b1;
      #10   load = 1'b0;
      
      #400  load = 1'b1;
      #10   load = 1'b0;
      
      #400  load = 1'b1;
      #10   load = 1'b0;
      
      #400  load = 1'b1;
      #10   load = 1'b0;
      
      #400  load = 1'b1; IV = `IV0; load_IV = 1'b1; plaintext = 'd0; key = `KEY0;
      #10   load_IV = 1'b0;
      #10   load = 1'b0;
      
      #400  load = 1'b1;
      #10   load = 1'b0;
      
      #400  load = 1'b1;
      #10   load = 1'b0;
      
      #400  load = 1'b1; plaintext = 'hf;
      #10   load = 1'b0;
      
      #400  load = 1'b1; IV = `IV3; load_IV = 1'b1; plaintext = `PLAINTEXT; key = `KEY1;
      #10   load_IV = 1'b0;
      #10   load = 1'b0;
      
      #400  load = 1'b1;
      #10   load = 1'b0;
      
      #400  load = 1'b1;
      #10   load = 1'b0;
      
      #400  load = 1'b1;
      #10   load = 1'b0;
      
      #400  load = 1'b1;
      #10   load = 1'b0;
      
      #400  load = 1'b1;
      #10   load = 1'b0;

      #10   load = 1'b0;
      #400 $finish;
   end

endmodule
