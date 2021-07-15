/*
  Javier Noa Turnes.
  Combinatoria Iterativa
  
  Esto funciona para combinaciones donde se decide por agregar
  o no agregar un elemento, o sea que la cantidad de combinaciones
  sea 2^N.
  
  Complegidad : O(2^N * N)
  
*/
#include <cstdio>
#include <algorithm>
#include <vector>
#include <iostream>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )

using namespace std;

int N;
const int mxn = 20;
int list[mxn+1];
vector <int> res[1<<mxn];

int main(){
    
//    freopen ( "d.in", "r", stdin );
//    freopen ( "d.out", "w", stdout );
    scanf ( "%d", &N );
    For ( i, 0, N-1 ) scanf ( "%d", &list[i] );
    
    For ( i, 0, (1 << N)-1 ){
        For ( j, 0, N-1 )
            if ( (i & ( 1 << j )) ) res[i].push_back ( list[j] );
    }
    
    For ( i, 0, (1 << N) ){
        if ( res[i].size() )
        For ( j, 0, res[i].size()-1 ) printf ( "%d ", res[i][j] );
        printf ( "\n" );
    }
    
    system ( "pause" );

    return 0;
}//No@
/*
  Se da un conjunto de N numeros. Hallar to das las combinaciones
de subconjuntos que se pueden agrupar
Entrada -----> N, N-enteros.
6
1
2
3
4
5
6
*/
