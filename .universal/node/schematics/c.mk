.PHONY:
construct-node-c: src lib exe obj .link .include

src:
	-mkdir src

lib:
	-mkdir lib

exe:
	-mkdir exe

obj:
	-mkdir obj

.link:
	-touch .link

.include:
	-touch .include
