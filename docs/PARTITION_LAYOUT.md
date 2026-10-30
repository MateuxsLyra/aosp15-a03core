# SM-A032M partition layout

Source: stock firmware A032MUBS4CXI1 and A3CORE_EUR_OPEN.pit.

## Physical super partition

- Size: 3,303,014,400 bytes
- Block count: 6,451,200 sectors
- Sector size: 512 bytes
- Metadata overhead: 4,194,304 bytes

## Dynamic partition group

- Name: group_unisoc
- Maximum size: 3,298,820,096 bytes

## Stock logical partitions

| Partition | Size in bytes |
|---|---:|
| system | 1,403,236,352 |
| system_ext | 150,073,344 |
| vendor | 407,732,224 |
| product | 1,203,503,104 |
| Total | 3,164,545,024 |

Remaining group capacity: 134,275,072 bytes.

## Comparison with LineageOS 21 V6

LineageOS uses the same group name and physical super size,
but its group maximum is 2,117,312,512 bytes.

Its system partition is larger, while product and system_ext
are minimal placeholder filesystems.

The AOSP project will use the original stock partition capacity
as its starting layout, not the reduced GSI group size.

## Boot-related physical partitions

| Partition | Size |
|---|---:|
| boot | 67,108,864 |
| recovery | 67,108,864 |
| dtbo | 8,388,608 |

## Status

Partition dimensions are derived from the supplied stock PIT
and lpdump metadata.

AVB, kernel integration, image generation and Odin packaging
remain unimplemented and require further validation.
