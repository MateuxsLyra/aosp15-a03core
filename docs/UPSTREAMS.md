# Fontes de referência

## Código-fonte e documentação

- AOSP:
  https://source.android.com/

- Requisitos para compilar AOSP:
  https://source.android.com/docs/setup/start/requirements

- Kernel Samsung Galaxy A03 Core (m168 / SC9863A):
  https://github.com/almondnguyen/android_kernel_samsung_a3core

- Adaptação de GSI para Galaxy A03 Core:
  https://github.com/MarsXZ-Official/LineageOs-Samsung-Galaxy-A03Core-gsi-adaptation

- Odin4 para Linux:
  https://github.com/llucs/odin4

## Regras do projeto

- O código desenvolvido para o projeto deve ser versionado.
- As fontes externas devem manter suas respectivas licenças e atribuições.
- Imagens proprietárias do firmware não serão publicadas como se
  fossem código-fonte original do projeto.
- O instalador de distribuição será baseado em Odin3/Odin4.
- Nenhum pacote será considerado pronto para flash sem validação.

## Estratégia inicial

Investigar primeiro o kernel e as configurações específicas
do SM-A032M, usando a GSI funcional e o firmware stock como
referências técnicas separadas.

Não existe ainda uma build AOSP própria neste repositório.
