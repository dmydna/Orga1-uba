// Operadores Logicos

// AND :  &&        ej: a && b
// OR  :  ||        ej: a || b
// NOT :  !         ej: !a
// 

//Operadores Bit a Bit 

// and :  &         ej:  a & b
// or  :  |         ej:  a | b
// xor : ^          ej:  a ^ b
// not : ~          ej:  ~a, a ~^ b, 
// nadn: ~&         ej:  ~& a



// VALORES NUMERICOS::

//  valor|  BITS'BASE BINARIO  
//     5 |  3   'b    101


/*
|  Num         |  #bits   |  base    |  val    |  stored      |
|------------------------------------------------------------ |
|  3'b101      |  3       |  2       |  5      |  101         |
|  'b11        |  ?       |  2       |  3      |  000...0011  |
|  8'b11       |  8       |  2       |  3      |  00000011    |
|  8'b101_1011 |  8       |  2       |  171    |  10101011    |
|  3'd6        |  3       |  10      |  6      |  110         |
|  6'o42       |  6       |  8       |  34     |  100010      |
|  8'hAB       |  8       |  16      |  171    |  10101011    |
|  42          |  ?       |  10      |  42     |  00..0101010 |

*/

module fulladder(
  input logic a, b, cin,          // señales entradas 
  output logic s, cout            // señales salidas
);
  logic p, g:                     // variables internas
  assign p = a ^ b;               // a xor b
  assign g = a & b;               // a and b
  assign s = p ^ cin;             // p xor cin
  assign cout = p | (p & cin);    // p or (p and cin)
endmodule



module buffer3(
  input logic[3:0] a,             // Entrada 'a' de 4 bits datos
  input logic en,                 // Señal de Control 'en' (enable?)
  output tri [3:0] y)             // Salida 'y' de 4 bits datos en 3 estados (tri)
);
  assign y = en ? a : 4'bz;       // y = a si en == true , y = 4'bz si en == false
                                  // en = [0,1] , 4'bz = 4 bits de base 2 (b) de altaImperancia(z) 
endmodule  

assign y = { c [2:1] , { 3{ d[0] } } , c[0] , 3'b101 } // {concateno} [accede a bits]
// c[2:1] accesede al 2°bit y 3°bit , pues c= [pos0,pos1,pos2,pos3]




module flop(
  input logic clk,                // Entrada de reloj de un bit
  input logic [3:0] d,            // Entrada de datos de 4 bits
  output logic [3:0] q            // Salida de datos de 4 bits
);
  always_ff @(posedge clk)        // Bloque siempre desencadenado por el flanco positivo del reloj
    q <= d;                       // Asignación no bloqueante de 'd' a 'q'
endmodule


module mux4(
  input logic [3:0] d0, d1, d2, d3,   // Entrada 4bits datos
  input logic [1:0] s,                // Entrada 1bit datos
  output logic [3:0] y,               // Salida  4bits datos
);
  logic [3:0] low, high:
  mux2 lowmux(d0, d1, s[0], low);
  mux2 highmux(d2, d3, s[0], high);
  mux2 finalmux(low, high, s[1], y);
endmodule


