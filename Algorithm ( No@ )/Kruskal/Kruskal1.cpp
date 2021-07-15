/*
	Javier Noa Turnes.
	Algor : Kruskal -- Para hayar el Arbol minimo en expansion
*/
#include <cstdio>
#include <algorithm>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )

using namespace std;

int Nodes, E;
const int 
      MaxN = 1000,
      MaxE = MaxN*(MaxN-1) / 2;
struct are { int ini; int fin; int cost; };
int Comp[MaxN+1];  // Componentes en las que se encuentra cada nodo
are Edges[MaxE];  // Aristas

bool cmp ( const are &a, const are &b ){
     return a.cost < b.cost;
}

void Kruskal(){
     int c = 0, j;
     For ( i, 1, E ){         
         if ( !Comp[Edges[i].ini] && !Comp[Edges[i].fin] ){
            c++;
            Comp[Edges[i].ini] = c;
            Comp[Edges[i].fin] = c;
         }
         else if (  Comp[Edges[i].ini] * Comp[Edges[i].fin] == 0 ){
            if ( Comp[Edges[i].ini] == 0 )
               j = Edges[i].ini;
               else j = Edges[i].fin;
               Comp[j] = Comp[Edges[i].ini] + Comp[Edges[i].fin];
         }
         else if ( Comp[Edges[i].ini] != Comp[Edges[i].fin] ){
            int a = Comp[Edges[i].ini], b = Comp[Edges[i].fin];
            For ( j, 1, Nodes )
                if ( Comp[j] == a )
                   Comp[j] = b;
         }
         else Edges[i].cost = 0;
		 //Cuando ya se han tomado N-1 nodos entonces ya esta formado el arbol
     }
}

int main(){
    
    freopen ( "Kruskal.in", "r", stdin );
    freopen ( "Kruskal.out", "w", stdout );
    scanf ( "%d%d", &Nodes, &E );
    For ( i, 1, E )
        scanf ( "%d%d%d", &Edges[i].ini, &Edges[i].fin, &Edges[i].cost );
    sort ( Edges+1, Edges+1+E, cmp );
    
    Kruskal();
    
    int cstmi = 0;
    For ( i, 1, E )
        if ( Edges[i].cost ) cstmi += Edges[i].cost;

    printf ( "%d\n", cstmi );
    For ( i, 1, E )
        if ( Edges[i].cost )
           printf ( "%d %d %d\n", Edges[i].ini, Edges[i].fin, Edges[i].cost );
    
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
