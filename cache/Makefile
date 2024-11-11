.SILENT:

all: build check distcheck

LINUX_VERSIONS := 6.8.12
LINUX_DIRS := $(addprefix linux-,$(LINUX_VERSIONS))
LINUX_TARS := $(addsuffix .tar.xz,$(LINUX_DIRS))

check distcheck build: $(LINUX_TARS)
	echo build cache done

# linux-%: linux-%.tar.xz
# 	echo "untar kernel $@ $(addsuffix .tar.xz,$@)"
# 	mkdir -p $@
# 	tar -xJf $(addsuffix .tar.xz,$@) -C $@ --strip-components=1

linux-%.tar.xz: 
	echo "download kernel $@ version $*"
	set -xe; curl -sSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$*.tar.xz

clean:
	echo "NOT cleaning cache"
	# @rm -rf $(LINUX_DIRS)
	# @rm -f $(LINUX_TARS)
