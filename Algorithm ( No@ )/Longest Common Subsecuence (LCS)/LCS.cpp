/*
  Javier Noa Turnes.
  LCS : Algoritmo para hallar la subsecuencia comun mas larga entre
  dos cadenas
*/
#include <cstdio>
#include <algorithm>
#include <cstring>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )

using namespace std;

const int mxn = 1000;
int a, b;
int lcs[mxn+1][mxn+1], dir[mxn+1][mxn+1];
char s1[mxn], s2[mxn], sol[mxn+1];

int main(){
    
    freopen ( "lcs.in", "r", stdin );
    freopen ( "lcs.out", "w", stdout );
    gets ( s1 );
    gets ( s2 );
    
    a = strlen ( s1 );
    b = strlen ( s2 );
    memmove ( &s1[1], &s1[0], a );
    memmove ( &s2[1], &s2[0], b );
    
    For ( i, 1, a ){
        For ( j, 1, b ){
            if ( s1[i] == s2[j] ){
               lcs[i][j] = lcs[i-1][j-1] + 1;
               dir[i][j] = 1;
            }
            else if ( lcs[i-1][j] >= lcs[i][j-1] ){
               lcs[i][j] = lcs[i-1][j];
               dir[i][j] = 2;
            }
            else{
               lcs[i][j] = lcs[i][j-1];
               dir[i][j] = 3;
            }
        }
    }

    int i = a, j = b, cont = lcs[a][b];
    bool band = 0;
    while ( dir[i][j] ){
          if ( dir[i][j] == 1 ){
             sol[--cont] = s1[i];
             i = i - 1;
             j = j - 1;
          }
          else if ( dir[i][j] == 2 ) i = i - 1;
          else if ( dir[i][j] == 3 ) j = j - 1;
    }
    
    printf ( "%d\n%s\n", lcs[a][b], sol );
    
    return 0;
}//No@
