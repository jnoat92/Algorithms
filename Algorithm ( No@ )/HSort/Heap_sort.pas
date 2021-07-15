{
  Javier Noa Turnes.
  Algoritmo : Heap_Sort.

  En este algoritmo utilizo un arbol binario donde su raiz muestra
  el mayor o menor elemento (en dependencia de lo que buscamos), en
  el cual el padre i tendra sus hijos en las posisiones 2*i y 2*i+1.
  Procedimientos utilizados son :

  Insertar : Para colocar un nodo primero se coloca el nodo en la
  posicion i y como el arbol esta destinado buscamos en log(N) si
  su padre es menor o mayor que el y lo intercambiamos.

  Eliminar : para borrar lo que tienes que hacer es el ultimo nodo,
  es decir el ultimo en la lista, lo reemplazas por este nodo que
  quieres eliminar y luego a partir de ahi reorganizas el arbol, de la
  siguiente forma buscas el menor o mayor de tus hijos y lo reemplazas
  y luego hacer lo mismo hasta que ya no puedas seguir bajando niveles
  al final te va a quedar reubicado el arbol.

}
const
  fe = 'd.in';
  fs = 'd.out';
  mxn = 10000;

var
  f : text;
  i, n : longint;
  list : array[0..mxn] of longint;

  procedure Insert(x, j : longint);
  var
    dad, son : longint;
  begin
    son := j;
    dad := j shr 1;
    while (list[dad] < x) and (dad <> 0) do
    begin
      list[0] := list[dad];
      list[dad] := list[son];
      list[son] := list[0];
      son := dad;
      dad := dad shr 1;
    end;
  end;

  procedure Leer;
  var
    a : longint;
  begin
    assign(f, fe); reset(f);
    readln(f, n);
    for i := 1 to n do
    begin
      readln(f, a);
      list[i] := a;
      Insert(a,i);
    end;
    close(f);
  end;

  procedure Delect(j : longint);
  begin
    while (2*j+1 <= n) and (2*j <= n)
    and ((list[2*j+1] > list[j]) or (list[2*j] > list[j]))do
    begin
      if (list[2*j] > list[2*j+1]) then
      begin
        list[0]  := list[2*j];
        list[2*j]:= list[j];
        list[j]  := list[0];
        j := 2 * j;
      end
      else
      begin
        list[0] := list[2*j+1];
        list[2*j+1] := list[j];
        list[j] := list[0];
        j := 2 * j + 1;
      end;
    end;
  end;

  procedure Print;
  var
    fin : longint;
  begin
    assign (f, fs); rewrite(f);
    fin := n;
    for i := 1 to n do
    begin
      writeln(f, list[1]);
      list[1] := list[fin];
{      list[fin] := inf;        <---------Si buscamos un elemento menor}
      list[fin] := 0;           {<--------Si buscamos un elemento mayor}
      dec(fin);
      Delect(1);
    end;
    close(f);
  end;

begin
  Leer;
  Print;
end.{No@}

Ordenamiento utilizando un Heap.

8
10
5
4
3
11
1
100
23
