{
Javier Noa Turnes.
Complejidad : O(V^2) V : vertices
Método Lee para grafos. Hallar camino mínimo.Ver implementación Horse.
Se cojen los padres iniciales(es decir los nodos padres al inicio),
después se le hallan sus hijos, convierte luego estos en padres y
se le hallan los hijos nuevamente y así sucesivamente
hasta encontrar el camino que estamos buscando.

}
type
  are = record
          x, y : longint;
        end;
const
   movx : array[1..4] of integer = (1,-1,0,0);
   movy : array[1..4] of integer = (0,0,1,-1);

var
   i, j, hijos, padres, xi, yi, k : longint;
   cam : array[1..6,1..6] of are;
   mat : array[0..6,0..6] of boolean;
   bfs : array[boolean,0..1000] of are;
   band : boolean;
   f : text;

begin
     band := true;
     bfs[band,1].x := 1; bfs[band,1].y := 1;
     mat[1,1]:= true;
     padres := 1;

     repeat
       hijos := 0;
       for i := 1 to padres do
         for j := 1 to 4 do
         begin
           xi := bfs[band,i].x + movx[j];
           yi := bfs[band,i].y + movy[j];
           if ( xi <= 6 ) and ( xi >= 1 ) then
             if ( yi <= 6 ) and ( yi >= 1 ) then
               if not mat[xi,yi] then
               begin
                 inc(hijos);
                 bfs[not band,hijos].x := xi;
                 bfs[not band,hijos].y := yi;
                 cam[xi,yi].x := bfs[band,i].x;
                 cam[xi,yi].y := bfs[band,i].y;
                 mat[xi,yi] := true;
                 if (xi = 6) and (yi = 6) then break;
               end;
         end;
       if (xi = 6) and (yi = 6) then break;
       padres := hijos;
       band := not band;
     until padres = 0;

     i := 6; j := 6; k := 0;
     repeat
       inc(k);
       bfs[band,k].x := i;
       bfs[band,k].y := j;
       i := cam[bfs[band,k].x,bfs[band,k].y].x;
       j := cam[bfs[band,k].x,bfs[band,k].y].y;
     until (i = 0) and (j = 0);

     assign(f, 'bfs.out'); rewrite(f);
     for i := k downto 1 do writeln(f, bfs[band,i].x, ' ', bfs[band,i].y);
     close(f);

end.{No@}