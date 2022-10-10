module serializer #(parameter  in_width =8 ,count_width=4)
 (
    input  wire [in_width-1:0] parallel_data,
    input  wire                serializer_EN,
    input  wire                clk,
    input  wire                rst,
    input  wire                Busy,
    output reg                 serial_data,
    output reg                 serial_done
    );
    
reg [in_width-1:0]      parallel_data_reg;
reg [count_width-1:0]   index_counter;


// register input data as it 8 bits to give chance for all input bits to be stable in clk cycle 
always @(posedge clk or negedge rst) 
 begin
 if(!rst)
    parallel_data_reg <='d0;
 else if(!Busy)
    parallel_data_reg <= parallel_data;
 end


always @(posedge clk or negedge rst) 
begin
 if(!rst)
    serial_data <=1'd0;
 else if(serializer_EN && (index_counter != in_width))
    serial_data <= parallel_data_reg[index_counter];
end

always @(posedge clk or negedge rst) 
begin
 if(!rst)
    index_counter <='d0;
 else if((parallel_data_reg != 'd0)&&(index_counter != in_width)&& serializer_EN)
    index_counter <= index_counter + 'd1;
 else if(index_counter == in_width)
    index_counter <='d0;

end

always @(*) 
begin
  if (index_counter == in_width)
    serial_done=1'd1;
    else
    serial_done=1'd0;
end
endmodule
