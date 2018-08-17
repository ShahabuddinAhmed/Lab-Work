import java.rmi.*;

public class MyClient{

public static void main(String args[]){
try{

Adder stub=(Adder)Naming.lookup("rmi://localhost:5000/sonoo");
int[] ara = {1,2,3,4,5,6,7,8,9,10};
System.out.println(stub.Sort(ara));
System.out.println(stub.avg(ara));

}catch(Exception e){System.out.println(e);}
}

}
