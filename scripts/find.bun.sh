#!/usr/bin/env bash

# ルートファイルシステムの下のすべてのファイルに対して stat コマンドを実行し、
# 所有者名、最終更新日時、ファイルパスを出力
echo "所有者,ファイル数,最も古い更新日付,最も新しい更新日付"
find /usr -type f 2>/dev/null | xargs -L 1 -I {} stat --format="%U,%y,{}" {} 2>/dev/null | awk -F, \
'{ \
    user = $1; \
    date = substr($2, 1, 10); \
    if (!(user in minDate) || date < minDate[user]) minDate[user] = date; \
    if (!(user in maxDate) || date > maxDate[user]) maxDate[user] = date; \
    count[user]++; \
} \
END { \
    for (user in count) { \
        print user "," count[user] "," minDate[user] "," maxDate[user]; \
    } \
}' | sort
