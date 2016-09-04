#!/bin/sh

test_colleen() {
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
	else
		echo "\x1b[31mColleen.c doesn't exist\x1b[0m"
	fi
	echo ""
}

test_grace() {
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
			echo "\x1b[31mFAIL: Grace_kid was not created\x1b[0m"
		fi
		rm -f grace Grace_kid.c
	else
		echo "\x1b[31mGrace.c doesn't exist\x1b[0m"
	fi
	echo ""
}


test_sully() {
	if [ -f Sully.c ]; then
		echo "Testing Sully:"
		gcc -Wall -Wextra -Werror Sully.c -o Sully
		./Sully
		echo "Diffs:"
		for bin in Sully_5 Sully_4 Sully_3 Sully_2 Sully_1 Sully_0; do
			if [ -f $bin ] && [ -f $bin.c ]; then
				df=`diff Sully.c $bin.c`
				echo "$bin.c:"
				echo "======================="
				diff Sully.c $bin.c
				echo "======================="
				rm -f $bin $bin.c
				echo ""
			else
				echo "\x1b[31mFAIL: $bin doesn't exist\x1b[0m"
				return
			fi
		done
	else
		echo "\x1b[31mSully.c doesn't exist\x1b[0m"
	fi
	rm -f Sully
	echo ""
}

test_colleen
test_grace
test_sully
