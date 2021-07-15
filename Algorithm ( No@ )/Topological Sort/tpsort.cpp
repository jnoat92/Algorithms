/*
  Javier Noa Turnes.
  Ordenamiento Topologico
  Este Algoritmo solo se puede efectuar en una red de grafo dirigido
  donde no existan ciclos ( DAG ){ Directed Acyclic Graph }
  
  Para efectuarlo es necesario:
  1- Extraer el o los nodos que no tengan aristas entrantes
  (asi como las aristas que despliegan).Asi sucesivamente.  
  
*/
#include <cstdio>

int M, cont, N;
int G[100][100], sol[100];
bool make[100];

void DFS( int v ){     
     int k;
     
     make[v] = 1;
     for ( k = 1; k <= G[v][0]; k++ )
         if ( !make[G[v][k]] ) DFS( G[v][k] );
     sol[++cont] = v;
}

int main(){
    
    freopen ( "tpsort.in", "r", stdin );
    freopen ( "tpsort.out", "w", stdout );
    scanf ( "%d%d", &N, &M );
    int a, b;
    for ( int i = 1; i <= M; i++ ){
        scanf ( "%d%d", &a, &b );
        G[a][++G[a][0]] = b;
    }
    
    DFS( 1 );
    
    for ( int i = 1; i <= N; i++ )
        if ( !make[i] ) printf ( "%d\n", i );
    for ( int i = cont; i >= 1; i-- )
        printf ( "%d\n", sol[i] );
    
    return 0;
}//No@
