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

## Manutenção dos links

Sempre que for publicado um novo ID de documentação, deve-se atentar a atualização dos links nos seguintes locais:

|Documento|Referências|
|------------------------------------------|---------------------------------------------------------------------------------------------------|
|Registro e Cadastramento Dinâmico do Cliente de APIs|<ul><li>Perfil de Segurança do OpenBanking Brasil</li><li>Padrão de Certificados Open Banking Brasil</li><li>Guia do usuário - ponto de vista da instituição receptora de dados ou iniciadora de pagamentos (TTP)</li><li>Áerea do Desenvolvedor do Portal do Open Banking Brasil</li><li>Swagger com a documentação do DCR</li></ul>|
|Perfil de Segurança do OpenBanking Brasil|<ul><li>Registro e Cadastramento Dinâmico do Cliente de APIs</li><li>Padrão de Certificados Open Banking Brasil</li><li>Guia do usuário - ponto de vista da instituição receptora de dados ou iniciadora de pagamentos (TTP)</li><li>Áerea do Desenvolvedor do Portal do Open Banking Brasil</li></ul>|
|Padrão de Certificados Open Banking Brasil|<ul><li>Perfil de Segurança do OpenBanking Brasil</li><li>Registro e Cadastramento Dinâmico do Cliente de APIs</li><li>Guia do usuário - ponto de vista da instituição receptora de dados ou iniciadora de pagamentos (TTP)</li><li>Áerea do Desenvolvedor do Portal do Open Banking Brasil</li></ul>|

## Geração de documentação para manutenção

As especificações formais são criadas usando diretrizes, processos e ferramentas criadas pela IETF e pela OIDF, o que garante consistência e familiaridade para os implementadores. Todas as referências às especificações devem ser para a versão normativa da especificação publicada publicada na versão HTML. A vinculação direta a versões de arquivos MarkDown desenvolvidas ativamente deve ser evitada.

Siga os seguintes passos para gerar a versão HTML à partir dos arquivos markdown
```shell
makerfc='docker run -v `pwd`:/data upnic/makerfc'

makerfc open-banking-brasil-dynamic-client-registration-1_ID1.md
```
