`timescale 1ns / 1ps

module uart(
input clk, //UART input clock
input reset, // reset signal
input transmit, //btn signal to trigger the UART communication
input sonar_echo,
output reg sonar_trig,
output reg TxD // Transmitter serial output. TxD will be held high during reset, or when no transmissions aretaking place. 
    );

//internal variables
reg [3:0] bitcounter; //4 bits counter to count up to 10
reg [13:0] counter; //14 bits counter to count the baud rate, counter = clock / baud rate
reg state,nextstate; // initial & next state variable
// 10 bits data needed to be shifted out during transmission.
//The least significant bit is initialized with the binary value "0" (a start bit) A binary value "1" is introduced in the most significant bit 
reg [9:0] rightshiftreg; 
reg shift; //shift signal to start bit shifting in UART
reg load; //load signal to start loading the data into rightshift register and add start and stop bit
reg clear; //clear signal to start reset the bitcounter for UART transmission


reg [16:0] count = 0;
reg [7:0] centimeters  = 0;
reg [3:0] centimeters_ones = 0;
reg [3:0] centimeters_tens = 0;
reg [3:0] output_ones      = 0;
reg [3:0] output_tens   = 0;
reg [3:0] digit         = 0;
reg echo_last    = 0;
reg echo_synced  = 0;
reg echo_unsynced = 0;
reg waiting = 0;

//UART transmission logic
always @ (posedge clk) 
begin
    centimeters = 7'd12; 
    
    if (reset) 
	   begin // reset is asserted (reset = 1)
        state <=0; // state is idle (state = 0)
        counter <=0; // counter for baud rate is reset to 0 
        bitcounter <=0; //counter for bit transmission is reset to 0
       end
    else begin
         counter <= counter + 1; //counter for baud rate generator start counting 
            if (counter >= 10415) //if count to 10416 (from 0 to 10415)
               begin 
                  state <= nextstate; //previous state change to next state
                  counter <=0; // reset couter to 0
            	  if (load) rightshiftreg <= {1'b1,centimeters,1'b0}; //load the data if load is asserted
		          if (clear) bitcounter <=0; // reset the bitcounter if clear is asserted
                  if (shift) 
                     begin // if shift is asserted
                        rightshiftreg <= rightshiftreg >> 1; //right shift the data as we transmit the data from lsb
                        bitcounter <= bitcounter + 1; //count the bitcounter
                     end
               end
         end
end 

//state machine

always @ (posedge clk) //trigger by positive edge of clock, 
//always @ (state or bitcounter or transmit)
begin
    load <=0; // set load equal to 0 at the beginning
    shift <=0; // set shift equal to 0 at the beginning
    clear <=0; // set clear equal to 0 at the beginning
    TxD <=1; // set TxD equals to during no transmission
    case (state)
        0: begin // idle state
             if (transmit) begin // assert transmit input
             nextstate <= 1; // Move to transmit state
             load <=1; // set load to 1 to prepare to load the data
             shift <=0; // set shift to 0 so no shift ready yet
             clear <=0; // set clear to 0 to avoid clear any counter
             end 
		else begin // if transmit not asserted
             nextstate <= 0; // next state is back to idle state
             TxD <= 1; 
             end
           end
        1: begin  // transmit state
             if (bitcounter >=10) begin // check if transmission is complete or not. If complete
             nextstate <= 0; // set nextstate back to 0 to idle state
             clear <=1; // set clear to 1 to clear all counters
             end 
		else begin // if transmisssion is not complete 
             nextstate <= 1; // set nextstate to 1 to stay in transmit state
             TxD <= rightshiftreg[0]; // shift the bit to output TxD
             shift <=1; // set shift to 1 to continue shifting the data
             end
           end
         default: nextstate <= 0;                      
    endcase
end


//always@(posedge clk)
//    begin
//    if (waiting == 0)
//        begin
//        if (count == 1000) 
//           begin
//           sonar_trig <= 0;
//           waiting    <= 1;
//           count       <= 0;
//           end
//        else
//           begin
//           sonar_trig <= 1;
//           count <= count+1;
//           end
//        end
        
//    else if ((echo_last == 0) & (echo_synced == 1))
//        begin
//        count       <= 0;
//        centimeters <= 0;
//        centimeters_ones <= 0;
//        centimeters_tens <= 0;
//        end
        
//    else if ((echo_last == 1) & (echo_synced == 0))
//        begin
//        output_ones <= centimeters_ones; 
//        output_tens <= centimeters_tens; 
//        end
        
//    else if (count == 2900*2 -1 )
//        begin
        
//        if (centimeters_ones == 9) 
//            begin
//            centimeters_ones <= 0;
//            centimeters_tens <= centimeters_tens + 1;
//            end
//        else
//            centimeters_ones <= centimeters_ones + 1;
        
//        centimeters <= centimeters + 1;
//        count <= 0;
        
        
//        if (centimeters == 3448) 
//            waiting <= 0;
            
//        end
//    else
//        count <= count + 1;                


//    echo_last     <= echo_synced;
//    echo_synced   <= echo_unsynced;
//    echo_unsynced <= sonar_echo;

//end

endmodule