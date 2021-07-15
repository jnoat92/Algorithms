/*
	Javier Noa Turnes.
	Algoritmo que determina la subsecuencia más larga decrementada
	o incrementada de una lista.	
	Complejidad : O( N * N ).
	
*/
#include <cstdio>

int main (){
    
    int n, res;
    int list[1001], cont[1001];
    
    freopen ( "catcher.in", "r", stdin );
    freopen ( "catcher.out", "w", stdout );
    
    scanf ( "%d", &n );
    for ( int i = 1; i <= n; i++ )
        scanf ( "%d", &list[i] );
    res = -1001;
    
    for ( int i = n; i >= 1; i-- )
        for ( int j = i+1; j <= n; j++ )
            if ( list[j] < list[i] ){
                 cont[i] >?= cont[j] + 1;
                 res >?= cont[i];                 
            }
    
    printf ( "%d\n", res + 1 );
    
    return 0;
}//No@

/*
5
1 2 3 2 4

2
*/
