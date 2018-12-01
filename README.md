# 製作 Diff Patch 
diff -uNr <原始目錄> <已修改目錄> > XXXX.patch
範例: diff -uNr mysql-5.1.58.orig mysql-5.1.58 > mysql-5.1.58-linux.patch

# 套用 Diff Patch
patch -p0 -i XXXX.patch
範例: patch -p0 -i mysql-5.1.58-linux.patch
