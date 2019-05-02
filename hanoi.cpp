#include <iostream> 
using namespace std; 
  
void solve(int n, int src, int dest, int aux)  
{  
    if (n == 1)  
    {  
        cout << "Move disk 1 from post " << src <<  " to " << dest<<endl;  
        return;  
    }  
    solve(n - 1, src, aux, dest);  
    cout << "Move disk " << n << " from post " << src << " to " << dest << endl;  
    solve(n - 1, aux, dest, src);  
}  
  
int main()  
{  
    int n = 3;
    cout << "Enter number of rings: \n";
    cin >> n;

    solve(n, 1, 3, 2);

    return EXIT_SUCCESS;  
}  