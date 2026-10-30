# Vendor Runtime Audit — SM-A032M

## Test environment

- Device: Samsung Galaxy A03 Core SM-A032M
- Platform: Unisoc SC9863A (`sp9863a`)
- Hardware identifier: `m168`
- Product device: `a3core`
- Vendor firmware: `A032MUBS4CXI1`
- Reference runtime: LineageOS 21 / Android 14
- Vendor image: Original stock vendor image

## Init services

The following 16 selected services reported `running`:

- Audio HAL
- Bluetooth HAL
- Camera Provider
- Samsung Health HAL
- Unisoc Keymaster 4.1
- Samsung GNSS
- Samsung MiscPower
- Samsung SysInput
- Samsung Wi-Fi HAL
- Spreadtrum Combined HAL
- Spreadtrum CP Log Connection Manager
- Spreadtrum CP Log Service
- Spreadtrum WCN
- Unisoc Power HAL
- Thermal daemon
- WCND

## HIDL runtime

Command executed as root:

    lshal --types=binderized -S -i

Result: every listed binderized HIDL interface reported `alive`.

The successful query included Android framework interfaces and
Samsung/Unisoc vendor interfaces, including:

- Audio and audio effects
- Bluetooth and Bluetooth Audio
- Camera Provider
- GNSS
- Graphics Allocator and Composer
- Health
- Keymaster
- Media OMX and Codec2
- Radio and Radio Config
- Sensors
- Thermal
- Wi-Fi and Supplicant
- Samsung proprietary HALs
- Spreadtrum/Unisoc proprietary HALs

The initial unprivileged query reported `non-responsive` and
service-manager lookup warnings. Repeating the command as root
resolved those results. The initial output must not be treated
as evidence of broken HAL implementations.

## AIDL runtime

The earlier `service list` inspection showed registered services
including Lights, Power, Reboot Escrow, Vibrator and Bluetooth Audio.

## Interpretation and limitations

This audit confirms successful runtime registration and
responsiveness of the inspected HIDL interfaces in the
Android 14 reference environment.

It does not prove Android 15 compatibility, complete hardware
functionality, or successful compilation of the AOSP device tree.

Further validation is required during the Android 15 build
and on-device testing.

## Blob handling

The original proprietary vendor binaries remain local.
They must not be committed to this public source repository.

## Storage encryption runtime

Tests performed on 2026-10-30 using the Android 14 reference
environment and the original stock vendor image.

Observed runtime properties:

- `init.svc.vold=running`
- `ro.crypto.state=encrypted`
- `ro.crypto.type=file`
- `/data` successfully mounted as F2FS.
- The `/data` mount options include `inlinecrypt`.
- `/metadata/vold/metadata_encryption` exists.

The command `dmctl table userdata` returned a device-mapper
`default-key` target using `aes-xts-plain64`, with:

- `allow_discards`
- `sector_size:4096`
- `iv_large_sectors`

These results confirm working file-based encryption and provide
runtime evidence of metadata encryption using dm-default-key.

## Keystore2 and legacy Keymaster runtime

Runtime inspection showed:

- `init.svc.keystore2=running`
- `init.svc.vendor.unisoc.keymaster-4-1=running`
- Android Keystore2 AIDL service registered.
- `android.security.compat` AIDL service registered.
- HIDL `IKeymasterDevice/default` interfaces 4.0 and 4.1 registered.
- The Unisoc Keymaster 4.1 service process was running.

### Cryptographic operation test

The Android `keystore_cli_v2` utility was available at
`/system/bin/keystore_cli_v2`.

A temporary key was generated with an explicit TEE security-level
request:

    keystore_cli_v2 generate --name=a3core_km_audit_20261030 --seclevel=tee

Result: `GenerateKey: success`.

The returned characteristics placed ALGORITHM, KEY_SIZE,
RSA_PUBLIC_EXPONENT, PURPOSE, DIGEST, PADDING, NO_AUTH_REQUIRED,
ORIGIN, OS_VERSION and OS_PATCHLEVEL in the Hardware section.
CREATION_DATETIME and USER_ID appeared in the Software section.

The characteristics query also completed successfully:

    keystore_cli_v2 get-chars --name=a3core_km_audit_20261030

Result: `GetCharacteristics: success`.

A signing and verification operation was then performed:

    keystore_cli_v2 sign-verify --name=a3core_km_audit_20261030

Results:

- `Sign: 256 bytes.`
- `Verify: OK`

The temporary key was deleted successfully. A subsequent existence
check returned `DoesKeyExists: no`.

These results demonstrate successful Keystore2 key generation
with a TEE security-level request, hardware-classified key
characteristics, and a successful RSA signing/verification
round trip in the Android 14 reference environment.

### Interpretation and limitations

The runtime tests provide strong evidence that the original
Unisoc Keymaster 4.1 implementation works with the Android 14
Keystore2 environment.

The presence of `android.security.compat` is consistent with
the legacy Keymaster compatibility architecture. However,
service registration alone does not prove the exact internal
routing of every Keystore2 operation.

These tests do not constitute a complete security certification,
a VTS result, or proof of Android 15 compatibility. The same
integration must be validated on the target Android 15 build.

The temporary audit key was removed after testing.
