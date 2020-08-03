import inc;
defaultpen(fontsize(182));
real rad=1;
real phi=(5 ** 0.5 - 1 ) * 0.5 ; 
int N=4; 

pair O=(0,0);
pair one=(rad,0);
pair I=(0,rad);

pair P[];
P[0]=rotate(360/N/2) * one;
for (int k=0; k<N; ++k) {
	P[k+1] = rotate(90) * P[k] ;
}


pair V1 = -phi * I  ;
pair V2 = rotate (360/3) * V1;
pair V3 = rotate (360/3) * V2;



filldraw ( circle (O,rad), thickpen + red , fillpen=white);

draw ( P[0] -- P[1] -- P[2] -- P[3] -- cycle, thickpen+ red);

draw (V1 -- V2 -- V3 -- cycle, thickpen +red );


lotus ( O, one, rad, 1/phi, N ); 

for (int k=0; k<N; ++k) {
	punto( P[k] ) ;
}

fine();

