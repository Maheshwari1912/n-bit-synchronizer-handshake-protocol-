module receiver(
  input wire clk1,rst,req,
  output reg ack,
  input wire [7:0] data_in,
  output reg [7:0] data);
  always@(posedge clk1 or posedge rst) begin
    if(rst) begin
      data <= 4'b0000;
      ack <= 1'b0;
    end else begin
      if(req) begin
        data <= data_in;
        ack <= 1'b1;
      end else begin
        ack <= 1'b0;
      end
    end
  end
endmodule

module sender(
  input clk,rst,ack,
  output reg req,
  output reg [7:0] data_out);
  reg [7:0] data_counter;
  always@(posedge clk or posedge rst) begin
    if(rst) begin
      data_out <= 8'b0000;
      req <= 1'b0;
      data_counter <= 8'b0000;
    end else begin
      if(ack) begin
        req <= 1'b0;
        data_out <= data_counter;
        data_counter <= data_counter+1;
      end else begin
        req <= 1'b1;
      end
    end
  end
endmodule
        
