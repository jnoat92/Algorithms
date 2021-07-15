/*
  Javier Noa Turnes
  Binary Index Tree (BIT)
  Estructura de datos en la que la suma acumulativa y la actualizacion de
  datos pueden ser hechos en O(log2(N)).
  En el arreglo cada posicion I guarda la solucion para
  el intervalo [I-2^k+1;I] donde K es el número de ceros a la
  derecha en la representación binaria de I.
  
*/

#include <cstdio>

const int mxn = 1 << 10;
int N, M, y, z;
int a[mxn+2], BIT[mxn+2];
char s;

int low_bit( int x ){
    return x & -x;
}//devuelve 2^k donde k es la cantidad de ceros a la derecha en
 //la representacion binaria de x.

void Update( int idx, int x ){
     while ( idx <= N ){
        BIT[idx] += x;
        idx += low_bit(idx);
     }
}

int Sum( int ini, int fin ){
    int S = 0; ini--;
    while ( ini ){
       S += BIT[ini];
       ini -= low_bit(ini);
    }

    int M = 0;
    while ( fin ){
       M += BIT[fin];
       fin -= low_bit(fin);
    }
    return M-S;
}

int main(){
    
    freopen ( "d.in", "r", stdin );
    freopen ( "d.out", "w", stdout );
    scanf ( "%d%d", &N, &M );

    for ( int i = 1; i <= N; i++ ){
        scanf ( "%d", &a[i] );
        Update( i, a[i] );
    }

    scanf ( "\n" );
    for ( int i = 1; i <= M; i++ ){
        scanf ( "%c%d%d\n", &s, &y, &z );
        if ( s == 'Q' )
           printf ( "%d\n", Sum( y, z ) );
        else{
           Update( y, z-a[y] );
           a[y] = z;
        }
    }
    
    return 0;
}//No@

/*

Se tiene una lista de N enteros ai y M instrucciones de dos tipos:
-- Insertar en la posicion y el numero z
-- Determinar la suma de los valores de la lista desde y hasta z.

Formato de entrada
N M
a1 a2 a3 ...ai... aN
I y z                  ==> Insertar.
Q y z                  ==> Determinar la suma.
(...)

Formato de salida
La suma de los valores en los intervalos dados

ENTRADA1.........d.in

10 5
1 2 1 4 6 2 2 3 2 1
Q 3 8
I 4 23
Q 1 2
I 7 1
Q 3 9

SALIDA1.........d.out

18
3
38

ENTRADA2.........d.in

16 5
1 0 2 1 1 3 0 4 2 5 2 2 3 1 0 2
Q 3 8
I 4 23
Q 1 10
I 7 1
Q 3 16

SALIDA2.........d.out

11
41
51

*/
