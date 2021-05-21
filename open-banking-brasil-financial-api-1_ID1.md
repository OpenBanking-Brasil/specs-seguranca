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

Além disso, se o valor `response_type` `code id_token` for usado, o servidor de autorização:

1. não deve retornar Informação de Identificação Pessoal (PII) confidenciais no token de ID na resposta de autorização, mas se for necessário,
então ele deve criptografar o token de ID.

#### Solicitando a reivindicação "cpf"

Este perfil define "cpf" como uma nova reivindicação padrão de acordo com cláusula 5.1 [OIDC]

O número do **CPF** (Cadastro de Pessoas Físicas, [sepeˈɛfi]; português para "Registro de Pessoas Físicas") é o cadastro de pessoa física **brasileira**. Este número é atribuído pela Receita Federal **Brasileira** para brasileiros e estrangeiros residentes que, direta ou indiretamente, pagar impostos no **Brasil**.

No modelo de identidade do Open Banking Brasil, o cpf é uma string composta por números 11 caracteres de comprimento e podem começar com 0.
Se a reivindicação cpf for solicitada como uma reivindicação essencial para o token de ID ou resposta UserInfo com um parâmetros de valores solicitando um valor cpf específico, o Servidor de Autorização DEVE retornar um valor de reivindicação cpf que corresponde ao valor solicitado. Se esta for uma reivindicação essencial e o requisito não puder ser atendido,
  então, o Authorization Server DEVE tratar esse resultado como uma tentativa de autenticação falhada.

Nome: cpf, Tipo: String, Regex: '^\d{11}$'

#### Solicitando a reivindicação "cnpj"

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

#### Solicitando o "urn: brasil: openbanking: loa2" ou "urn: brasil: openbanking: loa3" Solicitação de contexto de autenticação

Este perfil define "urn: brasil: openbanking: loa2" e "urn: brasil: openbanking: loa3" como novas classes de solicitação de contexto de autenticação.

### Cliente confidencial 

Um cliente confidencial deve apoiar as disposições especificadas na cláusula 5.2.3 de
[Financial-grade API Security Profile 1.0 - Part 1: Advanced][FAPI-1-Advanced],

Além disso, o cliente confidencial

1. deve suportar objetos de solicitação _encrypted_
2. deve suportar solicitações de autorização push (pushed authorization requests) [PAR]
3. deve usar objetos de solicitação _encrypted_ se não usar [PAR]
4. deve suportar o escopo de recurso OAuth 2.0 parametrizado _consentimento_ conforme definido na cláusula 6.3.1 [OIDF FAPI WG Lodging Intent Pattern][LIWP]
5. deve suportar tokens de atualização
6. deve incluir uma declaração de valor de cpf preenchida se o escopo incluir escopo de recurso dinâmico _consentimento_

# Considerações de segurança

Os participantes devem apoiar todas as considerações de segurança especificadas na cláusula 8 [Financial-grade API Security Profile 1.0 - Parte 1: Advanced] [FAPI-1-Advanced] e o [Manual de Segurança de Banco Central do Brasil] (https://www.bcb.gov.br/estabilidadefinanceira/exibenormativo?tipo=Instru%C3%A7%C3%A3o%20Normativa%20BCB&numero=99). O ICP brasileiro emite certificados RSA x509 somente, portanto, para simplificar, a seção remove o suporte para algoritmos EC e exige que apenas algoritmos de criptografia recomendados pela IANA sejam usados.
  
## Considerações de algoritmo

Para JWS, clientes e servidores de autorização

1. devem usar o algoritmo PS256;

### Considerações de algoritmo de criptografia

Para JWE, clientes e servidores de autorização

1. devem usar RSA-OAEP com A256GCM

### Considerações sobre o uso seguro do Transport Layer Security

Para TLS, endpoints do Servidor de Autenticação e endpoints do Servidor de Recursos usados diretamente pelo cliente:

1. devem suportar `TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256`
2. devem suportar `TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384`

# Considerações sobre compartilhamento de dados

## Mecanismo de Autorização

### Introdução

Os mecanismos existentes para gerenciar adequadamente o acesso aos recursos definidos em [RFC6749] são insuficientes para atender aos requisitos de um ecossistema de compartilhamento de dados moderno. Aproveitar strings de escopo estático não fornece aos consumidores controle de granularidade suficiente para compartilhar com terceiros. O Open Banking Brasil optou por implementar uma [API de consentimento] (https://openbanking-brasil.github.io/areadesenvolvedor/swagger/swagger_consents_apis.yaml) como um recurso protegido OAuth 2.0 que pode ser usado para gerenciar o acesso granular aos recursos. A referência ao recurso de consentimento será transmitida como parte de um escopo de recurso dinâmico OAuth 2.0.

### Definição de Escopo de Consentimento Dinâmico

Este perfil define o escopo dinâmico do OAuth 2.0 "consentimento" da seguinte maneira:

* string 'consentimento'; e
* delimitador de dois pontos ":"; e
* Consent API REST Resource Id retornado por uma criação bem-sucedida de [Open Banking Consent Resource](https://openbanking-brasil.github.io/areadesenvolvedor/#fase-2-apis-do-open-banking-brasil-api-consentimento);

Adicionalmente:

* the Consent Resource Id deve incluir caracteres seguros para url;
* the Consent Resource Id deve ter namespace;
* the Consent Resource Id deve ter propriedades de um nonce [Nonce](https://pt.wikipedia.org/wiki/Nonce);

### Dynamic Consent Scope Example

consent:urn:bancoex:C1DD33123

### Exemplo de escopo de consentimento dinâmico

consent:urn:bancoex:C1DD33123

## Ciclo de vida da autorização

### Introdução

O recurso de consentimento tem um ciclo de vida gerenciado separada e distintamente da estrutura de autorização OAuth 2.0. As transições de estado e comportamentos esperados e condições de erro esperados dos Recursos REST protegidos com este perfil são definidos nas especificações funcionais da API publicadas pelo Open Banking Brasil.

### Servidor de autorização

Além dos requisitos descritos nas disposições de segurança do Open Banking Brasil, o Servidor de Autorização

1. deve revogar tokens de atualização e, quando possível, tokens de acesso quando o recurso de consentimento vinculado for excluído;
2. deve garantir que os tokens de acesso sejam emitidos com o escopo necessário para o acesso aos dados especificados no elemento Permissões de um objeto de recurso de consentimento vinculado;
3. não deve rejeitar uma solicitação de autorização solicitando mais escopo do que o necessário para acessar os dados especificados no elemento Permissões de um objeto de recurso de consentimento vinculado;
4. pode reduzir o escopo solicitado a um nível suficiente para permitir o acesso aos recursos de dados especificados no elemento Permissões de um objeto de recurso de consentimento vinculado;

### Cliente confidencial

Além dos requisitos descritos nas disposições de segurança do Open Banking Brasil, o Cliente Confidencial

1. deve revogar sempre que possível e cessar o uso de tokens de atualização e acesso vinculados a um recurso de consentimento que foi excluído;
2. deve excluir Recursos de consentimento que estão expirados;

# Considerações regulatórias

## Requisito do cliente para apresentar reivindicação cpf para AS {#Reg}

[Resolução Conjunta nº 1, art. 10, parágrafo VI](https://www.in.gov.br/en/web/dou/-/resolucao-conjunta-n-1-de-4-de-maio-de-2020-255165055)
A interpretação da equipe de Conformidade exige que os TPPs (Third-party Providers ou Provedores terceiros) identifiquem o cliente antes de solicitar acesso a recursos de um banco. O mecanismo adotado é exigir que o TPP inclua um pedido de cpf de cliente preenchido como parte de um objeto de pedido quando o pedido ao banco inclui um pedido de acesso a uma conta ou recursos de pagamento que é transmitido por um escopo dinâmico de 'consent: {consentId}'.

Essa afirmação é considerada suficiente para atender aos requisitos da legislação, mas resulta na exigência de que os clientes forneçam a terceiros essas informações antes de solicitarem um fluxo bancário aberto. Os bancos que desejam evitar experiências ruins do cliente ou ajudar a mitigar a necessidade de os clientes digitarem detalhes confidenciais em ambientes ou interfaces de terceiros podem fornecer o cpf e outros atributos como parte de uma jornada de consentimento desde que o façam sem aceitar também um pedido de partilha de dados ao mesmo tempo.

A partilha de atributos do cliente sem um correspondente pedido de partilha de recursos bancários abertos está fora do âmbito do regulamento, o que significa que os bancos não são obrigados a oferecer este serviço, mas não existe qualquer barreira técnica para o fazerem. O perfil de segurança foi elaborado especificamente para permitir e encorajar os bancos a facilitar este processo de duas etapas que melhora significativamente a nova experiência do cliente para TPPs e evita a má prática de encorajar os consumidores a compartilhar manualmente informações pessoais sensíveis em sites. Eliminar a necessidade dessa atividade é um dos principais objetivos de segurança do Open Banking e do OpenID Foundation Financial Grade Working Group em cujos padrões este perfil se baseia.


# Reconhecimentos

Agradecemos a todos que estabeleceram as bases para o compartilhamento seguro e seguro de dados por meio da formação do Grupo de Trabalho FAPI da OpenID Foundation, o GT de Segurança do Open Banking Brasil e aos pioneiros que ficarão em seus ombros.

As seguintes pessoas contribuíram para este documento:

* Ralph Bragg (Raidiam)
* Joseph Heenan (Authlete)
* Alexandre Siqueira (Mercado Pago)
* Marcos Rodrigues (Itaú)

{backmatter}

# Avisos

Copyright (c) 2021 Estrutura Inicial do Open Banking Brasil

A Estrutura Inicial do Open Banking Brasil (EIOBB) concede a qualquer Colaborador, desenvolvedor, implementador ou outra parte interessada uma licença de direitos autorais mundial não exclusiva, livre de royalties para reproduzir, preparar trabalhos derivados, distribuir, executar e exibir, estes Implementadores Rascunho ou Especificação Final exclusivamente para fins de (i) desenvolver especificações e (ii) implementar Rascunhos de Implementadores e Especificações Finais com base em tais documentos, desde que a atribuição seja feita ao EIOBB como a fonte do material, mas que tal atribuição o faça não indica endosso do EIOBB.

A tecnologia descrita nesta especificação foi disponibilizada a partir de contribuições de várias fontes, incluindo membros da OpenID Foundation, do Grupo de Trabalho de Segurança do Open Banking Brasil e outros. Embora a Estrutura Inicial do Open Banking Brasil tenha tomado medidas para ajudar a garantir que a tecnologia esteja disponível para distribuição, ela não toma posição quanto à validade ou escopo de qualquer propriedade intelectual ou outros direitos que possam ser reivindicados como pertencentes à implementação ou uso do tecnologia descrita nesta especificação ou até que ponto qualquer licença sob tais direitos pode ou não estar disponível; nem representa que fez qualquer esforço independente para identificar tais direitos. A Estrutura Inicial do Open Banking Brasil e os contribuidores desta especificação não oferecem (e por meio deste expressamente se isentam de quaisquer) garantias (expressas, implícitas ou de outra forma), incluindo garantias implícitas de comercialização, não violação, adequação a uma finalidade específica ou título, relacionados a esta especificação, e todo o risco quanto à implementação desta especificação é assumido pelo implementador. A política de Direitos de Propriedade Intelectual do Open Banking Brasil exige que os contribuidores ofereçam uma promessa de patente de não fazer valer certas reivindicações de patentes contra outros contribuidores e implementadores. A Estrutura Inicial do Open Banking Brasil convida qualquer parte interessada a trazer à sua atenção quaisquer direitos autorais, patentes, pedidos de patentes ou outros direitos de propriedade que possam abranger a tecnologia que possa ser necessária para praticar esta especificação.
