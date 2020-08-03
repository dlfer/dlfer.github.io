import inc;
defaultpen(fontsize(182));
real rad=1;
real phi=(5 ** 0.5 - 1 ) * 0.5 ; 
int N=60; 

pair O=(0,0);
pair one=(rad,0);
pair I=(0,rad);

pair P[];
P[0]= rotate(360/N/2) * one;
for (int k=0; k<N; ++k) {
	P[k+1] = rotate(360/N) * P[k] ;
}


pair V1 = - I  ;
pair V2 = rotate (360/3) * V1;
pair V3 = rotate (360/3) * V2;



draw ( circle (O,rad / 5 ), thickpen );

// draw ( circle (O, 0.8 * rad) , thickpen + yellow )  ; 
// draw ( circle (O+0.1*I, 0.7 * rad) , thickpen + yellow )  ; 

// draw ( P[0] -- P[1] -- P[2] -- P[3] -- P[4] -- P[5] --  cycle, thickpen+ black);

// draw (V1 -- V2 -- V3 -- cycle, thickpen + purple );

// draw ( circle (O,0.5*rad), thickpen + blue );


// draw (rotate(60) * ( V1 -- V2 -- V3 -- cycle), thickpen + green);
// draw (V1 -- V2 -- V3 -- cycle, black );

// petalo ( P[7], P[1], 1.7); 
// petalo ( P[3], P[5], 1.7) ;

// lotus ( O, one/5 , rad/5, 1.6, 5 ); 
// lotus ( O, rotate(360 / 30) * one/5 , rad/5, 1.6, 5 ); 

filldraw ( circle (O,rad / 5 ), thickpen + red );
filldraw ( circle (O,rad / 5 *0.9258), thickpen + orange );
filldraw ( circle (O,rad / 5 *0.8451), thickpen + yellow );
filldraw ( circle (O,rad / 5 *0.7559), thickpen + green );
filldraw ( circle (O,rad / 5 *0.6546), thickpen + blue  );
filldraw ( circle (O,rad / 5 *0.5345), thickpen + purple  );
filldraw ( circle (O,rad / 5 *0.3779), thickpen + white  );

for (int k=0; k<12; ++k) {
lotus ( O, rotate(360 / (12*5) * k) * one/5 , rad/5, 1.6, 5 ); 
}

real s;

for (int k=0; k<6; ++k) {
s= 1.33;
s= 1.34;
lotus ( O, rotate(360 / (10*6) * k+ 0* 360/(10*6*2) ) * one/5 * s , rad/5 * s, 1.4, 10 ); 
}

for (int k=0; k<2; ++k) {
s= 1.60;
s= 1.61;
lotus ( O, rotate(360 / (60*2) * k+ 0* 360/(10*6*2) ) * one/5 * s , rad/5 * s, 1.10, 60 ); 
}

// for (int k=0; k<N; ++k) {
// 	punto( P[k] ) ;
// }
real tt=0.8;
for (int k = 0; k<1000; ++k) {
draw (  circle (O,rad / 5 *0.3779 * (tt**k) ), gray ) ;
}


fine();

