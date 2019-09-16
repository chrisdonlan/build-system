ifndef __UNIVERSAL_CFG_MK__

export SHELL:=/usr/bin/env bash
export ROOT:=$(shell git rev-parse --show-toplevel)
export NODE:=$(shell pwd)
export PREV:=$(shell dirname $(NODE))
export NAME:=$(shell basename $(NODE))
export BRANCHES:=$(shell find . -mindepth 1 -maxdepth 1 -type d | sed 's/\.\///')

export UNIVERSAL:=.universal
export UNIVERSAL_CFG:=.universal/cfg.mk
export UNIVERSAL_MAKES:=$(shell find .universal -mindepth 0 -maxdepth 0 -type f -name *.mk | xargs -I arg basename -s .mk arg)

.PHONY:
clean-universal: $(foreach umake,${UNIVERSAL_MAKES},clean-$(umake))


__UNIVERSAL_CFG_MK__:=1
endif
