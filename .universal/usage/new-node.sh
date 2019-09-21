usage(){
echo "
Recipe:        new-node

Usage:         make new-node [new_node_name=name] [new_node_type=optional]

               Current (or Default) Values:

               new_node_name := ${new_node_name}
               new_node_type := ${new_node_type}

               Available Types:

`
find ${ROOT}/.universal/node/schematics -name *.mk -type f \
	 | sort -u \
	 | xargs -I arg basename -s .mk arg \
	 | awk '{printf "                   "$1"\n"}'
`

               'make -y' will suppress this message
"
}
error_msg(){
	# args: errname message code
	echo "[ ERROR ] $1: $2" >&2
	exit $3
}
fail_empty(){
	# args: $variable variable
	if [ -z $1 ]
	then
		usage
		error "Missing Non-Optional Variable" $2 1
	fi
}

fail_empty $new_node_name new_node_name
fail_empty $new_node_type new_node_type
while getopts 'y' opt; do
  case ${opt} in
    y) exit 0;;
  esac
done

usage
echo "Confirm [y]?"
read -n 1 confirm
if [ "$confirm" == "y" ]; then
  echo ""
  exit 0
else
  exit 1
fi
