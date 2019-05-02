const readline = require('readline');

let move_disk = (src, dest, from, to) => {
    let home_top = src.pop();
    let center_top = dest.pop();

    if (home_top == undefined) {
        src.push(center_top);
        print_move(to, from, center_top);
    }
    else if (center_top == undefined) {
        dest.push(home_top);
        print_move(from, to, home_top);
    }
    else if (home_top > center_top) {
        src.push(home_top);
        src.push(center_top);
        print_move(to, from, center_top);
    }
    else {
        dest.push(center_top);
        dest.push(home_top);
        print_move(from, to, home_top);
    }
}

let print_move = (src, dest, disk) => {
    console.log("Move disk " + disk + " from post " + src + " to " + dest);
    return;
}

let solve = (n, src, dest, aux) => {
    let i, num_moves;
    let home = 1, center = 2, end = 3;

    num_moves = Math.pow(2, n) - 1;

    for (i = n; i >= 1; i--)
        src.push(i);

    for (i = 1; i <= num_moves; i++) {
        if (i % 3 == 0)
            move_disk(aux, dest, end, center);
        else if (i % 3 == 1)
            move_disk(src, dest, home, center);
        else if (i % 3 == 2)
            move_disk(src, aux, home, end);
    }
}


const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

src = [];
dest = [];
aux = [];

rl.question("Enter number of rings: ", x => {
    solve(parseInt(x), src, dest, aux);
    rl.close();
})

