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
    value = "open-banking-brasil-financial-api-1_ID1"

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

# Prefácio

A Estrutura Inicial do Open Banking Brasil (EIOBB) é responsável por criar padrões e especificações necessárias para atender aos requisitos e obrigações da Legislação do Open Banking do Brasil, conforme originalmente delineado pelo [Banco Central do Brasil] (https://www.bcb.gov.br/content /config/Documents/BCB_Open_Banking_Communique-April-2019.pdf). É possível que alguns dos elementos deste documento estejam sujeitos a direitos autorais ou patenteados. O EIOBB não se responsabiliza pela identificação de qualquer ou todos esses direitos.

O Financial-grade API 1.0 do Open Banking Brasil consiste nas seguintes partes:

* Open Banking Brasil Financial-grade API Security Profile 1.0
* [Open Banking Brasil Dynamic Client Registration Profile 1.0][OBB-FAPI-DCR]

Estas partes são destinados a serem usados com [RFC6749], [RFC6750], [RFC7636], [OIDC], [FAPI-1-Baseline] e [FAPI-1-Advanced]

# Introdução

A Financial-grade API do Open Banking Brasil é um perfil OAuth altamente seguro que visa fornecer diretrizes de implementação específicas para segurança e interoperabilidade que podem ser aplicadas a APIs na área de Open Banking do Brasil que requerem um nível de privacidade superior ao fornecido pelo padrão [Financial-grade API Security Profile 1.0 - Part 2: Advanced][FAPI-1-Advanced]. Entre outras melhorias, esta especificação aborda considerações de privacidade identificadas em [FAPI-1-Advanced] que são relevantes nas especificações do Open Banking Brasil, mas não foram, até agora, exigidas por outras jurisdições.

Embora seja possível codificar um provedor de OpenID e parte de confiança a partir dos primeiros princípios usando esta especificação, o público principal para esta especificação são as partes que já possuem uma implementação certificada do [Financial-grade API Security Profile 1.0 - Part 2: Advanced][FAPI-1-Advanced] e deseja obter a certificação para o programa Brasil Open Banking.

# Convenções Notacionais

As palavras-chave "deve", "não deve",
"deveria", "não deveria", "pode" e
"pode" neste documento deve ser interpretado conforme descrito em
[ISO Directive Part 2][ISODIR2].
Estas palavras-chave não são usadas como termos de dicionário, de modo que
qualquer ocorrência deles deve ser interpretada como palavras-chave
e não devem ser interpretados com seus significados de linguagem natural.

{mainmatter}

# Escopo

Este documento especifica o método de

* aplicativos para obter os tokens OAuth de maneira adequadamente segura para acesso de maior risco aos dados de uma maneira que atenda aos requisitos do [Open Banking Brasil] (https://www.in.gov.br/en/web/dou/-/resolucao-conjunta-n-1-de-4-de-maio-de-2020-255165055);
* aplicativos para usar o OpenID Connect para identificar o cliente; e
* aplicativos para usar o OpenID Connect para afirmar a identidade do cliente;

Este documento é aplicável a todos os participantes do Open Banking no Brasil.

# Referências normativas

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

# Termos e definições

Para efeitos deste documento, os termos definidos em [RFC6749], [RFC6750], [RFC7636], [OpenID Connect Core][OIDC] e ISO29100 se aplicam.

# Símbolos e termos abreviados

** API ** - Application Programming Interface (Interface de programação de aplicativo)

** EIOBB ** - Estrutura Inicial do Open Banking Brasil

** CSRF ** - Cross Site Request Forgery

** DCR ** - Registro de cliente dinâmico

** FAPI ** - Financial-grade API

** HTTP ** - Protocolo de transferência de hipertexto

** OIDF ** - OpenID Foundation

** REST ** - Representational State Transfer (Transferência de Estado Representacional)

** TLS ** - Transport Layer Security (Segurança da Camada de Transporte)

# Perfil de Segurança do Open Banking Brasil

## Introdução

O perfil de segurança do Open Banking Brasil especifica requisitos adicionais de segurança e identidade para recursos API de alto risco protegidos pelo OAuth 2.0 Authorization Framework que consiste em [RFC6749], [RFC6750], [RFC7636], [FAPI-1-Baseline], [FAPI- 1-Advanced] e outras especificações.

Este perfil descreve as provisões de segurança e recursos para um servidor e cliente que são necessárias para o Programa do Open Banking Brasil, definindo as medidas para mitigar ou resolver:

* ataques que abordam considerações de privacidade identificadas na cláusula 9.1 de [FAPI1 Avançado]
* o requisito de apoiar o acesso refinado a recursos para fins de minimização de dados
* o requisito de transmitir a Solicitação de Contexto de Autenticação que foi realizada por um Provedor OpenID a um Cliente para permitir um gerenciamento apropriado do cliente do risco de conduta do cliente.
* o requisito para os clientes afirmarem um relacionamento com o cliente pré-existente, afirmando uma reivindicação de identidade do cliente como parte do fluxo de autorização.

## Disposições de segurança do Open Banking Brasil

### Introdução

O Open Banking Brasil tem um requisito para endereçar considerações de privacidade que foram identificadas, mas não abordadas na especificação final [FAPI-1-Advanced], sem impor requisitos adicionais aos Servidores de Autorização que estão sendo propostos em [FAPI-2-Baseline].
Os participantes desse ecossistema precisam que os clientes solicitem a um provedor openid para confirmar os valores das declarações de identidade como parte de uma solicitação de autorização usando o mecanismo definido na cláusula 5.5.1 de [OIDC].
O uso do parâmetro de declarações para solicitar valores de declarações explícitos requer que os clientes garantam que criptografam o objeto de solicitação para evitar vazamento de informações. Este risco é identificado na cláusula 7.4.1 do [FAPI-1-Advanced].

Além disso, este perfil descreve o escopo específico, requisitos de gerenciamento de ações e clientes necessários para dar suporte ao ecossistema Open Banking Brasil mais amplo.

Como um perfil do OAuth 2.0 Authorization Framework, este documento exige o seguinte para o perfil de segurança do Open Banking Brasil.

### Servidor de Autorização

O Servidor de Autorização deve suportar as disposições especificadas na cláusula 5.2.2 de [Financial-grade API Security Profile 1.0 - Parte 2: Advanced] [FAPI-1-Advanced]. Além disso, ele deve:

1. deve suportar um objeto de solicitação JWE assinado e criptografado passado por valor ou deve exigir solicitações de autorização por push (pushed authorization requests) [PAR];
2. deve distribuir metadados de descoberta (como o endpoint de autorização) por meio do documento de metadados, conforme especificado em [OIDD] e [RFC8414]
3. deve suportar o parâmetro de reivindicações conforme definido na cláusula 5.5 [OpenID Connect Core] [OIDC]
4. deve apoiar a reivindicação padrão da OIDC "cpf", conforme definido na cláusula 5.2.2.2 deste documento
5. deve apoiar a reivindicação padrão da OIDC "cnpj", conforme definido na cláusula 5.2.2.3 deste documento
7. deve suportar o acr "urn: brasil: openbanking: loa2" conforme definido na cláusula 5.2.2.4 deste documento
8. deve suportar o acr "urn: brasil: openbanking: loa3" conforme definido na cláusula 5.2.2.4 deste documento
8. deve implementar o endpoint de informações do usuário (user info) conforme definido na cláusula 5.3 [OpenID Connect Core] [OIDC]
9. deve suportar o escopo do recurso OAuth 2.0 parametrizado _consentimento_, conforme definido na cláusula 6.3.1 [OIDF FAPI WG Lodging Intent Pattern][LIWP]
10. deve suportar [Financial-grade API: Client Initiated Backchannel Authentication Profile][FAPI-CIBA]
11. deve suportar [Financial-grade API: Client Initiated Backchannel Authentication Profile][FAPI-CIBA] se o escopo incluir _pagamentos_
12. pode exigir a presença de uma declaração de valor cpf preenchida se o escopo incluir escopo de recurso dinâmico _consentimento_
13. deve suportar tokens de atualização

#### Token de ID como assinatura separada

O Servidor de Autorização deve suportar as disposições especificadas na cláusula 5.2.2.1 de [Financial-grade API Security Profile 1.0 - Parte 2: Advanced] [FAPI-1-Advanced]

Além disso, se o valor `response_type`` code id_token` for usado, o servidor de autorização:

1. não deve retornar Informação de Identificação Pessoal (PII) confidenciais no token de ID na resposta de autorização, mas se for necessário,
então ele deve criptografar o token de ID.

#### Solicitando a reivindicação "cpf"

Este perfil define "cpf" como uma nova reivindicação padrão de acordo com cláusula 5.1 [OIDC]
  
The **CPF** number (Cadastro de Pessoas Físicas, [sepeˈɛfi]; Portuguese for "Natural Persons Register")
 is the **Brazilian** individual taxpayer registry identification. This number is attributed by
 the **Brazilian** Federal Revenue to Brazilians and resident aliens who, directly or indirectly,
  pay taxes in **Brazil**.

O número do ** CPF ** (Cadastro de Pessoas Físicas, [sepeˈɛfi]; português para "Registro de Pessoas Físicas") é o cadastro de pessoa física ** brasileiro **. Este número é atribuído pela Receita Federal ** Brasileira ** para brasileiros e estrangeiros residentes que, direta ou indiretamente, pagar impostos no ** Brasil **.

If the cpf Claim is requested as an Essential Claim for the ID Token or UserInfo response with a
values parameter requesting a specific cpf value, the Authorization Server MUST return an cpf Claim Value
that matches the requested value. If this is an Essential Claim and the requirement cannot be met,
 then the Authorization Server MUST treat that outcome as a failed authentication attempt.

No modelo de identidade do Brasil Open Banking, o cpf é uma string composta por números 11 caracteres de comprimento e podem começar com 0.
Se a reivindicação cpf for solicitada como uma reivindicação essencial para o token de ID ou resposta UserInfo com um parâmetros de valores solicitando um valor cpf específico, o Servidor de Autorização DEVE retornar um valor de reivindicação cpf que corresponde ao valor solicitado. Se esta for uma reivindicação essencial e o requisito não puder ser atendido,
  então, o Authorization Server DEVE tratar esse resultado como uma tentativa de autenticação falhada.

Nome: cpf, Tipo: String, Regex: '^\d{11}$'

#### Requesting the "cnpj" Claim

This profile defines "cnpj" as a new standard claim as per
 clause 5.1[OIDC]

**CNPJ**, short for Cadastro Nacional de Pessoas Jurídicas, is an identification number
 of **Brazilian** companies issued by the **Brazilian** Ministry of Revenue, **in**
 Portuguese "Secretaria da Receita Federal" or "Ministério da Fazenda". In the Brasil Open Banking identity model,
 individuals can associated with 0 or more CNPJs. A CNPJ is a string consisting of numbers that is 14 digits long and may start with a 0,
 the first eight digits identify the company, the four digits after the slash identify the branch or
  subsidiary ("0001" defaults to the headquarters), and the last two are checksum digits.
   For this profile, the cnpj claim must be requested and supplied as the 14 digit number.

If the cnpj Claim is requested as an Essential Claim for the ID Token or UserInfo response with a
values parameter requesting a specific cnpj value, the Authorization Server MUST return an cnpj
Claim Value that contains a **set** of CNPJs one of which must match the requested value. If this
 is an Essential Claim and the requirement cannot be met, then the Authorization Server MUST treat
 that outcome as a failed authentication attempt.

Name: cnpj, Type: Array of Strings, Array Element Regex: '^\d{14}$'

#### Requesting the "urn:brasil:openbanking:loa2" or "urn:brasil:openbanking:loa3" Authentication Context Request

This profile defines "urn:brasil:openbanking:loa2" and "urn:brasil:openbanking:loa3" as
 new Authentication Context Request classes.

### Confidential client

A confidential client shall support the provisions specified in clause 5.2.3 of
[Financial-grade API Security Profile 1.0 - Part 1: Advanced][FAPI-1-Advanced],

In addition, the confidential client

1. shall support _encrypted_ request objects
2. shall support pushed authorisation requests [PAR]
3. shall use _encrypted_ request objects if not using [PAR]
4. shall support parameterized OAuth 2.0 resource scope _consent_ as defined in clause 6.3.1 [OIDF FAPI WG Lodging Intent Pattern][LIWP]
5. shall support refresh tokens
6. shall include a populated cpf value claim if scope includes dynamic resource scope _consent_

# Security considerations

Participants shall support all security considerations specified in clause 8
 [Financial-grade API Security Profile 1.0 - Part 1: Advanced][FAPI-1-Advanced] and the [Brazilian Central Bank Open Banking Security Manual](https://www.bcb.gov.br/estabilidadefinanceira/exibenormativo?tipo=Instru%C3%A7%C3%A3o%20Normativa%20BCB&numero=99).
 The Brazilian ICP issues RSA x509 certificates only therefor section removes for simplicity support for EC algorithms
 and requires that only IANA recommended encryption algorithms be used.

## Algorithm considerations

For JWS, both clients and Authorization Servers

1. shall use PS256 algorithm;

### Encryption algorithm considerations

For JWE, both clients and Authorization Servers

1. shall use RSA-OAEP with A256GCM

### Secure Use of Transport Layer Security considerations

For TLS, Authorization Server endpoints and Resource Server endpoints used directly by the Client

1. shall support `TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256`
2. shall support `TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384`

# Data Sharing Considerations

## Authorisation Mechanism

### Introduction

Existing mechanisms for appropriately managing access to resources defined in [RFC6749] are insufficient to meet the requirements for a modern data sharing ecosystem. Leveraging static scope strings does not provide consumers control of sufficient granularity to share with third parties. Open Banking Brasil have elected to implement a [Consent API](https://openbanking-brasil.github.io/areadesenvolvedor/swagger/swagger_consents_apis.yaml) as a OAuth 2.0 protected resource that can be used to manage fine grain access to resources. The reference to the Consent Resource will be conveyed as part of an OAuth 2.0 dynamic resource scope.

### Dynamic Consent Scope Definition

This profile defines OAuth 2.0 dynamic scope "consent" as follows:

* string 'consent'; and
* delimiter of a colon ":"; and
* Consent API REST Resource Id as returned by a successful creation of [Open Banking Consent Resource](https://openbanking-brasil.github.io/areadesenvolvedor/#fase-2-apis-do-open-banking-brasil-api-consentimento);

In addition:

* the Consent Resource Id must include  url safe characters only;
* the Consent Resource Id must be namespaced;
* the Consent Resource Id must have the properties of a nonce;

### Dynamic Consent Scope Example

consent:urn:bancoex:C1DD33123

## Authorisation Life Cycle

### Introduction

The Consent Resource has a life cycle that is managed seperately and distinctly from the OAuth 2.0 Authorisation Framework. The state transitions and expected behaviours and error conditions expected of REST Resouces protected with this profile are defined in the functional API specifications published by Open Banking Brasil.

### Authorization server

In addition to the requirements outlined in Open Banking Brasil security provisions the Authorization Server

1. shall revoke refresh tokens and where practicable access tokens when the linked Consent Resource is deleted;
2. shall ensure Access Tokens are issued with sufficient scope necessary for access to data specified in the Permissions element of a linked Consent Resource object;
3. shall not reject an authorisation request requesting more scope than is necessary to access data specified in the Permissions element of a linked Consent Resource object;
4. may reduce requested scope to a level sufficient to enable access to data resources specified in the Permissions element of a linked Consent Resource object;

### Confidential Client

In addition to the requirements outlined in Open Banking Brasil security provisions the Confidential Client

1. shall revoke where possible and cease usage of refresh and access tokens that are bound to a Consent Resource that has been deleted;
1. shall delete Consent Resource that are expired;

# Regulatory Considerations

## Requirement on Client to present cpf claim to AS {#Reg}

[Joint Resolution No 1, Art. 10, paragraph VI](https://www.in.gov.br/en/web/dou/-/resolucao-conjunta-n-1-de-4-de-maio-de-2020-255165055)
The interpretation of the Compliance team requires the TPPs to identify the customer before requesting access to resources from a bank. The mechanism adopted is to require the TPP to include a populated customer cpf claim as part of a request object when the request to the bank includes a request for access to a account or payment resources which is
 conveyed by a dynamic scope of 'consent:{consentId}'.

This assertion is considered to be sufficient to meet the requirements of the legislation but does result in the requirement for customers to provide to third parties this information ahead of requesting an open banking flow.
 Banks that wish to prevent poor customer experiences or help mitigate the need for customers to key in sensitive details into third party UIs can provide the cpf and other attributes as part of a consent journey
 provided that they do so without also accepting a request for data sharing at the same time.

The sharing of customer atttributes without a corresponding open banking resource sharing request is out of scope of the regulation which means that banks are not obliged to offer this service but there is no technical barrier with them doing.
The security profile has been specifically drafted to enable and encourage banks to facilitate this two step process which significantly improves the new customer experience for tpps and prevents the bad practice of encouraging consumers to manually share sentitive personal information into websites. Removing the need for this activity is one of the primary security goals of Open Banking and the OpenID Foundation Financial Grade Working Group on whose standards this profile is based.

# Acknowledgements

With thanks to all who have set the foundations for secure and safe data sharing through the formation of the OpenID Foundation FAPI Working Group, the Open Banking Brasil GT Security and to the pioneers who will stand on their shoulders.

The following people contributed to this document:

* Ralph Bragg (Raidiam)
* Joseph Heenan (Authlete)
* Alexandre Siqueira (Mercado Pago)
* Marcos Rodrigues (Itaú)

{backmatter}

# Notices

Copyright (c) 2021 Open Banking Brasil Initial Structure.

The Open Banking Brasil Initial Structure (OBBIS) grants to any Contributor, developer, implementer, or other interested party a non-exclusive, royalty-free, worldwide copyright license to reproduce, prepare derivative works from, distribute, perform and display, this Implementers Draft or Final Specification solely for the purposes of (i) developing specifications, and (ii) implementing Implementers Drafts and Final Specifications based on such documents, provided that attribution be made to the OBBIS as the source of the material, but that such attribution does not indicate an endorsement by the OBBIS.

The technology described in this specification was made available from contributions from various sources, including members of the OpenID Foundation, the Open Banking Brasil GT Security Working Group and others. Although the Open Banking Brasil Initial Structure has taken steps to help ensure that the technology is available for distribution, it takes no position regarding the validity or scope of any intellectual property or other rights that might be claimed to pertain to the implementation or use of the technology described in this specification or the extent to which any license under such rights might or might not be available; neither does it represent that it has made any independent effort to identify any such rights. The Open Banking Brasil Initial Structure and the contributors to this specification make no (and hereby expressly disclaim any) warranties (express, implied, or otherwise), including implied warranties of merchantability, non-infringement, fitness for a particular purpose, or title, related to this specification, and the entire risk as to implementing this specification is assumed by the implementer. The Open Banking Brasil Intellectual Property Rights policy requires contributors to offer a patent promise not to assert certain patent claims against other contributors and against implementers. The Open Banking Brasil Initial Structure invites any interested party to bring to its attention any copyrights, patents, patent applications, or other proprietary rights that may cover technology that may be required to practice this specification.
