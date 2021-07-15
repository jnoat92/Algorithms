/*
  Javier Noa Turnes.
  Algor : Heap Sort.
  
  Utilizando una cola de prioridad donde a medida que entran 
  los elementos actualiza la raiz del arbol binario y a su
  ves los demas nodos.
*/
#include <cstdio>
#include <algorithm>
#include <queue>
#include <cmath>
#include <vector>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )

using namespace std;

struct cmp{
       bool operator () ( const int &a, const int &b ){
            return a < b; // Si estamos buscando el mayor elemento
            //return a > b // Si estamos buscando el menor elemento
       }
};

priority_queue < int, vector <int>, cmp > Q;
int N;

int main(){    
    freopen ( "d.in", "r", stdin );
    freopen ( "d.out", "w", stdout );
    scanf ( "%d", &N );
    For ( i, 1, N ){
        int a;
        scanf ( "%d", &a );
        Q.push ( a );
    }
    
    while ( !Q.empty() ){
          printf ( "%d\n", Q.top() );
          Q.pop();
    }
    
    
    return 0;
}//No@
