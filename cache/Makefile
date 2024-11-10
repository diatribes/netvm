.SILENT:

all: clean build check distcheck

LINUX_VERSIONS := 6.11.7 6.12.6
LINUX_DIRS := $(addprefix linux-,$(LINUX_VERSIONS))
LINUX_TARS := $(addsuffix .tar.xz,$(LINUX_DIRS))

check distcheck build: $(LINUX_DIRS)
	echo "Checking..."
	echo "Done!"

$(LINUX_DIRS): linux-%: linux-%.tar.xz
	echo "Building Linux kernel $@"
	mkdir -p $@
	# tar -xJf $< -C $@ --strip-components=1

linux-%: linux-$*.tar.xz
	echo "Building Linux kernel $@"
	tar -xJ -C $@ --strip-components=1

linux-%.tar.xz: 
	echo "Downloading Linux kernel $@"
	echo wget with $*
	set -xe; curl -sSL https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$*.tar.xz -o $@


clean:
	echo "Cleaning up..."
	rm -rf $(LINUX_DIRS)
	rm -f $(LINUX_TARS)
	echo "Done!"

