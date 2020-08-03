import inc;
defaultpen(fontsize(182));
real rad=1;
real phi=(5 ** 0.5 - 1 ) * 0.5 ; 
int N=16; 

pair O=(0,0);
pair one=(rad,0);
pair I=(0,rad);

pair P[];
P[0]=rotate(360/N/2) * one;
for (int k=0; k<N; ++k) {
	P[k+1] = rotate(360/N) * P[k] ;
}


pair V1 = - I  ;
pair V2 = rotate (360/3) * V1;
pair V3 = rotate (360/3) * V2;



draw ( circle (O,rad), thickpen + blue );

// draw ( circle (O, 0.8 * rad) , thickpen + yellow )  ; 
// draw ( circle (O+0.1*I, 0.7 * rad) , thickpen + yellow )  ; 

// draw ( P[0] -- P[1] -- P[2] -- P[3] -- P[4] -- P[5] --  cycle, thickpen+ black);

draw (V1 -- V2 -- V3 -- cycle, thickpen + blue);

draw ( circle (O,0.5*rad), thickpen + blue );


// draw (rotate(60) * ( V1 -- V2 -- V3 -- cycle), thickpen + green);
// draw (V1 -- V2 -- V3 -- cycle, black );


lotus ( O, one, rad, 1.3, N ); 

// for (int k=0; k<N; ++k) {
// 	punto( P[k] ) ;
// }

fine();

