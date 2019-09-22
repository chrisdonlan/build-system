ifndef __UNIVERSAL_COMMANDS_MK__
include .universal/cfg.mk
include .universal/node/schematics/*.mk

.PHONY:
new-node-usage:
	./.universal/usage/new-node.sh ${MFLAGS}

.PHONY:
new-node: new-node-usage
	$(eval new_node_name=$(shell read -p "Node Name? " nn; echo $$nn))
	$(eval new_node_type=$(shell read -p "Node Type? " nt; echo $$nt))
	-mkdir $(new_node_name)
	-cd $(new_node_name) && ln -s ${ROOT}/.universal .universal
	-cd $(new_node_name) \
		&& cp .universal/raw_makefile makefile \
		&& echo "include .universal/node/makes/${new_node_type}.mk" >> makefile
	-cd $(new_node_name) && cp .universal/.raw_bash_profile .bash_profile
	-touch $(new_node_name)/.pipreqs.txt
	cd $(new_node_name) && ${MAKE} construct-node-${new_node_type}

.PHONY:
overlay-node-usage:
	./.universal/usage/overlay-node.sh ${MFLAGS}

.PHONY:
overlay-node: overlay-node-usage
	$(eval node_name=$(shell read -p "Node Name? " nn; echo $$nn))
	$(eval node_type=$(shell read -p "Node Type? " nt; echo $$nt))
	cd $(node_name) \
		&& ${MAKE} construct-node-${node_type}
		&& echo "include .universal/node/makes/${node_type}.mk" >> makefile


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
