module FSM
 (
    input wire       data_vaild,
    input wire       parity_EN,
    input wire       serial_done,
    input wire       clk,
    input wire       rst,
    output reg       serializer_EN,
    output reg [1:0] mux_sel,
    output reg       Busy
);

reg [2:0] current_state;
reg [2:0] next_state;
     
localparam     idle_state   =3'd0 ,
               start_state  =3'd1 ,
               data_state   =3'd2 ,
               parity_state =3'd3 ,
               stop_state   =3'd4 ;

               
always @(posedge clk or negedge rst )
    begin
        if(!rst)
            current_state <= idle_state;
        else
            current_state <= next_state ;
    end

always @(*)
    begin
        case (current_state)
          idle_state    : begin
                         if(data_vaild)
                            next_state = start_state;
                        else
                            next_state = idle_state;
                            end
          start_state   : begin
                            next_state = data_state;
                            end
          data_state    : begin
                            if(serial_done && parity_EN)
                             next_state=parity_state;
                            else if(serial_done && !parity_EN)
                             next_state=stop_state;
                            else
                             next_state=data_state;
                            end
          parity_state  : begin
                            next_state = stop_state;
                            end
          stop_state    : begin
                            next_state=idle_state;
                            end
            default     : begin
                         next_state=idle_state;
                            end
        endcase
    end


always @(*)
   begin
        case (current_state)
          idle_state    : begin
                             mux_sel=2'd3;  // as stop_bit here =1'd1
                             Busy=1'd0;
                             serializer_EN=1'd0;
                          end
          start_state   : begin
                              mux_sel=2'd0;
                              Busy=1'd1;
                              serializer_EN=1'd1;
                          end
          data_state    : begin
                              serializer_EN=1'd1;
                              mux_sel=2'd1;
                              Busy=1'd1;
                          end
          parity_state  : begin
                            serializer_EN=1'd0;
                            mux_sel=2'd2;
                            Busy=1'd1;
                          end
          stop_state    : begin
                            serializer_EN=1'd0;
                            mux_sel=2'd3;
                            Busy=1'd1;
                          end
            default     : begin
                            serializer_EN=1'd0;
                            mux_sel=2'd3;
                            Busy=1'd0;
                         end    
        endcase
    end
endmodule
