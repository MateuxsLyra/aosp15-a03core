# AOSP 15 Device Bring-up — Samsung Galaxy A03 Core

[English](README.md) | [Português (Brasil)](README.pt-BR.md) | [Español](README.es.md)

> **Experimental project. Not ready to build, install or flash.**

An open-source community project investigating and developing
an AOSP 15-based operating system for the Samsung Galaxy A03 Core
SM-A032M.

This repository is currently in the device research and bring-up
phase. It is not a complete Android source tree or a working ROM.

## Project status

| Component | Status |
|---|---|
| Device and firmware research | In progress |
| Initial device configuration | Experimental |
| Product makefiles | Not implemented |
| Kernel integration | Pending |
| Vendor integration | Under investigation |
| AOSP 15 build | Not produced |
| Flashable images / Odin package | Not available |

**Do not attempt to build or flash this repository.**

## Target device

- Device: Samsung Galaxy A03 Core
- Target model: **SM-A032M**
- SoC: Unisoc SC9863A
- Board platform: `sp9863a`
- Hardware identifier: `m168`
- Product device name: `a3core`
- Reference stock firmware: `A032MUBS4CXI1`
- Intended Android base: AOSP 15

SM-A032F and other variants are not declared supported.
A032F material is used only as a technical reference and does
not establish compatibility with the SM-A032M.

## Project goals

- Develop a clean AOSP 15-based system.
- Preserve the applications and components provided by AOSP.
- Avoid bundling proprietary Google applications or services.
- Avoid Samsung applications and unrelated third-party additions.
- Keep original project work and documentation open source.
- Investigate the Unisoc platform, kernel, vendor interfaces,
  boot process, partition layout and encryption.
- Eventually distribute validated installation packages
  compatible with Odin3/Odin4.

These are project goals, not claims about an existing build.

## Reference environment and findings

The current functional reference is LineageOS 21 V6
(Android 14) running with the original stock vendor image.

The following have been investigated in that reference
environment:

- Selected HIDL vendor interfaces registered and responsive.
- Unisoc Keymaster 4.1 and Android Keystore2 running.
- A temporary key-generation request at the TEE security level
  completed successfully.
- RSA signing and verification completed successfully.
- File-based encryption and `dm-default-key` metadata
  encryption were observed at runtime.
- The stock partition layout and boot image metadata were audited.

These results describe the Android 14 reference environment.
They do **not** prove AOSP 15 compatibility, a complete security
certification, or successful hardware operation on an AOSP 15 build.

## Kernel architecture investigation

The Android 14 reference environment reports an ARM64 kernel
configuration with AArch32 compatibility enabled
(`CONFIG_ARM64=y`, `CONFIG_64BIT=y`, `CONFIG_COMPAT=y`).

The installed Android userspace remains 32-bit (`zygote32`).
Sampled vendor binaries include both 32-bit ARM HAL executables
and one 64-bit AArch64 library. This does not establish a
complete 64-bit vendor stack.

An AOSP 15 ARM64 userspace with ARM32 compatibility is under
investigation. The final target architecture has not been chosen.

See [`docs/ARCHITECTURE_AUDIT.md`](docs/ARCHITECTURE_AUDIT.md)
for the evidence and remaining requirements.

## Repository contents

- `device/samsung/a3core/BoardConfig.mk` — initial experimental
  board configuration; incomplete and not build-ready.
- `docs/ARCHITECTURE_AUDIT.md` — kernel architecture and userspace ABI audit (English).
- `docs/BASELINE.md` — device and firmware baseline (Portuguese).
- `docs/KERNEL_AUDIT.md` — kernel research (Portuguese).
- `docs/PARTITION_LAYOUT.md` — partition layout (English).
- `docs/UPSTREAMS.md` — upstream sources (Portuguese).
- `docs/VENDOR_RUNTIME_AUDIT.md` — runtime and encryption audit
  (English).

Detailed documentation is being expanded and translated.

## Proprietary files

This repository does not distribute Samsung firmware images,
proprietary vendor binaries, extracted blobs, private signing keys
or other restricted firmware material.

Proprietary components must remain separate and retain their
applicable licenses and redistribution restrictions.
Do not submit firmware dumps, private keys or credentials.

## Contributing

Research, documentation improvements, reproducible test results
and device-specific investigations are welcome.

Please identify the exact device model, firmware version,
software version and commands used when submitting test results.

Do not submit unverified flash images or proprietary firmware blobs.

## License

Original project materials are licensed under the Apache License
2.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE).

Third-party projects and referenced materials retain their
respective licenses. The Apache license does not grant rights
to proprietary Samsung, Unisoc or other third-party components.

## Disclaimer

This is an independent community project. It is not affiliated
with Samsung, Google, Android, AOSP, Unisoc or LineageOS.

Experimental Android images can cause data loss, boot failure
or device damage. Nothing in this repository is currently
recommended for installation on a device.
