Post 映射/轉發工具

# Linux 下編譯
$ gcc -o lcx lcx.c

# 使用方法
範例: 內網 Post 22 連接到 外網 Post 6666 (Post 6666 已由lcx監聽並轉發)
$ ./lcx -m 3 -h1 127.0.0.1 -p1 22 -h2 111.222.333.444 -p2 6666

