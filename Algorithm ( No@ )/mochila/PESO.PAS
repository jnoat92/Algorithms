{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
type
    mochi = record
              can : word;
              qs : word;
              dv : word;
            end;
const
     infile = 'peso.in';
     outfile = 'peso.out';
var
   f : text;
   mat, bo : array[1..1000]of word;
   sol : array[1..100]of mochi;
   n, m, i, j :  word;

   procedure algorithm;
   begin
        for i := 1 to m do
         for j := 1 to n do
         begin
              if mat[1] > m then exit;
              if (i + mat[j] <= m)
              and (sol[i + mat[j]].can = 0) then
              begin
                    sol[i + mat[j]].can := sol[i].can + 1;
                    sol[i + mat[j]].qs := j;
                    sol[i + mat[j]].dv := i;
              end;
         end;
   end;{algorithm}

   procedure reading;
   begin
        assign (f, infile); reset (f);
        readln (f, n);
        readln (f, m);
        for i := 1 to n do readln (f, mat[i]);
        for i := 1 to n do
        begin
             sol[mat[i]].can:=1;
             sol[mat[i]].qs := i;
        end;
        algorithm;
        close  (f);
   end;{reading}

   procedure working;
   var
     k : word;
   begin
        assign (f, outfile); rewrite (f);
        k:=0;
        for i := m downto 1 do
        begin
             if k = sol[m].can then break;
             inc (k);
             bo[k]:= sol[i].qs;
             i := sol[i].dv+1;
        end;
        for i:= k downto 1 do writeln (f, mat[bo[i]]);
        close  (f);
   end;{working}

begin
     Reading;
     Working;
end.

þ Pesos                                                        10mo
--------------------------------------------------------------------
 En  el  IPVCE  Lenin  el  almacenero  tiene  diversos productos. El
necesita pesar los productos que  se destinan para la preparaci¢n de
los diferentes alimentos. Para  ello cuenta con una balanza y varias
pesas de diferentes pesos. El  necesita saber que  cantidad de pesas
necesita  para  pesar  dichos  productos.  El  conoc¡a a unos amigos
inform ticos  y  les planteo este problema con el fin de resolver su
problema.

Tarea

Su tarea consiste en encontrar la menor cantidad de pesas  que debe
utilizar dicho  almacenero para pesar estos productos. Concidere que
la cantidad de pesas de cada peso es infinita.

Entrada

 La entrada ser   por el fichero PESO.IN el cual est   estructurado
de la siguiente forma:
- Primera linea: un entero N (1<= N <= 100o) que representa el
peso total de lo que ‚l va a pesar.
- Segunda linea: un entero M (1 <= M <= 100) que representa la
cantidad de discos que ‚l tiene disponible.
- Siguiente linea hasta la N linea: un entero P (1 <= P <= 10000) que
representa el peso de la N-‚sima pesa.

Salida

Ser   por  el  fichero PESO.OUT, el cual contendr  en sus consiguientes
l¡neas las pesas a utilizar por el almacenero.

ÚÄÄÄÄÄÄÄÄÄÄ¿ÚÄÄÄÄÄÄÄÄÄÄÄ¿
³  PESO.IN ³³  PESO.OUT ³
ÃÄÄÄÄÄÄÄÄÄÄ´ÃÄÄÄÄÄÄÄÄÄÄÄ´
³ 4        ³³           ³
³ 30       ³³ 6         ³
³ 2        ³³ 12        ³
³ 6        ³³ 12        ³
³ 12       ³ÀÄÄÄÄÄÄÄÄÄÄÄÙ
³ 8        ³
ÀÄÄÄÄÄÄÄÄÄÄÙ