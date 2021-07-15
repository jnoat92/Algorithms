tab[i,j] = true   i ---> j
m[i] = true      [i]
cantidad : c. nodos

procedure dfs(n : integer);
var
  k : integer;
begin
  for k := 1 to cantidad do
    if (tab[n,k]) and not m[k] then
    begin
      m[k] := true;
      dfs(k);
    end;
end;
