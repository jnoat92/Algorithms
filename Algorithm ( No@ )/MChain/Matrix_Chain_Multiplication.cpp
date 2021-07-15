/*
    
    Javier Noa Turnes.
    
    Matrix Chain Multiplication
    to solve Packing Cooler

    En el algoritmo voy a llevar tres parametros:
    *Longitud de los rangos.
    *Inicio del rango.
    *Fin del rango.

Bueno, esto algoritmo no es especifico cada cual lo implementa, 
como quiera la idea es la siguiente: 
Para  saber la solucion final en una secuencia que depende de sus
subsecuencias consecutivas. Tenemos que obtener primero las soluciones
de estas subsecuencias.

A1, A2, A3, A4, A5, A6, A7
para saber la solucion de A1..A7 debemos conocer primero las soluciones
de :
A1..A2 
pero para saber la solucion esta debemos saber la mejor solucion de A1
y A2.
A1..A3
para saber esta debes cojer la mejor solution entre A1 y A2..A3, 
A1..A2 y A3  

Es decir que cada subconjunto depende de sus subconjuntos, para 
mas informacion en el Dr.Books.

Complejidad : O(n^3)

Como ejemplo esta el problema Apilando Neveras Turquía 123
*/

#include <cstdio>
#include <algorithm>
#include <cmath>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )

using namespace std;

int N;
const int 
    mxn = 100,
    inf = 1 << 29;
int list[mxn+1];
int dp[mxn+1][mxn+1], cam[mxn+1][mxn+1][2];

void Ext( int ini, int fin ){
    
    if ( ini == fin ){
        printf ( "%d", list[ini]-list[ini-1] );
        return;
    }
    
    if ( cam[ini][fin][1] ){
        printf ( "(" );
        Ext( ini, cam[ini][fin][0] );
        printf ( "->" );
        Ext( cam[ini][fin][0]+1, fin );
        printf ( ")" );
    }
    else{
        printf ( "(" );
        Ext( cam[ini][fin][0]+1, fin );
        printf ( "->" );
        Ext( ini, cam[ini][fin][0] );
        printf ( ")" );
    }
    
}

int main(){
    
    scanf ( "%d", &N );
    For ( i, 1, N ){
        scanf ( "%d", &list[i] );
        list[i] += list[i-1];
    }
    
    For( i, 1, N )
        For( j, i+1, N )
            dp[i][j] = inf;
            
    int fin, v1, v2;
    For ( i, 2, N ){
        For ( j, 1, N-i+1 ){
            fin = j+i-1;
            For ( k, j, fin ){
                v1 = (list[k] - list[j-1]) * (fin-k) + dp[j][k] + dp[k+1][fin];
                v2 = (list[fin] - list[k]) * (k-j+1) + dp[j][k] + dp[k+1][fin];
                if ( v1 < dp[j][fin] ){
                    dp[j][fin] = v1;
                    cam[j][fin][0] = k;
                    cam[j][fin][1] = 1;
                }
                if ( v2 < dp[j][fin] ){
                    dp[j][fin] = v2;
                    cam[j][fin][0] = k;
                    cam[j][fin][1] = 0;
                }
            }
        }
    }
    
    printf ( "%d\n", dp[1][N] );
    
    Ext( 1, N );
    printf ( "\n" );
    
    return 0;
}//No@
