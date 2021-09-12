# include <stdio.h>

// Recursively
int fibstep(int n1, int n2, int step){
    if(step > 2){
        int n = n1 + n2;
        //printf("Step Number: %i, Total: %i \n",step, n);
        fibstep(n, n1,step-1);
    }
    else{
        return n1;
    }
}

// Iteratively
int fibonacci(int step){
    int n1= 1;
    int n2= 1;
    int n3= 1;
    while(step >2){
        n3 = n1+n2;
        n2 = n1;
        n1 = n3;
        step--;
    }
    return n3;

}

int main(void){
    int steps = 10;

    int recursive = fibstep(1,1,steps);
    int iterative = fibonacci(steps);

    printf("Recursive: %i \n", recursive);
    printf("Iterative: %i \n", iterative);
}