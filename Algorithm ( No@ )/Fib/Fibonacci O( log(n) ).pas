{Javier Noa Turnes}
{ Este algoritmo es para hallar fibonacci en O(log n). Ahora como se halla
 la idea esta basada en el algoritmo de Matrix Chain Multiplication.
 Definamos monoide a la siguiente multiplicacion
 (a,b) * (c,d) = (a*c+a*d+b*c, a*c+b*d);
 El monoide que tenemos al principio es (1,0)=(Fibn,Fibn-1);
 Y si elevamos (a,b)^N es decir (1,0)^N entonces obtendremos fibonacci en N.
 Como hacemos esto optimamente, pues muy facil, utilizaremos el algoritmo
 de elevar un numero a la N que corre en log n.}
const
   fe = 'fib.in';
   fs = 'fib.out';

var
   f : text;
   n, a, b, c, d, aux : longint;

   procedure Fibonacci;
   begin
     assign(f, fs); rewrite(f);
     a := 1; b := 0;
     c := 1; d := 0;
     while n > 0 do
     begin
       if odd(n) then
       begin
         aux := a * c;
         c := aux + a*d + b*c;
         d := aux + b*d;
       end;
       aux := a * a;
       a := aux + 2*a*b;
       b := aux + b*b;
       n := n div 2;
     end;
     writeln(f, c);
     close(f);
   end;

begin
   assign(f, fe); reset(f);
   readln(f, n);
   close(f);

   Fibonacci;

end.{No@}
