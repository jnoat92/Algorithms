{ Javier Noa Turnes }
{ Algoritmo para saber si N es primo o no }
{ Complejidad : O(sqrt(N)), N : numero}
Var
 fe, fs : text;
 N : longint;

 Function primo (x : longint) : boolean;
 Var
  i, j : longint;
 Begin
   primo := false;
   j := trunc(sqrt(x));
   if x = 1 then exit;
   For i := 2 to j do
    if x mod i = 0 then exit;
   primo := true;
 End;{primo}

Begin
  assign (fe, 'primo1.in'); reset (fe);
  readln (fe, N);
  close  (fe);

  assign (fs, 'primo1.out'); rewrite (fs);
  if primo (N) then writeln (fs, 'Es Primo')
  else writeln (fs, 'No es primo');
  close  (fs);
End.{ No@ }
63