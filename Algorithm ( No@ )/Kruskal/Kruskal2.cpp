/*
  Javier Noa Turnes.
  Kruskal con Disjoint_set
  Complegidad O( N + M )
*/
#include <cstdio>
#include <algorithm>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )

using namespace std;

int N, M;
const int 
      mxnN = 1000,
      mxnM = 10000;
struct are { int ini; int fin; int cost; };
are Edges[mxnM+1];
int P[mxnN+1], rank[mxnN+1];

bool cmp( const are &a, const are &b ){
     return a.cost < b.cost;
}

void Create_set( int v ){
      P[v] = v;
      rank[v] = 0;
}

int Find_set ( int v ){
    if ( v != P[v] ) P[v] = Find_set( P[v] );
    return P[v];
}

void Merge_set ( int vi, int vf ){
     int px = Find_set( vi );
     int py = Find_set( vf );

     if ( rank[px] > rank[py] ) P[py] = px;
     else P[px] = py;
     
     if ( rank[px] == rank[py] ) rank[py]++;
}

int main(){
    
    freopen ( "kruskal.in", "r", stdin );
    freopen ( "kruskal.out", "w", stdout );
    scanf ( "%d%d", &N, &M );
    For ( i, 1, M )
        scanf ( "%d%d%d", &Edges[i].ini, &Edges[i].fin, &Edges[i].cost );
    
    sort ( Edges+1, Edges+1+M, cmp );
    
    For ( i, 1, N ) Create_set ( i );
    
    int sol = 0;
    For ( i, 1, M ){
        int j = Edges[i].ini;
        int k = Edges[i].fin;
        if ( Find_set ( j ) != Find_set ( k ) ){
           Merge_set( j, k );
           sol += Edges[i].cost;
        }else Edges[i].cost = -1;
    }
    
    printf ( "%d\n", sol );
    For ( i, 1, M )
        if ( Edges[i].cost != -1 )
           printf ( "%d %d %d\n", Edges[i].ini, Edges[i].fin, Edges[i].cost );
    
    return 0;
}//No@
