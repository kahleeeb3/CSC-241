#include <stdio.h>

int main(void){
    char mystring[6]="Hello!";
    int length;
    printf("%s \n",mystring);

    for(int i = 0; i<6; i++){
        printf("%c\n",mystring[i]);
    }
    
    //printf("0x%x\n",&mystring);

    int j = 0;
    while(mystring[j] != '\0'){
        j++;
    }
    printf("%i\n",j);
}