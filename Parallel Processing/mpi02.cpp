#include<iostream>
#include<mpi.h>
using namespace std;

void main(int argc, char *argv[]) {
    int ID =0;
    int SendData =0;
    int receiveData =0;
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &ID);

    if(ID == 0) {
        SendData = 100;
        MPI_Send(&SendData, 1, MPI_INT, 1, 7, MPI_COMM_WORLD);
    }

    MPI_Status Status;

    if(ID == 1) {
        MPI_Recv(&receiveData, 1, MPI_INT, 0, 7, MPI_COMM_WORLD, &Status);
        cout << "Received Data = " << receiveData << endl;
    }
}
