#!/usr/bin/env bash

# 引数のチェック
if [ $# -ne 1 ]; then
  echo "使用法: $0 n"
  echo "nはフィボナッチ数列の計算を行う項の数です"
  exit 1
fi

# フィボナッチ数を計算する関数
fibonacci() {
  local n=$1
  if [ $n -le 1 ]; then
    echo $n
  else
    echo $(( $(fibonacci $((n - 1))) + $(fibonacci $((n - 2))) ))
  fi
}

# メインループ
for (( i=1; i<=$1; i++ )); do
  start_time=$(date +%s%N) # 開始時間
  fibonacci_result=$(fibonacci $i) # フィボナッチ数の計算
  end_time=$(date +%s%N) # 終了時間
  time_spent_to_calculate=$(( (end_time - start_time) / 1000000 )) # 計算時間（ミリ秒単位）
  echo "フィボナッチ数列の${i}番目: $fibonacci_result  (${time_spent_to_calculate}ms)"
done
