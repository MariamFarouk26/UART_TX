
module parity_calculation  #(parameter in_width =3 )
(
input  wire                 data_vaild,
input  wire [in_width-1:0]  parallel_data,
input  wire                 parity_type,
input  wire                 parity_EN,
input  wire                 clk,
input  wire                 rst,
output reg                  parity_bit
);

localparam     even_parity = 1'd0 ,
               odd_parity  = 1'd1;


reg [in_width-1:0]  parallel_data_reg;
reg 		    parity_bit_reg;

always @(posedge clk or negedge rst) 
begin
if(!rst)
   parallel_data_reg<='d0;   
else if(data_vaild && parity_EN )
   parallel_data_reg<= parallel_data;
end

//TODO: thses 2 comming blocks important to aviod latch in case (use comb block and seq)  or(in case seq) using filpflop with enable (ff with if)
always @(*)
     begin
        if(parity_EN)
        begin
        case (parity_type)
            even_parity  : begin
                             parity_bit_reg = ^parallel_data_reg  ;
                            end
            odd_parity   : begin
                             parity_bit_reg =  ~^parallel_data_reg;
                            end
            default      : parity_bit_reg =1'd0 ; // in ideal state
        endcase
        end
        else
        parity_bit_reg = parity_bit;
    end

always @(posedge clk or negedge rst) 
begin
   if(!rst)
	parity_bit <=0;    
   else
	parity_bit <=parity_bit_reg;    
end
endmodule


