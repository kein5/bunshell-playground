// fibonacci.ts
function fibonacci(n: number): number {
    if (n <= 1) {
        return n;
    } else {
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
}

function timeFibonacci(n: number): void {
    const startTime = process.hrtime.bigint(); // 開始時間
    const result = fibonacci(n);
    const endTime = process.hrtime.bigint(); // 終了時間
    const timeSpentToCalculate = (endTime - startTime) / BigInt(1000000); // 計算時間（ミリ秒単位）

    console.log(`フィボナッチ数列の${n}番目: ${result} (${timeSpentToCalculate}ms)`);
}

const n: number = parseInt(process.argv[2]); // コマンドライン引数からnを取得

if (!isNaN(n) && n > 0) {
    for (let i = 1; i <= n; i++) {
        timeFibonacci(i);
    }
} else {
    console.error('正しい数字を引数に指定してください。');
}
