# AOSP 15 — Samsung Galaxy A03 Core

[English](README.md) | [Português (Brasil)](README.pt-BR.md) | [Español](README.es.md)

> **Proyecto experimental. Todavía no está listo para compilar, instalar ni flashear.**

Proyecto comunitario y de código abierto para investigar
y desarrollar un sistema basado en AOSP 15 para el
Samsung Galaxy A03 Core SM-A032M.

El repositorio se encuentra en la fase de auditoría y preparación
del dispositivo. No es un árbol completo de Android ni una ROM
personalizada funcional.

## Estado del proyecto

| Componente | Estado |
|---|---|
| Investigación del dispositivo y firmware | En curso |
| Configuración inicial del dispositivo | Experimental |
| Archivos de producto (`device.mk`, etc.) | Aún no implementados |
| Integración del kernel | Pendiente |
| Integración del vendor | En investigación |
| Compilación AOSP 15 | Todavía no realizada |
| Imágenes instalables / paquete Odin | No disponibles |

**No intentes compilar ni flashear este repositorio.**

## Dispositivo objetivo

- Dispositivo: Samsung Galaxy A03 Core
- Modelo objetivo: **SM-A032M**
- SoC: Unisoc SC9863A
- Plataforma: `sp9863a`
- Identificador de hardware: `m168`
- Nombre del dispositivo en Android: `a3core`
- Firmware stock de referencia: `A032MUBS4CXI1`
- Base Android prevista: AOSP 15

El SM-A032F y otras variantes no se consideran compatibles.
Los materiales del A032F se utilizan únicamente como referencia
técnica y no demuestran compatibilidad con el SM-A032M.

## Objetivos del proyecto

- Desarrollar un sistema limpio basado en AOSP 15.
- Conservar las aplicaciones y los componentes originales de AOSP.
- No incluir aplicaciones ni servicios propietarios de Google.
- No incluir aplicaciones Samsung ni extras de terceros.
- Mantener el trabajo original y la documentación como código abierto.
- Investigar la plataforma Unisoc, el kernel, las interfaces vendor,
  el proceso de arranque, las particiones y el cifrado.
- En el futuro, distribuir paquetes de instalación validados
  y compatibles con Odin3/Odin4.

Estos son objetivos del proyecto, no características de una
ROM ya disponible.

## Entorno de referencia y resultados

Nuestra referencia funcional actual es LineageOS 21 V6
(Android 14), ejecutado con la imagen vendor original del
firmware stock.

En el entorno de referencia se investigaron:

- Interfaces HIDL seleccionadas, registradas y responsivas.
- Unisoc Keymaster 4.1 y Android Keystore2 en ejecución.
- Generación exitosa de una clave temporal solicitando
  el nivel de seguridad TEE.
- Firma y verificación RSA completadas correctamente.
- Cifrado basado en archivos y metadata encryption mediante
  `dm-default-key` observados durante la ejecución.
- Auditoría del esquema de particiones stock y de los metadatos
  de la imagen de arranque.

Estos resultados describen el entorno de referencia Android 14.
**No** demuestran compatibilidad con AOSP 15, una certificación
completa de seguridad ni el funcionamiento integral del hardware
en una futura compilación AOSP 15.

## Contenido del repositorio

- `device/samsung/a3core/BoardConfig.mk` — configuración inicial
  y experimental de la placa; incompleta y no lista para compilar.
- `docs/BASELINE.md` — referencia del dispositivo y firmware.
- `docs/KERNEL_AUDIT.md` — auditoría del kernel.
- `docs/PARTITION_LAYOUT.md` — esquema de particiones (inglés).
- `docs/UPSTREAMS.md` — fuentes de referencia.
- `docs/VENDOR_RUNTIME_AUDIT.md` — auditoría del vendor,
  runtime y cifrado (inglés).

La documentación detallada se está ampliando y traduciendo.

## Archivos propietarios

Este repositorio no distribuye imágenes del firmware Samsung,
binarios propietarios del vendor, blobs extraídos, claves
privadas de firma ni otros materiales restringidos del firmware.

Los componentes propietarios deben mantenerse separados y
respetar sus respectivas licencias y restricciones de distribución.

No envíes volcados de firmware, claves privadas ni credenciales.

## Contribuciones

Son bienvenidas las investigaciones, mejoras de documentación,
resultados de pruebas reproducibles y análisis específicos
del dispositivo.

Al compartir resultados, indica el modelo exacto, la versión
del firmware, la versión del software y los comandos utilizados.

No envíes imágenes de flasheo sin verificar ni blobs
propietarios del firmware.

## Licencia

Los materiales originales del proyecto se publican bajo
la Apache License 2.0. Consulta [LICENSE](LICENSE) y [NOTICE](NOTICE).

Los proyectos de terceros y los materiales referenciados conservan
sus propias licencias. La licencia Apache no otorga derechos sobre
componentes propietarios de Samsung, Unisoc u otros terceros.

## Aviso legal

Este es un proyecto comunitario independiente, sin afiliación
con Samsung, Google, Android, AOSP, Unisoc ni LineageOS.

Las imágenes Android experimentales pueden causar pérdida
de datos, fallos de arranque o daños al dispositivo. Actualmente,
no se recomienda instalar ningún contenido de este repositorio.
