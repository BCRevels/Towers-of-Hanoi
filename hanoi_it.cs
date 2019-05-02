using System;

public class Hanoi
{
    public class Stack
    {
        public int size;
        public int top;
        public int[] array;
    }

    Stack createStack(int size)
    {
        Stack stack = new Stack();
        stack.size = size;
        stack.top = -1;
        stack.array = new int[size];
        return stack;
    }

    Boolean isFull(Stack stack)
    {
        return (stack.top == stack.size - 1);
    }
    Boolean isEmpty(Stack stack)
    {
        return (stack.top == -1);
    }

    void push(Stack stack, int item)
    {
        if (isFull(stack))
            return;
        stack.array[++stack.top] = item;
    }

    int pop(Stack stack)
    {
        if (isEmpty(stack))
            return int.MinValue;
        return stack.array[stack.top--];
    }

    void move_disk(Stack src, Stack dest, int from, int to)
    {
        int home_top = pop(src);
        int center_top = pop(dest);

        if (home_top == int.MinValue)
        {
            push(src, center_top);
            print_move(to, from, center_top);
        }
        else if (center_top == int.MinValue)
        {
            push(dest, home_top);
            print_move(from, to, home_top);
        }
        else if (home_top > center_top)
        {
            push(src, home_top);
            push(src, center_top);
            print_move(to, from, center_top);
        }
        else
        {
            push(dest, center_top);
            push(dest, home_top);
            print_move(from, to, home_top);
        }
    }

    void print_move(int src, int dest, int disk)
    {
        Console.WriteLine("Move disk " + disk + " from post " + src + " to " + dest);
        return;
    }

    void solve(int n, Stack src, Stack dest, Stack aux)
    {
        int i, num_moves;
        int home = 1, center = 2, end = 3;

        num_moves = (int)(Math.Pow(2, n) - 1);

        for (i = n; i >= 1; i--)
            push(src, i);

        for (i = 1; i <= num_moves; i++)
        {
            if (i % 3 == 0)
                move_disk(aux, dest, end, center);
            else if (i % 3 == 1)
                move_disk(src, dest, home, center);
            else if (i % 3 == 2)
                move_disk(src, aux, home, end);
        }
    }

    public static void Main(String[] args)
    {
        int n = 3;

        Console.WriteLine("Enter number of rings: ");
        n = Convert.ToInt32(Console.ReadLine());

        Hanoi tower = new Hanoi();
        Stack src, dest, aux;

        src = tower.createStack(n);
        dest = tower.createStack(n);
        aux = tower.createStack(n);

        tower.solve(n, src, dest, aux);
    }
}

