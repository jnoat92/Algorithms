/*
  Javier Noa Turnes
  Gauss_Method
  El metodo de Gauss sirve para resolver un sistema de ecuaciones
  de N variables y N ecuaciones ( N*N ).
  En realidad consiste en sumar todas las ecuaciones de manera
  que se vallan simplificando entre si y luego de la mas simple
  puedan resolverse las mas complejas.
*/
#include <cstdio>
#include <algorithm>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )
#define Phor( i, j, k ) for ( int i = (j); i >= (k); i-- )

using namespace std;

int N, num;
const int mxn = 1000;
int mat[mxn+3][mxn+3], aux[mxn+2];
double sol[mxn+2];

int main(){
    
    freopen ( "gauss.in", "r", stdin );
    freopen ( "gauss.out", "w", stdout );
    scanf ( "%d", &N );
    For ( i, 1, N )
        For ( j, 1, N+1 ) scanf ( "%d", &mat[i][j] );
    
    //Gauss
    For ( i, 1, N-1 ){
        For ( j, i, N )
            if ( mat[j][i] ){
               For ( k, 1, N ) aux[k] = mat[i][k];
               For ( k, 1, N ) mat[i][k] = mat[j][k];
               For ( k, 1, N ) mat[j][k] = aux[k];
               break;
            }
        For ( j, i+1, N )
            if ( mat[j][i] != 0 ){
               num = mat[j][i];
               For ( k, i, N+1 )
                   mat[j][k] = mat[i][k]*num - mat[j][k]*mat[i][i];
            }
    }
    
    Phor( i, N, 1 ){
          sol[i] = mat[i][N+1];
          Phor( j, N, i+1 )
                sol[i] -= mat[i][j] * sol[j];
          sol[i] /= mat[i][i];
    }
    
    For ( i, 1, N ) printf ( "%.0lf\n", sol[i] );
    
    return 0;
}//No@
