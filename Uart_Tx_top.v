module Uart_TX_top 
#(parameter in_width =8 ,
            count_width = 4
)

 (  input  wire [in_width-1:0]   parallel_data,
    input  wire                  clk,
    input  wire                  rst,
    input  wire                  data_vaild,
    input  wire                  parity_EN,
    input  wire                  parity_type,
    output wire                  TX_OUT,
    output wire                  Busy
);

//internal connections
wire        serializer_EN;
wire        serial_done;
wire        parity_bit;
wire        serial_data;
wire [1:0]  mux_sel;


FSM u_FSM
(
    .data_vaild    (data_vaild    ),
    .parity_EN     (parity_EN     ),
    .serial_done   (serial_done   ),
    .clk           (clk           ),
    .rst           (rst           ),
    .serializer_EN (serializer_EN ),
    .mux_sel       (mux_sel       ),
    .Busy          (Busy          )
);



 mux u_mux
 (
    .mux_sel     (mux_sel     ),
    .serial_data (serial_data ),
    .parity_bit  (parity_bit  ),
    .TX_OUT      (TX_OUT      )
 );




parity_calculation 
#(
    .in_width    (in_width    )
)
u_parity_calculation(
    .data_vaild    (data_vaild    ),
    .parallel_data (parallel_data ),
    .parity_type   (parity_type   ),
    .parity_EN     (parity_EN     ),
    .clk           (clk           ),
    .rst           (rst           ),
    .parity_bit    (parity_bit    )
);




serializer 
#(
    .in_width    (in_width    ),
    .count_width (count_width )
)
u_serializer(
    .parallel_data (parallel_data ),
    .serializer_EN (serializer_EN ),
    .clk           (clk           ),
    .rst           (rst           ),
    .Busy          (Busy          ),
    .serial_data   (serial_data   ),
    .serial_done   (serial_done   )
);


endmodule

