{ Gregorio Ferrer Cordova }
{ Algoritmo para hallar el maximo comun divisor entre a, b utilizando el teorema
de Euclides c := a mod b; a := b; b := c; es decir cojemos una variable y guardamos el resto
entre el mayor numero y el menor luego asignamos este valor al menor de los numeros, y al
mayor numero le asignamos el valor del menor, repetimos esto hasta que el menor de los numeros
sea 0. Luego el mcd (a,b) = al mayor de los numeros}
{ Complejidad : O(log N), N : mayo de los numeros}

Var
 fe, fs : text;
 a, b, c : longint;

Begin
  assign (fe, 'mcd.in'); reset (fe);
  readln (fe, a, b);
  close  (fe);

  assign (fs, 'mcd.out'); rewrite (fs);
  if a < b then
  Begin
    c := a;
    a := b;
    b := c;
  End;

  repeat
   c := a mod b;
   a := b;
   b := c;
  until b = 0;

  writeln (fs, a);
  close  (fs);
End.{mcgregor}
10 20

