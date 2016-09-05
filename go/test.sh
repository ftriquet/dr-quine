#!/bin/sh

test_colleen() {
	if [ -f Colleen.go ]; then
		echo "Testing Colleen:"
		go build -o colleen Colleen.go
		df=`./colleen | diff - Colleen.go`
		if [ -z  $df ]; then
			echo "\x1b[32mOK\x1b[0m"
		else
			echo "\x1b[31mFAIL\x1b[0m"
			echo "diff:"
			echo $df
		fi
		rm -f colleen
	else
		echo "\x1b[31mColleen.go doesn't exist\x1b[0m"
	fi
	echo ""
}

test_grace() {
	if [ -f Grace.go ]; then
		echo "Testing Grace:"
		go build -o grace Grace.go
		./grace
		if [ -f Grace_kid.go ]; then
			df=`cat Grace_kid.go | diff - Grace.go`
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
		rm -f grace Grace_kid.go
	else
		echo "\x1b[31mGrace.go doesn't exist\x1b[0m"
	fi
	echo ""
}


test_sully() {
	if [ -f Sully.go ]; then
		echo "Testing Sully:"
		go build -o Sully Sully.go
		./Sully
		echo "Diffs:"
		for bin in Sully_5 Sully_4 Sully_3 Sully_2 Sully_1 Sully_0; do
			if [ -f $bin ] && [ -f $bin.go ]; then
				df=`diff Sully.go $bin.go`
				echo "$bin.go:"
				echo "======================="
				diff Sully.go $bin.go
				echo "======================="
				rm -f $bin $bin.go
				echo ""
			else
				echo "\x1b[31mFAIL: $bin doesn't exist\x1b[0m"
				return
			fi
		done
	else
		echo "\x1b[31mSully.go doesn't exist\x1b[0m"
	fi
	rm -f Sully
	echo ""
}

test_colleen
test_grace
test_sully
