ifndef __CMAKE_MK__

mainfiles=$(shell find src -name *.c -type f -printf "%f ")
srcnames=$(shell find src -name *.c -type f -printf "%f ")
objects=$(foreach name,$(srcnames),obj/$(name).o)
executables=$(foreach name,$(mainames),exe/$(name))
# NAME is defined in .universal/cfg.mk and references the node
lib=lib/${NAME}.a


obj/%.o: src/$$*.c
	gcc -Isrc -c -o $@ $<


lib/lib%.a: $(objects)
	-ar -rcs $@ $(objects)

exe/%:
	gcc -Isrc -Llib -l${PROJ} -o $@ main/$*.c 
	
c-build: ${lib} | $(executables)

__CMAKE_MK__:=1
endif
