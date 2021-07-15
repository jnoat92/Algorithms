{
 Javier Noa Turnes.

 Complejidad : O(sqrt(N) * M), N : rango M : max cant. de divisores.

 Criba de erastotenes, forma de hallar numeros primos, haciendo una criba
 La criba es muy facil se marcan todos los multiplos de los numeros menores
 que la raiz cuadrada de N, no hasta N, porque no es innecesario. Luego los
 numeros que no tengan multiplos es decir los que no esten marcados son
 evidentemente los numeros primos.
}
const
   fe = 'd.in';
   fs = 'd.out';
   mxn = 1000;

var
   f : text;
   n : integer;
   list : array[0..mxn] of boolean;

   procedure Criba_de_Erastotenes;
   var
     i, k : integer;
   begin
     for i := 2 to trunc(sqrt(n)) do
       if not list[i] then
       begin
         k := i*i;
         while k <= n do
         begin
           list[k] := true;
           k := k + i;
         end;
       end;
   end;

   procedure Print;
   begin
     assign(f, fs); rewrite(f);
     for n := 2 to n do
       if not list[n] then writeln(f, n);
     close(f);
   end;

begin
   assign(f, fe); reset(f);
   readln(f, n);
   close(f);

   Criba_de_Erastotenes;

   Print;

end.{No@}
100
Dado un N imprimir todos los numeros primos hasta N.