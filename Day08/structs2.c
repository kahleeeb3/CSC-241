#include<stdio.h>
#include<math.h>

struct point{
    float x;
    float y;
};

int main(void){

    struct point point1 = {0,0};
    struct point point2 = {3,4};

    printf("The x coordinate of point1 is %f\n", point2.x);
    return 0;
}