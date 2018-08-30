#include<bits/stdc++.h>
#include<omp.h>
using namespace std;

int main()
{
    int ID, NumThread, num_thds;
    #pragma omp parallel
    {
        NumThread = omp_get_num_threads();
        ID = omp_get_thread_num();
        printf("Hello World Is printed my id %d of threads %d \n",ID, NumThread);
    }

    return 0;
}


