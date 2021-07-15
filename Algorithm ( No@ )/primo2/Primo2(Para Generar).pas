const
   fe = 'Primo2.in';
   fs = 'Primo2.out';

var
   f : text;
   n, cont : longint;
   list : array[1..1000] of longint;
   make : array[1..2] of boolean;

   procedure Leer;
   begin
     assign(f, fe); reset(f);
     readln(f, n);
     close(f);
   end;

   procedure Genera;
   var
     a, b, i, j, h : longint;
   begin
     cont := 2;
     list[1]:= 2; list[2]:= 3;
     for i := 1 to (n+1) div 6 do
     begin
       a := 6*i+1; b := 6*i-1;
       h := trunc(sqrt(a));
       make[1]:= true; make[2]:= true;
       if a > n then
       begin
         a := 2;
         make[1]:= true;
       end;
       for j := 1 to cont do
       begin
         if list[j] > h then break;
         if a mod list[j] = 0 then make[1]:= false;
         if b mod list[j] = 0 then make[2]:= false;
         if not make[1] and not make[2] then break;
       end;
       if make[2] then
       begin
         inc(cont);
         list[cont]:= b;
       end;
       if make[1] then
       begin
         inc(cont);
         list[cont]:= a;
       end;
     end;
   end;

   procedure Print;
   begin
     assign(f, fs); rewrite(f);
     for n := 1 to cont do writeln(f, list[n]);
     close(f);
   end;

begin
   Leer;
   Genera;
   Print;
end.{No@}
10