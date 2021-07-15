{
  Javier Noa Turnes.
  Algor : KMP
  Complejidad : O(N+M) N : Longitud de la cadena, M : Longitud del patron
  Algoritmo para determinar cuantas veces se encuentra una cadena en
  otra.
}

const
   fe = 'kmp.in';
   fs = 'kmp.out';

var
   f : text;
   N, M, i, x : integer;
   cad, patron : array[0..1000] of char;
   prsf : array[0..1000] of integer;

   procedure Leer;
   begin
     assign (f, fe); reset(f);
     readln(f, N, M);
     for i := 1 to N do
       read(f, cad[i]);
     readln(f);
     for i := 1 to M do
       read(f, patron[i]);
     close(f);
   end;

   procedure PreKMP;
   begin
     prsf[1] := 0;
     for i := 2 to M do
     begin
       x := i - 1;
       while (x > 0) and (patron[prsf[x] + 1] <> patron[i]) do
         x := prsf[x];
       if (patron[prsf[x] + 1] = patron[i]) then prsf[i] := prsf[x] + 1;
     end;
   end;{prekmp}

   procedure KMP;
   begin
     assign (f, fs); rewrite(f);
     i := 0; x := 0;
     while (i <= N) do
     begin
       while (x > 0) and (cad[i+1] <> patron[x+1]) do x := prsf[x];
       if (cad[i+1] = patron[x+1]) then inc(x);
       if x = m then writeln(f, i-x+2);
       {Imprime los inicios de las subcadenas iguales al patron}
       inc(i);
     end;
     close(f);
   end;{kmp}

begin
   Leer;
   PreKMP;
   KMP;
end.{No@}
9 2
abcdabcab
ab
