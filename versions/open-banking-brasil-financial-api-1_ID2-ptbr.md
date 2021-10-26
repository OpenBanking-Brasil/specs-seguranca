%%%

    #
    # Open Banking Brasil Financial-grade API Security Profile 1.0 Implementers Draft 2
    # (open-banking-brasil-financial-api-1_ID2)
    #
    #

    title = "Open Banking Brasil Financial-grade API Security Profile 1.0 Implementers Draft 2"
    abbrev = "OBB-FAPI-1-ID2"
    ipr = "none"
    workgroup = "Open Banking Brasil GT Security"
    keyword = ["FAPI", "Open Banking Brasil GT Security"]

    [seriesInfo]
    name = "Internet-Draft"
    status = "standard"
    value = "open-banking-brasil-financial-api-1_ID2-ptbr"

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

The normative version in [English](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-financial-api-1_ID2.html)

A Estrutura Inicial do Open Banking Brasil (EIOBB) é responsável por criar padrões e especificações necessárias para atender aos requisitos e obrigações da Legislação do Open Banking do Brasil, conforme originalmente delineado pelo [Banco Central do Brasil](https://www.bcb.gov.br/content/config/Documents/BCB_Open_Banking_Communique-April-2019.pdf). É possível que alguns dos elementos deste documento estejam sujeitos a direitos autorais ou patenteados. O EIOBB não se responsabiliza pela identificação de qualquer ou todos esses direitos.

O Financial-grade API 1.0 do Open Banking Brasil consiste nas seguintes partes:

* Open Banking Brasil Financial-grade API Security Profile 1.0
* [Open Banking Brasil Dynamic Client Registration Profile 1.0][OBB-FAPI-DCR]

Estas partes são destinados a serem usados com [RFC6749], [RFC6750], [RFC7636], [OIDC], [FAPI-1-Baseline] e [FAPI-1-Advanced]

.# Introdução  {#Introduction}

A Financial-grade API do Open Banking Brasil é um perfil OAuth altamente seguro que visa fornecer diretrizes de implementação específicas para segurança e interoperabilidade que podem ser aplicadas a APIs na área de Open Banking do Brasil que requerem um nível de privacidade superior ao fornecido pelo padrão [Financial-grade API Security Profile 1.0 - Part 2: Advanced][FAPI-1-Advanced]. Entre outras melhorias, esta especificação aborda considerações de privacidade identificadas em [FAPI-1-Advanced] que são relevantes nas especificações do Open Banking Brasil, mas não foram, até agora, exigidas por outras jurisdições.

Embora seja possível codificar um provedor de OpenID e parte de confiança a partir dos primeiros princípios usando esta especificação, o público principal para esta especificação são as partes que já possuem uma implementação certificada do [Financial-grade API Security Profile 1.0 - Part 2: Advanced][FAPI-1-Advanced] e deseja obter a certificação para o programa Brasil Open Banking.

.# Convenções Notacionais  {#Notational}

As palavras-chave "*deve*" (shall), "*não deve*" (shall not), "*deveria*" (should), "*não deveria*" (should not) e "*pode*" (may) presentes nesse documento devem ser interpretadas conforme as diretrizes descritas em [ISO Directive Part 2][ISODIR2] observando  seguinte equivalência:

* "deve" => equivalente ao termo "shall" e expressa um requerimento definido no documento (nas traduções é similar ao termo "must", que pode denotar um requerimento externo ao documento);
* "não deve" => equivalente ao termo "shall not" e também expressa um requerimento definido no documento;
* "deveria" e "não deveria"=> equivalente ao termo "should" e "should not" e expressa uma recomendação
* "pode" => equivalente ao termo "may" indica uma permissão

Estas palavras-chave não são usadas como termos de dicionário, de modo que qualquer ocorrência deles deve ser interpretada como palavras-chave e não devem ser interpretados com seus significados de linguagem natural.

{mainmatter}

# Escopo  {#Scope}

Este documento especifica o método para os aplicativos

* obterem de maneira segura os tokens OAuth necessários para acesso a dados críticos de acordo com os requisitos do [Open Banking Brasil](https://www.in.gov.br/en/web/dou/-/resolucao-conjunta-n-1-de-4-de-maio-de-2020-255165055);
* utilizarem o OpenID Connect para identificação do usuário do Open Banking; e
* utilizarem o OpenID Connect para afirmar a identidade do cliente.

Este documento é aplicável a todos os participantes do Open Banking no Brasil.

# Referências normativas  {#Normative}

Os seguintes documentos referenciados são indispensáveis para a adoção das especificações deste documento. Para referências datadas, apenas a edição citada se aplica. Para referências não datadas, deve-se aplicar a última edição do documento referenciado (incluindo quaisquer emendas).

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

[RFC7515] - JSON Web Signature (JWS)
[RFC7515]:<https://tools.ietf.org/html/rfc7515

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

[LIWP] - OIDF FAPI WG Lodging Intent Working Paper
[LIWP]: <https://bitbucket.org/openid/fapi/src/master/Financial_API_Lodging_Intent.md

[OBB-FAPI-DCR] - Open Banking Brasil Financial-grade API Dynamic Client Registration Profile 1.0
[OBB-FAPI-DCR]: <https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-dynamic-client-registration-1_ID1.html

[RFC4648] - The Base16, Base32, and Base64 Data Encodings
[RFC4648]: <https://tools.ietf.org/html/rfc4648

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

**MFA** - Multi-Factor Authentication (Autenticação por Múltiplos Fatores)

# Profile de Segurança para o Open Banking Brasil {#securityprofile}

## Introdução  {#secintroduction}

O perfil de segurança do Open Banking Brasil especifica requisitos adicionais de segurança e de  identificação para o acesso a API´s com recursos críticos protegidas pelo OAuth 2.0 Authorization Framework, que consiste em [RFC6749], [RFC6750], [RFC7636], [FAPI-1-Baseline], [FAPI-1-Advanced] e outras especificações.

Este perfil descreve as capacidades e os recursos de segurança que devem ser oferecidos por servidores e clientes que são necessários para o Programa do Open Banking Brasil, definindo as medidas para mitigar ou endereçar:

* ataques que abordam considerações de privacidade identificadas na cláusula 9.1 de [FAPI-1 Advanced].
* o requisito de concessão de acesso granular a recursos, com vistas à minimização de dados;
* o requisito de informar sobre o contexto da autenticação do usuário (claim Authentication Context Request - acr) que foi realizada por um Provedor OpenID, com vistas a favorecer o adequado gerenciamento do risco decorrente do acesso do usuário;
* o requisito para que os clientes de API declarem um relacionamento prévio com o usuário, afirmando em uma `claim` de identificação do usuário como parte do fluxo de autorização.

## Disposições de segurança do Open Banking Brasil  {#authserver}

### Introdução  {#authintrod}

O Open Banking Brasil tem um requisito para endereçar considerações de privacidade que foram identificadas, mas não abordadas na especificação final [FAPI-1-Advanced], sem impor requisitos adicionais aos Servidores de Autorização que estão sendo propostos em [FAPI-2-Baseline].

Os participantes desse ecossistema precisam que os clientes de API solicitem a um provedor openid a confirmação dos valores das `claims` de identificação do usuário como parte de uma solicitação de autorização usando o mecanismo definido na cláusula 5.5.1 de [OIDC].

O uso do parâmetro `claims` para solicitar a validação de valores de identificação explícitos requer que os clientes de API protejam com criptografia o Request Object para evitar vazamento de informações. Este risco é identificado na cláusula 7.4.1 do [FAPI-1-Baseline].

Além disso, este perfil descreve o escopo específico, valores de `acr` e requisitos de gerenciamento de clientes necessários para dar suporte ao ecossistema Open Banking Brasil mais amplo.

Como um perfil do OAuth 2.0 Authorization Framework, este documento exige o seguinte para o perfil de segurança do Open Banking Brasil.

### Servidor de Autorização  {#authprovisions}

O Servidor de Autorização **deve** suportar as disposições especificadas na cláusula 5.2.2 de [Financial-grade API Security Profile 1.0 - Parte 2: Advanced] [FAPI-1-Advanced].

Além disso, ele deve:

1. deve suportar Request Objects JWE assinados e criptografados passados por valor ou deve exigir requisições do tipo "pushed authorization requests" [PAR]
2. deve publicar metadados de descoberta (incluindo a do endpoint de autorização) por meio do documento de metadado especificado em [OIDD] e [RFC8414] (".well-known")
3. deve suportar os parâmetros `claims` como definido no item 5.5 do [OpenID Connect Core][OIDC]
4. deve suportar o atributo `claim` padrão oidc "cpf" conforme definido no item 5.2.2.2 deste documento
5. deve suportar o atributo `claim` padrão oidc "cnpj" conforme definido no item 5.2.2.3 deste documento, se a instituição for detentora de conta para pessoas jurídicas
6. deve suportar o atributo `acr` "urn:brasil:openbanking:loa2" como definido no item 5.2.2.4 deste documento
7. deveria suportar o atributo `acr` "urn:brasil:openbanking:loa3" como definido no item 5.2.2.4 deste documento
8. deve implementar o endpoint "userinfo" como definido no item 5.3 do [OpenID Connect Core][OIDC]
9. deve suportar o escopo parametrizável ("parameterized OAuth 2.0 resource scope") _consent_ como definido no item 6.3.1 de [OIDF FAPI WG Lodging Intent Pattern][LIWP]
10. pode suportar [Financial-grade API: Client Initiated Backchannel Authentication Profile][FAPI-CIBA]
11. deve suportar [Financial-grade API: Client Initiated Backchannel Authentication Profile][FAPI-CIBA] se suportar o scope _payments_
12. deve suportar `refresh tokens`
13. deve emitir `access tokens` com o tempo de expiração entre 300 (mínimo) e 900 (máximo) segundos.

#### Token de ID como assinatura separada  {#detached}

O Servidor de Autorização *deve* suportar as disposições especificadas na cláusula 5.2.2.1 de [Financial-grade API Security Profile 1.0 - Parte 2: Advanced] [FAPI-1-Advanced]

Além disso, se o valor `response_type` `code id_token` for usado, o servidor de autorização:

1. **não deveria** retornar Informação de Identificação Pessoal (PII) confidenciais no token de ID na resposta de autorização, mas se for necessário, então ele **deve** criptografar o token de ID.

#### Solicitando uma "claim" **cpf**  {#cpf}

Este perfil define "cpf" como uma nova `claim` padrão de acordo com cláusula 5.1 [OIDC]

O número do **CPF** (Cadastro de Pessoas Físicas, [sepeˈɛfi]; português para "Registro de Pessoas Físicas") é o cadastro de pessoa física **brasileira**. Este número é atribuído pela Receita Federal **Brasileira** para brasileiros e estrangeiros residentes que, direta ou indiretamente, pagar impostos no **Brasil**.

No modelo de identidade do Open Banking Brasil, o cpf é uma string composta por números 11 caracteres de comprimento e podem começar com 0.

Se a Claim **cpf** for solicitada como essencial para constar no ID token ou na resposta ao endpoint de UserInfo e na solicitação constar no parâmetro `value` com determinado **CPF** exigido, o Authorization Server **DEVE** retornar no atributo **cpf** o valor que corresponda ao da solicitação.

Se a Claim **cpf** for solicitada como essencial para constar no ID Token ou na resposta no endpoint de UserInfo, o Authorization Server deve retornar no atributo **cpf** o valor com o **CPF** do usuário autenticado.

Se a Claim **cpf** indicada como essencial não puder ser preenchida ou não for compatível com o requisito, o Authorization Server deve tratar a solicitação como uma tentativa de autenticação com falha.

Nome: cpf, Tipo: String, Regex: '^\d{11}$'

#### Solicitando a "claim" **cnpj**  {#cnpj}

Este perfil define "cnpj" como uma nova reivindicação padrão de acordo com cláusula 5.1 [OIDC]

**CNPJ**, abreviação de Cadastro Nacional de Pessoas Jurídicas, é um número de identificação de empresas **brasileiras** emitidas pelo Ministério da Fazenda **brasileira**, **na** "Secretaria da Receita Federal" ou "Ministério da Fazenda" do Brasil. No modelo de identidade do Open Banking Brasil, pessoas físicas podem se associar a 0 ou mais CNPJs. Um CNPJ é uma string que consiste em números de 14 dígitos e pode começar com 0, os primeiros oito dígitos identificam a empresa, os quatro dígitos após a barra identificam a filial ou subsidiária ("0001" padrão para a sede), e os dois últimos são dígitos de soma de verificação. Para este perfil, o pedido de cnpj deve ser solicitado e fornecido como o número de 14 dígitos.

Se a Claim **cnpj** for solicitada como essencial para constar no ID Token ou na resposta ao endpoint UserInfo e na solicitação constar, no parâmetro `value`, determinado **CNPJ** exigido, o Authorization Server **DEVE** retornar no atributo **cnpj** um **conjunto** de **CNPJs** relacionado com o usuário, um dos quais deve incluir valor que corresponda ao da solicitação.

Se a Claim **cnpj** for solicitada como essencial para constar no ID Token ou na resposta ao endpoint UserInfo, o Authorization Server deve incluir no ID Token ou na resposta ao endpoint UserInfo um **conjunto** que inclua um elemento com o número do **CNPJ** relacionado à conta utilizada na autenticação do usuário.

Se a Claim **cnpj** indicada como essencial não puder ser preenchida ou validada, o Authorization Server deve tratar a solicitação como uma tentativa de autenticação com falha.

Nome: cnpj, Tipo: Array of Strings, Array Element Regex: '^\d{14}$'

#### Solicitando o "urn:brasil:openbanking:loa2" ou "urn:brasil:openbanking:loa3" Solicitação de contexto de autenticação  {#loa}

* **LoA2**: mecanismo de autenticação com a adoção de um único fator
* **LoA3**: mecanismo de autenticação com múltiplos fatores de autenticação

A seguinte regra deve ser adotada para o mecanismo de autenticação:
* **Para controle de acesso às API´s definidas na FASE 2 (leitura de dados)**: os `Authorization Servers` das instituições transmissoras de dados devem condicionar a autenticação do usuário proprietário do dado, no mínimo, a adoção de método compatível com `LoA2`. A adoção de mecanismo de autenticação mais rigoroso (`LoA3`) fica a critério da instituição transmissora de acordo com sua avaliação de riscos.
* **Para acesso às API´s das fases subsequentes (em especial pagamento)**: o acesso deve ser condicionado à método de autenticação compatível com `LoA3` ou superior.

**Esclarecimentos adicionais sobre fatores de autenticação**

São fatores de autenticação:

* Aquilo que **você conhece**, como uma senha ou frase secreta
* Aquilo que **você tem**, como um token, smartcard ou dispositivo
* Aquilo que **"você é"**, ou seja, autenticação condicionada a apresentação de uma característica física exclusivamente sua, como a validação por biometria

Para realizar autenticação por múltiplos fatores (MFA) é necessário que o usuário apresente, ao menos, dois diferentes  fatores dos listados acima. Um mesmo fator usado mais de uma vez - por exemplo, a apresentação de suas senhas que ele conhece - não pode ser aceito como MFA.

### Cliente confidencial  {#client}

Um cliente confidencial deve apoiar as disposições especificadas na cláusula 5.2.3 de
[Financial-grade API Security Profile 1.0 - Part 2: Advanced][FAPI-1-Advanced],

Além disso, o cliente confidencial

1. deve suportar objetos de solicitação _encrypted_
2. deve suportar solicitações de autorização push (pushed authorization requests) [PAR]
3. deve usar objetos de solicitação _encrypted_ se não usar [PAR]
4. deve suportar o escopo de recurso OAuth 2.0 parametrizado _consent_ conforme definido na cláusula 6.3.1 [OIDF FAPI WG Lodging Intent Pattern][LIWP]
5. deve suportar `refresh tokens`

# Considerações de segurança  {#authserver}

Os participantes devem apoiar todas as considerações de segurança especificadas na cláusula 8 [Financial-grade API Security Profile 1.0 - Parte 2: Advanced] [FAPI-1-Advanced] e o [Manual de Segurança de Banco Central do Brasil] (https://www.bcb.gov.br/estabilidadefinanceira/exibenormativo?tipo=Instru%C3%A7%C3%A3o%20Normativa%20BCB&numero=134). O ICP brasileiro emite certificados RSA x509 somente, portanto, para simplificar, a seção remove o suporte para algoritmos EC e exige que apenas algoritmos de criptografia recomendados pela IANA sejam usados.

## Considerações sobre assinatura do conteúdo de mensagens (JWS) {#jws}

1. Para garantir a integridade e o não-repúdio das informações tramitadas em **API´s sensíveis e que indicam essa necessidade na sua documentação**, deve ser adotado a estrutura no padrão JWS definida na [RFC7515] e que inclui:
   * Cabeçalho (_JSON Object Signing and Encryption – JOSE Header_), onde se define o algoritmo utilizado e inclui informações sobre a chave pública ou certificado que podem ser utilizadas para validar a assinatura;
   * Payload (_JWS Payload_): conteúdo propriamente dito e detalhado na especificação da API;
   * Assinatura digital (_JWS Signature_): assinatura digital, realizada conforme parâmetros do cabeçalho.
2. Cada elemento acima deve ser codificado utilizando o padrão Base64url [RFC4648](https://tools.ietf.org/html/rfc4648#section-5) e, feito isso, os elementos devem ser concatenados com “.” (método JWS Compact Serialization, conforme definido na [RFC7515]).

3. O payload das mensagens (requisição _JWT_ e resposta _JWT_) assinadas devem incluir as seguintes `claims` presentes na [RFC7519] (JWT):
   * **aud** (na requisição _JWT_): o Provedor do Recurso (p. ex. a instituição detentora da conta) deverá validar se o valor do campo **aud** coincide com o endpoint sendo acionado;
   * **aud** (na resposta _JWT_): o cliente da API (p. e. instituição iniciadora) deverá validar se o valor do campo **aud** coincide com o seu próprio `organisationId` listado no diretório;
   * **iss** (na requisição _JWT_ e na resposta _JWT_): o receptor da mensagem deverá validar se o valor do campo **iss** coincide com o `organisationId` do emissor;
   * **jti** (na requisição _JWT_ e na resposta _JWT_): o valor do campo **jti** deverá ser preenchido com o UUID definido pela instituição de acordo com a [RFC4122] usando o versão 4;
   * **iat** (na requisição _JWT_ e na resposta _JWT_): o valor do campo **iat** deverá ser preenchido com horário da geração da mensagem e de acordo com o padrão  estabelecido na [RFC7519](https://datatracker.ietf.org/doc/html/rfc7519#section-2) para o formato _NumericDate_.

4. O content-type HTTP das requisições e respostas com mensagens JWS deve ser definido como: "application/jwt".

5. No cabeçalho JOSE deve constar os seguintes atributos:
   * **alg** - deve ser preenchido com o valor `PS256`";
   * **kid** - deve ser obrigatoriamente preenchido com o valor do identificador da chave utilizado para a assinatura;
   * **typ** - deve ser preenchido com o valor `JWT`.

* Em caso de erro na validação da assinatura pelo `Provedor do Recurso` a API deve retornar mensagem de erro HTTP com `status code` **400** e a resposta deve incluir na propriedade `code` do objeto de resposta de erro especificado na API (`ResponseError`) a indicação da falha com o conteúdo `BAD_SIGNATURE`.
* Erros na validação da mensagem recebida pela aplicação cliente (p. ex. iniciador de pagamento) devem ser registrados e o `Provedor do Recurso` (p. ex. instituição detentora de conta) deve ser notificado.

6. O receptor  deve validar a consistência da assinatura digital da mensagem JWS **exclusivamente com base nas informações obtidas do diretório**, ou seja, com base nas chaves publicadas no JWKS da instituição no diretório.

7. As assinaturas devem ser realizadas com uso do certificado digital de assinatura especificado no [Padrão de Certificados Open Banking Brasil](https://github.com/OpenBanking-Brasil/specs-seguranca/blob/main/open-banking-brasil-certificate-standards-1_ID1-ptbr.md#certificado-de-assinatura-certificadoassinatura).

### Considerações sobre algoritmos de assinatura {#alg}

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

Os mecanismos existentes para gerenciar adequadamente o acesso aos recursos definidos em [RFC6749] são insuficientes para atender aos requisitos de um ecossistema de compartilhamento de dados moderno. Aproveitar strings de escopo estático não fornece aos consumidores controle de granularidade suficiente para compartilhar com terceiros. O Open Banking Brasil optou por implementar uma [API de consentimento](https://openbanking-brasil.github.io/areadesenvolvedor/swagger/swagger_consents_apis.yaml) como um recurso protegido OAuth 2.0 que pode ser usado para gerenciar o acesso granular aos recursos. A referência ao recurso de consentimento será transmitida como parte de um escopo de recurso dinâmico OAuth 2.0.

### Definição de Escopo de Consentimento Dinâmico  {#consent}

Este perfil define o escopo dinâmico do OAuth 2.0 "consentimento" da seguinte maneira:

* string 'consent'; e
* delimitador de dois pontos ":"; e
* Consent API REST Resource Id retornado por uma criação bem-sucedida de [Open Banking Consent Resource](https://openbanking-brasil.github.io/areadesenvolvedor/#fase-2-apis-do-open-banking-brasil-api-consentimento);

Adicionalmente:

* Consent Resource Id deve incluir caracteres seguros para url;
* Consent Resource Id deve ser "namespaced";
* Consent Resource Id deve ter propriedades de um `nonce` [Nonce](https://openid.net/specs/openid-connect-core-1_0.html#NonceNotes);

### Dynamic Consent Scope Example  {#consentexample}

consent:urn:bancoex:C1DD33123

### Exemplo de escopo de consentimento dinâmico  {#consentid}

consent:urn:bancoex:C1DD33123

## Ciclo de vida da autorização  {#lifecycle}

### Introdução  {#lifecycleintro}

O recurso de consentimento tem um ciclo de vida gerenciado separada e distintamente da estrutura de autorização OAuth 2.0. As transições de estado e comportamentos esperados e condições de erro esperados dos Recursos REST protegidos com este perfil são definidos nas especificações funcionais da API publicadas pelo Open Banking Brasil.

### Servidor de autorização  {#lifecycleauth}

Além dos requisitos descritos nas disposições de segurança do Open Banking Brasil, o Servidor de Autorização

1. deve apenas emitir _refresh_tokens_ quando vinculados a um consentimento ativo e válido;
2. só deve compartilhar o acesso aos recursos quando apresentado _access_token_ vinculado a um consentimento ativo e válido;
3. deve revogar os _refresh tokens_ e, quando aplicável, os _access tokens_ quando o Consentimento (Consent Resource) relacionado for apagado;
4. deve garantir que os _access tokens_ são emitidos com os _scopes_ necessários para permitir acesso aos dados especificados em elemento _Permission_ do Consentimento (Consent Resource Object) relacionado;
5. não deve rejeitar pedido de autorização com _scopes_ além do necessário para permitir acesso a dados definidos em elemento _Permission_ do Consentimento (Consent Resource Object) relacionado;
6. pode reduzir o escopo solicitado para um nível que seja suficiente para permitir o acesso aos dados definidos em elemento _Permission_ do Consentimento (Consent Resource Object) relacionado;
7. deve manter registros sobre o histórico dos consentimento para permitir a adequada formação de trilhas de auditoria em conformidade com a regulação em vigor.

### Cliente confidencial  {#clientconfidential}

Além dos requisitos descritos nas disposições de segurança do Open Banking Brasil, o Cliente Confidencial

1. deve, sempre que possível, revogar e cessar o uso de _refresh_ e de _access tokens_  vinculados a um consentimento (Consent Resource Object) que foi excluído;
2. deve excluir consentimentos (Consent Resource Objects) que estão expirados;

# Reconhecimentos  {#acknowledgement}

Agradecemos a todos que estabeleceram as bases para o compartilhamento seguro e seguro de dados por meio da formação do Grupo de Trabalho FAPI da OpenID Foundation, o GT de Segurança do Open Banking Brasil e aos pioneiros que ficarão em seus ombros.

As seguintes pessoas contribuíram para este documento:

* Ralph Bragg (Raidiam)
* Joseph Heenan (Authlete)
* Alexandre Siqueira (Mercado Pago)
* Marcos Rodrigues (Itaú)
* Mário Ginglass (BNDES)

{backmatter}

# Avisos  {#disclaimer}

Copyright (c) 2021 Estrutura Inicial do Open Banking Brasil

A Estrutura Inicial do Open Banking Brasil (EIOBB) concede a qualquer Colaborador, desenvolvedor, implementador ou outra parte interessada uma licença de direitos autorais mundial não exclusiva, livre de royalties para reproduzir, preparar trabalhos derivados, distribuir, executar e exibir, estes Implementadores Rascunho ou Especificação Final exclusivamente para fins de (i) desenvolver especificações e (ii) implementar Rascunhos de Implementadores e Especificações Finais com base em tais documentos, desde que a atribuição seja feita ao EIOBB como a fonte do material, mas que tal atribuição o faça não indica endosso do EIOBB.

A tecnologia descrita nesta especificação foi disponibilizada a partir de contribuições de várias fontes, incluindo membros da OpenID Foundation, do Grupo de Trabalho de Segurança do Open Banking Brasil e outros. Embora a Estrutura Inicial do Open Banking Brasil tenha tomado medidas para ajudar a garantir que a tecnologia esteja disponível para distribuição, ela não toma posição quanto à validade ou escopo de qualquer propriedade intelectual ou outros direitos que possam ser reivindicados como pertencentes à implementação ou uso do tecnologia descrita nesta especificação ou até que ponto qualquer licença sob tais direitos pode ou não estar disponível; nem representa que fez qualquer esforço independente para identificar tais direitos. A Estrutura Inicial do Open Banking Brasil e os contribuidores desta especificação não oferecem (e por meio deste expressamente se isentam de quaisquer) garantias (expressas, implícitas ou de outra forma), incluindo garantias implícitas de comercialização, não violação, adequação a uma finalidade específica ou título, relacionados a esta especificação, e todo o risco quanto à implementação desta especificação é assumido pelo implementador. A política de Direitos de Propriedade Intelectual do Open Banking Brasil exige que os contribuidores ofereçam uma promessa de patente de não fazer valer certas reivindicações de patentes contra outros contribuidores e implementadores. A Estrutura Inicial do Open Banking Brasil convida qualquer parte interessada a trazer à sua atenção quaisquer direitos autorais, patentes, pedidos de patentes ou outros direitos de propriedade que possam abranger a tecnologia que possa ser necessária para praticar esta especificação.
