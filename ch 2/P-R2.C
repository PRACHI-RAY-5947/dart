#include<stdio.h>
#include<conio.h>

main()
{
	int a=12,b=6;
	clrscr();

	printf("\n%d + %d = %d",a,b,a+b);
	printf("\n%d - %d = %d",a,b,a-b);
	printf("\n%d * %d = %d",a,b,a*b);
	printf("\n%d / %d = %d",a,b,a/b);
	printf("\n%d %% %d = %d",a,b,a%b);
	getch();
}