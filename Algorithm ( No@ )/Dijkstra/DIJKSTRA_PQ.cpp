/*
  Javier Noa Turnes
 Algoritmo para hallar el camino minimo de un nodo a todos los demas pero que corre en 
 E log V, hasta ahora lo habiamos visto en V^2, bueno esto una optimizacion n E log V, 
 la idea es la misma cojer y agregar los nodos a un cojunto y lo luego actualizar a todos
 sus enlaces, pero esto lo vamos a hacer con una cola de prioridad en C++, o heap en pascal
 ( mas trabajoso ), pero es lo mismo y siempre vamos a agregar a el conjunto el nodo que este
 en el tope de la cola, lo eliminamos para no repetirlo y actualizamos a todas sus conexiones
 y las agregamos en la cola. 
 Dev Cpp
 Dijkstra - E log V;
*/
#include <cstdio>
#include <algorithm>
#include <vector>
#include <queue>
#include <cmath>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )
#define Phor( i, j, k ) for ( int i = (j); i >= (k); i-- )

using namespace std;

int Nodes, Edges, source, aim;
const int MaxN = 100;
const int inf = 1061109567;
struct are { int fin; int cost; };
vector <are> G[MaxN];
int cam[MaxN+1], res[MaxN+1];

struct cmp{
     bool operator ()( const are &a, const are &b ){
          return a.cost > b.cost;
     }
};
priority_queue < are, vector <are>, cmp > Q;

int main(){
    
    freopen ( "d.in", "r", stdin );
    freopen ( "d.out", "w", stdout );
    scanf ( "%d%d%d%d", &Nodes, &Edges, &source, &aim );
    int a, b, c;
    For ( i, 1, Edges ){
        scanf ( "%d%d%d", &a, &b, &c );
        G[a].push_back ( (are) {b,c} );
        G[b].push_back ( (are) {a,c} );
    }
    
    memset ( cam, 63, sizeof (cam) );
    Q.push ( (are) {source,0} );
    res[source] = 0;
    
    while ( !Q.empty() ){
       are p = Q.top();
       Q.pop();
       For ( k, 0, G[p.fin].size()-1 ){
           if ( p.cost + G[p.fin][k].cost < cam[G[p.fin][k].fin] ){
              cam[G[p.fin][k].fin] = p.cost + G[p.fin][k].cost;
              res[G[p.fin][k].fin] = p.fin;
              Q.push ( (are) {G[p.fin][k].fin, cam[G[p.fin][k].fin]} );
           }
       }
    }

    if ( cam[aim] == inf ) printf ( "Dont Path\n" );
    else printf ( "%d\n", cam[aim] );
    
    int i = aim, j = 0;
    do{
       cam[++j] = i;
       i = res[i];
    }while ( i != 0 );
    
    Phor ( k, j, 1 ) printf ( "%d ", cam[k] );
    
    return 0;
}//No@
