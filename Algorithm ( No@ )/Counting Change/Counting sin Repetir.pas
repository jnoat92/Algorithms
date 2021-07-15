{
 Javier Noa Turnes
}
const
   fe = 'd.in';
   fs = 'd.out';
   mxn = 100;

var
   f : text;
   n,aux : shortint;
   band : boolean;
   nway : array[boolean,0..mxn] of shortint;

   procedure Counting;
   var
     i, j, aux : shortint;

   begin
     fillchar(nway, sizeof(nway), 0);
     nway[band,0] := 1;
     aux := n*(n+1) shr 2;

     for i := 0 to n do
     begin
       for j := 0 to i-1 do
         nway[not band,j] := nway[band,j];
       for j := i to aux do
         nway[not band,j] := nway[band,j] + nway[band,j-i];
       band := not band;
     end;{IMPORTANT}

   end;

begin
   assign(f, fe); reset(f);
   readln(f, n);
   close(f);

   Counting;

   assign(f, fs); rewrite(f);
   writeln(f, nway[band,aux] shr 1);
   close(f);

end.{No@}
14
