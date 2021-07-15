/*
  Javier Noa Turnes.
  Prim : Algoritmo para hayar el arbol minimo en expansion en un
  grafo no orientado.
*/
#include <cstdio>
#include <algorithm>
#include <cmath>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )

using namespace std;

int Nodes, E, ini, fin;
const int 
      MaxN = 100,
      inf = 1061109567;
int Cost[MaxN+1][MaxN+1];
bool make[MaxN+1] = {0};
int Edges[MaxN], Ntaken[MaxN];

void Edge_min( int v ){
     int last_min = inf;
     For ( j, 1, v )
         For ( k, 1, Nodes ){
             if ( !make[k] && Cost[Ntaken[j]][k] < last_min ){
                last_min = Cost[Ntaken[j]][k];
                ini = Ntaken[j];
                fin = k;
             }
         }
}

int main(){
    
    freopen ( "prim.in", "r", stdin );
    freopen ( "prim.out", "w", stdout );

    scanf ( "%d%d", &Nodes, &E );
    int a, b, c;
    memset ( Cost, 63, sizeof (Cost) );
    For ( i, 1, E ){
        scanf ( "%d%d%d", &a, &b, &c );
        Cost[a][b] <?= c;
        Cost[b][a] <?= c;
    }
    
    Ntaken[1] = 1; make[1] = 1;
    For ( i, 2, Nodes ){
        Edge_min( i-1 );
        make[fin] = 1;
        Ntaken[i] = fin;
        Edges[fin] = ini;
    }//Prim
    
    For ( i, 2, Nodes ){
        printf ( "%d %d\n", Edges[i], i );
    }
    
    return 0;
}//No@

/*
6 10
1 2 2
1 6 2
1 5 3
2 3 3
2 6 6
3 6 1
3 4 5
4 6 5
4 5 6
5 6 4
*/
