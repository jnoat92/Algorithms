/*
  Javier Noa Turnes.
  Triangulo de Pascal
*/
#include <cstdio>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )

using namespace std;

int Grade;
const int mxn = 1000;
int mat[mxn+1][mxn+1];

int main(){
    
    freopen ( "d.in", "r", stdin );
    freopen ( "d.out", "w", stdout );
    scanf ( "%d", &Grade );
    mat[1][1] = 1;
    For ( i, 2, Grade )
        For ( j, 1, i )
            mat[i][j] = mat[i-1][j] + mat[i-1][j-1];
    For( i, 1, Grade ){
         For( j, 1, i ) printf ( "%d ", mat[i][j] );
         printf ( "\n" );
    }
    
    For ( i, 1, Grade ){
        printf ( "%d --- ", i-1 );
        For ( j, 1, Grade ) printf ( "%d ", mat[i][j] );
        printf ( "\n" );
    }
    
    return 0;
}//No@
