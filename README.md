> # :warning: Repositório Arquivado  
> Para novas informações por favor acesse o link em [Segurança](https://openfinancebrasil.atlassian.net/wiki/spaces/OF/pages/17378160/Seguran+a)
 
# Repositório Especificações - GT Segurança - Open Finance Brasil

Repositório para documentação das especificações do GT de Segurança do Open Finance Brasil.

## O que é?

O Open Finance, ou sistema financeiro aberto, é a possibilidade de clientes de produtos e serviços financeiros permitirem o compartilhamento de suas informações entre diferentes instituições autorizadas pelo Banco Central e a movimentação de suas contas bancárias a partir de diferentes plataformas e não apenas pelo aplicativo ou site do banco, de forma segura, ágil e conveniente.

Mais informações em: https://www.bcb.gov.br/estabilidadefinanceira/openfinance

## Introdução

Este respositório e seu conteúdo foram criados e são mantidos pelo **GT de Segurança**, da estrutura responsável pela Governança do Open Finance Brasil, formada por integrantes de múltiplas associações: Febraban, ABBC, ACREFI, ABBI, OCB, Abecs, Abipag, Abranet, Câmara e-net, ABCD e ABFintechs.

## Como contribuir?

As especificações deste repositório ainda estão em versão *draft*. A princípio, as alterações e manutenção nesse repositório são responsabilidades da [Governança do Open Finance Brasil - GT Segurança](mailto:gt-seguranca@openfinancebrasil.org.br).

## O que eu vou encontrar nesse repositório?

Esse repositório inclui o detalhamento técnico necessário para o entendimento sobre o funcionamento das principais etapas para:

 - [Registro e Cadastramento Dinâmico do Cliente de APIs ID3](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-dynamic-client-registration-1_ID3-ptbr.html)
 - [Perfil de Segurança do Open Finance Brasil ID3, que inclui requisitos para o Authorization Server, para o registro da intenção de consentimento, autenticação do usuário e efetivação do consentimento e emissão do `access_token`](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-financial-api-1_ID3-ptbr.html)
 - [Guia do usuário - ponto de vista da instituição transmissora (ASPSP)](https://openbanking-brasil.github.io/specs-seguranca/aspsp-user-guide-ptbr.html)
 - [Guia do usuário - ponto de vista da instituição receptora de dados ou iniciadora de pagamentos (TPP)](https://openbanking-brasil.github.io/specs-seguranca/tpp-user-guide-ptbr.html)
 - [Padrão de Certificados Open Finance Brasil](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-certificate-standards-1_ID1-ptbr.html)

## Manutenção dos links

Sempre que for publicado um novo ID de documentação, deve-se atentar a atualização dos links nos seguintes locais:

|Documento|Referências|
|------------------------------------------|---------------------------------------------------------------------------------------------------|
|Registro e Cadastramento Dinâmico do Cliente de APIs|<ul><li>Perfil de Segurança do Open Finance Brasil</li><li>Padrão de Certificados Open Finance Brasil</li><li>Guia do usuário - ponto de vista da instituição receptora de dados ou iniciadora de pagamentos (TPP)</li><li>Área do Desenvolvedor do Portal do Open Finance Brasil</li><li>Swagger com a documentação do DCR</li></ul>|
|Perfil de Segurança do Open Finance Brasil|<ul><li>Registro e Cadastramento Dinâmico do Cliente de APIs</li><li>Padrão de Certificados Open Finance Brasil</li><li>Guia do usuário - ponto de vista da instituição receptora de dados ou iniciadora de pagamentos (TPP)</li><li>Área do Desenvolvedor do Portal do Open Finance Brasil</li></ul>|
|Padrão de Certificados Open Finance Brasil|<ul><li>Perfil de Segurança do Open Finance Brasil</li><li>Registro e Cadastramento Dinâmico do Cliente de APIs</li><li>Guia do usuário - ponto de vista da instituição receptora de dados ou iniciadora de pagamentos (TPP)</li><li>Área do Desenvolvedor do Portal do Open Finance Brasil</li></ul>|

## Geração de documentação para manutenção

As especificações formais são criadas usando diretrizes, processos e ferramentas criadas pela IETF e pela OIDF, o que garante consistência e familiaridade para os implementadores. Todas as referências às especificações devem ser para a versão normativa da especificação publicada publicada na versão HTML. A vinculação direta a versões de arquivos MarkDown desenvolvidas ativamente deve ser evitada.

Siga os seguintes passos para gerar a versão HTML à partir dos arquivos markdown
```shell
alias makerfc='docker run -v `pwd`:/data upnic/makerfc'

makerfc open-banking-brasil-dynamic-client-registration-1_ID1.md
```
