# Repositório Especificações - GT Segurança - Open Banking Brasil

Repositório para documentação das especificações do GT de Segurança do Open Banking Brasil.

## O que é?

O Open Banking, ou sistema financeiro aberto, é a possibilidade de clientes de produtos e serviços financeiros permitirem o compartilhamento de suas informações entre diferentes instituições autorizadas pelo Banco Central e a movimentação de suas contas bancárias a partir de diferentes plataformas e não apenas pelo aplicativo ou site do banco, de forma segura, ágil e conveniente.

Mais informações em: https://www.bcb.gov.br/estabilidadefinanceira/openbanking

## Introdução

Este respositório e seu conteúdo foram criados e são mantidos pelo **GT de Segurança**, da estrutura responsável pela Governança do Open Banking Brasil, formada por integrantes de múltiplas associações: Febraban, ABBC, ACREFI, ABBI, OCB, Abecs, Abipag, Abranet, Câmara e-net, ABCD e ABFintechs.

## Como contribuir?

As especificações deste repositório ainda estão em versão *draft*. A princípio, as alterações e manutenção nesse repositório é responsabilidade do [Governança do Open Banking Brasil - GT Segurança](mailto:gt-seguranca@openbankingbr.org).

## O que eu vou encontrar nesse repositório?

Esse repositório inclui o detalhamento técnico necessário para o entendimento sobre o funcionamento das principais etapas para:

 - [Registro e Cadastramento Dinâmico do Cliente de APIs ID2](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-dynamic-client-registration-1_ID2-ptbr.html)
 - [Perfil de Segurança do OpenBanking Brasil ID3, que inclui requisitos para o Authorization Server, para o registro da intenção de consentimento, autenticação do usuário e efetivação do consentimento e emissão do `access_token`](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-financial-api-1_ID3-ptbr.html)
 - [Guia do usuário - ponto de vista da instituição transmissora (ASPSP)](https://openbanking-brasil.github.io/specs-seguranca/aspsp-user-guide-ptbr.html)
 - [Guia do usuário - ponto de vista da instituição receptora de dados ou iniciadora de pagamentos (TTP)](https://openbanking-brasil.github.io/specs-seguranca/tpp-user-guide-ptbr.html)
 - [Padrão de Certificados Open Banking Brasil](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-certificate-standards-1_ID1-ptbr.html)

## Documentation Generation for Maintainers

The formal specifications are created using guidelines, processes and tools created by the IETF and the OIDF which ensures consistency and familiarity for implementers. All references to the specifications should be to the normative version of the published specification published in HTML version. Linking to actively developed versions of MarkDown files directly should be avoided.

The following steps can be used to generate the html version of the markdown files

1. docker run -v `pwd`:/data danielfett/markdown2rfc open-banking-brasil-dynamic-client-registration-1_ID1.md
2. find and replace '&amp;' with '&' in all html files
3. find and replace '&lt;' with '<' in all html files
4. find and replace '&gt;' with '>' in all html files
