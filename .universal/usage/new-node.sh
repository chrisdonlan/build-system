#!/usr/bin/env bash
loc="$(dirname $0)"
source $loc/funcs.sh

usage(){
echo "
Recipe:        new-node

Usage:         make new-node [new_node_name=name] [new_node_type=optional]

Available Types:

`
find ${ROOT}/.universal/node/schematics -name *.mk -type f \
	 | sort -u \
	 | xargs -I arg basename -s .mk arg \
	 | awk '{printf "                   "$1"\n"}'
`

    'make -s' will suppress this message
"
}


while getopts 's' opt; do
  case ${opt} in
    s) exit 0;;
  esac
done
usage
