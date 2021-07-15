#include <cstdio>
#include <algorithm>
#include <cmath>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )
#define Phor( i, j, k ) for ( int i = (j); i >= (k); i-- )

using namespace std;

int Nodes, Edges, ini, fin;
const int mxn = 100;
const int inf = 1061109567;
int mat[mxn+1][mxn+1];
int cam[mxn+1], res[mxn+1];
bool make[mxn+1];

void Dijkstra ( int v ){
     int x;
     make[v] = true;
     For ( i, 1, Nodes )
         cam[i] = mat[v][i];
     For ( i, 1, Nodes ) res[i] = ini;
     res[ini] = 0;
     
     For ( i, 1, Nodes ){
         x = 1;
         while ( make[x] ) x++;
         For ( j, 1, Nodes )
             if ( !make[j] && cam[j] < cam[x] ) x = j;
         if ( cam[x] == inf ){
            printf ( "Dont Path" );
            return;
         }
         make[x] = 1;
         For ( j, 1, Nodes ){
             if ( mat[x][j] != inf )
                if ( !make[j] && cam[j] > cam[x] + mat[x][j] ){
                   cam[j] = cam[x] + mat[x][j];
                   res[j] = x;
                }
         }
     }
}

int main(){
    
    freopen ( "d.in", "r", stdin );
    freopen ( "d.out", "w", stdout );
    scanf ( "%d%d%d%d", &Nodes, &Edges, &ini, &fin );
    memset ( mat, 63, sizeof ( mat ) );
    int a, b, c;
    For ( i, 1, Edges ){
        scanf ( "%d%d%d", &a, &b, &c );
        mat[a][b] = c;
        mat[b][a] = c;
    }
    
    Dijkstra ( ini );
    printf ( "%d\n", cam[fin] );
    
    int i = fin, j = 0;
    while ( i != 0 ){
          cam[++j] = i;
          i = res[i];
    }
    
    Phor ( i, j, 1 ) printf ( "%d ", cam[i] );
    
    return 0;
}//No@
