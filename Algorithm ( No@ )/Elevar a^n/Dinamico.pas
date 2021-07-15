{Javier Noa Turnes}
{ Algoritmo dinamico para elevar a^n en Complejidad : O (log N) N : potencia}
{ El fundamento de este algoritmo es el siguiente :
para elevar un numero a la N en log N verificamos dos cosas
si n es par entonces elevamos (a^2)^n div 2
si n es impar entonces a*a^n-1 }

const
   fe = 'eleva.in';
   fs = 'eleva.out';

var
   f : text;
   n, a, z : longint;

   procedure Eleva;
   begin
     z := 1;
     while n > 0 do
     begin
       if odd(n) then z := z * a;
       a := a * a;
       n := n div 2;
     end;
   end;

begin
   assign(f, fe); reset(f);
   readln(f, a, n);
   close(f);

   assign(f, fs); rewrite(f);
   Eleva;
   writeln(f, z);
   close(f);

end.{No@}
