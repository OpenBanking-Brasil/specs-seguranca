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

.# Foreword

The Open Banking Brasil Initial Structure is responsible for creating standards and specifications necessary to meet the requirements and obligations of the Brasil Open Banking Legislation as originally outlined by the [Brasil Central Bank](https://www.bcb.gov.br/content/config/Documents/BCB_Open_Banking_Communique-April-2019.pdf). There is a possibility that some of the elements of this document may be the subject to patent rights. OBBIS shall not be held responsible for identifying any or all such patent rights.

Open Banking Brasil Financial-grade API Security Profile 1.0 consists of the following parts:

* Open Banking Brasil Financial-grade API Security Profile 1.0
* [Open Banking Brasil Dynamic Client Registration Profile 1.0][OBB-FAPI-DCR]

These parts are intended to be used with [RFC6749], [RFC6750], [RFC7636], [OIDC], [FAPI-1-Baseline] and [FAPI-1-Advanced]

.# Introduction

The Open Banking Brasil Financial-grade API is a highly secured OAuth profile that aims to provide specific implementation guidelines for security and interoperability which can be applied to APIs in the Brasil Open Banking Area area that require a higher level of privacy than provided by standard [Financial-grade API Security Profile 1.0 - Part 2: Advanced][FAPI-1-Advanced]. Among other enhancements, this specification addresses privacy considerations identified in [FAPI-1-Advanced] that are relevent in the Open Banking Brasil specifications but have not, so far, been required by other jurisdictions.

Although it is possible to code an OpenID Provider and Relying Party from first principles using this specification, the main audience for this specification is parties who already have a certified implementation of [Financial-grade API Security Profile 1.0 - Part 2: Advanced][FAPI-1-Advanced] and want to achieve certification for the Brasil Open Banking programme.

.# Notational Conventions

The key words "shall", "shall not",
"should", "should not", "may", and
"can" in this document are to be interpreted as described in
[ISO Directive Part 2][ISODIR2].
These key words are not used as dictionary terms such that
any occurrence of them shall be interpreted as key words
and are not to be interpreted with their natural language meanings.

{mainmatter}

# Scope

This document specifies the method of

* applications to obtain the OAuth tokens in an appropriately secure manner for higher risk access to data in a manner that meets the requirements of [Open Banking Brasil](https://www.in.gov.br/en/web/dou/-/resolucao-conjunta-n-1-de-4-de-maio-de-2020-255165055);
* applications to use OpenID Connect to identify the customer; and
* applications to use OpenID Connect to assert identity of the customer;

This document is applicable to all participants engaging in Open Banking in Brasil.

# Normative references

The following referenced documents are indispensable for the application of this document. For dated references, only the edition cited applied. For undated references, the latest edition of the referenced document (including any amendments) applies.

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

# Terms and definitions

For the purpose of this document, the terms defined in [RFC6749], [RFC6750], [RFC7636], [OpenID Connect Core][OIDC] and ISO29100 apply.

# Symbols and Abbreviated terms

**API** – Application Programming Interface

**OBBIS** – Open Banking Brasil Initial Structure

**CSRF** - Cross Site Request Forgery

**DCR** – Dynamic Client Registration

**FAPI** - Financial-grade API

**HTTP** – Hyper Text Transfer Protocol

**OIDF** - OpenID Foundation

**REST** – Representational State Transfer

**TLS** – Transport Layer Security

# Brasil Open Banking Security Profile

## Introduction

The Brasil Open Banking Security profile specifies additional security and identity requirements for high risk API resources protected by the OAuth 2.0 Authorization Framework that consists of [RFC6749], [RFC6750], [RFC7636], [FAPI-1-Baseline], [FAPI-1-Advanced] and other specifications.

This profile describes security and features provisions for a server and client that are necessary for the Brasil Open Banking Programme by defining the measures to mitigate or address:

* attacks that address privacy considerations identified in clause 9.1 of [FAPI1 Advanced]
* the requirement to support fine grained access to resources for data minimisation purposes
* the requirement to convey the Authentication Context Request that was performed by an OpenID Provider to a Client to enable a appropriate client management of customer conduct risk.
* the requirement for clients to optionally assert a pre-existing customer relationship by asserting a customer identity claim as part of the authorization flow.

## Open Banking Brasil security provisions

### Introduction

Open Banking Brasil has a requirement to address privacy considerations that were identified but not addressed in the [FAPI-1-Advanced] final specification without imposing additional requirements on Authorisation Servers being proposed in [FAPI-2-Baseline].
Participants in this ecosystem have a need for clients to request an openid provider to confirm values of identity claims as part of an authorization request using the mechanism defined in clause 5.5.1 of [OIDC].
The use of the claims parameter to request explicit claims values requires clients to ensure that they encrypt the request object to avoid information leakage. This risk is identified in clause 7.4.1 of [FAPI-1-Advanced].
In addition this profile describes the specific scope, acr and client management requirements necessary to support the wider Open Banking Brasil ecosystem.

As a profile of the OAuth 2.0 Authorization Framework, this document mandates the following for the Brasil Open Banking Security profile.

### Authorization server

The Authorization Server shall support the provisions specified in clause 5.2.2 of [Financial-grade API Security Profile 1.0 - Part 2: Advanced][FAPI-1-Advanced]

In addition, the Authorization Server

1. shall support a signed and encrypted JWE request object passed by value or shall require pushed authorization requests;
2. shall distribute discovery metadata (such as the authorization endpoint) via the metadata document as specified in [OIDD] and [RFC8414]
3. shall support the claims parameter as defined in clause 5.5 [OpenID Connect Core][OIDC]
4. shall support the oidc standard claim "cpf" as defined in clause 5.2.2.2 of this document
5. shall support the oidc standard claim "cnpj" as defined in clause 5.2.2.3 of this document
6. shall support the acr "urn:brasil:openbanking:loa2" as defined in clause 5.2.2.4 of this document
7. should support the acr "urn:brasil:openbanking:loa3" as defined in clause 5.2.2.4 of this document
8. shall implement the user info endpoint as defined in clause 5.3 [OpenID Connect Core][OIDC]
9. shall support parameterized OAuth 2.0 resource scope _consent_ as defined in clause 6.3.1 [OIDF FAPI WG Lodging Intent Pattern][LIWP]
10. may support [Financial-grade API: Client Initiated Backchannel Authentication Profile][FAPI-CIBA]
11. shall support [Financial-grade API: Client Initiated Backchannel Authentication Profile][FAPI-CIBA] if scope includes _payments_
12. shall support refresh tokens

#### ID Token as detached signature

The Authorization Server shall support the provisions specified in clause 5.2.2.1 of [Financial-grade API Security Profile 1.0 - Part 2: Advanced][FAPI-1-Advanced]

In addition, if the `response_type` value `code id_token` is used, the Authorization Server

1. should not return sensitive PII in the ID Token in the authorization response, but if it needs to,
then it shall encrypt the ID Token.

#### Requesting the "cpf" Claim

This profile defines "cpf" as a new standard claim as per
 clause 5.1 [OIDC]

The **CPF** number (Cadastro de Pessoas Físicas, [sepeˈɛfi]; Portuguese for "Natural Persons Register")
 is the **Brazilian** individual taxpayer registry identification. This number is attributed by
 the **Brazilian** Federal Revenue to Brazilians and resident aliens who, directly or indirectly,
  pay taxes in **Brazil**.
In the Brasil Open Banking identity model, the cpf is a string consisting of numbers that is 11
characters long and may start with a 0.
If the cpf Claim is requested as an Essential Claim for the ID Token or UserInfo response with a
values parameter requesting a specific cpf value, the Authorization Server MUST return an cpf Claim Value
that matches the requested value. If this is an Essential Claim and the requirement cannot be met,
 then the Authorization Server MUST treat that outcome as a failed authentication attempt.

Name: cpf, Type: String, Regex: '^\d{11}$'

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

1. shall revoke refresh tokens and where practicable access tokens when a consent resource is deleted;

### Confidential Client

In addition to the requirements outlined in Open Banking Brasil security provisions the Confidential Client

1. shall discard and cease usage of refresh and access tokens that are bound to a Consent Resource that has been deleted;

# Acknowledgements

With thanks to all who have set the foundations for secure and safe data sharing through the formation of the OpenID Foundation FAPI Working Group, the Open Banking Brasil GT Security and to the pioneers who will stand on their shoulders.

The following people contributed to this document:

* Ralph Bragg (Raidiam)
* Joseph Heenan (Authlete)
* Alexandre Siqueira (Mercado Pago)

{backmatter}

# Notices

Copyright (c) 2021 Open Banking Brasil Initial Structure.

The Open Banking Brasil Initial Structure (OBBIS) grants to any Contributor, developer, implementer, or other interested party a non-exclusive, royalty-free, worldwide copyright license to reproduce, prepare derivative works from, distribute, perform and display, this Implementers Draft or Final Specification solely for the purposes of (i) developing specifications, and (ii) implementing Implementers Drafts and Final Specifications based on such documents, provided that attribution be made to the OBBIS as the source of the material, but that such attribution does not indicate an endorsement by the OBBIS.

The technology described in this specification was made available from contributions from various sources, including members of the OpenID Foundation, the Open Banking Brasil GT Security Working Group and others. Although the Open Banking Brasil Initial Structure has taken steps to help ensure that the technology is available for distribution, it takes no position regarding the validity or scope of any intellectual property or other rights that might be claimed to pertain to the implementation or use of the technology described in this specification or the extent to which any license under such rights might or might not be available; neither does it represent that it has made any independent effort to identify any such rights. The Open Banking Brasil Initial Structure and the contributors to this specification make no (and hereby expressly disclaim any) warranties (express, implied, or otherwise), including implied warranties of merchantability, non-infringement, fitness for a particular purpose, or title, related to this specification, and the entire risk as to implementing this specification is assumed by the implementer. The Open Banking Brasil Intellectual Property Rights policy requires contributors to offer a patent promise not to assert certain patent claims against other contributors and against implementers. The Open Banking Brasil Initial Structure invites any interested party to bring to its attention any copyrights, patents, patent applications, or other proprietary rights that may cover technology that may be required to practice this specification.
