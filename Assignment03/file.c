#include<stdio.h>
#include<string.h>
#include<ctype.h> 

int choose(){
    int a;
    printf("Choose:\n(1) Use the built-in function.\n(2) Use my function.\n");
    scanf("%i",&a);
    if(a == 1 | a == 2){
        printf("You chose %i\n",a);
    }
    else{
        printf("%i is neither 1 or 2. Try Again\n",a);
        a = choose();
    }
    return a;   
}

char upper(char* mystring){
    // loops through string index and uses toupper() built in function
    int i = 0;
    while(mystring[i] != '\0'){
        if(mystring[i]>='a' && mystring[i]<='z')
        {
            mystring[i] = toupper(mystring[i]);
        }
        i++;
    }    
}

char upper2(char* mystring){
    // loops through string index and uses math.
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
    char mystring[31];int choice;
    printf("Please enter the string you would like to use: ");
    scanf("%31[^\n]",mystring);
    choice = choose();
    printf("=================\n");
    printf("Original: %s\n",mystring);
    if(choice == 1){
        upper(mystring);
    }
    else{
        upper2(mystring);
    }
    printf("Output: %s\n",mystring);
    
}