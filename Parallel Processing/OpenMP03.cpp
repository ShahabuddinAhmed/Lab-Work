#include<bits/stdc++.h>
#include<omp.h>
using namespace std;

#define ArraySize 20
int main(int argc, char *argv[])
{
    int MyID, Size;
    int i;
    int *A, *B, *C;
    A = (int *)malloc(ArraySize*sizeof(int));
    B = (int *)malloc(ArraySize*sizeof(int));
    C = (int *)malloc(ArraySize*sizeof(int));

    for(i=0; i<ArraySize; i++) {
        A[i] = i;
        B[i] = i;
    }

    cout << "Initial data" << endl;
    for(i=0; i<ArraySize; i++) {
        cout << A[i] << " " << B[i] << endl;
        cout << "__________________" << endl;
        cout << A[i] << " " << B[i] << endl;
    }
    cout << "Initial data is ended " << i << endl;

    #pragma omp parallel for default(none) shared(A, B, C)
    for(i=0; i<ArraySize; i++) {
        C[i] = A[i] + B[i];
    }

    cout << "After vector addition data" << endl;
    for(i=0; i<ArraySize; i++) {
        cout << C[i] << endl;
    }
    cout << "Program Exit" << endl;
    free(A);
    free(B);
    free(C);
}
