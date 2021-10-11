#include<stdio.h>
#include<string.h>

char upper(char* mystring, int stringlength){
    //Accepts the pointer to the string and the string's length, and converts all lower case letters to upper case.
    for (int i = 0; i<stringlength;i++){
        if(mystring[i]>='a' && mystring[i]<='z')
        {
            mystring[i] = mystring[i] - 32;
        }
    }
}

char upper2(char* mystring){
    //does the same thing but doesn't take the string length in as a parameter.
    int i = 0;
    while(mystring[i] != '\0'){
        if(mystring[i]>='a' && mystring[i]<='z')
        {
            mystring[i] = mystring[i] - 32;
        }
        i++;
    }
}

int main(void){
    // Define the strings
    char string1[] = "Caleb Powell";
    char string2[] = "Caleb Powell";
    char string3[] = "Caleb Powell";

    // Print the strings
    printf("String1: %s\n",string1);
    printf("String2: %s\n",string2);
    printf("String3: %s\n",string3);
    printf("\n");

    // Run the two functions
    upper(string2,strlen(string2));
    upper2(string3);

    // Print the strings
    printf("String1: %s\n",string1);
    printf("String2: %s\n",string2);
    printf("String3: %s\n",string3);
    printf("\n");

    // Print the pointers
    printf("Pointer String1: 0x%lx\n",&string1);
    printf("Pointer String2: 0x%lx\n",&string2);
    printf("Pointer String3: 0x%lx\n",&string3);


}