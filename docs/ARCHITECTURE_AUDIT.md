# Kernel Architecture and Userspace ABI Audit — SM-A032M

## Test environment

- Device: Samsung Galaxy A03 Core SM-A032M
- Reference system: LineageOS 21 V6 / Android 14
- Vendor: Original stock vendor image
- Runtime kernel: `4.14.199-27418755-abA032MUBU3CWI8`
- Audit date: 2026-10-30

## Running kernel configuration

The running kernel configuration was read from `/proc/config.gz`
with root permissions.

The following options were present:

    CONFIG_ARM64=y
    CONFIG_64BIT=y
    CONFIG_COMPAT=y

These settings confirm an ARM64 kernel configuration with
AArch32 compatibility support enabled.

The command `uname -m` returned `armv8l`. This does not contradict
the ARM64 configuration: the public kernel source defines
`COMPAT_UTS_MACHINE` as `armv8l` in
`arch/arm64/include/asm/compat.h` for the compatibility ABI.

The `armv8l` string must not be used alone to classify the
running kernel as 32-bit.

## Android userspace architecture

The reference Android environment reported:

- `ro.product.cpu.abilist=armeabi-v7a,armeabi`
- `ro.vendor.product.cpu.abilist=armeabi-v7a,armeabi`
- `ro.zygote=zygote32`
- `/system/lib64` was absent.
- `linker64` was absent from the inspected runtime paths.

These findings identify the current Android userspace as
32-bit, despite the ARM64 kernel configuration.

## Vendor binary architecture sampling

The following file counts were observed:

- `/vendor/lib`: 419 regular files.
- `/vendor/lib64`: 1 regular file.

The single file found in `/vendor/lib64` was `libdrm.so`.
ELF inspection identified it as:

    ELF64, ARM AArch64

Two sampled vendor HAL executables were identified as 32-bit:

- `android.hardware.keymaster@4.1-unisoc.service`:
  ELF32, ARM EABI5.
- `vendor.sprd.hardware.combined@1.0-service`:
  ELF32, ARM EABI5.

This is a sample of selected files, not a complete inventory
of all vendor executables and shared libraries.

The presence of one 64-bit library does not prove that a complete
64-bit vendor HAL stack is available or usable.

## Public kernel source reference

The locally audited public kernel repository is:

    https://github.com/almondnguyen/android_kernel_samsung_a3core

Inspected branch: `13`

Inspected commit:

    fac69d6f97e694711c2ef528b86d612896d1e9ae

The source contains:

    arch/arm64/configs/a3core_eur_open_defconfig

Its build script sets `ARCH=arm64`.

This source configuration is consistent with an ARM64 kernel
target, but it has not yet been proven to reproduce the exact
running kernel or the target stock firmware kernel.

## Interpretation

The reference environment provides evidence of:

1. An ARM64-configured running kernel.
2. AArch32 compatibility enabled through `CONFIG_COMPAT`.
3. A 32-bit Android userspace.
4. A predominantly 32-bit vendor binary set among the sampled files.
5. At least one proprietary vendor library built for AArch64.

This architecture combination is technically meaningful:
a 64-bit kernel can support 32-bit userspace processes when
the appropriate compatibility support is enabled.

## Implications for the AOSP 15 project

An AOSP 15 ARM64 userspace with ARM32 application compatibility
is now a research possibility worth investigating.

However, this audit does not establish that such a build will
boot or operate correctly on the SM-A032M.

Further work is required:

- Complete inventory of vendor ELF executables and libraries.
- Identify dependencies and linker namespaces of all HALs.
- Audit VINTF declarations and framework/vendor compatibility.
- Verify Binder and service compatibility for the target build.
- Determine whether required 64-bit HAL implementations exist.
- Produce and test an Android 15 build in a controlled environment.

The project's final userspace architecture remains undecided.
Do not change `TARGET_ARCH` or claim full ARM64 ROM support
until the remaining compatibility work has been completed.

No partitions or firmware images were modified during this audit.
