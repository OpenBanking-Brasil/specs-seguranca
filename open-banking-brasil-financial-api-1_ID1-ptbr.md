%%%

    #
    # Open Banking Brasil Financial-grade API Security Profile 1.0 Implementers Draft 1
    # (open-banking-brasil-financial-api-1_ID1)
    #
    #

    title = "Open Banking Brasil Financial-grade API Security Profile 1.0 Implementers Draft 1"
    abbrev = "OBB-FAPI-1-ID1"
    ipr = "none"
    workgroup = "Open Banking Brasil GT Security"
    keyword = ["FAPI", "Open Banking Brasil GT Security"]

    [seriesInfo]
    name = "Internet-Draft"
    status = "standard"
    value = "open-banking-brasil-financial-api-1_ID1-ptbr"

    [[author]]
    initials = "R."
    surname = "Bragg"
    fullname = "Ralph Bragg"
    organization = "Raidiam"
    abbrev = "Raidiam"
      [author.address]
      email = "ralph.bragg@raidiam.com"
      uri = "https://www.raidiam.com/"

    [[author]]
    initials = "GT"
    surname = "Security"
    fullname = "OBBIS GT Security"
    organization = "Open Banking Brasil Initial Structure"
    abbrev = "OBBIS"
      [author.address]
      email = "gt-seguranca@openbankingbr.org"
      uri = "https://openbankingbrasil.org.br/"
%%%

.# Prefácio  {#Foreword}

The normative version in [English](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-financial-api-1_ID1.html)

A Estrutura Inicial do Open Banking Brasil (EIOBB) é responsável por criar padrões e especificações necessárias para atender aos requisitos e obrigações da Legislação do Open Banking do Brasil, conforme originalmente delineado pelo [Banco Central do Brasil] (https://www.bcb.gov.br/content /config/Documents/BCB_Open_Banking_Communique-April-2019.pdf). É possível que alguns dos elementos deste documento estejam sujeitos a direitos autorais ou patenteados. O EIOBB não se responsabiliza pela identificação de qualquer ou todos esses direitos.

O Financial-grade API 1.0 do Open Banking Brasil consiste nas seguintes partes:

* Open Banking Brasil Financial-grade API Security Profile 1.0
* [Open Banking Brasil Dynamic Client Registration Profile 1.0][OBB-FAPI-DCR]

Estas partes são destinados a serem usados com [RFC6749], [RFC6750], [RFC7636], [OIDC], [FAPI-1-Baseline] e [FAPI-1-Advanced]

.# Introdução  {#Introduction}

A Financial-grade API do Open Banking Brasil é um perfil OAuth altamente seguro que visa fornecer diretrizes de implementação específicas para segurança e interoperabilidade que podem ser aplicadas a APIs na área de Open Banking do Brasil que requerem um nível de privacidade superior ao fornecido pelo padrão [Financial-grade API Security Profile 1.0 - Part 2: Advanced][FAPI-1-Advanced]. Entre outras melhorias, esta especificação aborda considerações de privacidade identificadas em [FAPI-1-Advanced] que são relevantes nas especificações do Open Banking Brasil, mas não foram, até agora, exigidas por outras jurisdições.

Embora seja possível codificar um provedor de OpenID e parte de confiança a partir dos primeiros princípios usando esta especificação, o público principal para esta especificação são as partes que já possuem uma implementação certificada do [Financial-grade API Security Profile 1.0 - Part 2: Advanced][FAPI-1-Advanced] e deseja obter a certificação para o programa Brasil Open Banking.

.# Convenções Notacionais  {#Notational}

As palavras-chave "deve", "não deve",
"deveria", "não deveria", "pode" e
"pode" neste documento deve ser interpretado conforme descrito em
[ISO Directive Part 2][ISODIR2].
Estas palavras-chave não são usadas como termos de dicionário, de modo que
qualquer ocorrência deles deve ser interpretada como palavras-chave
e não devem ser interpretados com seus significados de linguagem natural.

{mainmatter}

# Escopo  {#Scope}

Este documento especifica o método de

* aplicativos para obter os tokens OAuth de maneira adequadamente segura para acesso de maior risco aos dados de uma maneira que atenda aos requisitos do [Open Banking Brasil] (https://www.in.gov.br/en/web/dou/-/resolucao-conjunta-n-1-de-4-de-maio-de-2020-255165055);
* aplicativos para usar o OpenID Connect para identificar o cliente; e
* aplicativos para usar o OpenID Connect para afirmar a identidade do cliente;

Este documento é aplicável a todos os participantes do Open Banking no Brasil.

# Referências normativas  {#Normative}

Os seguintes documentos referenciados são indispensáveis para a aplicação deste documento. Para referências datadas, apenas a edição citada se aplica. Para referências não datadas, a última edição do documento referenciado (incluindo quaisquer emendas) se aplica.

[ISODIR2] - ISO/IEC Directives Part 2
[ISODIR2]: <https://www.iso.org/sites/directives/current/part2/index.xhtml

[RFC6749] - The OAuth 2.0 Authorization Framework
[RFC6749]: <https://tools.ietf.org/html/rfc6749

[RFC6750] - The OAuth 2.0 Authorization Framework: Bearer Token Usage
[RFC6750]: <https://tools.ietf.org/html/rfc6750

[RFC7636] - Proof Key for Code Exchange by OAuth Public Clients
[RFC7636]: <https://tools.ietf.org/html/rfc7636

[RFC6819] - OAuth 2.0 Threat Model and Security Considerations
[RFC6819]: <https://tools.ietf.org/html/rfc6819

[RFC7519] - JSON Web Token (JWT)
[RFC7519]:<https://tools.ietf.org/html/rfc7519

[RFC7591] - OAuth 2.0 Dynamic Client Registration Protocol
[RFC7591]:<https://tools.ietf.org/html/rfc7591

[RFC7592] - OAuth 2.0 Dynamic Client Registration Management Protocol
[RFC7592]:<https://tools.ietf.org/html/rfc7592

[BCP195] - Recommendations for Secure Use of Transport Layer Security (TLS) and Datagram Transport Layer Security (DTLS)
[BCP195]: <https://tools.ietf.org/html/bcp195

[OIDC] - OpenID Connect Core 1.0 incorporating errata set 1
[OIDC]: <https://openid.net/specs/openid-connect-core-1_0.html

[FAPI-CIBA] - Financial-grade API: Client Initiated Backchannel Authentication Profile
[FAPI-CIBA]: <https://bitbucket.org/openid/fapi/src/master/Financial_API_WD_CIBA.md

[OIDD] -  OpenID Connect Discovery 1.0 incorporating errata set 1
[OIDD]: <https://openid.net/specs/openid-connect-discovery-1_0.html

[OIDR] -  OpenID Connect Registration 1.0 incorporating errata set 1
[OIDR]: <https://openid.net/specs/openid-connect-registration-1_0.html

[RFC8705] - OAuth 2.0 Mutual TLS Client Authentication and Certificate Bound Access Tokens
[RFC8705]: <https://tools.ietf.org/html/rfc8705

[JARM] - Financial-grade API: JWT Secured Authorization Response Mode for OAuth 2.0 (JARM)
[JARM]: <https://bitbucket.org/openid/fapi/src/master/Financial_API_JWT_Secured_Authorization_Response_Mode.md

[PAR] - OAuth 2.0 Pushed Authorization Requests
[PAR]: <https://tools.ietf.org/html/draft-ietf-oauth-par

[JAR] - OAuth 2.0 JWT Secured Authorization Request
[JAR]: <https://tools.ietf.org/html/draft-ietf-oauth-jwsreq

[FAPI-1-Baseline] - Financial-grade API Security Profile 1.0 - Part 1: Baseline
[FAPI-1-Baseline]: <https://openid.net/specs/openid-financial-api-part-1-1_0.html

[FAPI-1-Advanced] - Financial-grade API Security Profile 1.0 - Part 2: Advanced
[FAPI-1-Advanced]: <https://openid.net/specs/openid-financial-api-part-2-1_0.html

[FAPI-2-Baseline] - Financial-grade API Security Profile 2.0 - Part 1: Baseline
[FAPI-2-Baseline]: <https://bitbucket.org/openid/fapi/src/master/FAPI_2_0_Baseline_Profile.md

[FAPI-2-Advanced] - Financial-grade API Security Profile 2.0 - Part 2: Advanced
[FAPI-2-Advanced]: <https://bitbucket.org/openid/fapi/src/master/FAPI_2_0_Advanced_Profile.md

[LIWP] - OIDF FAPI WG Lodging Intent Working Paper
[LIWP]: <https://bitbucket.org/openid/fapi/src/master/Financial_API_Lodging_Intent.md

[OBB-FAPI-DCR] - Open Banking Brasil Financial-grade API Dynamic Client Registration Profile 1.0
[OBB-FAPI-DCR]: <https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-dynamic-client-registration-1_ID1.html

# Termos e definições  {#definitions}

Para efeitos deste documento, os termos definidos em [RFC6749], [RFC6750], [RFC7636], [OpenID Connect Core][OIDC] e ISO29100 se aplicam.

# Símbolos e termos abreviados  {#terms}

**API** - Application Programming Interface (Interface de programação de aplicativo)

**EIOBB** - Estrutura Inicial do Open Banking Brasil

**CSRF** - Cross Site Request Forgery

**DCR** - Registro de cliente dinâmico

**FAPI** - Financial-grade API

**HTTP** - Protocolo de transferência de hipertexto

**OIDF** - OpenID Foundation

**REST** - Representational State Transfer (Transferência de Estado Representacional)

**TLS** - Transport Layer Security (Segurança da Camada de Transporte)

**MFA** - Multi-Factor Authentication

# Brasil Open Banking Security Profile  {#securityprofile}

## Introdução  {#secintroduction}

O perfil de segurança do Open Banking Brasil especifica requisitos adicionais de segurança e identidade para recursos API de alto risco protegidos pelo OAuth 2.0 Authorization Framework que consiste em [RFC6749], [RFC6750], [RFC7636], [FAPI-1-Baseline], [FAPI- 1-Advanced] e outras especificações.

Este perfil descreve as provisões de segurança e recursos para um servidor e cliente que são necessárias para o Programa do Open Banking Brasil, definindo as medidas para mitigar ou resolver:

* ataques que abordam considerações de privacidade identificadas na cláusula 9.1 de [FAPI1 Avançado]
* o requisito de apoiar o acesso refinado a recursos para fins de minimização de dados
* o requisito de transmitir a Solicitação de Contexto de Autenticação que foi realizada por um Provedor OpenID a um Cliente para permitir um gerenciamento apropriado do cliente do risco de conduta do cliente.
* o requisito para os clientes afirmarem um relacionamento com o cliente pré-existente, afirmando uma reivindicação de identidade do cliente como parte do fluxo de autorização.

## Disposições de segurança do Open Banking Brasil  {#authserver}

### Introdução  {#authintrod}

O Open Banking Brasil tem um requisito para endereçar considerações de privacidade que foram identificadas, mas não abordadas na especificação final [FAPI-1-Advanced], sem impor requisitos adicionais aos Servidores de Autorização que estão sendo propostos em [FAPI-2-Baseline].
Os participantes desse ecossistema precisam que os clientes solicitem a um provedor openid para confirmar os valores das declarações de identidade como parte de uma solicitação de autorização usando o mecanismo definido na cláusula 5.5.1 de [OIDC].
O uso do parâmetro de declarações para solicitar valores de declarações explícitos requer que os clientes garantam que criptografam o objeto de solicitação para evitar vazamento de informações. Este risco é identificado na cláusula 7.4.1 do [FAPI-1-Advanced].

Além disso, este perfil descreve o escopo específico, requisitos de gerenciamento de ações e clientes necessários para dar suporte ao ecossistema Open Banking Brasil mais amplo.

Como um perfil do OAuth 2.0 Authorization Framework, este documento exige o seguinte para o perfil de segurança do Open Banking Brasil.

### Servidor de Autorização  {#authprovisions}

O Servidor de Autorização deve suportar as disposições especificadas na cláusula 5.2.2 de [Financial-grade API Security Profile 1.0 - Parte 2: Advanced] [FAPI-1-Advanced]. Além disso, ele deve:

1. shall support a signed and encrypted JWE request object passed by value or shall require pushed authorization requests [PAR];
2. shall distribute discovery metadata (such as the authorization endpoint) via the metadata document as specified in [OIDD] and [RFC8414]
3. shall support the claims parameter as defined in clause 5.5 [OpenID Connect Core][OIDC]
4. shall support the oidc standard claim "cpf" as defined in clause 5.2.2.2 of this document
5. shall support the oidc standard claim "cnpj" as defined in clause 5.2.2.3 of this document
6. shall support the acr "urn:brasil:openbanking:loa2" as defined in clause 5.2.2.4 of this document
7. should support the acr "urn:brasil:openbanking:loa3" as defined in clause 5.2.2.4 of this document
8. shall implement the user info endpoint as defined in clause 5.3 [OpenID Connect Core][OIDC]
9. shall support parameterized OAuth 2.0 resource scope _consent_ as defined in clause 6.3.1 [OIDF FAPI WG Lodging Intent Pattern][LIWP]
10. may support [Financial-grade API: Client Initiated Backchannel Authentication Profile][FAPI-CIBA]
11. shall support [Financial-grade API: Client Initiated Backchannel Authentication Profile][FAPI-CIBA] if supporting scope _payments_
12. shall support refresh tokens
13. shall issue access tokens with an expiry no greater than 900 seconds and no less than 300 seconds

#### Token de ID como assinatura separada  {#detached}

O Servidor de Autorização deve suportar as disposições especificadas na cláusula 5.2.2.1 de [Financial-grade API Security Profile 1.0 - Parte 2: Advanced] [FAPI-1-Advanced]

Além disso, se o valor `response_type` `code id_token` for usado, o servidor de autorização:

1. não deve retornar Informação de Identificação Pessoal (PII) confidenciais no token de ID na resposta de autorização, mas se for necessário,
então ele deve criptografar o token de ID.

#### Solicitando a reivindicação "cpf"  {#cpf}

Este perfil define "cpf" como uma nova reivindicação padrão de acordo com cláusula 5.1 [OIDC]

O número do **CPF** (Cadastro de Pessoas Físicas, [sepeˈɛfi]; português para "Registro de Pessoas Físicas") é o cadastro de pessoa física **brasileira**. Este número é atribuído pela Receita Federal **Brasileira** para brasileiros e estrangeiros residentes que, direta ou indiretamente, pagar impostos no **Brasil**.

No modelo de identidade do Open Banking Brasil, o cpf é uma string composta por números 11 caracteres de comprimento e podem começar com 0.
Se a reivindicação cpf for solicitada como uma reivindicação essencial para o token de ID ou resposta UserInfo com um parâmetros de valores solicitando um valor cpf específico, o Servidor de Autorização DEVE retornar um valor de reivindicação cpf que corresponde ao valor solicitado. Se esta for uma reivindicação essencial e o requisito não puder ser atendido,
  então, o Authorization Server DEVE tratar esse resultado como uma tentativa de autenticação falhada.

Nome: cpf, Tipo: String, Regex: '^\d{11}$'

#### Solicitando a reivindicação "cnpj"  {#cnpj}

Este perfil define "cnpj" como uma nova reivindicação padrão de acordo com cláusula 5.1 [OIDC]
  
**CNPJ**, abreviação de Cadastro Nacional de Pessoas Jurídicas, é um número de identificação de empresas **brasileiras** emitidas pelo Ministério da Fazenda **brasileira**, **na**
  "Secretaria da Receita Federal" ou "Ministério da Fazenda" do Brasil. No modelo de identidade do Open Banking Brasil, pessoas físicas podem se associar a 0 ou mais CNPJs. Um CNPJ é uma string que consiste em números de 14 dígitos e pode começar com 0, os primeiros oito dígitos identificam a empresa, os quatro dígitos após a barra identificam a filial ou subsidiária ("0001" padrão para a sede), e os dois últimos são dígitos de soma de verificação. Para este perfil, o pedido de cnpj deve ser solicitado e fornecido como o número de 14 dígitos.

If the cnpj Claim is requested as an Essential Claim for the ID Token or UserInfo response with a
values parameter requesting a specific cnpj value, the Authorization Server MUST return an cnpj
Claim Value that contains a **set** of CNPJs one of which must match the requested value. If this
 is an Essential Claim and the requirement cannot be met, then the Authorization Server MUST treat
 that outcome as a failed authentication attempt.

Se a reivindicação cnpj for solicitada como uma reivindicação essencial para o token de ID ou resposta UserInfo com um parâmetros de valores solicitando um valor cnpj específico, o Servidor de Autorização DEVE retornar um cnpj Claim Value que contém um **conjunto** de CNPJs, um dos quais deve corresponder ao valor solicitado. Se este é uma Reivindicação Essencial e o requisito não pode ser atendido, então o Servidor de Autorização DEVE tratar esse resultado como uma tentativa de autenticação falhada.

Nome: cnpj, Tipo: Array of Strings, Array Element Regex: '^\d{14}$'

#### Solicitando o "urn:brasil:openbanking:loa2" ou "urn:brasil:openbanking:loa3" Solicitação de contexto de autenticação  {#loa}

* **LoA2:** Authentication performed using single factor;
* **LoA3:** Authentication performed using multi factor (MFA)

The following rules are applicable:

* **Read-only APIs :** shall require resource owner authentication to at least LoA2, elevating the requirement to authenticate resource owners to LoA3 is at the discretion of the Authorization Server;
* **Read-and-Write APIs (Transactional):** shall require resource owner authentication to at least LoA3.

**Authentication factors clarification**

The authentication methods are:

* Something you know, such as password or phrase
* Something you have, such as token or smartcard;
* Something you are, such as biometric validation.

To performe a MFA authentication is necessary the end user to present at least two different methods as listed above. A unique method used more than once is not accepted as MFA.

### Cliente confidencial  {#client}

Um cliente confidencial deve apoiar as disposições especificadas na cláusula 5.2.3 de
[Financial-grade API Security Profile 1.0 - Part 2: Advanced][FAPI-1-Advanced],

Além disso, o cliente confidencial

1. deve suportar objetos de solicitação _encrypted_
2. deve suportar solicitações de autorização push (pushed authorization requests) [PAR]
3. deve usar objetos de solicitação _encrypted_ se não usar [PAR]
4. deve suportar o escopo de recurso OAuth 2.0 parametrizado _consentimento_ conforme definido na cláusula 6.3.1 [OIDF FAPI WG Lodging Intent Pattern][LIWP]
5. deve suportar tokens de atualização

# Considerações de segurança  {#authserver}

Os participantes devem apoiar todas as considerações de segurança especificadas na cláusula 8 [Financial-grade API Security Profile 1.0 - Parte 1: Advanced] [FAPI-1-Advanced] e o [Manual de Segurança de Banco Central do Brasil] (https://www.bcb.gov.br/estabilidadefinanceira/exibenormativo?tipo=Instru%C3%A7%C3%A3o%20Normativa%20BCB&numero=99). O ICP brasileiro emite certificados RSA x509 somente, portanto, para simplificar, a seção remove o suporte para algoritmos EC e exige que apenas algoritmos de criptografia recomendados pela IANA sejam usados.
  
## Considerações de algoritmo  {#alg}

Para JWS, clientes e servidores de autorização

1. devem usar o algoritmo PS256;

### Considerações de algoritmo de criptografia  {#cipher}

Para JWE, clientes e servidores de autorização

1. devem usar RSA-OAEP com A256GCM

### Considerações sobre o uso seguro do Transport Layer Security  {#tls}

Para TLS, endpoints do Servidor de Autenticação e endpoints do Servidor de Recursos usados diretamente pelo cliente:

1. devem suportar `TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256`
2. devem suportar `TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384`

# Considerações sobre compartilhamento de dados  {#dados}

## Mecanismo de Autorização  {#authmech}

### Introdução  {#authmechintro}

Os mecanismos existentes para gerenciar adequadamente o acesso aos recursos definidos em [RFC6749] são insuficientes para atender aos requisitos de um ecossistema de compartilhamento de dados moderno. Aproveitar strings de escopo estático não fornece aos consumidores controle de granularidade suficiente para compartilhar com terceiros. O Open Banking Brasil optou por implementar uma [API de consentimento] (https://openbanking-brasil.github.io/areadesenvolvedor/swagger/swagger_consents_apis.yaml) como um recurso protegido OAuth 2.0 que pode ser usado para gerenciar o acesso granular aos recursos. A referência ao recurso de consentimento será transmitida como parte de um escopo de recurso dinâmico OAuth 2.0.

### Definição de Escopo de Consentimento Dinâmico  {#consent}

Este perfil define o escopo dinâmico do OAuth 2.0 "consentimento" da seguinte maneira:

* string 'consentimento'; e
* delimitador de dois pontos ":"; e
* Consent API REST Resource Id retornado por uma criação bem-sucedida de [Open Banking Consent Resource](https://openbanking-brasil.github.io/areadesenvolvedor/#fase-2-apis-do-open-banking-brasil-api-consentimento);

Adicionalmente:

* Consent Resource Id deve incluir caracteres seguros para url;
* Consent Resource Id deve ter namespace;
* Consent Resource Id deve ter propriedades de um nonce [Nonce](https://pt.wikipedia.org/wiki/Nonce);

### Dynamic Consent Scope Example  {#consentexample}

consent:urn:bancoex:C1DD33123

### Exemplo de escopo de consentimento dinâmico  {#consentid}

consent:urn:bancoex:C1DD33123

## Ciclo de vida da autorização  {#lifecycle}

### Introdução  {#lifecycleintro}

O recurso de consentimento tem um ciclo de vida gerenciado separada e distintamente da estrutura de autorização OAuth 2.0. As transições de estado e comportamentos esperados e condições de erro esperados dos Recursos REST protegidos com este perfil são definidos nas especificações funcionais da API publicadas pelo Open Banking Brasil.

### Servidor de autorização  {#lifecycleauth}

Além dos requisitos descritos nas disposições de segurança do Open Banking Brasil, o Servidor de Autorização

1. shall issue refresh tokens with validity equal to the *expirationDateTime* defined on the linked Consent Resource;
2. shall revoke refresh tokens and where practicable access tokens when the linked Consent Resource is deleted;
3. shall ensure Access Tokens are issued with sufficient scope necessary for access to data specified in the Permissions element of a linked Consent Resource object;
4. shall not reject an authorisation request requesting more scope than is necessary to access data specified in the Permissions element of a linked Consent Resource object;
5. may reduce requested scope to a level sufficient to enable access to data resources specified in the Permissions element of a linked Consent Resource object;
6. shall retain a complete audit history of the consent resource in acoordance with current Central Bank brazilian regulation;

### Cliente confidencial  {#clientconfidential}

Além dos requisitos descritos nas disposições de segurança do Open Banking Brasil, o Cliente Confidencial

1. deve revogar sempre que possível e cessar o uso de tokens de atualização e acesso vinculados a um recurso de consentimento que foi excluído;
2. deve excluir Recursos de consentimento que estão expirados;

# Reconhecimentos  {#acknowledgement}

Agradecemos a todos que estabeleceram as bases para o compartilhamento seguro e seguro de dados por meio da formação do Grupo de Trabalho FAPI da OpenID Foundation, o GT de Segurança do Open Banking Brasil e aos pioneiros que ficarão em seus ombros.

As seguintes pessoas contribuíram para este documento:

* Ralph Bragg (Raidiam)
* Joseph Heenan (Authlete)
* Alexandre Siqueira (Mercado Pago)
* Marcos Rodrigues (Itaú)

{backmatter}

# Avisos  {#disclaimer}

Copyright (c) 2021 Estrutura Inicial do Open Banking Brasil

A Estrutura Inicial do Open Banking Brasil (EIOBB) concede a qualquer Colaborador, desenvolvedor, implementador ou outra parte interessada uma licença de direitos autorais mundial não exclusiva, livre de royalties para reproduzir, preparar trabalhos derivados, distribuir, executar e exibir, estes Implementadores Rascunho ou Especificação Final exclusivamente para fins de (i) desenvolver especificações e (ii) implementar Rascunhos de Implementadores e Especificações Finais com base em tais documentos, desde que a atribuição seja feita ao EIOBB como a fonte do material, mas que tal atribuição o faça não indica endosso do EIOBB.

A tecnologia descrita nesta especificação foi disponibilizada a partir de contribuições de várias fontes, incluindo membros da OpenID Foundation, do Grupo de Trabalho de Segurança do Open Banking Brasil e outros. Embora a Estrutura Inicial do Open Banking Brasil tenha tomado medidas para ajudar a garantir que a tecnologia esteja disponível para distribuição, ela não toma posição quanto à validade ou escopo de qualquer propriedade intelectual ou outros direitos que possam ser reivindicados como pertencentes à implementação ou uso do tecnologia descrita nesta especificação ou até que ponto qualquer licença sob tais direitos pode ou não estar disponível; nem representa que fez qualquer esforço independente para identificar tais direitos. A Estrutura Inicial do Open Banking Brasil e os contribuidores desta especificação não oferecem (e por meio deste expressamente se isentam de quaisquer) garantias (expressas, implícitas ou de outra forma), incluindo garantias implícitas de comercialização, não violação, adequação a uma finalidade específica ou título, relacionados a esta especificação, e todo o risco quanto à implementação desta especificação é assumido pelo implementador. A política de Direitos de Propriedade Intelectual do Open Banking Brasil exige que os contribuidores ofereçam uma promessa de patente de não fazer valer certas reivindicações de patentes contra outros contribuidores e implementadores. A Estrutura Inicial do Open Banking Brasil convida qualquer parte interessada a trazer à sua atenção quaisquer direitos autorais, patentes, pedidos de patentes ou outros direitos de propriedade que possam abranger a tecnologia que possa ser necessária para praticar esta especificação.
