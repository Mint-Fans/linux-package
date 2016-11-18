# Port 映射/轉發工具

# Linux 下編譯
$ gcc -o lcx lcx.c

# 使用方法
範例: 內網 Port 4444 連接到 外網 Port 4444 (Port 4444 已由lcx監聽並轉發)

$ ./lcx -m 3 -h1 192.168.1.101 -p1 4444 -h2 61.234.201.218 -p2 4444

