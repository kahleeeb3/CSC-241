#include <stdio.h>

// Calculates the length of a string
int len(char *mystring){
    int j = 0;
    while(mystring[j] != '\0'){
        j++;
    }
    return j;
}

int main(void){
    char mystring[6]="Hello!";
    printf("%s (%i) \n",mystring,len(mystring));
    printf("%c\n",*mystring);
    

    printf("0x%x \n",&mystring); //32-Bit Memory Address in Hex
    printf("0x%lx \n",&mystring); //64-Bit Memory Address in Hex

    /*
    for(int i = 0; i<6; i++){
        printf("%c\n",mystring[i]);
    }
    */
}

/*
32 Registers
64 Wide (64 Bits)
*/