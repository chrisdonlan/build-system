.PHONY:
construct-node-R: scripts .setup src

src:
	-mkdir src

scripts:
	-mkdir scripts

.R-deps:
	-touch .R-deps

.setup: .R-deps
	test -e .setup || echo "#!/usr/bin/env bash" > .setup
	test -x .setup || chmod +x .setup
	-sed -i '/.R-deps/d' .setup
	echo "cat .R-deps | xargs -I arg apt-get install -y arg" >> .setup
