current_dir = $(notdir $(shell pwd))
KERNELVER := 6.11.7
CACHE_DIR := $(shell pwd)/../../cache
KERNEL_TAR := linux-$(KERNELVER).tar.xz
CACHE_FILE := $(CACHE_DIR)/$(KERNEL_TAR)
KERNEL_DIR := linux-$(KERNELVER)
SRC_KERNEL_CONFIG := kernel-config
KERNEL_CONFIG := $(KERNEL_DIR)/.config

all: clean build check distcheck

build check distcheck: $(KERNEL_DIR) bzImage
	@echo build kernel $(current_dir) done
	@echo kernel in $(CACHE_DIR)

.PHONY: CACHE_FILE

$(CACHE_FILE):
	@set -xe; ls -la $(CACHE_DIR)
	@echo "using cache $(KERNEL_TAR)"
	@$(MAKE) -C $(CACHE_DIR) $(KERNEL_TAR)
	@file $(CACHE_FILE)

$(KERNEL_DIR): $(CACHE_FILE)
	@echo "untar kernel $(KERNEL_DIR)"
	@mkdir -p $(KERNEL_DIR)
	@tar -xJf $(CACHE_FILE) -C $(KERNEL_DIR) --strip-components=1

$(KERNEL_CONFIG): $(SRC_KERNEL_CONFIG)
	@echo "copying kernel config"
	@cp $(SRC_KERNEL_CONFIG) $(KERNEL_CONFIG)

$(KERNEL_DIR)/arch/x86/boot/bzImage: $(KERNEL_DIR) $(KERNEL_CONFIG)
	@$(MAKE) -C $(KERNEL_DIR) -j$(shell nproc) bzImage

bzImage: $(KERNEL_DIR)/arch/x86/boot/bzImage
	@cp $< $@
	@file $@



clean:
	@rm -rf $(KERNEL_DIR)
	@rm -f bzImage