/*
  Javier Noa Turnes
  Lo mismo que en un arreglo lineal, solo que en dos dimenciones.
  2D
*/

#include <cstdio>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )

int N, M, Q, sum;
const int mxn = 1000;
int a[mxn+2][mxn+2], BIT[mxn+2][mxn+2];
char s;

int low_bit( int x ){
    return x & -x;
}

void Update( int x, int y, int val ){
     while ( x <= N ){
        int y1 = y;
        while ( y1 <= M ){
           BIT[x][y1] += val;
           y1 += low_bit( y1 );
        }
        x += low_bit( x );
     }
}

int Sum0( int x, int y ){
    int res = 0;
    while ( x ){
       int y1 = y;
       while ( y1 ){
          res += BIT[x][y1];
          y1 -= low_bit( y1 );
       }
       x -= low_bit( x );
    }
    return res;
}

int main(){
    
    freopen ( "d.in", "r", stdin );
    freopen ( "d.out", "w", stdout );
    scanf ( "%d%d%d", &N, &M, &Q );
    
    For ( i, 1, N )
        For ( j, 1, M ){
            scanf ( "%d", &a[i][j] );
            Update( i, j, a[i][j] );
        }
    
    scanf ( "\n" );
    int a1, b1, a2, b2;
    For ( i, 1, Q ){
        scanf ( "%c", &s );
        if ( s == 'I' ){
           scanf ( "%d%d%d\n", &a1, &b1, &a2 );
           Update( a1, b1, a2-a[a1][b1] );
           a[a1][b1] = a2;
        }else{
           scanf ( "%d%d%d%d\n", &a1, &b1, &a2, &b2 );
           sum = Sum0( a2, b2 )-Sum0( a2, b1-1 )-Sum0( a1-1, b2 )+Sum0( a1-1, b1-1 );
           printf ( "%d\n", sum );
        }
    }
    
    return 0;
}//No@

/*
4 4 2
1 4 0 3
9 7 5 1
10 2 8 6
2 5 0 3
I 3 4 10
Q 1 2 4 4
*/
