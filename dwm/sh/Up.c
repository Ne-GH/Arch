#include <stdio.h>

int Getnum(char *s){
    int num = 0;

    for(int i = 0;s[i] != '\0'; ++i){
        num = num * 10 + (s[i] - '0');
    }
    return num;
}

int main(int argv,char **argc){

    int nums = 0;

    nums += Getnum(argc[4]);                                        //s
    nums += Getnum(argc[3]) * 60;                                   //m
    nums += Getnum(argc[2]) * 3600;                                 //h
    nums += Getnum(argc[1]) * 86400;                                //day
    // 27
    nums += (3600*24*(37+31));

    float fnum = nums;
    fnum /= 86400;

    FILE *out;
    out = fopen("./D.txt","w");
    fprintf(out,"%.5f",fnum);
    fclose(out);
    

    return 0;
}
