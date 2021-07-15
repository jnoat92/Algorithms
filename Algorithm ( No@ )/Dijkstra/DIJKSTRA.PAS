{$B-,I-,Q-,R-,S-}
{
   Name : Javier Noa.
   Method : Dijkstra.
   Complejidad : O(V^2) V : cant. de vertices.
}
const
   fe = 'd.in';
   fs = 'd.out';
   inf = 32639;

type
   are = array[1..100] of integer;

var
   f : text;
   nodes, edges, ini, fin : integer;
   map : array[1..100,1..100] of integer;
   cam, res : are;
   make : array[1..100] of boolean;

   procedure Leer;
   var
     a, b, c, i : longint;
   begin
     assign(f, fe); reset(f);
     readln(f, nodes, edges, ini, fin);
     fillchar(map, sizeof(map), $7f);
     for i := 1 to edges do
     begin
       readln(f, a, b, c);
       if map[a,b] > c then map[a,b]:=  c;
       if map[b,a] > c then map[b,a] := c;
     end;
     close(f);
   end;{Lectura}

   procedure Dijkstra(v : longint);
   var
     x, i, j : integer;
   begin
     make[v]:= true;
{     cam := map[v];}                     { <--------This line or }
     move(map[v], cam, nodes*2);        { <---------This line }
     for i := 1 to nodes do res[i] := ini;
     res[ini]:= 0;
     for i := 1 to nodes do
     begin
       x := 1;
       while make[x] do inc(x);
       for j := x to nodes do
         if (not make[j]) and (cam[j] < cam[x]) then x := j;
       if cam[x] = inf then exit;
       make[x]:= true;
       for j := 1 to nodes do
         if map[x,j] <> inf then
           if (not make[j]) and (cam[j] > cam[x] + map[x,j]) then
           begin
             cam[j] := cam[x] + map[x,j];
             res[j] := x;
           end;
     end;
   end;{Dijkstra Algorithm}

   procedure Print;
   var
    i, j : integer;
   begin
     assign(f, fs); rewrite(f);
     writeln(f, cam[fin]);
     j := 0;
     i := fin;
     repeat
       inc(j);
       cam[j] := i;
       i := res[i];
     until i = 0;
     for i := j downto 1 do write(f, cam[i], #32);
     close(f);
   end;

begin
   Leer;
   Dijkstra(ini);
   Print;
end.{No@}

1- Dado la cantidad de nodos, la cantidad de aristas. Hallar el camino minimo
entre dos punto dados.
Entrada
Se daran Nnodes, Naristas, ini, fin , es decir numero de nodos, numero
de aristas, el nodo de inicio (ini) y el nodo final (fin).
Salida
Costo minimo de llegar de ini a fin e impremir el camino.

Djistra.in        Djistra.out
4 4 1 4           5
1 2 3             1 4
2 3 7
1 4 5
3 4 1
