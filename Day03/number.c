#include <stdio.h>

int main(void){
    int number = 5000;
    int second = 2021;
    int third = 1234;

    // Print Statements
    printf("%i\n",number); //Printing the int "number"
    printf("%x\n",number); //Printing the hex number

    // If & Else
    if((number < second) && (number < third)){
        printf("Test1\n");
    }
    else{
        printf("Test2\n");
    }
    
    // For Loops
    for(int i=0; i<5; i++){
        printf("%i\n",i);
    }
    
}