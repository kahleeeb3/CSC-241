#include<stdio.h>

int main(void){
    int *mypointer; // defining mypointer as pointing to an int

    int x = 5;
    float y = 3.5;

    mypointer = &y; // Throws Error because defined mypointer as int

    printf("The Address of '%f' is 0x%lx\n",y,mypointer);
}