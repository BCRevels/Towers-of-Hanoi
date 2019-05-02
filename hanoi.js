const readline = require('readline');

solve = (n, src, aux, dest) => {
    if (n == 1) {
        console.log("Move disk 1 from post " + src + " to " + dest);
        return;
    }
    solve(n - 1, src, dest, aux);
    console.log("Move disk " + n + " from post " + src + " to " + dest);
    solve(n - 1, aux, src, dest);
    return;
}

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question("Enter number of rings: ", x => {
    solve(x, 1, 2, 3);
    rl.close();
})
