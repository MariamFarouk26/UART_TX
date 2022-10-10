module mux 
(
input  wire [1:0] mux_sel,
input  wire       serial_data,
input  wire       parity_bit,
output reg        TX_OUT
);

localparam start    = 2'd0 ,
           data     = 2'd1 ,
           parity   = 2'd2 ,
           stop     = 2'd3 ;

localparam start_bit = 1'd0 ,
           stop_bit  = 1'd1 ;
           
          
    always @(*)
     begin
        case (mux_sel)
            start  : TX_OUT =start_bit   ;
            data   : TX_OUT =serial_data ;
            parity : TX_OUT =parity_bit  ;
            stop   : TX_OUT =stop_bit    ;
            default: TX_OUT =1'd1 ; // in ideal state
        endcase
    end
endmodule
