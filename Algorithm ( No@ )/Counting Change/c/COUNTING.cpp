/*
 Gregorio Ferrer Cordova
 Complejidad : O(N*M) N : elementos M : capacidad 
*/
#include <cstdio>
FILE *fe = fopen ("count.in","r"), *fs = fopen ("count.out","w");
int n, m;
int coin[101];
int nway[1001];

void reading ()
{
 fscanf (fe, "%d %d",&m, &n);
 for (int i = 0; i < n; i++)       
  fscanf (fe, "%d", &coin[i+1]);
  
 //counting change
 nway[0] = 1;
 for (int i = 1; i <= n; i++)
  for (int j = coin[i]; j <= m; j++)
    nway[j] += nway[j-coin[i]];
    
 fprintf (fs, "%d",nway[m]);
}//read 

main ()
{
 reading ();
 return 0;     
}//Mcgregor
