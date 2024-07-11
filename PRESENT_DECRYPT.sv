module PRESENT_DECRYPT (
        // output [63:0] odat,   // data output port
        
        output        load_decrypt,
        output reg  [63:0] plaintext,   // data output port
        input  [63:0] ciphertext,   // data input port
        input  [79:0] key,    // key input port
        input         load,   // data load command
        input         clk,    // clock
        input         load_IV,
        input  [63:0] IV
    );

    wire  [63:0] odat;

    //---------wires, registers----------
    reg  [79:0] kreg;               // key register
    reg  [63:0] dreg;               // data register
    reg  [4:0]  round;              // round counter
    reg  [63:0] counter;

    wire  [63:0] counter_nx;
    wire [63:0] dat1, dat2, dat3;   // intermediate data
    wire [79:0] kdat1, kdat2;       // intermediate subkey data

    //---------combinational processes----------
    assign load_decrypt = (round == 0) ? 1 : 0; 
    assign dat1 = dreg ^ kreg[79:16];        // add round key
    assign odat = dat1 ^ ciphertext;         // output ciphertext

    // key update
    assign kdat1 = {kreg[18:0], kreg[79:19]}; // rotate key 61 bits to the left
    assign kdat2[14:0] = kdat1[14:0];
    assign kdat2[19:15] = kdat1[19:15] ^ round; // xor key data and round counter
    assign kdat2[75:20] = kdat1[75:20];

    //---------instantiations--------------------

    // instantiate 16 substitution boxes (s-box) for encryption
    genvar i;
    generate
        for (i = 0; i < 64; i = i + 4) begin: sbox_loop
            s_box USBOX (.odat(dat2[i+3:i]), .plaintext(dat1[i+3:i]));
        end
    endgenerate

    // instantiate pbox (p-layer)
    p_box UPBOX (.odat(dat3), .plaintext(dat2));

    // instantiate substitution box (s-box) for key expansion
    s_box USBOXKEY (.odat(kdat2[79:76]), .plaintext(kdat1[79:76]));

    //---------sequential processes----------
    always_ff @(posedge clk) begin
        if (load_IV)
            counter <= IV;
        else
            counter <= counter_nx;
    end
    assign counter_nx = (round == 0) ? counter + 1 : counter;

    // Load data
    always_ff @(posedge clk) begin
        if (load)
            dreg <= counter;
        else
            dreg <= dat3;
    end

    // Load/reload key into key register
    always_ff @(posedge clk) begin
        if (load)
            kreg <= key;
        else
            kreg <= kdat2;
    end

    // Round counter
    always_ff @(posedge clk) begin
        if (load)
            round <= 1;
        else
            round <= round + 1;
    end

    always_ff @(posedge clk) begin
        if (round == 0)
            plaintext <= odat;
    end
endmodule