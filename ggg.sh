function ggg() {
if [ -n "$2" ]; then
	ga $1
	if [ "$?" != "0" ]; then
		echo "Error while adding file $1"
		return
	fi
	gc -m $2
	if [ "$?" != "0" ]; then
		echo "Error while committing with commit message $2"
		return
	fi
	gp
	if [ "$?" != "0" ]; then
		echo "Error while pushing"
		return
	fi
elif [ -n "$1" ]; then
	ga -A
	if [ "$?" != "0" ]; then
		echo "Error while adding all files"
		return
	fi
	gc -m $1
	if [ "$?" != "0" ]; then
		echo "Error while committing with commit message $1"
		return
	fi
	gp
	if [ "$?" != "0" ]; then
		echo "Error while pushing"
		return
	fi
else
	ga -A
	if [ "$?" != "0" ]; then
		echo "Error while adding all files"
		return
	fi
	gc -m "Automatic commit"
	if [ "$?" != "0" ]; then
		echo "Error while committing with commit message \"Automatic Commit\""
		return
	fi
	gp
	if [ "$?" != 0 ]; then
		echo "Error while pushing with commit message \"Automatic Commit\""
		return
	fi
fi
