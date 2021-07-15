/*
    Javier Noa Turnes
    
    Largest Square es un ejemplo de DP
    que consiste en determinar el area cuadrada
    mas grande que se puede formar donde todas las
    coordenadas sean del mismo tipo
    
    Ej:
    --We have a rectangular construction site, in
    which we want to build a square house.
    --Some part of the land is not suitable for
    construction (0).
    --What is the largest house you can build?
    
*/
#include <cstdio>
#include <algorithm>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )

using namespace std;

int N, M, sol;
char land[1000][1000];
int dp[1000][1000];

int main(){
    
    freopen ( "d.in", "r", stdin );
    freopen ( "d.out", "w", stdout );
    scanf ( "%d%d\n", &N, &M );
    char c;
    For ( i, 1, N )
        gets ( land[i] + 1 );
        
    For ( i, 1, N )
        For ( j, 1, M ){
            if ( land[i][j] != '0' ){
            if ( dp[i-1][j] == dp[i][j-1] ){
                if ( land[i-dp[i][j-1]][j-dp[i][j-1]] != '0' )
                    dp[i][j] = dp[i][j-1] + 1;
                else dp[i][j] = dp[i][j-1];
            }
            else dp[i][j] = min( dp[i-1][j], dp[i][j-1] ) + 1;
            sol >?= dp[i][j];
            }
        }        
        
    printf ( "%d\n", sol );
    
    return 0;
}//No@

/*
7 9
111111111
111101101
101111111
111110111
110111101
111111111
101111111
*/
