.SILENT:
TOPTARGETS := all build check distcheck clean

SUBDIRS := $(wildcard src/*/.)

$(TOPTARGETS): $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: $(TOPTARGETS) $(SUBDIRS)
.default: all


# .default: all

# all: clean check distcheck
# 	echo "All..."
# 	echo "Done!"

# clean:
# 	echo "Cleaning up..."
# 	echo "Done!"

# check:
# 	echo "Checking..."
# 	echo "Done!"

# distcheck:
# 	echo "Distchecking..."
# 	echo "Done!"

# CARL_EXIT_BIN := src/carl-exit/carl-exit

# carl-exit: $(CARL_EXIT_BIN)
# 	echo "Building carl-exit..."

# $(CARL_EXIT_BIN):
# 	$(MAKE) -C src/carl-exit
# 	echo "Done!"
