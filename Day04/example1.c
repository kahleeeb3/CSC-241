#include <stdio.h>

// n! = n*(n-1)!

int fact1(int x){
    if((x==0)||(x==1)){
        return 1;
    }
    else{
        return x*fact1(x-1);
    }
}

int main(void){
    int num = 4;
    int ans = fact1(num);
    //printf("The number is %i. I repeat, the number is %i\n",ans,ans);
    printf("%i\n",ans);
}