using System;
public class Hanoi 
{ 
    static void solve(int n, int src, int aux, int dest) 
    { 
        if (n == 1) 
        { 
            Console.WriteLine("Move disk 1 from post " +  src + " to " + dest); 
            return; 
        } 
        solve(n-1, src, dest, aux); 
        Console.WriteLine("Move disk " + n + " from post " +  src + " to " + dest); 
        solve(n-1, aux, src, dest); 
        return;
    } 

    public static void Main(String[] args) 
    { 
        int n = 3;

        Console.WriteLine("Enter number of rings: ");
        n = Convert.ToInt32(Console.ReadLine());

        solve(n, 1, 2, 3);
    } 
} 