%%%

    #
    # Open Banking Brasil Certificate Standards 1.0 Implementers Draft 1
    # (open-banking-brasil-certificate-standards-1_ID1)
    #
    #

    title = "Open Banking Brasil FAQ 1.0 Implementers Draft 1"
    abbrev = "OBB-FAQ-1-ID1"
    ipr = "none"
    workgroup = "Open Banking Brasil GT Security"
    keyword = ["FAPI", "CERT", "Open Banking Brasil GT Security"]

    [seriesInfo]
    name = "Internet-Draft"
    status = "standard"
    value = "open-banking-brasil-FAQ-1_ID1"

    [[author]]
    initials = "M."
    surname = "Rodrigues"
    fullname = "Marcos Rodrigues"
    organization = "Itau"
    abbrev = "Itau"
      [author.address]
      email = "marcos.aurelio-rodrigues@itau-unibanco.com.br"
      uri = "https://www.itau.com.br/"

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

.# Prefácio

A Estrutura Inicial do Open Banking Brasil é responsável por criar padrões e especificações necessárias para garantir que os requisitos e obrigações da Regulações do Open Banking Brasil como originalmente publicadas pelo Banco Central do Brasil. É possível que parte dos elementos deste documento estejam sujeitos a direitos autorais.  A Estrutura Inicial do Open Banking Brasil não deve ser responsável por identificar nenhuma parte ou totalidade destes direitos autorais.

.# Objetivo

Responder as principais questões realizadas por desenvolvedores e responsáveis por realizar a implementação dos sistemas parte do ecossistema do Open Banking Brasil em instituições participantes ou não.

.# Convenções Notacionais

As palavras-chave "deve", "não deve", "recomenda", "não recomenda", "pode" e "pode" neste documento devem ser interpretadas conforme descrito na [Diretiva ISO Parte 2] [ISODIR2]. Essas palavras-chave não são usadas como termos de dicionário, de forma que qualquer ocorrência delas deve ser interpretada como palavras-chave e não devem ser interpretadas com seus significados em linguagem natural.

{mainmatter}

# Escopo

Responder a principais questões técnicas e normativas a respeito de controles de segurança da informação aplicáveis ao Open Banking Brasil.

# Referências Normativas

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

# Termos e Definicoes

Para o propósito deste documento os termos definidos na [RFC5280, [BCP195], [RFC8705], e ISO29100 são aplicáveis.

# Glossario

* **SSA** – Software Statement Assertion
* **SS** – Software Statement
* **DCR** – Dynamic Client Registration
* **API** – Application Programming Interface
* **HTTP** – Hyper Text Transfer Protocol
* **TLS** – Transport Layer Security
* **mTLS** – Mutual Transport Layer Security
* **ICP** - Infraestrutura de Chave Públicas Brasileira
* **MFA** - Múltiplo Fator de Autenticação
* **JAR** - JWT Secured Authorization Request
* **JARM** - JWT Secured Authorization Response
* **PKI** - Public Key Infrastructure

# Pergunta Frequentes

## Quais os níveis de autenticação (LoA - Level of Assurance) exigido pelo Open Banking Brasil?
O ACR (Authentication Context Class Reference) é um parâmetro opcional que é utilizado para enviar informações adicionais sobre o nível de autenticação exigida para o usuário final, sendo especificado através do LoA (Level of Assurance)

Para o Open Banking Brasil são definidos:
* **LoA2:** Autenticação realizada através de fator único
* **LoA3:** Autenticação realizada através de múltiplo fatores (MFA)

Sendo necessário:
* **APIs de Consulta:** Deve ser solicitado ao menos LoA2, podendo a instituição transmissora realizar a critério (de acordo com resoluçõa vigente) executar autenticação usando LoA3.
* **APIs de Escrita (Transacional):** Deve ser solicitado ao menos LoA3.

## Quais os critérios de Múltiplos Fatores de Autenticação?
Considerando que os fatores de autenticação são compostos por métodos:
* Algo que você sabe; como uma senha ou uma frase;
* Algo que você tem; como um token ou um smartcard;
* Algo que você é; como uma validação biométrica.

Para realizar uma autenticação MFA é necessário que o usuário final apresente ao menos dois métodos distintos de autenticação conforme listado acima. Um mesmo método utilizado duas vezes não é aceito como autenticação de múltiplo fator.

## O Open Banking Brasil utiliza JAR/JARM?

JAR (JWT Secured Authorization Request) e JARM (JWT Secured Authorization Response) são suportados pelo Open Banking Brasil Financial-grade API Security Profile 1.0 porém não têm sua implementação exigida.

## É permitido a utilizaçao de PKI Privada para emissão de certificados responsáveis por autenticação (cliente) e assinatura no Open Banking Brasil?

De acordo com a MEDIDA PROVISÓRIA No 2.200-2, DE 24 DE AGOSTO DE 2001 (http://www.planalto.gov.br/ccivil_03/mpv/antigas_2001/2200-2.htm) a utilização de PKI Privada é autorizada como mecanismo válido para autenticação e assinatura.

Para o Open Banking Brasil, a utilização de PKI Privada para emissão de certificados de autenticação (cliente) e assinatura é permitido apenas quando provisionado pela entidade atuando como transmissora de dados, e quando a entidade receptora de dados não participa do Ecossistema do Open Banking Brasil de maneira a não possuir cadastro no Serviço de Diretório do Open Banking Brasil e o **certificado deve possuir as mesmas características de chaves criptográficas e atributos conforme especificado pelo Open Banking Brasil.**

# Reconhecimento

Agradecemos a todos que estabeleceram as bases para o compartilhamento seguro e seguro de dados por meio da formação do Grupo de Trabalho FAPI da OpenID Foundation, o GT-Segurança do Open Banking Brasil e aos pioneiros que ficarão em seus ombros.

As seguintes pessoas contribuíram para este documento:

* Marcos Rodrigues (Itaú)

# Informativo

Copyright (c) 2021 Estrutura Inicial do Open Banking Brasil.

A Estrutura Inicial do Open Banking Brasil (EIOBB) concede a qualquer Colaborador, desenvolvedor, implementador ou outra parte interessada uma licença de direitos autorais mundial não exclusiva, livre de royalties para reproduzir, preparar trabalhos derivados, distribuir, executar e exibir, estes Implementadores Rascunho ou Especificação Final exclusivamente para fins de (i) desenvolver especificações e (ii) implementar Rascunhos de Implementações e Especificações Finais com base em tais documentos, desde que a atribuição seja feita ao EIOBB como a fonte do material, mas que tal atribuição o faça não indica endosso do EIOBB.

A tecnologia descrita nesta especificação foi disponibilizada a partir de contribuições de várias fontes, incluindo membros da OpenID Foundation, do GT-Segurança do Open Banking Brasil e outros. Embora a Estrutura Inicial do Open Banking Brasil tenha tomado medidas para ajudar a garantir que a tecnologia esteja disponível para distribuição, ela não toma posição quanto à validade ou escopo de qualquer propriedade intelectual ou outros direitos que possam ser reivindicados como pertencentes à implementação ou uso do tecnologia descrita nesta especificação ou até que ponto qualquer licença sob tais direitos pode ou não estar disponível; nem representa que fez qualquer esforço independente para identificar tais direitos. A Estrutura Inicial do Open Banking Brasil e os contribuidores desta especificação não oferecem (e por meio deste expressamente se isentam de quaisquer) garantias (expressas, implícitas ou de outra forma), incluindo garantias implícitas de comercialização, não violação, adequação a uma finalidade específica ou título, relacionados a esta especificação, e todo o risco quanto à implementação desta especificação é assumido pelo implementador. A política de Direitos de Propriedade Intelectual do Open Banking Brasil exige que os contribuidores ofereçam uma promessa de patente de não fazer valer certas reivindicações de patentes contra outros contribuidores e implementadores. A Estrutura Inicial do Open Banking Brasil convida qualquer parte interessada a trazer à sua atenção quaisquer direitos autorais, patentes, pedidos de patentes ou outros direitos de propriedade que possam abranger a tecnologia que possa ser necessária para praticar esta especificação.