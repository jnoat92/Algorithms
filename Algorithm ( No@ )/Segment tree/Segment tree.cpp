/*
  Javier Noa Turnes.
  Algor : Segment tree ( estructura de dato ).
  ( To solve RMQ problem )
  
  Segment tree es un arbol que se hace desde 1 hasta 2 * ( 2^(log2(N) + 1) ).
  Para un nodo de rango [i,j] que se encuentra en la posicion K su hijo izquierdo
  estara en la posicion K shl 1 y su rango sera [i,(i+j) shr 1]; y su hijo
  derecho estara en la posicion K shl 1 + 1 y su rango sera [(i+j) shr 1,j].
  
*/
#include <cstdio>
#include <algorithm>
#include <cmath>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )
#define Phor( i, j, k ) for ( int i = (j); i >= (k); i-- )

using namespace std;

int N, M, a, b, sol;
const int mxn = 1000;
int list[mxn+1], cost[2*mxn+1];

void Create ( int ini, int fin, int posi ){
     if ( ini == fin ){
        cost[posi] = ini;
        return;
     }     
     Create ( ini, ((ini + fin) / 2), 2*posi );
     Create ( ((ini + fin) / 2)+1, fin, 2*posi+1 );
     
     if ( list[cost[posi*2]] > list[cost[posi*2+1]] )
        cost[posi] = cost[posi*2];
     else cost[posi] = cost[posi*2+1];
}

int Find ( int ri, int rf, int posi ){
    int izq; //tendra la mejor solucion para la rama izquierda del nodo [ri;rf]
    int der; //tendra la mejor solucion para la rama derecha del nodo [ri;rf]
    if ( b < ri || a > rf ) return -1;
    //si el rango [ri;fr] esta fuera del rango [a;b] retorno -1
    else if ( ri >= a && rf <= b ) return cost[posi];
    //si el rango [ri;fr] esta dentro del rango [a;b] retorno la solucion
    //para el rango[ri;rf]
    else{
       izq = Find ( ri, ( ri + rf ) / 2, 2*posi );
       der = Find ( ( ri + rf ) / 2 + 1, rf, 2*posi+1 );
       if ( izq == -1 ) return der;
       else if ( der == -1 ) return izq;
       else 
       if ( list[izq] > list[der] ) return izq;
       else return der;
    }
}

int main(){
    
    freopen ( "seg.in", "r", stdin );
    freopen ( "seg.out", "w", stdout );
    scanf ( "%d%d", &N, &M );
    For ( i, 1, N )
        scanf ( "%d", &list[i] );
    Create ( 1, N, 1 );

    For ( i, 1, M ){
        scanf ( "%d%d", &a, &b );
        sol = list[Find ( 1, N, 1 )];
        printf ( "%d\n", sol );
    }
    
    return 0;
}//No@
