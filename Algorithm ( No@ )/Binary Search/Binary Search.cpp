/*
  Javier Noa Turnes.
  Busqueda binaria : Algoritmo para buscar un elemento en una lista.
  Complejidad : O( log(N) ).
  Para que esto funcione la lista debe estar ordenada.

  Explicacion:
  Esta busqueda es muy sencilla y puede ser muy util, ejemplo tenemos una lista de numeros
  ordenados de menor a mayor o de mayor a menor, trabajaremos de menor a mayor, y queremos
  buscar un numero en esta lista en la menor cantidad de pasos posibles, entonces que hacemos
  llamaremos ini al inicio de la lista y fin al fin de la lista, es decir que si la lista es de
  8 elementos ini=1 y fin=8, luego buscamos la mitad esto es mit = (ini+fin)div 2 entonces 
  comprobamos si la mitad es menor que el numero buscado y si esto ocurre hacemos ini= mit+1,
  porque se supone que la mit ya la miramos, y como se puede ver se elimina la mitad de la lista
  esto es porque si el numero es mayor que la mitad, se supone que los que estan detras de el 
  tambien son menores. La busqueda binaria tambien puede ser utilizada para ubicar un numero
  en una lista de numeros en su mejor ubicacion.}
  
*/
#include <cstdio>
#include <algorithm>
#define For( i, j, k ) for ( int i = (j); i <= (k); i++ )

using namespace std;

int N, num;
const int mxn = 10000;
int list[mxn+1];

int main(){
    
    freopen ( "d.in", "r", stdin );
    freopen ( "d.out", "w", stdout );
    scanf ( "%d%d", &N, &num );
    For ( i, 1, N ) scanf ( "%d", &list[i] );
    
    sort ( list+1, list+1+N );
    
    //Binary Search
    int ini = 1, fin = N, half, sol = 0;
    while ( ini <= fin ){
        half = ( ini + fin ) / 2;
        if ( num < list[half] )
           fin = half - 1;
        else ini = half + 1;
        if ( list[half] == num ){
           sol = half;
           break;
        }
    }
    
    if ( sol ) printf ( "%d\n", sol );
    else printf ( "No Se Encuentra" );
    
    return 0;
}//No@

/*
10 20
2 4 5 7 9 20 22 26 28 30

Dada una lista de elementos y un numero encontrar este numero en la
lista en la menor cantidad de pasos posibles.

*/
