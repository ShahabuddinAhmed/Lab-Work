#include<bits/stdc++.h>
using namespace std;

int main()
{
    #pragma omp parallel
    {
        cout << "Hello World" << endl;
    }
    system("PAUSE");
    return 0;
}
