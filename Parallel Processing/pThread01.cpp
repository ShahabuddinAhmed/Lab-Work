#include<bits/stdc++.h>
#include<thread>
using namespace std;
void fun1()
{
    cout << "Fun1 is working" << endl;
}

int main()
{
    std::thread t1(fun1);
    t1.join();
}
