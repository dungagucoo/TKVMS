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

`define CIPHERTEXT1 64'ha4883ec784dd9554
`define CIPHERTEXT2 64'hc93a2379c7bcd63e
`define CIPHERTEXT3 64'h1590d348516e8d81
`define CIPHERTEXT4 64'h1d51ab8c02b7f29a
`define CIPHERTEXT5 64'hefa91af66b88b6ad
`define CIPHERTEXT6 64'h87dda2e5a52f3500
`define CIPHERTEXT7 64'h5579c1387b228445
`define CIPHERTEXT8 64'h38cbdc863843c72f
`define CIPHERTEXT9 64'he4612cb7ae919c90
`define CIPHERTEXT10 64'heca05473fd48e384
`define CIPHERTEXT11 64'hd9a2016eac340ddf
`define CIPHERTEXT12 64'h98d09eb2c3831f7a
`define CIPHERTEXT13 64'hdd5abc08c62fc1d1
`define CIPHERTEXT14 64'hcc4dd9b046d6efd0
`define CIPHERTEXT15 64'h1a8d4f6a5a55f4be

// Testbench module
module PRESENT_DECRYPT_TB;

   // internal signals and registers
   wire        load_decrypt;
   wire [63:0] plaintext;
   reg  [63:0] ciphertext;
   reg  [79:0] key  = 0;
   reg         load = 1'b0;
   reg         clk  = 1'b0;
   reg         load_IV = 1'b0;
   reg  [63:0] IV = 1'b0;
   
   // instantiate design under test
   PRESENT_DECRYPT dut (
       .load_decrypt(load_decrypt),
       .plaintext(plaintext),
       .ciphertext(ciphertext),
       .key(key),
       .load(load),
       .clk(clk),
       .load_IV(load_IV),
       .IV(IV)
   );

   // clock generator
   always #5 clk = ~clk;

   initial begin
      #10   load = 1'b1; IV = `IV0; load_IV = 1'b1; ciphertext = `CIPHERTEXT1; key = `KEY0;
      #10   load_IV = 1'b0;
      #10   load = 1'b0;
      
      #400  load = 1'b1; ciphertext = `CIPHERTEXT2;
      #10   load = 1'b0;
      
      #400  load = 1'b1; ciphertext = `CIPHERTEXT3;
      #10   load = 1'b0;
      
      #400  load = 1'b1; ciphertext = `CIPHERTEXT4;
      #10   load = 1'b0;
      
      #400  load = 1'b1; ciphertext = `CIPHERTEXT5;
      #10   load = 1'b0;
      
      #400  load = 1'b1; ciphertext = `CIPHERTEXT6;
      #10   load = 1'b0;
      
      #400  load = 1'b1; IV = `IV0; load_IV = 1'b1; ciphertext = `CIPHERTEXT7; key = `KEY0;
      #10   load_IV = 1'b0;
      #10   load = 1'b0;
      
      #400  load = 1'b1; ciphertext = `CIPHERTEXT8;
      #10   load = 1'b0;
      
      #400  load = 1'b1; ciphertext = `CIPHERTEXT9;
      #10   load = 1'b0;
      
      #400  load = 1'b1; ciphertext = `CIPHERTEXT10;
      #10   load = 1'b0;
      
      #400  load = 1'b1; IV = `IV3; load_IV = 1'b1; ciphertext = `CIPHERTEXT11; key = `KEY1;
      #10   load_IV = 1'b0;
      #10   load = 1'b0;
      
      #400  load = 1'b1; ciphertext = `CIPHERTEXT12;
      #10   load = 1'b0;
      
      #400  load = 1'b1; ciphertext = `CIPHERTEXT13;
      #10   load = 1'b0;
      
      #400  load = 1'b1; ciphertext = `CIPHERTEXT14;
      #10   load = 1'b0;
      
      #400  load = 1'b1; ciphertext = `CIPHERTEXT15;
      #10   load = 1'b0;

      #400 $finish;
   end

endmodule
