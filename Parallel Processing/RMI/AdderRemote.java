import java.rmi.*;
import java.rmi.server.*;

public class AdderRemote extends UnicastRemoteObject implements Adder{

AdderRemote()throws RemoteException{
super();
}

public int Sort(int[] ara){
	int sum =0;
	sum = ara[0]+ara[1]+ara[2]+ara[3]+ara[4]+ara[5]+ara[6]+ara[7]+ara[8]+ara[9];
	return sum/10;
	}

}

public int avg(int[] ara){
	int sum =0;
	sum = ara[0]+ara[1]+ara[2]+ara[3]+ara[4]+ara[5]+ara[6]+ara[7]+ara[8]+ara[9];
	return sum;
	}

}

