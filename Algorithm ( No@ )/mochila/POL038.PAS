{$I-,Q-,R-,S-}
{ Enrique Glez Mart¡n
  12 grado
  IPVCE:"Ernesto Che Guevara"
  14 de marzo del 2006      (PRE)
}
const
 alf:array['A'..'Z'] of string=('.-','-...','-.-.','-..','.','..-.','--.',
                             '....','..','.---','-.-','.-..','--','-.','---',
                             '.--.','--.-','.-.','...','-','..-','...-','.--',
                             '-..-','-.--','--..');
 max=10001;

var
 r              :array[1..max] of char;
 t              :array[1..max] of longint;
 dic,s          :array[1..max] of string;
 i,j,k,n,m      :longint;
 fe,fs          :text;

procedure asignar;
 begin
  assign(fe,'MORSE.IN'); reset(fe);
  assign(fs,'MORSE.OUT'); rewrite(fs);
 end;

procedure closed;
 begin
  close(fs);
 end;

procedure leer;
 begin
  m:=0;
  while not eoln(fe) do
   begin
    inc(m);
    read(fe,r[m]);
   end;
  readln(fe);
  readln(fe,n);
  for i:=1 to n do
   readln(fe,dic[i]);
 end;

procedure correr;

   function comp(pi:integer; s:string):boolean;
    var
     i,j:integer;
    begin
     comp:=false;
     j:=1;
     for i:=1 to length(s) do
      if r[pi+i-1]<>s[i] then
       begin
        j:=0;
        exit;
       end;
     comp:=true;
    end;

 begin
  fillchar(t,sizeof(t),0);
  for i:=1 to n do
   for j:=1 to length(dic[i]) do
    s[i]:=s[i]+alf[dic[i,j]];

  t[1]:=1;
  for i:=1 to m do
   if t[i]<>0 then
    for j:=1 to n do
     if i+length(s[j])<=m+1 then
      if comp(i,s[j]) then
       inc(t[i+length(s[j])],t[i]);
  writeln(fs,t[m+1]);
 end;

begin
 asignar;
 leer;
 correr;
 closed;
end.

38þ Decodificando Secuencias Morse.                       Polonia 2005
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

Antes de  la era  digital, la  mayor¡a del  codigo binario  comun para
comunicacion  por radio  fue el  codigo Morse.  En codigo  Morse,  los
simbolos  estan codificados  como secuencias  de pulso  largo y  corto
(llamados  puntos  y  guiones  respectivamente.  La  siguiente   tabla
reproduce el  codigo morse  para el  alfabeto, donde  puntos y guiones
estan representados por los caracteres ASCII "." and "-":

A .-    B -...   C -.-.   D -..
E .     F ..-.   G --.    H ....
I ..    J .---   K -.-    L .-..
M --    N -.     O ---    P .--.
Q --.-  R .-.    S ...    T -
U ..-   V ...-   W .--    X -..-
Y -.--  Z --..

Observe que en   ausencia de  pausas  entre  letras serian   multiples
las  interpretaciones  de  una  secuencia   Morse.   Por  ejemplo,  la
secuencia -.-..-- podr¡a  ser decofificada  como CAT  or  NXT   (entre
otras).  Un operador  Morse  utilizaria  otra  informaci¢n  contextual
(tal   como   un   diccionario  del    lenguaje)  para    decidir  la
decodificaci¢n  apropiada.  Aun  teniendo  tal  diccionario  uno puede
obtener multiples frases de una secuencia Morse simple.

Tarea

Escriba un programa  el cual:

- lea una secuencia  Morse y una  lista de palabras (un diccionario),
- calcule el numero de  distintas frases que pueden  ser obtenidas  de
  la secuencia Morse usando palabras del diccionario,
- escriba el resultado.

Observe que  nosotros  estamos  interesados en   relaciones completas,
es decir, la  secuencia Morse  completa tiene  que estar   relacionada
con palabras en  el diccionario.

Entrada

La  primera  l¡nea  del  fichero  de  entrada  MORSE.IN  contiene  una
secuencia  no vacia de a lo sumo  10000  caracteres  "."  y   "-"  sin
espacios entre ellos. La segunda l¡nea contiene exactamente un  entero
N,   1  <=   N  <=   10000,  igual   al  n£mero   de  palabras  en  un
diccionario. Cada una  de las siguientes  lineas contiene una  palabra
del diccionario de a lo sumo 20 letras may£sculas de la "A" a la  "Z".
Ninguna palabra  aparece en  el diccionario  m s de  una vez.

Salida

La unica  linea del  fichero de  salida MORSE.OUT  contiene un  entero
igual al numero de distintas frases dentro del cual la secuencia Morse
puede  ser  analizada  gramaticalmente. Usted  puede  asumir  que este
numero a los sumo es 2*10^9.

Ejemplo de Entrada y Salida

 ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
 ³ MORSE.IN                   ³ ³ MORSE.OUT   ³
 ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ ÃÄÄÄÄÄÄÄÄÄÄÄÄÄ´
 ³ .---.--.-.-.-.---...-.---. ³ ³ 2           ³
 ³ 6                          ³ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
 ³ AT                         ³
 ³ TACK                       ³
 ³ TICK                       ³
 ³ ATTACK                     ³
 ³ DAWN                       ³
 ³ DUSK                       ³
 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
