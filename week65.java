public class week65 {
    public static void main(String[] args) {
        String name="madam";
        int leng=name.length();
        String rev=" ";
        int i;
        for(i=leng-1;i>=0;i--)
        {
          rev=rev+name.charAt(i);
        }
        if(name.equals(rev))
        {
            System.out.println("palindrome");
        }
        else
        {
           System.out.println(" not palindrome"); 
        }
    }
    
}
