current_dir = $(notdir $(shell pwd))
KERNELVER := 6.11.7
CACHE_DIR := $(shell pwd)/../../cache
KERNEL_TAR := linux-$(KERNELVER).tar.xz
CACHE_FILE := $(CACHE_DIR)/$(KERNEL_TAR)
BUILD_DIR := build
SRC_KERNEL_CONFIG := kernel-config
KERNEL_CONFIG := $(BUILD_DIR)/.config

all: clean build check distcheck

build check distcheck: bzImage
	@echo build kernel $(current_dir) done
	file bzImage

.PHONY: CACHE_FILE

$(CACHE_FILE):
	@echo "using cached $(KERNEL_TAR)"
	@$(MAKE) -C $(CACHE_DIR) $(KERNEL_TAR)
	@file $(CACHE_FILE)

.PHONY: $(BUILD_DIR)

build/arch/x86/boot/bzImage: $(CACHE_FILE)
	@mkdir -p $(BUILD_DIR)
	@tar -xJf $(CACHE_FILE) -C $(BUILD_DIR) --strip-components=1
	@cp $(SRC_KERNEL_CONFIG) $(BUILD_DIR)/.config
	@$(MAKE) -C $(BUILD_DIR) -j$(shell nproc) bzImage

bzImage: $(BUILD_DIR)/arch/x86/boot/bzImage
	@cp $< $@

clean:
	@rm -rf $(BUILD_DIR)
	@rm -f bzImage