ifndef __UNIVERSAL_ANACONDA_MK__
include .universal/cfg.mk
THIS:=anaconda

export OS:=$(shell uname -s)
export MACHINE_TYPE:=$(shell uname -m)
export PYTHON_MAJOR_VERSION:=3
export PYTHON_MINOR_VERSION:=7
export CONTINUUM_REPO=https://repo.continuum.io
export ANACONDA:=miniconda/Miniconda${PYTHON_MAJOR_VERSION}-latest-${OS}-${MACHINE_TYPE}.sh
export ANACONDA_DEST:=${ROOT}/.universal/anaconda
export ANACONDA_INSTALLER_DEST:=${ROOT}/.universal/resources



${ANACONDA_INSTALLER_DEST}/${ANACONDA}:
	-mkdir -p $(@D)
	cd $(@D) && wget ${CONTINUUM_REPO}/${ANACONDA}

${ANACONDA_DEST}: ${ANACONDA_INSTALLER_DEST}/${ANACONDA}
	bash $< -b -p $@

.PHONY:
clean-${THIS}:
	-rm -rf ${ANACONDA_DEST}
	-rm -rf ${ANACONDA_INSTALLER_DEST}/${ANACONDA}

.PHONY:
install-${THIS}: ${ANACONDA_DEST} | .anacondarc

${ANACONDA_DEST}/etc/profile.d/conda.sh:
	-${MAKE} clean-${THIS}
	${MAKE} install-${THIS}

.anacondarc: ${ANACONDA_DEST}/etc/profile.d/conda.sh
	echo ". $<" > $@

${ANACONDA_DEST}/envs/${envname}:
	source .anacondarc && conda create -y --name $(envname) python=$(pyvers)

# default args
export pyvers:=3.7
export envname:=${NAME}
.PHONY:
pyenv: .anacondarc
	./.universal/usage/pyenv.sh ${MFLAGS}
	${MAKE} ${ANACONDA_DEST}/envs/${envname}
	sed '/^conda activate/d' -i .bash_profile
	echo "conda activate $(envname)" >> .bash_profile


# default args
pipreqs:=.pipreqs.txt
.PHONY:
get-pipreqs:
	pip install -r $(pipreqs)


__UNIVERSAL_ANACONDA_MK__:=1
endif
