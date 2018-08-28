#include<bits/stdc++.h>
using namespace std;

int main()
{
    switch(_OPENMP) {
        case 200805:
            cout << "OPENMP version is 8.00" << endl;
            break;
        case 200505:
            cout << "OPENMP version is 5.00" << endl;
            break;
        default:
            cout << "OPENMP version is unrecognigation" << _OPENMP << endl;
    }
    return 0;
}

