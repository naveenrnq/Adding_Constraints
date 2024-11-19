class generator;

  randc bit [3:0] a,b;  // rand or randc
  bit [3:0] y;
 
  /* Verified this constraint 
  // Internal constraint: Inside class
  constraint data_a {a > 3; a < 7;} // We can also add b but for easyness we seperate
  constraint data_b {b == 3;}
  */

  constraint data { a> 3; a < 7; b > 0; }

endclass

module tb;
 generator g;
 int i = 0;
 int status = 0; // this is to store the result of randomization
 
 initial begin
   g = new();
   for(i = 0; i < 10; i++) begin

     status = g.randomize(); // So we understood it gives 1 when randomization is successfull
     
     if(!g.randomize()) begin
       $display("Randomization Failed at %0t", $time);
       $finish(); // As soon as randomization fails stop simulation
     end
     
    
     $display("Value of a: %0d and b: %0d with status: %0d", g.a,g.b,status);
     #10; 
   end
 end

endmodule
