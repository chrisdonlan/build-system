usage(){
echo "
Recipe:        new-node

Usage:         make new-node [new_node_name=name] [new_node_type=optional]

               Current (or Default) Values:

               node_name := ${node_name}
               overlay_type := ${overlay_type}

               Available Types:

`find .universal/node/schematics -name *.mk -type f | basename -s .mk | awk '{printf "                   "$1}'`


               'make -s' will suppress this message
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

fail_empty $node_name node_name
fail_empty $overlay_type overlay_type

while getopts 's' opt; do
  case ${opt} in
    s) exit 0;;
  esac
done
usage
