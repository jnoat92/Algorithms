Folleto de Ejercicios de Mochila.

Estos ejercicios son de Mochila de Sencillos elementos.


1- Dado un conjunto de n tipos de objetos, donde cada objeto
se puede utilizar infinitamente, queremos obtener una cantidad
m con la minima cantidad de objetos.
0 < n <= 100
0 < m <= 10000

Entrada (d.in)
 La primera linea del fichero de entrada contiene dos enteros n y m
separados por un simple espacio.
En las proximas n lineas un entero menor o igual que m definiendo el tama¤o
del ith objeto.

Salida (d.out)
 En la primera y unica linea del fichero de salida, la cantidad minima de
objetos que hay que utilizar para obtener un m en la mochila. En caso de que
no sea posible escribir en el fichero de salida 'NO SOLUTION'.

Ejemplo de fichero de entrada y de salida


d.in

6 14
2
3
4
5
6
1

d.out
3

2- Dado un conjunto de n tipos de elementos donde cada elemento se puede
utilizar una unica vez, se quiere obtener una mochila de tama¤o m de menor
costo posible.

Entrada (d.in)
 En la primera del fichero de entrada dos enteros n y m separados por un
simple espacio en blanco. En las proximas n lineas dos enteros T y C separados
por un espacio en blanco denotando en tama¤o del objeto y el costo de ese
objeto.

0 < n <= 1000
0 < m <= 5000
0 < T <= m
0 <= C <= 16 bits

Salida (d.out)
 En la unica linea del fichero de salida un entero denotando el costo minimo
del tama¤o m de la mochila. En caso de no ser posible escribir 'NO SOLUTION'.

Ejemplo de Entrada y Salida

d.in

4 5
1 9
2 10
3 15
4 20

d.out
25


3*- Jose Carlos tiene en su casa una coleccion de n tipos de pesas,
el es un jovel muy conocido en su pueblo, el tiene una balanza donde
pesa cualquier tipo de cosa, el se dedica a pesar cosas a las personas
que van a su casa, su negocio es que por cada pesita que el utilice
el cliente le paga un impuesto a Carlos por utilizar esa pesita.

Tarea
Jose Carlos quiere que tu le hagas un programa que lo ayude a encontrar
el mayor beneficio para el, dado un peso m, y que le digas cuales pesitas
el tiene que coger.

Entrada (d.in)

 La primera linea del fichero de entrada consta de dos enteros n y m separados
por un espacio en blanco, la cantidad de tipos de pesitas que tiene Jose
Carlos y la pesada que el cliente le pide respectivamente.
 En las proximas n lineas dos enteros T y K separados por un espacio en blanco,
el tama¤o de la ith pesa y el costo de esta.

0 < n <= 1000
0 < m <= 2000
0 < T <= m
0 < K <= word

Salida (d.out)

 La primera linea del fichero de salida dos enteros P y W representando el
costo maximo y la cantidad de pesitas que Jose Carlos debe utilizar para dicha
pesada.
 En las proximas W lineas del fichero de salida un entero A representando
la Ath pesa que se utilizo en la pesada en orden en que aparecen en la
entrada.

Ejemplo de Entrada y Salida

d.in

5 11
1 15
3 20
5 30
6 20
7 20

d.out

55 3
1
2
5


4*- Luis esta jugando un juego muy extra¤o de cartas, el tiene n tipos de
cartas y cada carta tiene un numero por delante y uno por detras, el numero
que esta por el frente es el numero de la carta y el otro es el costo de la
carta, estas cartas no son igual que las cartas habituales, estas cartas
contienen numeros demasiado grandes comparado con las cartas normales. El
juego consiste en obtener una combinacion de cartas que sus numeros sumen
al menos M y que su costo sea minimo.


Tarea
 Escriba un programa que ayuda a Luis a realizar el juego sin mucho esfuerzo,
y que le diga que cartas tiene que coger.

0 < N <= 1000
0 < M <= 5000

Entrada (d.in)
 La primera linea del fichero de entrada contiene dos enteros n y m separados
por un espacio en blanco.
 En las proximas n lineas del fichero de entrada contiene dos enteros separados
por un simple espacio a y b, donde a es el numero de la carta y b es el costo
de la carta.

0 < A <= M
0 < B <= 10^7

Salida (d.out)
 La primera linea del fichero de salida consta de dos enteros C y P, el costo
minimo y las P cartas que tiene que utilizar.
 En las proximas P lineas del fichero de salida un entero J indicando que se
utilizo la Jth carta.

Nota: El orden de las cartas en el fichero de salida tienen que estar ordenados
de mayor a menor.

Ejemplo de Entrada y Salida

d.in

4 5
2 4
2 1
4 1
6 3

d.out
2 2
3
2


5-***Mensaje secreto (Usa011)                             USA     2003
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

Un  mensaje  secreto  est   escrito  sin espacios entre las palabras y
contiene   solo  letras.  Otro  texto  de  la  misma  fuente  ha  sido
encontrado.  Los  expertos  conocen  que  el  mensaje ha sido escrito 
seleccionando  algunas palabras del texto y escribi‚ndolas en el mismo
orden  que  aparecen  en este, una a continuaci¢n de otra sin espacios
entre  ellas.  Las  palabras del texto pueden ser utilizadas solamente
una vez en el mensaje.

Tarea

Escriba un programa que:
- Lea desde el fichero texto SECRET.IN el  mensaje secreto y el texto
  encontrado.
- Determine la m¡nima cantidad de palabras que se seleccionaron del
  texto para escribir el mensaje secreto.
- Escriba hacia el fichero texto SECRET.OUT la cantidad y las palabras
  seleccionadas.

Entrada

El fichero de entrada SECRET.IN tiene la siguiente estructura:
- L¡nea 1: Un entero N (1 <= N <= 1000) que representa la cantidad de
           letras que tiene el mensaje secreto.

- L¡nea 2: Contiene los N caracteres del mensaje secreto que pueden
           ser letras may£sculas y min£sculas del alfabeto ingl‚s.

- L¡nea 3: Est  escrito un entero M (1 <= M <= 150), el n£mero de
           palabras que contiene el texto encontrado.

- L¡nea 4..M+1: Contienen una palabra cada una, las cuales est n
           formadas por may£sculas y min£sculas del alfabeto ingl‚s.
           Ninguna palabra del texto tendr  m s de 200 caracteres.

Salida

El fichero de salida SECRET.OUT tiene la siguiente estructura:
- L¡nea 1: Un entero K, la cantidad m¡nima de palabras seleccionadas
           para escribir el mensaje.
- L¡nea 2..K+1: Deben escribirse las palabras seleccionadas del texto,
           en el mismo orden en que aparecen en la entrada.

Ejemplo de Entrada y Salida

ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿
³ SECRET.IN      ³ ³ SECRET.OUT ³
ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ ÃÄÄÄÄÄÄÄÄÄÄÄÄ´
³ 14             ³ ³ 2          ³
³ automaticainfo ³ ³ automatica ³
³ 7              ³ ³ info       ³
³ out            ³ ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ
³ extra          ³
³ automatica     ³
³ metica         ³
³ window         ³
³ info           ³
³ system         ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ


