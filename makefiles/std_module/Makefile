
ifndef PREFIX
$(error PREFIX is not set)
endif

MODULE_PATH=${PREFIX}/modules/home/std.lua


.PHONY: all uninstall clean
all: ${PREFIX}/modules/home/std.lua

${PREFIX}/modules/home/std.lua: std_module.lua
	cp ./std_module.lua ${MODULE_PATH}

clean:
	echo "Nothing to clean."

uninstall:
	rm -f ${MODULE_PATH}
