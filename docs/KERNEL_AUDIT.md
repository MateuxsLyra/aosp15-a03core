# Auditoria do kernel — Galaxy A03 Core

## Firmware de referência

Modelo: SM-A032M
Firmware: A032MUBS4CXI1
Kernel: Linux 4.14.199

## Kernels examinados

### Stock A032M

Linux 4.14.199-27418755-abA032MUBS4CXI1
Compilação: 17/09/2024
Clang: 11.0.1
Tamanho: 19.884.048 bytes

### Referência A032F

Linux 4.14.199-27418755-abA032FXXS5CXA2
Compilação: 04/01/2024
Clang: 11.0.1
Tamanho: 19.884.048 bytes

Os dois binários possuem hashes diferentes.
Não assumir intercambiabilidade.

## Código-fonte público

Repositório:
https://github.com/almondnguyen/android_kernel_samsung_a3core

Branch: 13
Commit: fac69d6f97e694711c2ef528b86d612896d1e9ae

Versão: Linux 4.14.199

Defconfig disponível:
a3core_eur_open_defconfig

O arquivo a3core_defconfig não existe nesta branch.

O script build_kernel.sh utiliza:
a3core_eur_open_defconfig

## IKCONFIG

O defconfig público contém:

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y

Entretanto, os marcadores IKCFG_ST não foram
encontrados nos dois kernels pré-compilados examinados.

Não foi possível recuperar a configuração original
desses binários pelo mecanismo IKCONFIG.

A configuração do defconfig não comprova a configuração
efetivamente utilizada nas builds stock ou A032F.

## Device Tree

DTB:
Idêntico entre referência A032F e stock A032M.

DTBO:
Quatro overlays idênticos individualmente:
6400, 6401, 6402 e 6403.

A tabela DTBO possui ordenação diferente.

## Recursos identificados no defconfig público

- ARM64
- ARCH_SPRD / sharkl3
- Android Binder e BinderFS
- SELinux
- EXT4 e F2FS
- Criptografia
- dm-verity / AVB
- ZRAM
- Módulos do kernel

## Pendências

- Investigar a configuração efetiva do kernel stock.
- Verificar compatibilidade da fonte pública com A032M.
- Investigar dependências da toolchain.
- Avaliar o projeto IverCoder como referência adicional.
- Não utilizar kernels A032F sem validação.
- Não gerar imagens de flash antes da auditoria.
