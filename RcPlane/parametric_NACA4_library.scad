//*********************************
//*	Parametric NACA4 Library
//*	slightly modified by Quentin Harley - Oct 2011
//*	to ease the use of the NACA profile in other projects
//*
//*	99% of the original code by David Buzz left in tact
//* 	Removed MCAD dependency
//*
//*	Usage:  In stead of using the include directive, the "use" directive
//*	should be used in stead.
//*	The module airfoil() defaults to the NACA-8412
//*
//*	airfoil(camber, position, thickness);
//****************************************************************

//---------------------------------------------------------------------------------------------------
// NACA 4 digit Airfoil/Wing profile calculator:
// Copyright 2011. Author: David Buzz.   email: davidbuzz@gmail.com
// This file may be licensed under the same terms as OpenScad itself ( GPL V2) . 

// The shape of the Naca 4 Digit profiles is determined by three parameters:
//   the camber (first digit)
//   the position of the camber (second digit) and 
//   the thickness in percent (two digits). Profiles without a camber are symmetrical.

// for more details, see http://en.wikipedia.org/wiki/NACA_airfoil
// the MATH for this is based on ideas from an excel spreadsheet found here: http://groups.google.com/group/SketchUp3d/browse_thread/thread/68865aa2fc881e30/26a9ccea8c3c9af1 and authored by TaffGoch.  - if you see this, thanks! 

// Please change these three values and refresh ( F5) to see you modified NACA profile.

// constants: 
	A9=1;A10=2;A11=3;A12=4;A13=5;A14=6;A15=7;A16=8;A17=9;A18=10;A19=11;A20=12;
	A21=13;A22=14;A23=15;A24=16;A25=17;A26=18;A27=19;A28=20;A29=21;A30=22;A31=23;A32=24;A33=25;

	//Pi = 3.14159265;
	Pi = 3.141592653589793238462643383279502884197;
	function RADIANS(v) =  v*(Pi/180) ;  // degrees to radians 
	function DEGREES(w) =  w*(180/Pi) ;   // radians to degrees


	// TIP: excell SIN and COS functions default to RADIANS! ( openscad sin and cos functions default to degrees! ) 
	function COS(x) = cos(DEGREES(x));
	function SIN(y) = sin(DEGREES(y));
	function ATAN(z) = RADIANS(atan(z));


//************************************************************************
module airfoil(maxcamber = 8, camberposn = 4, thickness = 12) {

	//maxcamber = 8;    // percent figure. ( valid in range 0-9 )
	//camberposn = 4; // tenths   ( valid in range 0-9 )
	//thickness = 12; //percentage relative to chord   ( valid in range 0-99 )

//---------------------------------------------------------------------------------------------------
// Yes, I'm aware that the code below is *crap*.  I can't believe I did this without a single loop, and I named the variables after the cell of the xls spreadsheet that I took them from! what was I thinking?   am I mad?   --Buzz.
//---------------------------------------------------------------------------------------------------


	B3 = maxcamber/100;
	m = maxcamber/100;
	B4 = camberposn;
	p = camberposn;
	B5 = thickness/100;
	t = thickness/100;

	// this is NOT modifiable without major functional changes below.  just leave it at 25, ok? 
	datapoints = 25; // on each of upper and lower surfaces
	B6 = datapoints;

	

	// TIP: X^Y in excell means Exponentiation.   in openscad, that's pow(X,Y)


	// x 
	B9 = 1-COS(RADIANS((A9-1)*(90/(B6-1))));
	B10 = 1-COS(RADIANS((A10-1)*(90/(B6-1))));
	B11 = 1-COS(RADIANS((A11-1)*(90/(B6-1))));
	B12 = 1-COS(RADIANS((A12-1)*(90/(B6-1))));
	B13 = 1-COS(RADIANS((A13-1)*(90/(B6-1))));
	B14 = 1-COS(RADIANS((A14-1)*(90/(B6-1))));
	B15 = 1-COS(RADIANS((A15-1)*(90/(B6-1))));
	B16 = 1-COS(RADIANS((A16-1)*(90/(B6-1))));
	B17 = 1-COS(RADIANS((A17-1)*(90/(B6-1))));
	B18 = 1-COS(RADIANS((A18-1)*(90/(B6-1))));
	B19 = 1-COS(RADIANS((A19-1)*(90/(B6-1))));
	B20 = 1-COS(RADIANS((A20-1)*(90/(B6-1))));
	B21 = 1-COS(RADIANS((A21-1)*(90/(B6-1))));
	B22 = 1-COS(RADIANS((A22-1)*(90/(B6-1))));
	B23 = 1-COS(RADIANS((A23-1)*(90/(B6-1))));
	B24 = 1-COS(RADIANS((A24-1)*(90/(B6-1))));
	B25 = 1-COS(RADIANS((A25-1)*(90/(B6-1))));
	B26 = 1-COS(RADIANS((A26-1)*(90/(B6-1))));
	B27 = 1-COS(RADIANS((A27-1)*(90/(B6-1))));
	B28 = 1-COS(RADIANS((A28-1)*(90/(B6-1))));
	B29 = 1-COS(RADIANS((A29-1)*(90/(B6-1))));
	B30 = 1-COS(RADIANS((A30-1)*(90/(B6-1))));
	B31 = 1-COS(RADIANS((A31-1)*(90/(B6-1))));
	B32 = 1-COS(RADIANS((A32-1)*(90/(B6-1))));
	B33 = 1-COS(RADIANS((A33-1)*(90/(B6-1))));

	// y(t)
	C9 = (B5/0.2)*((0.2969*pow(B9,0.5))-(0.126*B9)-(0.3516*pow(B9,2))+(0.2843*pow(B9,3))-(0.1015*pow(B9,4)));	
	C10 =(B5/0.2)*((0.2969*pow(B10,0.5))-(0.126*B10)-(0.3516*pow(B10,2))+(0.2843*pow(B10,3))-(0.1015*pow(B10,4)));
	C11 =(B5/0.2)*((0.2969*pow(B11,0.5))-(0.126*B11)-(0.3516*pow(B11,2))+(0.2843*pow(B11,3))-(0.1015*pow(B11,4)));
	C12 =(B5/0.2)*((0.2969*pow(B12,0.5))-(0.126*B12)-(0.3516*pow(B12,2))+(0.2843*pow(B12,3))-(0.1015*pow(B12,4)));
	C13 =(B5/0.2)*((0.2969*pow(B13,0.5))-(0.126*B13)-(0.3516*pow(B13,2))+(0.2843*pow(B13,3))-(0.1015*pow(B13,4)));
	C14 =(B5/0.2)*((0.2969*pow(B14,0.5))-(0.126*B14)-(0.3516*pow(B14,2))+(0.2843*pow(B14,3))-(0.1015*pow(B14,4)));
	C15 =(B5/0.2)*((0.2969*pow(B15,0.5))-(0.126*B15)-(0.3516*pow(B15,2))+(0.2843*pow(B15,3))-(0.1015*pow(B15,4)));
	C16 =(B5/0.2)*((0.2969*pow(B16,0.5))-(0.126*B16)-(0.3516*pow(B16,2))+(0.2843*pow(B16,3))-(0.1015*pow(B16,4)));
	C17 =(B5/0.2)*((0.2969*pow(B17,0.5))-(0.126*B17)-(0.3516*pow(B17,2))+(0.2843*pow(B17,3))-(0.1015*pow(B17,4)));
	C18 =(B5/0.2)*((0.2969*pow(B18,0.5))-(0.126*B18)-(0.3516*pow(B18,2))+(0.2843*pow(B18,3))-(0.1015*pow(B18,4)));
	C19 =(B5/0.2)*((0.2969*pow(B19,0.5))-(0.126*B19)-(0.3516*pow(B19,2))+(0.2843*pow(B19,3))-(0.1015*pow(B19,4)));
	C20 =(B5/0.2)*((0.2969*pow(B20,0.5))-(0.126*B20)-(0.3516*pow(B20,2))+(0.2843*pow(B20,3))-(0.1015*pow(B20,4)));
	C21 =(B5/0.2)*((0.2969*pow(B21,0.5))-(0.126*B21)-(0.3516*pow(B21,2))+(0.2843*pow(B21,3))-(0.1015*pow(B21,4)));
	C22 =(B5/0.2)*((0.2969*pow(B22,0.5))-(0.126*B22)-(0.3516*pow(B22,2))+(0.2843*pow(B22,3))-(0.1015*pow(B22,4)));
	C23 =(B5/0.2)*((0.2969*pow(B23,0.5))-(0.126*B23)-(0.3516*pow(B23,2))+(0.2843*pow(B23,3))-(0.1015*pow(B23,4)));
	C24 =(B5/0.2)*((0.2969*pow(B24,0.5))-(0.126*B24)-(0.3516*pow(B24,2))+(0.2843*pow(B24,3))-(0.1015*pow(B24,4)));
	C25 =(B5/0.2)*((0.2969*pow(B25,0.5))-(0.126*B25)-(0.3516*pow(B25,2))+(0.2843*pow(B25,3))-(0.1015*pow(B25,4)));
	C26 =(B5/0.2)*((0.2969*pow(B26,0.5))-(0.126*B26)-(0.3516*pow(B26,2))+(0.2843*pow(B26,3))-(0.1015*pow(B26,4)));
	C27 =(B5/0.2)*((0.2969*pow(B27,0.5))-(0.126*B27)-(0.3516*pow(B27,2))+(0.2843*pow(B27,3))-(0.1015*pow(B27,4)));
	C28 =(B5/0.2)*((0.2969*pow(B28,0.5))-(0.126*B28)-(0.3516*pow(B28,2))+(0.2843*pow(B28,3))-(0.1015*pow(B28,4)));
	C29 =(B5/0.2)*((0.2969*pow(B29,0.5))-(0.126*B29)-(0.3516*pow(B29,2))+(0.2843*pow(B29,3))-(0.1015*pow(B29,4)));
	C30 =(B5/0.2)*((0.2969*pow(B30,0.5))-(0.126*B30)-(0.3516*pow(B30,2))+(0.2843*pow(B30,3))-(0.1015*pow(B30,4)));
	C31 =(B5/0.2)*((0.2969*pow(B31,0.5))-(0.126*B31)-(0.3516*pow(B31,2))+(0.2843*pow(B31,3))-(0.1015*pow(B31,4)));
	C32 =(B5/0.2)*((0.2969*pow(B32,0.5))-(0.126*B32)-(0.3516*pow(B32,2))+(0.2843*pow(B32,3))-(0.1015*pow(B32,4)));
	C33 =(B5/0.2)*((0.2969*pow(B33,0.5))-(0.126*B33)-(0.3516*pow(B33,2))+(0.2843*pow(B33,3))-(0.1015*pow(B33,4)));


	// y(c)
	D9= B9<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B9)-pow(B9,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B9)-pow(B9,2)) ;
	D10= B10<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B10)-pow(B10,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B10)-pow(B10,2)) ;
	D11= B11<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B11)-pow(B11,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B11)-pow(B11,2)) ;
	D12= B12<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B12)-pow(B12,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B12)-pow(B12,2)) ;
	D13= B13<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B13)-pow(B13,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B13)-pow(B13,2)) ;
	D14= B14<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B14)-pow(B14,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B14)-pow(B14,2)) ;
	D15= B15<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B15)-pow(B15,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B15)-pow(B15,2)) ;
	D16= B16<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B16)-pow(B16,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B16)-pow(B16,2)) ;
	D17= B17<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B17)-pow(B17,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B17)-pow(B17,2)) ;
	D18= B18<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B18)-pow(B18,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B18)-pow(B18,2)) ;
	D19= B19<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B19)-pow(B19,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B19)-pow(B19,2)) ;
	D20= B20<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B20)-pow(B20,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B20)-pow(B20,2)) ;
	D21= B21<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B21)-pow(B21,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B21)-pow(B21,2)) ;
	D22= B22<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B22)-pow(B22,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B22)-pow(B22,2)) ;
	D23= B23<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B23)-pow(B23,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B23)-pow(B23,2)) ;
	D24= B24<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B24)-pow(B24,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B24)-pow(B24,2)) ;
	D25= B25<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B25)-pow(B25,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B25)-pow(B25,2)) ;
	D26= B26<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B26)-pow(B26,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B26)-pow(B26,2)) ;
	D27= B27<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B27)-pow(B27,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B27)-pow(B27,2)) ;
	D28= B28<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B28)-pow(B28,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B28)-pow(B28,2)) ;
	D29= B29<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B29)-pow(B29,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B29)-pow(B29,2)) ;
	D30= B30<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B30)-pow(B30,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B30)-pow(B30,2)) ;
	D31= B31<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B31)-pow(B31,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B31)-pow(B31,2)) ;
	D32= B32<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B32)-pow(B32,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B32)-pow(B32,2)) ;
	D33= B33<(p/10) ? (m/pow((p/10),2))*((2*(p/10)*B33)-pow(B33,2)) : (m/pow(((1-(p/10))),2))*((1-(2*(p/10)))+(2*(p/10)*B33)-pow(B33,2)) ;

	// x(U)
	E9 = 0;
	E10 =B10 - C10*(SIN(ATAN((D10-D9)/(B10-B9))));
	E11 =B11 - C11*(SIN(ATAN((D11-D10)/(B11-B10))));
	E12 =B12 - C12*(SIN(ATAN((D12-D11)/(B12-B11))));
	E13 =B13 - C13*(SIN(ATAN((D13-D12)/(B13-B12))));
	E14 =B14 - C14*(SIN(ATAN((D14-D13)/(B14-B13))));
	E15 =B15 - C15*(SIN(ATAN((D15-D14)/(B15-B14))));
	E16 =B16 - C16*(SIN(ATAN((D16-D15)/(B16-B15))));
	E17 =B17 - C17*(SIN(ATAN((D17-D16)/(B17-B16))));
	E18 =B18 - C18*(SIN(ATAN((D18-D17)/(B18-B17))));
	E19 =B19 - C19*(SIN(ATAN((D19-D18)/(B19-B18))));
	E20 =B20 - C20*(SIN(ATAN((D20-D19)/(B20-B19))));
	E21 =B21 - C21*(SIN(ATAN((D21-D20)/(B21-B20))));
	E22 =B22 - C22*(SIN(ATAN((D22-D21)/(B22-B21))));
	E23 =B23 - C23*(SIN(ATAN((D23-D22)/(B23-B22))));
	E24 =B24 - C24*(SIN(ATAN((D24-D23)/(B24-B23))));
	E25 =B25 - C25*(SIN(ATAN((D25-D24)/(B25-B24))));
	E26 =B26 - C26*(SIN(ATAN((D26-D25)/(B26-B25))));
	E27 =B27 - C27*(SIN(ATAN((D27-D26)/(B27-B26))));
	E28 =B28 - C28*(SIN(ATAN((D28-D27)/(B28-B27))));
	E29 =B29 - C29*(SIN(ATAN((D29-D28)/(B29-B28))));
	E30 =B30 - C30*(SIN(ATAN((D30-D29)/(B30-B29))));
	E31 =B31 - C31*(SIN(ATAN((D31-D30)/(B31-B30))));
	E32 =B32 - C32*(SIN(ATAN((D32-D31)/(B32-B31))));
	E33 =B33 - C33*(SIN(ATAN((D33-D32)/(B33-B32))));


	// y(U)
	F9=0;
	F10 =D10 + C10*(COS(ATAN((D10-D9)/(B10-B9))));
	F11 =D11 + C11*(COS(ATAN((D11-D10)/(B11-B10))));
	F12 =D12 + C12*(COS(ATAN((D12-D11)/(B12-B11))));
	F13 =D13 + C13*(COS(ATAN((D13-D12)/(B13-B12))));
	F14 =D14 + C14*(COS(ATAN((D14-D13)/(B14-B13))));
	F15 =D15 + C15*(COS(ATAN((D15-D14)/(B15-B14))));
	F16 =D16 + C16*(COS(ATAN((D16-D15)/(B16-B15))));
	F17 =D17 + C17*(COS(ATAN((D17-D16)/(B17-B16))));
	F18 =D18 + C18*(COS(ATAN((D18-D17)/(B18-B17))));
	F19 =D19 + C19*(COS(ATAN((D19-D18)/(B19-B18))));
	F20 =D20 + C20*(COS(ATAN((D20-D19)/(B20-B19))));
	F21 =D21 + C21*(COS(ATAN((D21-D20)/(B21-B20))));
	F22 =D22 + C22*(COS(ATAN((D22-D21)/(B22-B21))));
	F23 =D23 + C23*(COS(ATAN((D23-D22)/(B23-B22))));
	F24 =D24 + C24*(COS(ATAN((D24-D23)/(B24-B23))));
	F25 =D25 + C25*(COS(ATAN((D25-D24)/(B25-B24))));
	F26 =D26 + C26*(COS(ATAN((D26-D25)/(B26-B25))));
	F27 =D27 + C27*(COS(ATAN((D27-D26)/(B27-B26))));
	F28 =D28 + C28*(COS(ATAN((D28-D27)/(B28-B27))));
	F29 =D29 + C29*(COS(ATAN((D29-D28)/(B29-B28))));
	F30 =D30 + C30*(COS(ATAN((D30-D29)/(B30-B29))));
	F31 =D31 + C31*(COS(ATAN((D31-D30)/(B31-B30))));
	F32 =D32 + C32*(COS(ATAN((D32-D31)/(B32-B31))));
	F33 =D33 + C33*(COS(ATAN((D33-D32)/(B33-B32))));

	// x(L)
	G9=0;
	G10 =B10 + C10*(SIN(ATAN((D10-D9)/(B10-B9))));
	G11 =B11 + C11*(SIN(ATAN((D11-D10)/(B11-B10))));
	G12 =B12 + C12*(SIN(ATAN((D12-D11)/(B12-B11))));
	G13 =B13 + C13*(SIN(ATAN((D13-D12)/(B13-B12))));
	G14 =B14 + C14*(SIN(ATAN((D14-D13)/(B14-B13))));
	G15 =B15 + C15*(SIN(ATAN((D15-D14)/(B15-B14))));
	G16 =B16 + C16*(SIN(ATAN((D16-D15)/(B16-B15))));
	G17 =B17 + C17*(SIN(ATAN((D17-D16)/(B17-B16))));
	G18 =B18 + C18*(SIN(ATAN((D18-D17)/(B18-B17))));
	G19 =B19 + C19*(SIN(ATAN((D19-D18)/(B19-B18))));
	G20 =B20 + C20*(SIN(ATAN((D20-D19)/(B20-B19))));
	G21 =B21 + C21*(SIN(ATAN((D21-D20)/(B21-B20))));
	G22 =B22 + C22*(SIN(ATAN((D22-D21)/(B22-B21))));
	G23 =B23 + C23*(SIN(ATAN((D23-D22)/(B23-B22))));
	G24 =B24 + C24*(SIN(ATAN((D24-D23)/(B24-B23))));
	G25 =B25 + C25*(SIN(ATAN((D25-D24)/(B25-B24))));
	G26 =B26 + C26*(SIN(ATAN((D26-D25)/(B26-B25))));
	G27 =B27 + C27*(SIN(ATAN((D27-D26)/(B27-B26))));
	G28 =B28 + C28*(SIN(ATAN((D28-D27)/(B28-B27))));
	G29 =B29 + C29*(SIN(ATAN((D29-D28)/(B29-B28))));
	G30 =B30 + C30*(SIN(ATAN((D30-D29)/(B30-B29))));
	G31 =B31 + C31*(SIN(ATAN((D31-D30)/(B31-B30))));
	G32 =B32 + C32*(SIN(ATAN((D32-D31)/(B32-B31))));
	G33 =B33 + C33*(SIN(ATAN((D33-D32)/(B33-B32))));
	
	// y(L)
	H9=0;
	H10 =D10 - C10*(COS(ATAN((D10-D9)/(B10-B9))));
	H11 =D11 - C11*(COS(ATAN((D11-D10)/(B11-B10))));
	H12 =D12 - C12*(COS(ATAN((D12-D11)/(B12-B11))));
	H13 =D13 - C13*(COS(ATAN((D13-D12)/(B13-B12))));
	H14 =D14 - C14*(COS(ATAN((D14-D13)/(B14-B13))));
	H15 =D15 - C15*(COS(ATAN((D15-D14)/(B15-B14))));
	H16 =D16 - C16*(COS(ATAN((D16-D15)/(B16-B15))));
	H17 =D17 - C17*(COS(ATAN((D17-D16)/(B17-B16))));
	H18 =D18 - C18*(COS(ATAN((D18-D17)/(B18-B17))));
	H19 =D19 - C19*(COS(ATAN((D19-D18)/(B19-B18))));
	H20 =D20 - C20*(COS(ATAN((D20-D19)/(B20-B19))));
	H21 =D21 - C21*(COS(ATAN((D21-D20)/(B21-B20))));
	H22 =D22 - C22*(COS(ATAN((D22-D21)/(B22-B21))));
	H23 =D23 - C23*(COS(ATAN((D23-D22)/(B23-B22))));
	H24 =D24 - C24*(COS(ATAN((D24-D23)/(B24-B23))));
	H25 =D25 - C25*(COS(ATAN((D25-D24)/(B25-B24))));
	H26 =D26 - C26*(COS(ATAN((D26-D25)/(B26-B25))));
	H27 =D27 - C27*(COS(ATAN((D27-D26)/(B27-B26))));
	H28 =D28 - C28*(COS(ATAN((D28-D27)/(B28-B27))));
	H29 =D29 - C29*(COS(ATAN((D29-D28)/(B29-B28))));
	H30 =D30 - C30*(COS(ATAN((D30-D29)/(B30-B29))));
	H31 =D31 - C31*(COS(ATAN((D31-D30)/(B31-B30))));
	H32 =D32 - C32*(COS(ATAN((D32-D31)/(B32-B31))));
	H33 =D33 - C33*(COS(ATAN((D33-D32)/(B33-B32))));


	// top line coords
	//x = E9-E33;
	//y = F9-F33;

	// middle line  coords
	//x = b9-b33;
	//y = d9-d33;

	// bottom line coords
	//x = g9-g33;
	//y = h9-h33;

	polygon( points=[ 
 
	// upper side front-to-back
	[0,0],[E11,F11],[E12,F12],[E13,F13],[E14,F14],[E15,F15],[E16,F16],[E17,F17],[E18,F18],
	[E19,F19],[E20,F20],[E21,F21],[E22,F22],[E23,F23],[E24,F24],[E25,F25],[E26,F26],[E27,F27],[E28,F28],
	[E29,F29],[E30,F30],[E31,F31],[E32,F32],[E33,F33]
	,
	// lower side back to front
	[G33,H33],[G32,H32],[G31,H31],[G30,H30],[G29,H29],[G28,H28],[G27,H27],[G26,H26],[G25,H25],[G24,H24],
	[G23,H23],[G22,H22],[G21,H21],[G20,H20],[G19,H19],[G18,H18],[G17,H17],[G16,H16],[G19,H19],[G14,H14],
	[G13,H13],[G12,H12],[G11,H11],[G10,H10],
	] ); 
}

// to draw the 2D airfoil polygon directly: 
//airfoil();

// use "thrown-together" view, NOT CSG! 

// wing basic sizing  ( affects both eliptical and straight wings ) 
length = 80;
basewidth = 12;  

// extra eliptical wing  sizing: 
ellipse_major =   length;
ellipse_minor =   basewidth/2;
ellipse_chord = 2/3;   
// the chord value : 
//  1 gives fully eliptical wing front and rear ,   
//  2/3 gives spitfire style eliptical wings ( more curve on back edge) 
//  1/3 gives nearly straight front, and heavily curved back edge 
//  0.0 gives straight-fronted wing 


// standard ellipse formula: 
// plot for minor points ( faster )
function my_ellipse(x)  = sqrt( (1 - pow( x, 2 )/pow(ellipse_minor,2)) * pow(ellipse_major,2) );

// plot for major points ( more points) 
function my_ellipse2(y,e_major,e_minor) = sqrt((1 - pow(y,2)/pow(e_major,2)) * pow(e_minor,2));


// plotted as a number of airfoil sections 10 * the size of the wing itself. 
module eliptical_wing(e_major, e_minor, e_chord) {
  for( n = [1:e_major*10] ) {
    translate([n/10,-my_ellipse2(n/10,e_major,e_minor)*e_chord ,0]) {   
		scale([1,my_ellipse2(n/10,e_major,e_minor)*2,my_ellipse2(n/10,e_major,e_minor)*2]) {   // wing length, chord , and height  ( chord and height should be the same ) 
			rotate ( [ 90,0,90 ] ) {
			  // 2D to 3D as linear extrusion 
			  linear_extrude(height=0.1)  airfoil();   
			} 
		}
     }
  } 
}

module straight_wing(s_length, s_base) { 
 	translate ( [n,0,0] ) {  // move the section/s out, and toward the centre a bit 
	       translate([0,-s_base/3,0])	
		rotate ( [ 90,0,90 ] ) {
			// 2D to 3D as linear extrusion 
			linear_extrude(height=s_length)  
				scale([s_base,s_base,1]) {   // wing length, chord , and height  ( chord and height should be the same )
					airfoil();   
			} 
		}
	}

  
}

// a simple straight wing ! 
translate([0,10,0]) 
	straight_wing( length, basewidth);


// a eliptical spitfire styled wing ! 
translate([0,-10,0])
	eliptical_wing(ellipse_major,ellipse_minor,ellipse_chord);



