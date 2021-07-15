{
 Javier Noa Turnes.

 Algoritmo para determinar el numero de formas en que se puede
 expresar un "dato" a partir de una ocurrencia de "subdatos",
 que se pueden repetir.

 Complejidad : (M*N); M : cant. de elementos N : capacidad
}

const
   fe = 'conting.in';
   fs = 'conting.out';
   mxn = 1000;

var
   f : text;
   n, m, i : integer;
   list, nway : array[0..mxn] of integer;


   procedure Leer;
   begin
     assign(f, fe); reset(f);
     readln(f, n, m);
     for i := 1 to m do readln(f, list[i]);
     close(f);
   end;

   procedure Problem;
   var
     j : integer;
   begin
     assign(f, fs); rewrite(f);
     nway[0]:= 1;
     for i := 0 to m do
     begin
       for j := list[i] to n do
         nway[j] := nway[j] + nway[j-list[i]];
     end;
     writeln(f, nway[n]);
     close(f);
   end;

begin
   Leer;

   Problem;

end.{No@}

10. Coin Change  (Cambio de Monedas)

Soluci¢n: Counting Change

Suponga que tiene 5 tipos de monedas: 50-centavos, 25-centavos,
10-centavos, 5-centavos, and 1-centavos. Nosotros queremos tomar los
cambios con estas monedas para una cantidad de dinero dado. Por
ejemplo, si nosotros tenemos 11 centavos, entonces nosotros podemos
tomar los cambios con 10-centavos  y uno de 1-centavo, dos 5-centavos
y uno de 1-centavos, una de 5-centavos  y seis de 1-centavos, o once
de 1-centavos. De esta manera tenemos cuatro formar de tomar los
cambios para 11 centavos. Note que nosotros podemos contar que una
forma que contar los cambios para cero centavos. Escriba un programa
que encuentre el n£mero total de diferentes formas de tomar cambios
para cualquier cantidad de monedas en centavos. Tu programa debe  ser
capaz de manejar hasta 7489 centavos.

Entrada

En la primera l¡nea aparecer n los valores de N y M, donde N es la
cantidad de monedas en centavos y M la cantidad de tipos de Monedas.
En las siguientes M l¡neas aperecran los tipos de monedas para hacer
el cambio.

Salida

Para cada l¡nea de entrada, la salida contiene las l¡neas  con el
n£mero de diferentes formas de tomar los  cambios mediante lo citado
anteriormente con  M tipos de  monedas.

Ejemplo de Entrada y Salida:

COIN.IN       COIN.OUT         Detalles

11 5          4                10 - (1) y 1 - (1)
50                              5 - (2) y 1 - (1)
25                              5 - (1) y 1 - (6)
10                              1 - (11)
5
1

COIN.IN       COIN.OUT

26 5          13
50
25
10
5
1

COIN.IN       COIN.OUT

200 10        293
10000
5000
2000
1000
200
100
50
20
10
5