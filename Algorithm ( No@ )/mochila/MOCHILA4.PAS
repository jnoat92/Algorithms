type
   tipo = record
             cost : longint;
             qs, dv, can : word;
          end;
var
   f : text;
   n, m, i, j : word;
   c : array[1..1000] of longint;
   p : array[1..1000] of word;
   mo : array[0..5000] of tipo;

   procedure read_;
   begin
      assign(f, 'd.in'); reset(f);
      readln(f, n, m);
      for i := 1 to n do readln(f, p[i], c[i]);
      close(f);
   end;{read_}

   procedure algor;
   begin
      mo[0].cost := 1;
      for i := 1 to n do
        for j := m - p[i] downto 0 do
        begin
           if mo[j].cost <> 0 then
           begin
              if (mo[j + p[i]].cost = 0) or
              (mo[j + p[i]].cost > mo[j].cost + c[i]) then
              begin
                 mo[j + p[i]].cost := mo[j].cost + c[i];
                 mo[j + p[i]].qs := i;
                 mo[j + p[i]].dv := j;
                 mo[j + p[i]].can := mo[j].can + 1;
              end;
           end;
        end;
   end;{algor}

   procedure write_;
   begin
      assign(f, 'd.out'); rewrite(f);
      writeln(f, mo[m].cost - 1, #32, mo[m].can);
      j := m;
      for i := 1 to mo[m].can do
      begin
         p[i] := mo[j].qs;
         j := mo[j].dv;
      end;
      for i := 1 to mo[m].can do writeln(f, p[i]);
      close(f);
   end;{write_}

begin
   read_;
   algor;
   write_;
end.

4*- Luis esta jugando un juego muy extra¤o de cartas, el tiene n tipos de
cartas y cada carta tiene un numero por delante y uno por detras, el numero
que esta por el frente es el numero de la carta y el otro es el costo de la
carta, estas cartas no son igual que las cartas habituales, estas cartas
contienen numeros demasiado grandes comparado con las cartas normales. El
juego consiste en obtener una combinacion de cartas que sus numeros sumen
al menos M y que su costo sea minimo.


Tarea
 Escriba un programa que ayude a Luis a realizar el juego sin mucho esfuerzo,
y que le diga que cartas tiene que coger.

0 < N <= 1000
0 < M <= 5000

Entrada (d.in)
 La primera linea del fichero de entrada contiene dos enteros n y m separados
por un espacio en blanco.
 En las proximas n lineas el fichero de entrada contiene dos enteros separados
por un simple espacio a y b, donde a es el numero de la carta y b es el costo
de la carta.

0 < A <= M
0 < B <= 10^7

Salida (d.out)
 La primera linea del fichero de salida consta de dos enteros C y P, el costo
minimo y las P cartas que tiene que utilizar.
 En las proximas P lineas del fichero de salida un entero J indicando que se
utilizo la Jth carta.

Nota: El orden de las cartas en el fichero de salida tienen que estar ordenados
de mayor a menor.

Ejemplo de Entrada y Salida

d.in

4 6
2 4
2 1
4 1
6 3

d.out
2 2
3
2
