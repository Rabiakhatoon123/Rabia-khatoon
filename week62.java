import java.util.Scanner;
public class week62
 {
    public static void main(String[] args)
    {
      int a[]=new int[5];
        Scanner r=new Scanner(System.in);
      System.out.println("enter elements in array");
      int i,j;
      int temp;
      for(i=0;i<5;i++)
      {
        a[i]=r.nextInt();
      }
      for(i=0;i<5;i++)
        {
            for( j=i+1;j<5;j++)
            {
                if(a[i]>a[j])
              {
                temp=a[i];
                a[i]=a[j];
                a[j]=temp;
              }
            }
        }
      System.out.println(a[i]+" ");
    }
 }  
            



        