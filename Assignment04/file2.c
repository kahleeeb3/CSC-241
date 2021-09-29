#include<stdio.h>
#include<math.h>

struct point{
    float x;
    float y;
};

struct triangle{
    struct point a;
    struct point b;
    struct point c;
};

float distance(struct point *a,struct point *b){
    float dx = (b->x)-(a->x);
    float dy = (b->y)-(a->y);
    float distance = sqrt(pow(dx,2)+pow(dy,2));
    return distance;
}

float area(struct triangle *x){
    // length from  a to b
    float a = distance(&x->a,&x->b);
    // length from b to c
    float b = distance(&x->b,&x->c);
    // length from c to a
    float c = distance(&x->c,&x->a);

    float s = (a+b+c)/2;
    float area = sqrt(s*(s-a)*(s-b)*(s-c));

    return area;
}

int main(void){

    struct point point1 = {12,10};
    struct point point2 = {16,24};
    struct point point3 = {8,3};

    struct triangle tri1 = {point1,point2,point3};

    float dis = distance(&point1,&point2);
    float a = area(&tri1);

    printf("The distance between point1 and point2 is %f\n", dis);
    printf("The area between point1, point2, and point3 is %f\n", a);
    //https://ncalculators.com/geometry/triangle-area-by-3-points.htm (Check Values)

    return 0;
}