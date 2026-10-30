# Auditoria inicial — Galaxy A03 Core SM-A032M

## Firmware de referência

- Modelo: Samsung Galaxy A03 Core SM-A032M
- Plataforma: Unisoc SC9863A / plataforma m168
- Firmware stock: A032MUBS4CXI1
- Sistema stock: Android 13 / SDK 33
- Vendor stock: Android 11 / SDK 30
- Base funcional de comparação: LineageOS 21 V6
- Sistema da base funcional: Android 14 / SDK 34
- ABI do sistema: armeabi-v7a
- Instalação pretendida: Odin3/Odin4

## Resultados confirmados

- O vendor.img stock e o vendor.img da base custom são
  idênticos byte a byte.
- SHA-256 do vendor.img:
  baaa76ca5323e88753b48c8db8b1e7605a69cd3f89433539d2d9fed08068667c
- O super.img stock contém system, vendor, product e system_ext.
- A base custom coloca conteúdo de product e system_ext
  nos respectivos diretórios dentro de system.
- O pacote LineageOS analisado contém super.img dentro do TAR.
- O projeto Odin deve preservar a distinção entre as imagens
  de referência e as imagens produzidas pela nossa própria build.

## Próximas investigações

- Obter e analisar fontes AOSP e kernel relevantes.
- Preparar a árvore de dispositivo para compilação de ROM.
- Determinar a estratégia de boot e AVB.
- Definir a produção e validação de pacotes TAR para Odin.
- Validar compatibilidade antes de qualquer instalação experimental.

Nenhuma imagem de firmware foi modificada por este diagnóstico.
