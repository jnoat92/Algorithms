type
   tipo = record
             can, qs, dv : word;
          end;
var
   f : text;
   list : array[1..150] of string;
   p : array[1..150] of word;
   mo : array[0..1000] of tipo;
   s, s1 : string;
   n, i, j : word;
   m : byte;

   procedure read_;
   begin
       assign(f, 'secret.in'); reset(f);
       readln(f, m); readln(f, s); readln(f, n);
       for i := 1 to n do
       begin
          readln(f, s1);
          if pos(s1, s) <> 0 then
          begin
             inc(j);
             list[j] := s1; p[j] := length(list[j]);
          end;
       end;
       close(f);
   end;{read_}

   procedure algor;
   begin
      mo[0].can := 1;
      for i := 1 to n do
         for j := m - p[i] downto 0 do
            if mo[j].can <> 0 then
            begin
               if (mo[j + p[i]].can = 0) or
               (mo[j + p[i]].can > mo[j].can + 1) then
               begin
                  mo[j + p[i]].can := mo[j].can + 1;
                  mo[j + p[i]].qs := i;
                  mo[j + p[i]].dv := j;
               end;
            end;
   end;{algor}

   procedure write_;
   begin
      assign(f, 'secret.out'); rewrite(f);
      writeln(f, mo[m].can - 1);
      j := m;
      for i := 1 to mo[m].can - 1 do
      begin
         p[i] := mo[j].qs;
         j := mo[j].dv;
      end;
      for i := mo[m].can - 1 downto 1 do writeln(f, list[p[i]]);
      close(f);
   end;{write_}
begin
   read_;
   s1 := '';
   for i := 1 to j do s1 := s1 + list[i] ;
   if s1 = s then
   begin
      assign(f, 'secret.out'); rewrite(f);
      writeln(f, j);
      for i := 1 to n do writeln(f, list[i]);
      close(f);
      halt(0);
   end;
   algor;
   write_;
end.

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


