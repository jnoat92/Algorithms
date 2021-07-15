{ Javier Noa Turnes (Floyd) }
{ En Cost[i,j] esta contenido el camino minimo de i a j }
{ Complejidad : O(V^3) V : vertices}
const
   fe = 'floyd.in';
   fs = 'floyd.out';
   inf = 2139062143;

var
   f : text;
   nodes, edges : longint;
   mat : array[0..4,0..4] of longint;

   procedure Leer;
   var
    i, a, b, c : longint;
   begin
     fillchar(mat, sizeof(mat), $7f);
     assign(f, fe); reset(f);
     readln(f, nodes, edges);
     for i := 1 to edges do
     begin
       readln(f, a, b, c);
       if mat[a,b] > c then mat[a,b] := c;
       if mat[b,a] > c then mat[b,a] := c;
     end;
     close(f);
   end;

   procedure Floyd;
   var
     i, j, k : longint;
   begin
     for k := 1 to nodes do
       for i := 1 to nodes do
         if mat[i,k] <> inf then
           for j := 1 to nodes do
             if mat[k,j] <> inf then
               if mat[i,j] > mat[i,k] + mat[k,j] then
                 mat[i,j] := mat[i,k] + mat[k,j]
   end;{Floyd}

   procedure Print;
   var
    i, j : longint;
   begin
     assign(f, fs); rewrite(f);
     for i := 1 to nodes do
       for j := 1 to nodes do
         if mat[i,j] <> inf then
           writeln(f, i, #32, j, #32, mat[i,j]);
     close(f);
   end;

begin
   Leer;

   Floyd;

   Print;

end.{No@}

n ==> Cant_Nodes
m ==> Cant_Edges
a ==> nodo_inicial
b ==> nodo_final
c ==> cost
4 4
1 2 3
2 3 7
1 4 5
3 4 1
