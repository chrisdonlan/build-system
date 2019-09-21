ifndef __UNIVERSAL_COMMANDS_MK__
include .universal/cfg.mk
include .universal/node/schematics/*.mk

export new_node_name:=foo
export new_node_type:=none
.PHONY:
new-node:
	# usage script?
	./.universal/usage/new-node.sh ${MFLAGS}
	mkdir $(new_node_name)
	cd $(new_node_name) && ln -s ${ROOT}/.universal .universal
	cd $(new_node_name) && cp .universal/raw_makefile makefile
	cd $(new_node_name) && cp .universal/.raw_bash_profile .bash_profile
	touch $(new_node_name)/.pipreqs.txt
	cd $(new_node_name) && ${MAKE} construct-node-${new_node_type}

.PHONY:
overlay-node:
	./.universal/usage/overlay-node.sh ${MFLAGS}
	cd $(node_name) && ${MAKE} construct-node-${node_type}


.PHONY:
c-node:
	${MAKE} new-node new_node_type=c

.PHONY:
R-node:
	${MAKE} new-node new_node_type=R


.PHONY:
show-env:
	env

__UNIVERSAL_COMMANDS_MK__:=1
endif
