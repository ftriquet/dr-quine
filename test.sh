#!/bin/sh

if [ -f Colleen.c ]; then
	echo "Testing Colleen:"
	gcc -Wall -Wextra -Werror Colleen.c -o colleen
	df=`./colleen | diff - Colleen.c`
	if [ -z  $df ]; then
		echo "\x1b[32mOK\x1b[0m"
	else
		echo "\x1b[31mFAIL\x1b[0m"
		echo "diff:"
		echo $df
	fi
	rm -f colleen
	echo ""
fi

if [ -f Grace.c ]; then
	echo "Testing Grace:"
	gcc -Wall -Wextra -Werror Grace.c -o grace
	./grace
	if [ -f Grace_kid.c ]; then
		df=`cat Grace_kid.c | diff - Grace.c`
		if [ -z $df ]; then
			echo "\x1b[32mOK\x1b[0m"
		else
			echo "\x1b[31mFAIL\x1b[0m"
			echo "diff:"
			echo $df
		fi
	else
		echo "Fail. grace_kid.c was not created"
	fi
	rm -f grace Grace_kid.c
	echo ""
fi
