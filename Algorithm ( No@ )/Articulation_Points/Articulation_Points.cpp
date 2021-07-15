/*
  Javier Noa Turnes
  Articulation Points
*/
#include <cstdio>
#include <algorithm>
#include <vector>

using namespace std;

int M, num, aux, men;
vector <int> G[101], sol;
int low[101], anc[101];

int DFS( int v ){
    men = low[v] = ++num;
    
    for ( int k = 0; k <= G[v].size()-1; k++ ){
        if ( !low[G[v][k]] ){
           aux = DFS( G[v][k] );
           if ( aux < men ) men = aux;
           if ( ( aux >= low[v] && v != 1) || ( v == 1 && low[G[v][k]] > 1 ) ){
              printf ( "%d\n", v );
           }
        }
        else if ( men > low[G[v][k]] ) men = low[G[v][k]];
    }
    return men;
}

int main(){
    
    freopen ( "point.in", "r", stdin );
    freopen ( "point.out", "w", stdout );
    scanf ( "%d", &M );
    int a, b;
    for ( int i = 1; i <= M; i++ ){
        scanf ( "%d%d", &a, &b );
        G[a].push_back( (int) {b} );
        G[b].push_back( (int) {a} );
    }
    
    num = 0;
    DFS( 1 );
    
    return 0;
}//No@
/*
10
1 2
1 3
1 4
1 5
2 4
2 5
3 6
3 7
4 5
6 7
*/
