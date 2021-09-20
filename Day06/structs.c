#include<stdio.h>
#include<string.h>

int main(void){
    char string1[8];
    int a;

    printf("Enter a String: ");
    scanf("%8s",string1);
    printf("String is %s\n",string1);

    printf("Enter a number: ");
    scanf("%i",&a);
    printf("Number is %i\n",a);

    return 0;
}