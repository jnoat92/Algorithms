#include <cstdio>
#include <algorithm>
#include <queue>
#include <set>
#include <cmath>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )
#define Phor( i, j, k ) for ( int i = (j); i >= (k); i-- )

using namespace std;

int N, M;
const int mxn1 = 1000;
const int mxn2 = 2000;
struct are { int lon; int cost; int qs; int dv; int cant; };
are list[mxn1+1];
are mo[mxn2+1];

int main(){
    
    freopen ( "d.in", "r", stdin );
    freopen ( "d.out", "w", stdout );
    scanf ( "%d%d", &N, &M );    
    For ( i, 1, N )
        scanf ( "%d%d", &list[i].lon, &list[i].cost );
    
    mo[0].lon = 1;
    For ( i, 1, N ){
        Phor ( j, M-list[i].lon, 0 ){
            if ( mo[j].lon > 0 && j + list[i].lon <= M )
               if ( mo[j+list[i].lon].lon < mo[j].lon + list[i].cost ){
                  mo[j+list[i].lon].lon = mo[j].lon + list[i].cost;
                  mo[j+list[i].lon].qs = i;
                  mo[j+list[i].lon].dv = j;
                  mo[j+list[i].lon].cant = mo[j].cant + 1;
               }
        }
    }
    
    printf ( "%d %d\n", mo[M].lon - 1, mo[M].cant );
    
    int j = M;
    N = mo[M].cant;
    while ( N > 0 ){
       list[N].lon = mo[j].qs;
       j = mo[j].dv;
       N--;
    }
    For ( i, 1, mo[M].cant ) printf ( "%d\n", list[i].lon );
    
    return 0;
}//No@
