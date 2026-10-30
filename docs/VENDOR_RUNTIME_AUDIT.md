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
