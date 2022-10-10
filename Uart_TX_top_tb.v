`timescale 1ns/1ps
module Uart_TX_top_tb ();

parameter in_width_tb =8 ;
parameter count_width_tb = 4;
parameter clk_period = 5;  //5 nano
parameter num_bit_by_frame =11 ;
 
reg [in_width_tb-1:0]    parallel_data_tb;
reg                      clk_tb;
reg                      rst_tb;
reg                      data_vaild_tb;
reg                      parity_EN_tb;
reg                      parity_type_tb;
wire                     TX_OUT_tb;
wire                     Busy_tb;


initial 
begin
clk_tb=1'd0;

/***************************************************************************/
/*******************case 1 sending 2frame with odd parity************************/
/****************************************************************************/

reset;
data_vaild_tb    =1'd1;
parity_EN_tb     =1'd1;
parity_type_tb   =1'd1; 
parallel_data_tb ='b01000011;
if (Busy_tb==1'd0 )
     $display("busy is empty and ready to transmite");
    else
     $display("it is busy to transimted please check the busy =0 to transmite ");

#clk_period;
data_vaild_tb    =1'd0;  //data_vaild active for 1 cycle
///test on start_bit
if(TX_OUT_tb==1'b0 && Busy_tb==1'd1)
    $display("right start bit of frame 1 && busy 1 ");
    else
     $display("wrong start bit of frame 1");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 2");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 3");
    else
    $display("wrong ");
#clk_period;
//data_vaild_tb    =1'd1;
//parallel_data_tb ='b11111001;
if( Busy_tb==1'd1)
    $display("busy 4");
    else
    $display("wrong ");
#clk_period;
//data_vaild_tb    =1'd0;
if( Busy_tb==1'd1)
    $display("busy 5");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 6");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 7");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 8");
    else
    $display("wrong ");
#clk_period;
parallel_data_tb='b00000111;
if( Busy_tb==1'd1)
    $display("busy 9");
    else
    $display("wrong ");
#clk_period;
//test on parity_bit
if( Busy_tb==1'd1 && TX_OUT_tb==1'b0)
    $display("right parity bit of frame 1 && busy 10");
    else
    $display("wrong busy && wrong parity bit of frame 1 ");
#clk_period;
//test if the stop_Bit of frame1 transmitted
if( Busy_tb==1'd1 && TX_OUT_tb==1'b1)
    $display("complete transmitted of frame 1 && busy 11");
    else
    $display("transmitted faild of frame 1 && wrong busy ");

#clk_period;


//vaild is enabled for second frame
data_vaild_tb=1'd1;
parallel_data_tb='b11000110;
#clk_period;
data_vaild_tb=1'd0;


//test if the second frame transmitted

///test on start_bit
if(TX_OUT_tb==1'b0 && Busy_tb==1'd1)
    $display("right start bit of frame 2 && busy 1");
    else
     $display("wrong start bit of frame 2");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 2");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 3");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 4");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 5");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 6");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 7");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 8");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 9");
    else
    $display("wrong ");
#clk_period;
//test on parity_bit
if( Busy_tb==1'd1 && TX_OUT_tb==1'b1)
    $display("right parity bit of frame 2 && busy 10");
    else
    $display("wrong busy && wrong parity bit of frame 2 ");
#clk_period;
//test if the stop_Bit of frame1 transmitted
if( Busy_tb==1'd1 && TX_OUT_tb==1'b1)
    $display("complete transmitted of frame 2 && busy 11");
    else
    $display("transmitted faild of frame 2 && wrong busy ");

    #clk_period;

$dislay("                                     /n ");
$display("/***************************//n");
$dislay("                                /n      ");

/***************************************************************************/
/*******************case 2 sending 1frame with odd parity************************/
/****************************************************************************/

data_vaild_tb    =1'd1;
parity_EN_tb     =1'd1;
parity_type_tb   =1'd1; 
parallel_data_tb ='b01000111;
if (Busy_tb==1'd0 )
     $display("busy is empty and ready to transmite");
    else
     $display("itis busy to transimted please check the busy =0 to transmite ");



#clk_period;
data_vaild_tb    =1'd0;  //data_vaild active for 1 cycle
///test on start_bit
if(TX_OUT_tb==1'b0 && Busy_tb==1'd1)
    $display("right start bit of frame 1 && busy 1 ");
    else
     $display("wrong start bit of frame 1");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 2");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 3");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 4");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 5");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 6");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 7");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 8");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 9");
    else
    $display("wrong ");
#clk_period;
//test on parity_bit
if( Busy_tb==1'd1 && TX_OUT_tb==1'b1)
    $display("right parity bit of frame 1 && busy 10");
    else
    $display("wrong busy && wrong parity bit of frame 1 ");
#clk_period;
//test if the stop_Bit of frame1 transmitted
if( Busy_tb==1'd1 && TX_OUT_tb==1'b1)
    $display("complete transmitted of frame 1 && busy 11");
    else
    $display("transmitted faild of frame 1 && wrong busy ");

#clk_period;

$dislay("                                     /n ");
$display("/***************************//n");
$dislay("                                /n      ");


/***************************************************************************/
/*******************case 3 sending 1frame with even parity************************/
/****************************************************************************/


data_vaild_tb    =1'd1;
parity_EN_tb     =1'd1;
parity_type_tb   =1'd0; 
parallel_data_tb ='b01000111;
if (Busy_tb==1'd0 )
     $display("busy is empty and ready to transmite");
    else
     $display("itis busy to transimted please check the busy =0 to transmite ");

#clk_period;
data_vaild_tb    =1'd0;  //data_vaild active for 1 cycle
///test on start_bit
if(TX_OUT_tb==1'b0 && Busy_tb==1'd1)
    $display("right start bit of frame 1 && busy 1 ");
    else
     $display("wrong start bit of frame 1");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 2");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 3");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 4");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 5");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 6");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 7");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 8");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 9");
    else
    $display("wrong ");
#clk_period;
//test on parity_bit
if( Busy_tb==1'd1 && TX_OUT_tb==1'b0)
    $display("right parity bit of frame 1 && busy 10");
    else
    $display("wrong busy && wrong parity bit of frame 1 ");
#clk_period;
//test if the stop_Bit of frame1 transmitted
if( Busy_tb==1'd1 && TX_OUT_tb==1'b1)
    $display("complete transmitted of frame 1 && busy 11");
    else
    $display("transmitted faild of frame 1 && wrong busy ");

#clk_period;

$dislay("                                     /n ");
$display("/***************************//n");
$dislay("                                /n      ");



/***************************************************************************/
/*******************case 4 sending 1frame with none parity************************/
/****************************************************************************/

data_vaild_tb    =1'd1;
parity_EN_tb     =1'd0;
parity_type_tb   =1'd1; 
parallel_data_tb ='b01000111;
if (Busy_tb==1'd0 )
     $display("busy is empty and ready to transmite");
    else
     $display("itis busy to transimted please check the busy =0 to transmite ");

#clk_period;
data_vaild_tb    =1'd0;  //data_vaild active for 1 cycle
///test on start_bit
if(TX_OUT_tb==1'b0 && Busy_tb==1'd1)
    $display("right start bit of frame 1 && busy 1 ");
    else
     $display("wrong start bit of frame 1");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 2");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 3");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 4");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 5");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 6");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 7");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 8");
    else
    $display("wrong ");
#clk_period;
if( Busy_tb==1'd1)
    $display("busy 9");
    else
    $display("wrong ");
#clk_period;
//test if the stop_Bit of frame1 transmitted
if( Busy_tb==1'd1 && TX_OUT_tb==1'b1)
    $display("complete transmitted of frame 1 && busy 10");
    else
    $display("transmitted faild of frame 1 && wrong busy ");


    #(2*clk_period);
$stop;
end

/***********reset**************/
task reset ();
    begin
         rst_tb=1'b1;
         #clk_period
         rst_tb=1'b0;
         #clk_period
         rst_tb=1'b1;
         #clk_period;
    end
endtask

always #(clk_period/2.0)  clk_tb=~clk_tb;



Uart_TX_top 
    #(
        .in_width    (in_width_tb    ),
        .count_width (count_width_tb )
    )
    u_Uart_TX_top(
    	.parallel_data (parallel_data_tb ),
        .clk           (clk_tb           ),
        .rst           (rst_tb           ),
        .data_vaild    (data_vaild_tb    ),
        .parity_EN     (parity_EN_tb     ),
        .parity_type   (parity_type_tb   ),
        .TX_OUT        (TX_OUT_tb        ),
        .Busy          (Busy_tb          )
    );
    
endmodule
