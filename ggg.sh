function ggg() {
	if [ -n "$2" ]; then
		git add $1
		if [ "$?" != "0" ]; then
			echo "Error while adding file $1"
			return
		fi
		git commit -m $2
		if [ "$?" != "0" ]; then
			echo "Error while committing with commit message $2"
			return
		fi
		git push
		if [ "$?" != "0" ]; then
			echo "Error while pushing"
			return
		fi
	elif [ -n "$1" ]; then
		git add -A
		if [ "$?" != "0" ]; then
			echo "Error while adding all files"
			return
		fi
		git commit -m $1
		if [ "$?" != "0" ]; then
			echo "Error while committing with commit message $1"
			return
		fi
		git push
		if [ "$?" != "0" ]; then
			echo "Error while pushing"
			return
		fi
	else
		git add -A
		if [ "$?" != "0" ]; then
			echo "Error while adding all files"
			return
		fi
		git commit -m "Automatic commit message"
		if [ "$?" != "0" ]; then
			echo "Error while committing with commit message \"Automatic Commit\""
			return
		fi
		git push
		if [ "$?" != 0 ]; then
			echo "Error while pushing with commit message \"Automatic Commit\""
			return
		fi
	fi
	echo "Everything went well !"
}
