/*
Javier Noa Turnes.
Complejidad : O(V^2) V : vertices
Método Lee para grafos. Hallar camino mínimo.Ver implementación Horse.
Se cojen los padres iniciales(es decir los nodos padres al inicio),
después se le hallan sus hijos, convierte luego estos en padres y
se le hallan los hijos nuevamente y así sucesivamente
hasta encontrar el camino que estamos buscando.
*/

#include <cstdio>
#include <algorithm>
#include <queue>

using namespace std;

struct are { int x; int y; };
const int mxn = 6;
const int movx[4] = {1,-1,0,0};
const int movy[4] = {0,0,1,-1};
queue < are > bfs;
bool mat[mxn+1][mxn+1];
are cam[mxn+1][mxn+1], res[mxn*mxn];
int i, xi, yi;

int main(){
    
    freopen ( "bfs.out", "w", stdout );    
    bfs.push ( (are) {1,1} );
    mat[1][1] = 1;
    
    while ( !bfs.empty() ){
     are p = bfs.front();
     bfs.pop();
     if ( p.x == 6 && p.y == 6  ) break;
     for ( i = 0; i < 4; i++ ){
       xi = movx[i] + p.x;
       yi = movy[i] + p.y;
       if ( xi >= 1 && xi <= 6 )          
        if ( yi >= 1 && yi <= 6 ) 
         if ( !mat[xi][yi] ){
          mat[xi][yi] = true;
          cam[xi][yi].x = p.x;
          cam[xi][yi].y = p.y;
          bfs.push ( (are) {xi,yi} );
         }
     }      
    }
    
    xi = 6; yi = 6; i = 0;
    
    while ( xi != 0 && yi != 0 ){
          i++;
          res[i].x = xi;
          res[i].y = yi;
          xi = cam[res[i].x][res[i].y].x;
          yi = cam[res[i].x][res[i].y].y;          
          }
    
    for ( i = i; i >= 1; i-- ){
        printf ( "%d %d\n", res[i].x, res[i].y );
        }
    return 0;
    }
//No@
