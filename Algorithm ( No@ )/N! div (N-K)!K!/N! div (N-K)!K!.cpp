/*
  Javier Noa Turnes.
                 (N)            N!
  Combinacion de(   ) =   --------------
                 (K)      (N - K)! * K!
  N y K no pueden tener un valor demasiado grande
  porque sino no cabe en la variable.
  En caso de ser asi hay que implementarlo con un Big Num
*/
#include <cstdio>

using namespace std;

int N, K, i;
double fact;
typedef long long int64;

int main(){
    
    freopen ( "d.in", "r" , stdin );
    freopen ( "d.out", "w", stdout );
    scanf ( "%d%d", &N, &K );
    
    if ( K > N - K ) K = N - K;
    
    fact = 1;
    for ( i = 1; i <= K; i++ ) fact /= i;
    for ( i = N; i >= N-K+1; i-- ) fact *= i;
    
    printf ( "%I64d", int64(fact) );
    
    return 0;
}//No@
