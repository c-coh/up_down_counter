module up_down_counter #(
parameter N = 4
) (
  input logic clk,
  input logic en_b,
  input logic load_b,
  input logic up,
  input logic [N-1:0] load_in,
  output logic [N-1:0] q,
  output logic rco_b
  );
    always_ff @(posedge clk) begin
      if (~en_b) begin
        if (load_b) begin
          if(up) begin
            q = (q + 1);
          end
          else begin
            q = (q - 1);
          end
        end
        else begin
          q <= load_in;
        end
       end
     end
    assign rco_b = ~((&q & up) + (~(|q) & ~up));
endmodule
