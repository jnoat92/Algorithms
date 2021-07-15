{Javier Noa Turnes}
{ Algoritmo recursivo para elevar a^n en log N }
{ Complejidad : O(log N) N : potencia}

const
   fe = 'eleva.in';
   fs = 'eleva.out';

var
   f : text;
   n, a : longint;

   function Eleva(a, n : longint): longint;
   begin
     if n = 0 then
     begin
       eleva := 1;
       exit;
     end
     else if not odd(n) then eleva := sqr(eleva(a,n shr 1))
     else eleva := a * eleva(a,n-1);
   end;

begin
   assign(f, fe); reset(f);
   readln(f, a, n);
   close(f);

   assign(f, fs); rewrite(f);
   writeln(f, Eleva(a, n));
   close(f);

end.{No@}
