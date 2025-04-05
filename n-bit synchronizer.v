module receiver(
  input wire clk1, rst, req,
  output reg ack,
  input wire [7:0] data_in,
  output reg [7:0] data
);
  always @(posedge clk1 or posedge rst) begin
    if (rst) begin
      data <= 8'b00000000; // Correct reset value
      ack <= 1'b0;
    end else begin
      if (req && !ack) begin
        data <= data_in; // Capture data when request is high
        ack <= 1'b1; // Acknowledge reception
      end else if (!req) begin
        ack <= 1'b0; // Deassert acknowledgment when request is low
      end
    end
  end
endmodule


module sender(
  input clk, rst, ack,
  output reg req,
  output reg [7:0] data_out
);
  reg [7:0] data_counter;
  
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      data_out <= 8'b00000000;
      req <= 1'b0;
      data_counter <= 8'b00000000;
    end else begin
      if (req && ack) begin
        req <= 1'b0; // Deassert request when acknowledgment is received
        data_out <= data_counter;
        data_counter <= data_counter + 1;
      end else if (!req) begin
        req <= 1'b1; // Assert request for new data transfer
      end
    end
  end
endmodule

        
