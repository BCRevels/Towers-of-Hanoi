#include <iostream>
#include <stack>
#include <cmath>
using namespace std;

void print_move(int src, int dest, int disk)
{
    disk ? cout << "Move disk " << disk << " from post " << src << " to " << dest << "\n" : cout << "\n";
    return;
}

void move_disk(stack<int> &src, stack<int> &dest, int from, int to)
{
    int home_top;
    int center_top;
    if (src.size() > 0)
    {
        home_top = src.top();
        src.pop();
    }else
        home_top = 0;

    if (dest.size() > 0)
    {
        center_top = dest.top();
        dest.pop();
    }else
        center_top = 0;

    if (home_top == 0)
    {
        src.push(center_top);
        print_move(to, from, center_top);
    }
    else if (center_top == 0)
    {
        dest.push(home_top);
        print_move(from, to, home_top);
    }
    else if (home_top > center_top)
    {
        src.push(home_top);
        src.push(center_top);
        print_move(to, from, center_top);
    }
    else
    {
        dest.push(center_top);
        dest.push(home_top);
        print_move(from, to, home_top);
    }
}

void solve(int n, stack<int> &src, stack<int> &dest, stack<int> &aux)
{
    int i, num_moves;
    int home = 1, center = 2, end = 3;
    num_moves = static_cast<int>(pow(2, static_cast<float>(n)));
    for (i = n; i >= 1; i--)
        src.push(i);

    for (i = 1; i <= num_moves; i++)
    {
        if (i % 3 == 0)
            move_disk(aux, dest, end, center);
        else if (i % 3 == 1)
            move_disk(src, dest, home, center);
        else if (i % 3 == 2)
            move_disk(src, aux, home, end);
    }
    return;
}

int main()
{
    int n = 3;
    cout << "Enter number of rings: \n";
    cin >> n;

    stack<int> src, dest, aux;

    solve(n, src, dest, aux);

    return EXIT_SUCCESS;
}
