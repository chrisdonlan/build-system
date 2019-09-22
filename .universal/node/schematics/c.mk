.PHONY:
construct-node-c: main src lib exe obj .link .include

main:
	-mkdir main

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
