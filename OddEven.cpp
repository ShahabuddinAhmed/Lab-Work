#include<bits/stdc++.h>
#include<omp.h>

using namespace std;

void OddEvenSort (int N)
{
    int A[N+10], n;
    n = N;
    for(int i=0; i<N; i++) {
        A[i] = n;
        n--;
    }
    int exch = 1 , start = 0 , i;
    int temp;
    while ( exch || start ) {
        exch = 0 ;
        #pragma omp parallel for private(temp)
        for ( i = start; i < N-1; i+=2) {
            if(A[i] > A[i+1]) {
                temp = A[i];
                A[i] = A[i+1];
                A[i+1] = temp;
                exch = 1;
            }
        }
        if (start == 0) {
            start = 1 ;
        }
        else {
            start = 0 ;
        }
    }

    for(i=0; i<N; i++) {
        cout << A[i] << " ";
    }
}

int main()
{
    int N;
    cout << "Enter the number of element = ";
    cin >> N;
    OddEvenSort(N);
}
