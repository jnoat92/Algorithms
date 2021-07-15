#include <cstdio>
#include <algorithm>
#include <iostream>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )

using namespace std;

int N, M;
const int inf = 1061109567;
const int mxn = 100;
const int mxn1 = 1000;
int list[mxn+1];
int mo[mxn+1];

int main(){
    
    freopen ( "d.in", "r", stdin );
    freopen ( "d.out", "w", stdout );
    
    scanf ( "%d%d", &N, &M );
    For ( i, 1, N )
        scanf ( "%d", &list[i] );
    
    memset ( mo, 63, sizeof ( mo ) );
    mo[0] = 0;
    For ( i, 0, M ){
        if ( mo[i] != inf )
         For ( j, 1, N ){
             if ( ( mo[i+list[j]] > mo[i] + 1 ) && i+list[j] <= M )
                mo[i+list[j]] = mo[i] + 1;
         }
    }
    
    printf ( "%d\n", mo[M] );
    
    return 0;    
}//No@
