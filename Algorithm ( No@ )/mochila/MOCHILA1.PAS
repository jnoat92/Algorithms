type
   tipo = record
             can : byte;
          end;
var
   f : text;
   n : byte;
   m : word;
   i, j : word;
   list : array[1..100] of word;
   a : array[1..10000] of tipo;
begin
   assign(f, 'd.in'); reset(f);
   read(f, n, m);
   for i := 1 to n do read(f, list[i]);
   close(f);
   assign(f, 'd.out'); rewrite(f);
   for i := 1 to m do a[i].can  := 255;
   for i := 1 to n do
   begin
      with a[list[i]] do
      begin
         can := 1;
      end;
   end;
   for i := 1 to m do
   begin
      if a[i].can <> 255 then
      begin
         if i + list[1] > m then break;
         for j := 1 to n do
            if (i + list[j] <= m) and (a[i + list[j]].can > a[i].can + 1) then
               a[i + list[j]].can := a[i].can + 1;
      end
   end;
   if a[m].cam <> 0 then write(f, a[m].can)
   else write(f, 'NO SOLUTION');
   close(f);
end.
3

1- Dado un conjunto de n tipos de objetos, donde cada objeto
se puede utilizar infinitamente, queremos obtener una cantidad
m con la minima cantidad de objetos.
0 < n <= 100
0 < m <= 10000

Entrada (d.in)
 La primera linea del fichero de entrada contiene dos enteros n y m
separados por un simple espacio.
En las proximas n lineas un entero menor o igual que m definiendo el tama¤o
del ith objeto.

Salida (d.out)
 En la primera y unica linea del fichero de salida, la cantidad minima de
objetos que hay que utilizar para obtener un m en la mochila. En caso de que
no sea posible escribir en el fichero de salida 'NO SOLUTION'.

Ejemplo de fichero de entrada y de salida


d.in
y
6 14
2
3
4
5
6
1

d.out
3
