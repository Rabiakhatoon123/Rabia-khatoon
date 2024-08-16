import java.util.Scanner;
public class week41 {
    public static void main(String[] args) 
    {
        int len, p ,ele;
        Scanner Sc = new Scanner(System.in);
        System.out.print("Enter length of an array:");
        len = Sc.nextInt();
        int arr[] = new int[len+1];
        System.out.println("Enter "+len+" elements:");
        for(int i = 0; i < len; i++)
        {
            arr[i] = Sc.nextInt();
        }
        System.out.print("Enter the element which you want to insert:");
        ele = Sc.nextInt();
        arr[len] = ele;
        System.out.print("After inserting : ");
        for(int i = 0; i <len; i++)
        {
            System.out.print(arr[i]+",");
        }
        System.out.print(arr[len]);
        
    }

    
}
