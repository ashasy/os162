#!/bin/bash
# (c) 2016 Dwitri Rhaiza A. -- This is free software
# Feel free to copy and/or modify and/or distribute it,
# provided this notice, and the copyright notice, are preserved.
# REV01 Sun Jan 1  10:52:55 WIB 2017
# START Sat Dec 31 15:53:44 WIB 2016
# Script membuat array no serta link, mengecek no dapat di dump atau tidak,
# membuat RK-XX-GAGAL.txt bila tidak dapat di dump,
# membuat RK-XX.txt bila dapat di dump.

no=()
link=()

for val in $(awk '{print $2}' ranking.txt); do
	no+=("$val")
done

for val2 in $(awk '{print $3}' ranking.txt); do
	link+=("$val2")
done

x=0
while ((x<${#no[@]})); do
	site="$(w3m -dump ${link[x]})"
	if [ -z "$site" ]; then
		touch "${no[x]}-GAGAL.txt"
	else
		w3m -dump -cols 2000 ${link[x]} > "${no[x]}.txt"
	fi
	let x=x+1
done
