   procedure Qsort(ini, fin : longint);
   var
     i, j, r : longint'
   begin
     i := ini;
	 j := fin;
	 r := aux[(i+j) div 2];
	 repeat
	   while aux[i] < r do inc(i);
	   while aux[j] > r do dec(j);
	   if i <= j then
	   begin
	     aux[0] := aux[i];
		 aux[i] := aux[j];
		 aux[j] := aux[0];
		 inc(i);
		 dec(j);
	   end;
	 until i > j;
	 if j > ini then Qsort(ini, j);
	 if i < fin then Qsort(i, fin);
   end;
