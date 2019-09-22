ifndef __CMAKE_MK__

mainfiles=$(shell find main -name *.c -type f -printf "%p ")
mainames=$(shell find main -name *.c -type f -printf "%f\n" | xargs -I arg basename -s .c arg)
srcfiles=$(shell find src -name *.c -type f -printf "%p ")
srcnames=$(shell find src -name *.c -type f -printf "%f\n" | xargs -I arg basename -s .c arg)
objects=$(foreach name,$(srcnames),obj/$(name).o)
executables=$(foreach name,$(mainames),exe/$(name))
# NAME is defined in .universal/cfg.mk and references the node
lib=$(shell if [ ! -z "$(objects)" ]; then echo lib/${NAME}.a; fi)
links=$(foreach l,${lib},-Llib -l$(shell basename -s .a ${l}))


obj/%.o: src/$$*.c
	gcc -Isrc -c -o $@ $<


lib/lib%.a: $(objects)
	-ar -rcs $@ $(objects)

exe/%: ${mainfiles}
	gcc -Isrc ${links} -o $@ main/$*.c

.PHONY:
c-build: ${lib} | $(executables)


__CMAKE_MK__:=1
endif
