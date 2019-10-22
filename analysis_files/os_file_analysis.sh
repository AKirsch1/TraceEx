#!/bin/bash

files_recursive() {
	for f in $(ls $1)
	do
		if [ -d $1/$f ]; then
			if ! [[ -L $f ]]; then
				files_recursive $1/$f
			else
				echo $1/$f
			fi
		else
			echo $1/$f
		fi
	done
}
for f in $(ls /)
do
	if [ -d /$f ]; then
		if ! [[ -L $f ]]; then
			if ! ([ $f = "proc" ] || [ $f = "sys" ]); then
				files_recursive /$f
			fi
		else
			echo /$f
		fi
	else
		echo /$f
	fi
done
