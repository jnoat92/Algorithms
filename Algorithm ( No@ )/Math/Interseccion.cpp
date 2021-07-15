/*
	Algoritmo para determinar si dos rectas en el plano se cortan
*/
#include <cstdio>

struct point { double x, y; };
struct line { point p1, p2; };

double same( line l, point p1, point p2 ){
	double dx, dy, dx1, dx2, dy1, dy2;
	dx = l.p2.x - l.p1.x;  dy = l.p2.y - l.p1.y;

	dx1 = p1.x - l.p1.x;   dy1 = p1.y - l.p1.y;
	dx2 = p2.x - l.p2.x;   dy2 = p2.y - l.p2.y;

	return (dx*dy1 - dy*dx1) * (dx*dy2 - dy*dx2);

}

bool Intersection( line l1, line l2 ){
	return ( (same( l1, l2.p1, l2.p2 ) <= 0 && same( l2, l1.p1, l1.p2 ) <= 0) );
}

int main(){
	
	line l1, l2;
	scanf ( "%lf%lf%lf%lf", &l1.p1.x, &l1.p1.y, &l1.p2.x, &l1.p2.y );
	scanf ( "%lf%lf%lf%lf", &l2.p1.x, &l2.p1.y, &l2.p2.x, &l2.p2.y );
	if ( Intersection( l1, l2 ) ) printf ( "yes\n" );
	else printf ( "no\n" );

	return 0;
}//No@
