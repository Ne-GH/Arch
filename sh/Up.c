#include <stdio.h>
#include <time.h>

int main(int argv,char **argc){

    time_t now;
    time(&now);

    struct tm beg;
    beg = *localtime(&now);
    
    beg.tm_year = 2021 -1900;
    beg.tm_mon = 10;
    beg.tm_mday = 24;
    beg.tm_hour = 0;
    beg.tm_min = 0;
    beg.tm_sec = 0;

    double seconds = difftime(now, mktime(&beg));
    double difference = seconds /60/60/24;

    FILE *out = fopen("./D.txt", "w");
    fprintf(out,"%.4f", difference);
    fclose(out);


    return 0;
}
