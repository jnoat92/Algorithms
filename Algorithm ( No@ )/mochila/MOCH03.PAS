const
     entrada = 'd.in';
      salida = 'd.out';
        Nmax = 1000;
        Mmax = 2000;

type
    rangeN = 0..Nmax;
    rangeM = 0..Mmax;
      tipo = record
                   cos, can, qs, dv : longint;
             end;

var
   n, m : word;
   p, c : array [rangeN] of word;
    max : array [rangeM] of tipo;

  procedure read_data;

    var
       f : text;

    begin
         assign (f, entrada); reset (f);
         readln (f, n, m);
         for n := 1 to n do
             readln (f, p [n], c [n]);
         close (f);
    end;

  procedure solve;

    var
       i, j : integer;

      function maximo (a, b : longint) : longint;

        begin
             if a >= b then maximo := a else begin
                maximo := b;
                max [j + p [i]]. qs := i;
                max [j + p [i]]. dv := j;
                max [j + p [i]]. can := max [j]. can + 1;
                end;
        end;

    begin
         max [0]. cos := 1;
         for i := 1 to n do
             for j := m - p [i] downto 0 do
                 if max [j]. cos <> 0 then
                    max [j + p [i]]. cos := maximo (max [j + p [i]].cos, max [j].cos + c [i]);
    end;

  procedure write_data;

    var
       f : text;

    begin
         assign (f, salida); rewrite (f);
         writeln (f, max [m]. cos - 1, ' ', max [m]. can);
         n := m;
         p [0] := max [m]. can;
         for m := 1 to max [m]. can do begin
             p [m] := max [n]. qs;
             n := max [n]. dv;
             end;
         for m := p [0] downto 1 do
             writeln (f, p [m]);
         close (f);
    end;

begin
     read_data;
     solve;
     write_data;
end.
1

3*- Jose Carlos tiene en su casa una coleccion de n tipos de pesas,
el es un jovel muy conocido en su pueblo, el tiene una balanza donde
pesa cualquier tipo de cosa, el se dedica a pesar cosas a las personas
que van a su casa, su negocio es que por cada pesita que el utilice
el cliente le paga un impuesto a Carlos por utilizar esa pesita.

Tarea
Jose Carlos quiere que tu le hagas un programa que lo ayude a encontrar
el mayor beneficio para el, dado un peso m, y que le digas cuales pesitas
el tiene que coger.

Entrada (d.in)

 La primera linea del fichero de entrada consta de dos enteros n y m separados
por un espacio en blanco, la cantidad de tipos de pesitas que tiene Jose
Carlos y la pesada que el cliente le pide respectivamente.
 En las proximas n lineas dos enteros T y K separados por un espacio en blanco,
el tama¤o de la ith pesa y el costo de esta.

0 < n <= 1000
0 < m <= 2000
0 < T <= m
0 < K <= word

Salida (d.out)

 La primera linea del fichero de salida dos enteros P y W representando el
costo maximo y la cantidad de pesitas que Jose Carlos debe utilizar para dicha
pesada.
 En las proximas W lineas del fichero de salida un entero A representando
la Ath pesa que se utilizo en la pesada en orden en que aparecen en la
entrada.

Ejemplo de Entrada y Salida

d.in

5 11
1 15
3 20
5 30
6 20
7 20

d.out

55 3
1
2
5



