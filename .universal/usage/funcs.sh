#!/usr/bin/env bash
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
prompt_var(){
	# args: prompt_message varname
	read -p "$1 " $2
}
prompt_if_empty(){
	# args: prompt_message $variable varname
	if [ -z $2 ]
	then
		prompt_var $1 $3
	fi
}
