# AOSP 15 — Samsung Galaxy A03 Core

[English](README.md) | [Português (Brasil)](README.pt-BR.md) | [Español](README.es.md)

> **Projeto experimental. Ainda não está pronto para compilar, instalar ou gravar no aparelho.**

Projeto comunitário e open source para pesquisar e desenvolver
um sistema baseado no AOSP 15 para o Samsung Galaxy A03 Core
SM-A032M.

O repositório está na fase de auditoria e preparação do
dispositivo. Ele não é uma árvore completa do Android nem
uma Custom ROM funcional.

## Estado do projeto

| Componente | Situação |
|---|---|
| Pesquisa do dispositivo e firmware | Em andamento |
| Configuração inicial do dispositivo | Experimental |
| Arquivos de produto (`device.mk` etc.) | Ainda não implementados |
| Integração do kernel | Pendente |
| Integração do vendor | Em investigação |
| Build AOSP 15 | Ainda não produzida |
| Imagens instaláveis / pacote Odin | Indisponíveis |

**Não tente compilar nem gravar este repositório no aparelho.**

## Dispositivo-alvo

- Aparelho: Samsung Galaxy A03 Core
- Modelo-alvo: **SM-A032M**
- SoC: Unisoc SC9863A
- Plataforma: `sp9863a`
- Identificador de hardware: `m168`
- Nome do dispositivo no Android: `a3core`
- Firmware stock de referência: `A032MUBS4CXI1`
- Base Android pretendida: AOSP 15

SM-A032F e outras variantes não são consideradas compatíveis.
Materiais do A032F são apenas referências técnicas e não
comprovam compatibilidade com o SM-A032M.

## Objetivos

- Desenvolver um sistema limpo baseado no AOSP 15.
- Preservar os aplicativos e componentes originais do AOSP.
- Não incluir aplicativos ou serviços proprietários do Google.
- Não incluir aplicativos Samsung ou extras de terceiros.
- Manter o trabalho original e a documentação em open source.
- Investigar a plataforma Unisoc, o kernel, as interfaces vendor,
  o processo de boot, as partições e a criptografia.
- Futuramente distribuir pacotes de instalação validados
  e compatíveis com Odin3/Odin4.

Esses são objetivos do projeto, não funcionalidades de uma
ROM já existente.

## Ambiente de referência e resultados

Nossa referência funcional atual é o LineageOS 21 V6
(Android 14), executado com a imagem vendor original do firmware
stock.

No ambiente de referência, foram investigados:

- Interfaces HIDL selecionadas, registradas e responsivas.
- Unisoc Keymaster 4.1 e Android Keystore2 em execução.
- Geração de uma chave temporária com solicitação de nível
  de segurança TEE concluída com sucesso.
- Assinatura e verificação RSA concluídas com sucesso.
- Criptografia baseada em arquivos e metadata encryption
  por `dm-default-key` observadas em execução.
- Layout de partições stock e metadados da imagem de boot auditados.

Esses resultados descrevem o ambiente de referência Android 14.
Eles **não** comprovam compatibilidade com AOSP 15, certificação
completa de segurança ou funcionamento integral do hardware
em uma futura build AOSP 15.

## Conteúdo do repositório

- `device/samsung/a3core/BoardConfig.mk` — configuração inicial
  e experimental da placa; incompleta e não pronta para build.
- `docs/BASELINE.md` — referência do dispositivo e firmware.
- `docs/KERNEL_AUDIT.md` — auditoria do kernel.
- `docs/PARTITION_LAYOUT.md` — layout das partições (inglês).
- `docs/UPSTREAMS.md` — fontes de referência.
- `docs/VENDOR_RUNTIME_AUDIT.md` — auditoria do vendor,
  runtime e criptografia (inglês).

A documentação detalhada está sendo ampliada e traduzida.

## Arquivos proprietários

Este repositório não distribui imagens do firmware Samsung,
binários proprietários do vendor, blobs extraídos, chaves
privadas de assinatura ou outros materiais restritos do firmware.

Componentes proprietários devem permanecer separados e respeitar
suas respectivas licenças e restrições de redistribuição.

Não envie dumps de firmware, chaves privadas ou credenciais.

## Contribuições

São bem-vindas pesquisas, melhorias na documentação,
resultados de testes reproduzíveis e investigações específicas
do dispositivo.

Ao compartilhar resultados, informe o modelo exato, a versão
do firmware, a versão do software e os comandos utilizados.

Não envie imagens de flash não verificadas nem blobs
proprietários do firmware.

## Licença

Os materiais originais do projeto são disponibilizados sob
a Apache License 2.0. Consulte [LICENSE](LICENSE) e [NOTICE](NOTICE).

Projetos de terceiros e materiais referenciados mantêm suas
próprias licenças. A licença Apache não concede direitos sobre
componentes proprietários da Samsung, Unisoc ou terceiros.

## Aviso legal

Este é um projeto comunitário independente, sem afiliação
à Samsung, Google, Android, AOSP, Unisoc ou LineageOS.

Imagens Android experimentais podem causar perda de dados,
falha de inicialização ou danos ao aparelho. Atualmente,
nenhum conteúdo deste repositório é recomendado para instalação.
