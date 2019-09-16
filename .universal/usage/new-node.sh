while getopts 'y' opt; do
  case ${opt} in
    y) exit 0;;
  esac
done

usage(){
echo "
Recipe:        new-node

Usage:         make new-node [new_node_name=name] [new_node_type=optional]

               Current (or Default) Values:

               new_node_name := ${new_node_name}
               new_node_type := ${new_node_type}

               Available Types:

`find .universal/node/schematics -name *.mk -type f | basename -s .mk | awk '{printf "                   "$1}'`


               'make -y' will suppress this message
"
}
usage
echo "Confirm [y]?"
read -n 1 confirm
if [ "$confirm" == "y" ]; then
  echo ""
  exit 0
else
  exit 1
fi
