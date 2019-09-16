while getopts 'y' opt; do
  case ${opt} in 
    y) exit 0;;
  esac
done

usage(){
echo "
Recipe:        pyenv

Usage:         make pyenv [pyvers=vers] [envname=current_node_name]
              
               Current (or Default) Values: 

               pyvers  := ${pyvers}
               envname := ${envname} 

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
