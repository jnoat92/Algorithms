{ Gregorio Ferrer Cordova }
{ Para hallar el minimo comun multiplo entre a y b
 mcm (a,b) = a*b / mcd (a,b) }
{ Complejidad : O(1) }

Var
 fe, fs : text;
 m, c, a, b : longint;

 Function mcd (x,y : longint): longint;
 Begin
   if x < y then
   Begin
     c := x;
     x := y;
     y := c;
   End;

   repeat
    c := x mod y;
    x := y;
    y := c;
   until y = 0;

   mcd := x;
 End;

Begin
  assign (fe,'mcm.in'); reset (fe);
  readln (fe, a, b);
  close  (fe);

  assign (fs, 'mcm.out'); rewrite (fs);
  m := mcd (a,b);
  writeln (fs, a*b div m);
  close  (fs);
End.{mcgregor}
10 20
