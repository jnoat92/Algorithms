
  {$B-,I-,Q-,R-,S-}
{Por Ernesto Soto G¢mez}
program Soto;

var
   f : text;
   n, m, i, j : word;
{   N es la cantidad de objetos y M el tama¤o de la mochila }
   list : array[1..100] of word; {Lista de los objetos}
   mo : array[0..100] of word; {Mochila. (El 0 es un parche)}

   procedure read_;
   begin
      assign(f, 'f.in'); reset(f);
      readln(f, n, m);
      for i := 1 to n do readln(f, list[i]);
      close(f);
   end;{read_}

   procedure algor;
   begin
      mo[0] := 1;
     { Cuando la resta de j - list[i] d‚ cero quiere decir que hay una sola
     forma de llenar la mochila hasta j con i objetos}
      for i := 1 to n do
         for j := list[i] to m do {j = list[i] para que la resta no de < 0}
               mo[j] := mo[j] + mo[j - list[i]];
   end;{algor}

   procedure write_;
   begin
      assign(f, 'f.out'); rewrite(f);
      writeln(f, mo[m]);
      close(f);
   end;{write_}

begin
   read_;
   algor;
   write_;
end.{ESto}
1
_____________

3 5
1
2
3
_____________

¯ Cu ntas formas hay de con n elementos lograr un total X (Sin
repetir) ?.

Primero se tiene una tabla donde en la posici¢n [i, j] se tiene la
cantidad de formas que existen para llenar la mochila hasta j con i
elementos. para buscar [i, j] se suma la cantidad que tengo sin poner
el objeto i, es decir la cantidad que tengo de poner i-1 objetos (la
que ten¡a antes), + la cantidad que tengo poniendo el objeto i, que
‚sta no es m s que la cantidad que tengo en mochila[i, j - ob[i]],
o sea, la cantidad que tengo en la posici¢n de la mochila
[i, j - el tama¤o del objeto i]; esto es porque, por ejemplo :

si j = 5 y tengo objetos 1, 2, 3 y voy a buscar la cantidad de formas
que hay al meter el 3, esto se halla buscando la cantidad de formas
que ya hab¡a antes de meter el 3; o sea, metiendo el 1 y el 2; + la
cantidad de formas que hay ya metiendo el objeto 3, que esto es la
cantidad de fomas que hay de meter el el 3 para hacer una mochila de
5-3 que es 2; y esto es simplemente porque para formar el tama¤o 5 es
2 + 3, y el 3 es el objeto que estoy metiendo y la cantidad de formas
de formar el dos ya lo hab¡a calculado anteriormente, o sea, que el 5
puedo formarlo, formando un 2 + un objeto 3 (El 2 ya se hab¡a formado
con los objetos, o sea, ya tengo la cantidad de formas para formar el
2).

Toda esta "muela" se puede resumir en una implementaci¢n en donde, en
vez de untilizarse la TablaMochila de la que hab¡amos hablado se
untilize una mochila linear (esto es m s econ¢mico desde el punto de
vista de la memoria e igual de tiempo de corrida que la que es con una
TablaMochila) con dos ciclos anidados :

- el primero desde 1 hasta la cantidad de objetos (Ciclo que controla
los objetos).

- y el otro desde 1 hasta la capacidad de la mochila (Ciclo que
controla la mochila).

Nota : en el problema en que s¡ se puede repetir CREO que lo £nico que
hay que hacer es cambiar los ciclos :

- el primero el de la mochila

- y el segundo el los objetos.

{Por Ernesto Soto G¢mez}
