#!/bin/bash
# (c) 2016 Dwitri Rhaiza A. -- This is free software 
# Feel free to copy and/or modify and/or distribute it,
# provided this notice, and the copyright notice, are preserved.
# REV02 Sat Dec 31 15:50:15 WIB 2016
# REV01 Thu Dec 29 22:35:14 WIB 2016
# START Thu Dec 29 11:30:55 WIB 2016
# script menyimpan webpage dalam format text, mengambil konten 
# yang berada diantara string ZCZC dan NNNN, dan menghapus line yang mengandung [DISK] 

page="$(w3m -dump -cols 120 http://os162.vlsm.org/2016/11/ranking-os162.html)"

echo "$page" | awk '/ZCZC/{f=1;next} /NNNN/{f=0} f' | sed '/DISK/,+0 d' >> ranking.txt 
