const
     entrada = 'd.in';
      salida = 'd.out';
        Nmax = 1000;
        Mmax = 5000;


var
  n, m : word;
  t, c : array [0..Nmax] of word; {Tama¤o (t) y costo (c) de cada elemento}
    mi : array [0..Mmax] of word; {minimo costo para llegar a M}

  procedure read_data;

    var
       f : text;

    begin
         assign (f, entrada); reset (f);
         readln (f, n, m);
         for n := 1 to n do
             readln (f, t [n], c [n]);
         close (f);
    end;

  procedure solve;

    var
       i, j : integer;

       function min (a, b : longint) : longint;

         begin
              if (a = 0) or (b < a) then min := b else
                 min := a;
         end;

    begin
         mi [0] := 1;
         for i := 1 to n do
             for j := m - t [i] downto 0 do
                 if mi [j] <> 0 then
                    mi [j + t [i]] := min (mi [j + t [i]], mi [j] + c [i]);
    end;

  procedure write_data;

    var
       f : text;

    begin
         assign (f, salida); rewrite (f);
         if mi [m] <> 0 then
            writeln (f, mi [m] - 1) else
            writeln (f, 'NO SOLUTION');
         close (f);
    end;

begin
     read_data;
     solve;
     write_data;
end.
1

2- Dado un conjunto de n tipos de elementos donde cada elemento se puede
utilizar una unica vez, se quiere obtener una mochila de tama¤o M de menor
costo posible.

Entrada (d.in)
 En la primera del fichero de entrada dos enteros N y M separados por un
simple espacio en blanco. En las proximas N lineas dos enteros T y C separados
por un espacio en blanco denotando en tama¤o del objeto y el costo de ese
objeto.

0 < n <= 1000
0 < m <= 5000
0 < T <= m
0 <= C <= 16 bits

Salida (d.out)
 En la unica linea del fichero de salida un entero denotando el costo minimo
del tama¤o m de la mochila. En caso de no ser posible escribir 'NO SOLUTION'.

Ejemplo de Entrada y Salida

d.in

4 5
1 9
2 10
3 15
4 20

d.out
25


5

0 1 2 3 4 5 6 7 8 9 10