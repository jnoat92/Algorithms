{Javier Noa turnes}
{Sucesion de Fibonacci donde se generan el ith numero menor que N}
{Complejidad : O(N)}
const
   fe = 'fib.in';
   fs = 'fib.out';

var
   f : text;
   n, i : longint;
   mat : array[0..100] of longint;

begin
   assign(f, fe); reset(f);
   readln(f, n);
   close(f);

   assign(f, fs); rewrite(f);
   mat[0]:= 1; mat[1]:= 1;
   for i := 2 to n do
     mat[i] := mat[i-1] + mat[i-2];
   writeln(f, mat[n]);
   close(f);
end.{No@}

6
