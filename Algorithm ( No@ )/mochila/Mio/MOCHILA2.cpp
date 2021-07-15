#include <cstdio>
#include <algorithm>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )
#define Phor( i, j, k ) for ( int i = (j); i >= (k); i-- )

using namespace std;

int N, M;
const int inf = 1061109567;
const int mxn1 = 1000;
const int mxn2 = 5000;
struct are { int height; int cost; };
are list[mxn1+1];
int mo[mxn2+1];

int main(){
    
    freopen ( "d.in", "r", stdin );
    freopen ( "d.out", "w", stdout );
    scanf ( "%d%d", &N, &M );    
    For ( i, 1, N )
        scanf ( "%d %d", &list[i].height, &list[i].cost );
    
    memset ( mo, 63, sizeof ( mo ) );
    mo[0] = 0;
    For ( i, 1, N ){
        Phor ( j, M-list[i].height, 0 ){
             if ( mo[j] < inf && j + list[i].height <= M )
                if ( mo[j+list[i].height] > mo[j] + list[i].cost )
                   mo[j+list[i].height] = mo[j] + list[i].cost;
        }
    }
    
    printf ( "%d\n", mo[M] );
    
    return 0;
}//No@
