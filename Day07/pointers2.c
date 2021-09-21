#include<stdio.h>

int main(void){
    char mystring[] = "Wabash Always Fights";
    int myarray[] = {1,8,3,2};
    int mynumber = 1832;

    printf("the location of the string `%s` is 0x%lx \n",mystring,mystring);
    // because its a STRING we dont need &mystring for the location
    // %lx does not give the physical location but the "virtual one"
    printf("the location of the number `%i` is 0x%lx \n",mynumber,&mynumber);
    // mynumber is the number 1832, &mynumber is the location
    // we need & on the second one because it is an INT
    printf("the location of the array is 0x%lx \n", myarray);
    // we need & because it is an ARRAY

    // the de-reference operator (*) we will cover more later
}