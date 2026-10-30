# AOSP 15 - Samsung Galaxy A03 Core SM-A032M
# Platform: Unisoc SC9863A / m168
#
# Initial configuration based on stock firmware audit.
# NOT YET READY FOR BUILD OR FLASH.

DEVICE_PATH := device/samsung/a3core

# Architecture: 32-bit Android userspace, 64-bit Binder
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55
TARGET_USES_64_BIT_BINDER := true

# Platform
TARGET_BOARD_PLATFORM := sp9863a
TARGET_BOOTLOADER_BOARD_NAME := m168
TARGET_NO_BOOTLOADER := true

# Boot image - values observed in stock boot.img
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_SECOND_OFFSET := 0x00000000
BOARD_DTB_OFFSET := 0x01f00000
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8

# DTB is embedded in boot.img.
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Recovery image contains recovery_dtbo.
BOARD_INCLUDE_RECOVERY_DTBO := true

# Physical partition sizes from SM-A032M stock firmware PIT.
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 8388608

# Dynamic partitions - stock SM-A032M layout.
BOARD_SUPER_PARTITION_SIZE := 3303014400

BOARD_SUPER_PARTITION_GROUPS := group_unisoc

BOARD_GROUP_UNISOC_SIZE := 3298820096

BOARD_GROUP_UNISOC_PARTITION_LIST := \
    system \
    system_ext \
    vendor \
    product

# Kernel integration is pending.
# Public source branch 13 contains:
# a3core_eur_open_defconfig
#
# TARGET_KERNEL_SOURCE and kernel build integration
# will be configured after full source and toolchain audit.

# AVB configuration is pending.
# Do not generate or flash vbmeta with placeholder keys.

# Dynamic partitions require AVB support.
# Do not enable system-as-root for this layout.
