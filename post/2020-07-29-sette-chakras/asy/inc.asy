import fontsize;
// texpreamble("\usepackage{esvect}\usepackage{mathptmx}\usepackage{bm}");
texpreamble("\usepackage{esvect}\usepackage{mathpazo}\usepackage{bm}");
pen thickpen = black + 2;
pen oneptpen = 1 + black;
pen thinpen = 0.5 + black;
pen tratteggiato = 1 + black + linetype("4 4");
pen tratteggiatofine = 0.5 + black + linetype("6 6");
real sizefont = 11;
defaultpen(oneptpen);
real margineX;
real margineY;
arrowbar freccia;
void widefig() {
defaultpen( fontsize(12) + black );
margineX=0.2cm;
margineY=0.2cm;
sizefont=12;

defaultpen( fontsize(sizefont) + black );
freccia = Arrow(size=9);
size(12.25cm,0,keepAspect=Aspect);
}
void fine() {
shipout(bbox(margineX,margineY,nullpen));
}

void Punto(pair P ) {
dot(P,black+3); dot(P,white+1.5);
}

void punto(pair P, string s = "", pair labeldir = E ) {
draw( Label (s,1,labeldir), P);
Punto(P);
// dot(P,blue+3); dot(P,white+1.5);
}


import math;
real norm(pair P) {
return sqrt( (P.x)**2 + (P.y)**2 );
}

real scalarProd(pair P, pair Q) {
return P.x * Q.x + P.y * Q.y ;
}

pair projected(pair A, pair B, pair C) {
real t =   scalarProd(C-A,B-A) / scalarProd(B-A,B-A);
return A + t *(B-A); 
}

pair intersection(pair A, pair B, pair C, pair D) {
real t = scalarProd( A-C, rotate(90) * (B-A) ) / scalarProd( D-C, rotate(90)*(B-A) ) ;
return C + t * (D-C);  
}

void petalo( pair A, pair B, real rrad ) {
draw (A{A+0.7*B} .. (rrad * norm(A) * norm(A+B)**(-1)*(A+B)){A+B}   ) ;
draw (B{0.7*A+B} .. (rrad * norm(B) * norm(A+B)**(-1)*(A+B)){A+B}  ) ;
}


void  lotus (pair O, pair P0, real rad, real rrad, int N) {
pair A;
pair B;
A=P0;
B=rotate(360/N) * P0;
// draw ( circle (O,rad), black );
for ( int k=0; k < N; ++k ) {
petalo( A, B , rrad );
A = B;
B = rotate(360/N)*A;
}
}


widefig();


