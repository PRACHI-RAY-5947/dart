#include<stdio.h>
#include<conio.h>

main()
{
	const float pi = 3.14;
	float r=2,l=4,b=3,base=6,h=8,p=3,t=8;
	clrscr();

	printf("\narea of circle = %.2f",pi*r*r);

	printf("\narea of rectangle = %.2f",l*b);

	printf("\narea of triangle = %.2f ",0.5*base*h);

	printf("\nsimple interest = %.2f ",p*1+r*t);

	printf("\nperimeter of circle = %.2f",2*pi*r);

	getch();
}