ARMGNU ?= aarch64-linux-gnu
COPS = -Wall -nostdlib -nostartfiles -ffreestanding -Ios/include -mgeneral-regs-only
ASMOPS = -Ios/include
BUILD_DIR = build
OS_SRC_DIR = os
BOOT_SRC_DIR = boot
C_FILES = $(wildcard os/*.c)
BOOT_ASM_FILES = $(wildcard boot/*.S)
OS_ASM_FILES += $(wildcard os/*.S)
SRC_DIR = .
all : kernel8.img

clean :
	rm -rf $(BUILD_DIR) *.img

#$(info cfiles $(C_FILES))

$(BUILD_DIR)/%_c.o: $(OS_SRC_DIR)/%.c
	mkdir -p $(@D)
	$(ARMGNU)-gcc $(COPS) -MMD -c $< -o $@

$(BUILD_DIR)/%_s.o: $(BOOT_SRC_DIR)/%.S
	$(ARMGNU)-gcc $(ASMOPS) -MMD -c $< -o $@

$(BUILD_DIR)/%_s.o: $(OS_SRC_DIR)/%.S
	$(ARMGNU)-gcc $(ASMOPS) -MMD -c $< -o $@

OBJ_FILES = $(C_FILES:os/%.c=$(BUILD_DIR)/%_c.o)
OBJ_FILES += $(BOOT_ASM_FILES:boot/%.S=$(BUILD_DIR)/%_s.o)
OBJ_FILES += $(OS_ASM_FILES:os/%.S=$(BUILD_DIR)/%_s.o)

#$(info OBJ_FILES is $(OBJ_FILES))
#$(info ASM_FILES is $(ASM_FILES))


DEP_FILES = $(OBJ_FILES:%.o=%.d)
$(DEP_FILES):

-include $(DEP_FILES)

kernel8.img : linker.ld $(OBJ_FILES)
	$(ARMGNU)-ld -T linker.ld -o $(BUILD_DIR)/kernel8.elf $(OBJ_FILES)
	$(ARMGNU)-objcopy $(BUILD_DIR)/kernel8.elf -O binary kernel8.img
