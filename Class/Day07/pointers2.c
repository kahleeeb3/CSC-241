#include<stdio.h>

int main(void){
    char mystring[] = "Wabash Always Fights";
    int myarray[] = {1,8,3,2};
    int mynumber = 1832;

    printf("The character at %lx is `%c`\n",mystring,mystring[0]);
    printf("The character at %lx is `%c`\n",mystring+1,mystring[1]);
    // Memory Address Goes up by 1
    printf("\n");
    printf("The character at %lx is `%i`\n",myarray,myarray[0]);
    printf("The character at %lx is `%i`\n",myarray+1,myarray[1]);
    // Goes up by 4 not 1 bc numbers are encoded in 32 bits
    printf("\n");

/*
    printf("the location of the string `%s` is 0x%lx \n",mystring,mystring);
    // because its a STRING we dont need &mystring for the location
    // %lx does not give the physical location but the "virtual one"
    printf("the location of the number `%i` is 0x%lx \n",mynumber,&mynumber);
    // mynumber is the number 1832, &mynumber is the location
    // we need & on the second one because it is an INT
    printf("the location of the array is 0x%lx \n", myarray);
    // we need & because it is an ARRAY

    // the de-reference operator (*) we will cover more later
    for(int i = 0; i<4;i++){
        printf("Array element number %i is %i\n",i,myarray[i]);
    }
*/
    return 0;
}