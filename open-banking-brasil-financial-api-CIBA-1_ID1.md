%%%

    #
    # Open Banking Brasil Financial-grade API CIBA Security Profile 1.0 Implementers Draft 3
    # (open-banking-brasil-financial-api-1_ID3)
    #
    #

    title = "Open Banking Brasil Financial-grade CIBA API Security Profile 1.0 Implementers Draft 3"
    abbrev = "OBB-FAPI-CIBA-1-ID3"
    ipr = "none"
    workgroup = "Open Banking Brasil GT Security"
    keyword = ["FAPI", "Open Banking Brasil GT Security"]

    [seriesInfo]
    name = "Internet-Draft"
    status = "standard"
    value = "open-banking-brasil-financial-api-CIBA-1_ID3"

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

Este documento também está disponível em [português](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-financial-api-1_ID3-ptbr.html)

The Open Banking Brasil Initial Structure is responsible for creating standards and specifications necessary to meet the requirements and obligations of the Brasil Open Banking Legislation as originally outlined by the [Brasil Central Bank](https://www.bcb.gov.br/content/config/Documents/BCB_Open_Banking_Communique-April-2019.pdf). There is a possibility that some of the elements of this document may be the subject to patent rights. OBBIS shall not be held responsible for identifying any or all such patent rights.

Open Banking Brasil Financial-grade API Security Profile 1.0 consists of the following parts:

* Open Banking Brasil Financial-grade API Security Profile 1.0
* [Open Banking Brasil Dynamic Client Registration Profile 1.0][OBB-FAPI-DCR]

These parts are intended to be used with [RFC6749], [RFC6750], [RFC7636], [OIDC], [FAPI-1-Baseline] and [FAPI-1-Advanced]

.# Introduction
The Financial-grade API Standard provides a profile for OAuth 2.0 suitable for use in financial services. The standard OAuth method for the client to send the resource owner to the authorization server is to use an HTTP redirect. Parts 1 and 2 of this specification support this interaction model and are suitable for use cases where the resource owner is interacting with the client on a device they control that has a web browser. There are however many use-cases for initiating payments where the resource owner is not interacting with the client in such a manner. For example, the resource owner may want to authorize a payment at a "point of sale" terminal at a shop or fuel station.

This document is a profile of the OpenID Connect Client Initiated Backchannel Authentication Flow [CIBA] that supports this decoupled interaction method. The CIBA spec allows a client that gains knowledge of an identifier for the user to obtain tokens from the authorization server. The user consent is given at the user's Authentication Device mediated by the authorization server. This document profiles the CIBA specification to bring it in line with the other FAPI parts and provides security recommendations for its use with APIs that require financial-grade security.

Although it is possible to code an OpenID Provider and Relying Party from first principles using this specification, the main audience for this specification is parties who already have a certified implementation of [Financial-grade API: Client Initiated Backchannel Authentication Profile][FAPI-CIBA] and want to achieve certification for the Brasil Open Banking programme.

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

* applications to obtain OAuth tokens via a backchannel authentication flow in an appropriately secure manner for higher risk access to data in a manner that meets the requirements of [Open Banking Brasil](https://www.in.gov.br/en/web/dou/-/resolucao-conjunta-n-1-de-4-de-maio-de-2020-255165055);
* applications to use OpenID Connect CIBA to suggest the identity of the customer;

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

[FAPI-2-Advanced] - Financial-grade API Security Profile 2.0 - Part 2: Advanced
[FAPI-2-Advanced]: <https://bitbucket.org/openid/fapi/src/master/FAPI_2_0_Advanced_Profile.md

[FAPI-CIBA] - Financial-grade API: Client Initiated Backchannel Authentication Profile
[FAPI-CIBA]: <https://openid.net/specs/openid-financial-api-ciba-ID1.html

[CIBA] - OpenID Connect Client Initiated Backchannel Authentication Core
[CIBA]: <https://openid.net/specs/openid-financial-api-ciba-ID1.html

[LIWP] - OIDF FAPI WG Lodging Intent Working Paper
[LIWP]: <https://bitbucket.org/openid/fapi/src/master/Financial_API_Lodging_Intent.md

[OBB-FAPI-DCR] - Open Banking Brasil Financial-grade API Dynamic Client Registration Profile 1.0
[OBB-FAPI-DCR]: <https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-dynamic-client-registration-1_ID1.html

[RFC4648] - The Base16, Base32, and Base64 Data Encodings
[RFC4648]: <https://tools.ietf.org/html/rfc4648

# Terms and definitions

For the purpose of this document, the terms defined in [RFC6749], [RFC6750], [RFC7636], [OpenID Connect Core][OIDC], [CIBA] and ISO29100 apply.

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

**MFA** - Multi-Factor Authentication

# Brasil Open Banking Security Profile

## Introduction

The Brasil Open Banking Security profile specifies additional security and identity requirements for high risk API resources protected by the OAuth 2.0 Authorization Framework that consists of [RFC6749], [RFC6750], [RFC7636], [FAPI-1-Baseline], [FAPI-1-Advanced], [FAPI-CIBA] and other specifications.

This profile describes security and features provisions for a server and client that are necessary for the Brasil Open Banking Programme by defining the measures to address:

* the requirement to convey the Authentication Context Request that was performed by an OpenID Provider to a Client to enable a appropriate client management of customer conduct risk.
* the requirement for clients to assert a pre-existing customer relationship by asserting a customer identity claim as part of the CIBA flow.

## Open Banking Brasil CIBA Security provisions

### Introduction

Open Banking Brasil has a requirement to adopt Client [Initiated Back Channel Authentication][CIBA] as a means of enabling decoupled authentication work flows.
In addition this profile describes the specific scope, acr and client management requirements necessary to support the wider Open Banking Brasil ecosystem.

As a profile of the OAuth 2.0 Authorization Framework, this document mandates the following for the Brasil Open Banking Security profile.

### Authorization server

The Authorization Server shall support the provisions specified in clause 5.2.2 of [Financial-grade API CIBA Security Profile 1.0][FAPI-CIBA]

In addition, the Authorization Server

1. shall distribute discovery metadata (such as the authorization endpoint) via the metadata document as specified in [OIDD] and [RFC8414]
2. shall support the claims parameter as defined in clause 5.5 [OpenID Connect Core][OIDC]
3. shall support the oidc standard claim "cpf" as defined in clause 5.2.2.2 of [FAPI-BR]
4. shall support the oidc standard claim "cnpj" as defined in clause 5.2.2.3 of [FAPI-BR] if providing access to resources where the resource owner is not a `natural person`
5. shall support the acr "urn:brasil:openbanking:loa2" as defined in clause 5.2.2.4 of FAPI-BR
6. should support the acr "urn:brasil:openbanking:loa3" as defined in clause 5.2.2.4 of [FAPI-BR]]
7. shall implement the userinfo endpoint as defined in clause 5.3 [OpenID Connect Core][OIDC]
8. shall support parameterized OAuth 2.0 resource scope _consent_ as defined in clause 6.3.1 [OIDF FAPI WG Lodging Intent Pattern][LIWP]
9. shall support refresh tokens
10. shall issue access tokens with an expiry no greater than 900 seconds and no less than 300 seconds
11. shall always include an acr claim in the `id_token`
12. shall require the Signed Authentication Request to contain nbf and exp claims that limit the lifetime of the request to no more than 10 minutes
13. shall issue ciba auth request acknowledgements with a minimum expiry of 6 minutes;

### Confidential client

In addition, the confidential client

1. shall support parameterized OAuth 2.0 resource scope _consent_ as defined in clause 6.3.1 [OIDF FAPI WG Lodging Intent Pattern][LIWP]
2. shall support refresh tokens
3. shall not populate the `acr` claim with required values
4. shall require the `acr` claim as an essential claim

### Resource Owner identity hint mechanisms

#### Introduction

As described in [FAPI-CIBA], there are many mechanisms that can be used to convey a Resource Owners identity from the Consumption Device to the Authorization Server however in call cases this identity attestation must be treated as a `hint` only. There are naturally limitations on the types of id hints that can be captured by the consumption device based on the input and output contraints of the device being used. In addition to input and output challenges, there are several key privacy and security conerns that must be evaluated when defining id conveyance processes. This profile defines several `login hint` types that must be supported by authorisation servers.

[FAPI-CIBA] requires requests to be signed, there is no requirement in Brazil to additionally sign these hints as they are all asserted by the Client.

##### Authorisation Server Generated - Login Hint Token

This `login hint` can be used where it is not possible for the Resource Owner to provide a Login Hint to the Consumption Device or where the Resource Owner wishes to claim the authentication request by independently reaching out to the Authorisation Server out of band to claim this authentication request.

`
{
    "format": "urn:brasil:openbanking:ciba:login-hint-token-type:as-generated"
}
`

The use of a `binding message` is mandatory if this token type is to be leveraged.

###### Authorisation Server Generated - Login Hint Presentation

Presentation of the Authorisation Server Generated Token must be in the format of a JWE displayed as a QR Code with the following properties in the following way.

JWS Creation

1. The payload of signed messages (request _JWT_) shall include the following claims as defined at [RFC7519] (JWT):

* **aud** the Authorization Servers advertised issuer as per [OIDD];
* **iss** the receiver of the message shall validate if the value of the **iss** field matches the `clientId` of the sender;
* **jti** the value of the **jti** field shall be filled with the UUID defined by the institution according to [RFC4122] version 4;
* **iat** the **iat** field  shall be filled with the message generation time and according to the standard established in [RFC7519](https:// datatracker.ietf.org/doc/html/rfc7519#section-2) to the _NumericDate_ format.
* ***exp** the **exp** field  shall be filled with the message expiry time and according to the standard established in [RFC7519](https:// datatracker.ietf.org/doc/html/rfc7519#section-2) to the _NumericDate_ format with an maximum value not greater than 5 minutes;
* **auth_request_id** the authentication request id returned from the Authorisation Server CIBA requst.

2. The JOSE header must contain the following attributes:
   * **alg** - shall be filled with the value `PS256`";
   * **kid** - shall be filled with the key identifier value used for the signature listed on the `software statement` keystore on the Open Banking Brasil Directory of Participants;
   * **typ** - shall be filled with the value `JWT`.

JWE Creation

1. The JOSE header must contain the following attributes:
   * **alg** - shall be filled with the value `RSA-OAEP`";
   * **enc** - shall be filled with the value `A256GCM`";
   * **kid** - shall be filled with the encryption key identifier `kid` value used to encrypt the JWE with the encryption key advertised on the authorisation servers jwks endpoint;
   * **cty** - shall be filled with the value `JWT`.

##### Authentication Device Generated - Login Hint Token

This `login hint token` should be used when Client has requested a unique identifier be provided by the Resource Owner to the Consumption Device. It is recommended that this identifier be dynamic, time based, have sufficient entropy and short lived to prevent replay attacks.

`
{
    "format": "urn:brasil:openbanking:ciba:login-hint-token-type:ad-generated",
    "id": "11112222333344445555"
}
`

The use of a `binding message` is mandatory if this token type is to be leveraged.


# Security considerations

Participants shall support all security considerations specified in clause TODO and all sub clauses of [FAPI-BR] and [FAPI-CIBA]

# Data Sharing Considerations

Participants shall support all data sharing considerations specified in clause TODO of [FAPI-BR]

# Registration and Discovery Metadata

OpenID Provider Metadata

The following authorization server metadata parameters are introduced by this specification for OPs publishing their support of the Brazil CIBA flow and details thereof.

* backchannel_endpoint_login_hint_token_types_supported: REQUIRED. JSON array containing one or more of the following values: urn:brasil:openbanking:ciba:login-hint-token-type:cpf, urn:brasil:openbanking:ciba:login-hint-token-type:opaque or urn:brasil:openbanking:ciba:login-hint-token-type:credit-proposition.

# Acknowledgements

With thanks to all who have set the foundations for secure and safe data sharing through the formation of the OpenID Foundation FAPI Working Group, the Open Banking Brasil GT Security and to the pioneers who will stand on their shoulders.

The following people contributed to this document:

* Ralph Bragg (Raidiam)
* Add Contributors

{backmatter}

# Notices

Copyright (c) 2021 Open Banking Brasil Initial Structure.

The Open Banking Brasil Initial Structure (OBBIS) grants to any Contributor, developer, implementer, or other interested party a non-exclusive, royalty-free, worldwide copyright license to reproduce, prepare derivative works from, distribute, perform and display, this Implementers Draft or Final Specification solely for the purposes of (i) developing specifications, and (ii) implementing Implementers Drafts and Final Specifications based on such documents, provided that attribution be made to the OBBIS as the source of the material, but that such attribution does not indicate an endorsement by the OBBIS.

The technology described in this specification was made available from contributions from various sources, including members of the OpenID Foundation, the Open Banking Brasil GT Security Working Group and others. Although the Open Banking Brasil Initial Structure has taken steps to help ensure that the technology is available for distribution, it takes no position regarding the validity or scope of any intellectual property or other rights that might be claimed to pertain to the implementation or use of the technology described in this specification or the extent to which any license under such rights might or might not be available; neither does it represent that it has made any independent effort to identify any such rights. The Open Banking Brasil Initial Structure and the contributors to this specification make no (and hereby expressly disclaim any) warranties (express, implied, or otherwise), including implied warranties of merchantability, non-infringement, fitness for a particular purpose, or title, related to this specification, and the entire risk as to implementing this specification is assumed by the implementer. The Open Banking Brasil Intellectual Property Rights policy requires contributors to offer a patent promise not to assert certain patent claims against other contributors and against implementers. The Open Banking Brasil Initial Structure invites any interested party to bring to its attention any copyrights, patents, patent applications, or other proprietary rights that may cover technology that may be required to practice this specification.
