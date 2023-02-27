%%%

    #
    # Open Finance Brasil Certificate Standards 1.0
    # (open-banking-brasil-certificate-standards-1_ID1)
    #
    #

    title = "Open Finance Brasil Certificate Standards 1.0"
    abbrev = "OFB-CERT-1-ID1"
    ipr = "none"
    workgroup = "Open Finance Brasil GT Security"
    keyword = ["FAPI", "CERTIFICATES", "Open Finance Brasil GT Security"]

    [seriesInfo]
    name = "Internet-Draft"
    status = "standard"
    value = "open-banking-brasil-certificate-standards-1_ID1"

    [[author]]
    initials = "GT"
    surname = "Segurança"
    fullname = "GT Segurança"
    organization = "Estrutura Inicial do Open Finance Brasil"
    abbrev = "EIOFB"
      [author.address]
      email = "gt-seguranca@openbankingbr.org"
      uri = "https://openbankingbrasil.org.br/"
%%%

.# Foreword

Este documento também está disponível em [português](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-certificate-standards-1_ID1-ptbr.html).

The Open Finance Brasil Initial Structure is responsible for creating standards and specifications necessary to meet the requirements and obligations of the Brasil Open Finance Legislation as originally outlined by the [Brasil Central Bank](https://www.bcb.gov.br/content/config/Documents/BCB_Open_Banking_Communique-April-2019.pdf). There is a possibility that some of the elements of this document may be the subject to patent rights. OFBIS shall not be held responsible for identifying any or all such patent rights.

.# Objective

Specify the set of necessary certificates required by participating organizations in Open Finance Brasil to ensure interoperability for authentication, confidentiality, integrity and non-repudiation among participants, as well as for users and consumers of these entities. The audience of this specification are the entities participating in Open Finance Brasil that will issue certificates to authenticate themselves with other entities, as well as offering their customers a secure authentication channel.

.# Notational Conventions

The key words "shall", "shall not",
"should", "should not", "may", and
"can" in this document are to be interpreted as described in
[ISO Directive Part 2][ISODIR2].
These key words are not to be used as lexicon terms such that any occurrence of them shall be interpreted as key words and are not to be interpreted with their natural language meanings.

{mainmatter}

# Scope

This document specifies the types of certificates required for:

* Mutually authenticate (MTLS - Mutual TLS) participants' applications;
* Message Signature (JWS - JSON Web Signature) applications to ensure authenticity and non-repudiation of messages between participants;
* Provide a safe and reliable channel for Open Finance Brasil customers;
* Authenticate participants in the Open Finance Brasil Participant Directory.

# Normative refences

The following referenced documents are indispensable for the application of this document. For dated references, only the edition cited applied. For undated references, the latest edition of the referenced document (including any amendments) applies.

* [ISODIR2] - ISO/IEC Directives Part 2 [ISODIR2]: <https://www.iso.org/sites/directives/current/part2/index.xhtml>
* [RFC5280] -  Internet X.509 Public Key Infrastructure Certificate and Certificate Revocation List (CRL) Profile: <https://datatracker.ietf.org/doc/html/rfc5280>
* [RFC7519] - JSON Web Token (JWT) [RFC7519]:<https://tools.ietf.org/html/rfc7519>
* [RFC7515] - JSON Web Signature (JWS) [RFC7515] :<https://datatracker.ietf.org/doc/html/rfc7515>
* [RFC7591] - OAuth 2.0 Dynamic Client Registration Protocol [RFC7591]:<https://tools.ietf.org/html/rfc7591>
* [RFC7592] - OAuth 2.0 Dynamic Client Registration Management Protocol [RFC7592]:<https://tools.ietf.org/html/rfc7592>
* [BCP195] - Recommendations for Secure Use of Transport Layer Security (TLS) and Datagram Transport Layer Security (DTLS) [BCP195]: <https://tools.ietf.org/html/bcp195>
* [RFC8705] - OAuth 2.0 Mutual TLS Client Authentication and Certificate Bound Access Tokens [RFC8705]: <https://tools.ietf.org/html/rfc8705>
* [OFB-FAPI] - Open Finance Brasil Financial-grade API Security Profile 1.0 [OFB-FAPI]: <https://github.com/OpenBanking-Brasil/specs-seguranca/open-banking-brasil-financial-api-1_ID3.html>
* [OFB-FAPI-DCR] - Open Finance Brasil Financial-grade API Dynamic Client Registration Profile 1.0 [OFB-FAPI-DCR]: <https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-dynamic-client-registration-1_ID3.html>
* [DOC-ICP-01] - DECLARAÇÃO DE PRÁTICAS DE CERTIFICAÇÃO DA AUTORIDADE CERTIFICADORA RAIZ DA ICP-BRASIL: <https://www.gov.br/iti/pt-br/centrais-de-conteudo/doc-icp-01-v-5-2-dpc-da-ac-raiz-da-icp-brasil-pdf>
* [RFC6749] - The OAuth 2.0 Authorization Framework [RFC6749]: <https://tools.ietf.org/html/rfc6749>
* [BCB-IN134] - Manual de Segurança do Open Finance: <https://www.in.gov.br/web/dou/-/instrucao-normativa-bcb-n-134-de-22-de-julho-de-2021-3345585364>
* [RFC2818] - HTTP Over TLS: <https://datatracker.ietf.org/doc/html/rfc2818>
* [RFC5246] - The Transport Layer Security (TLS) Protocol Version 1.2 <https://www.rfc-editor.org/rfc/rfc5246.txt>

# Terms and definitions

For the purpose of this document, the terms defined in [RFC5280], [BCP195], [RFC8705], e ISO29100 apply.

# Glossary

* **API** – Application Programming Interface
* **DCR** – Dynamic Client Registration
* **HTTP** – Hyper Text Transfer Protocol
* **ICP** - Infraestrutura de Chave Públicas Brasileira
* **SS** – Software Statement
* **SSA** – Software Statement Assertion
* **TLS** – Transport Layer Security
* **mTLS** – Mutual Transport Layer Security

# Open Finance Brasil Certificate Standards

## Introduction

The Open Finance Brazil ecosystem makes use of chains of certificates and TLS protocol to guarantee the confidentiality, authentication and integrity of the communication channel used by the APIs of the participating organizations, as well as the customers of each of the participants.

The certificates used by Open Finance Brasil are also required to authenticate applications through oAuth 2.0 mTLS or private_key_jwt, in addition to being used to perform the payload signature using JWS. Another important attribution of certificates is to authenticate and present a secure channel to the end user in the act of authentication and use of services provided by the participating organizations.

## ICP-Brasil Certificates

Certificates issued by Certifying Authorities authorized by ICP-Brasil are only used for communication between entities participating in the Open Finance Brasil ecosystem.

The certificate issuing and revocation processes are responsibility of the Certifate Authorities themselves, being regulated by Certification Practice Statements, and supervised by the Management Committee of the Brazilian Public Key Infrastructure (Comitê Gestor da Infraestrutura de Chaves Públicas Brasileira).

The practices, processes, availability and values practiced by the Certification Authorities are not responsibility of the Initial Structure of Open Finance Brasil.

**Algorithms**

All certificates issued by ICP-Brasil must have the following characteristics:

* Type A of ICP-Brasil;
* Key Algorithms: RSA 2048 bits;
* Message Digest: SHA 256 bits.

**Participating Certificate Authorities**

The following certifying authorities carried out the onboard process for Open Finance Brasil and are authorized to issue Open Finance Brasil certificates using the level 1 certificates listed here:

* [CertiSign](https://www.gov.br/iti/pt-br/assuntos/repositorio/ac-certisign) (Chain v5 e v10)
* [Serasa](https://www.gov.br/iti/pt-br/assuntos/repositorio/ac-serasa-acp) (Chain v5 e v10)
* [Serpro](https://www.gov.br/iti/pt-br/assuntos/repositorio/ac-serpro-de-1deg-nivel) (Chain v5 e v10)
* [Soluti](https://www.gov.br/iti/pt-br/assuntos/repositorio/ac-soluti) (Chain v5 e v10)

Only the certificates indicated with "`Situação: válido`" (which mean "`status: valid`") in these ITI repositories referenced above, which are Chain v5 and v10, should be accepted by the servers of the Open Finance Brasil ecosystem.

### Server Certificate

The Server Certificate must be issued to protect and authenticate the TLS channel used by the APIs that will be consumed by client applications of organizations participating in Open Finance.

The certificate standard used must follow the existing certificate issuing practices of "CERTIFICATE FOR WEB SERVER – ICP-Brasil".

The server certificate shall be sent with the intermediate chain, according to [RFC5246] (items 7.4.2).

### Client Certificate

Client Application Certificates (Transport) are used to authenticate the mTLS channel and to authenticate the client application through oAuth2.0 mTLS or private_key_jwt, according to the application registration performed by the Dynamic Client Registration process with the transmitting organization. Regarding mTLS, the client certificate shall be sent with the intermediate chain, according to [RFC5246] (items 7.4.2 and 7.4.6).

To issue a Client Certificate, the participating organization in Open Finance Brasil must register the application in the Directory Service through the Software Statement Assertion issue process, and thus have already obtained the Software Statement ID value.

#### Open Finance Brasil Attributes

* **serialNumber:** National Register of Legal Personnel (CNPJ) of the legal entity holding the certificate and associated with the UID attribute and Software Statement ID, during validation with the Directory Service of Open Finance Brasil;
* **organizationIdentifier:** Participant Code associated with the CNPJ listed in the Directory Service of Open Finance Brasil; For certificates issued until August 31 the field used for this information is **organizationalUnitName**.
* **UID:** Software Statement ID registered in the Directory Service of Open Finance Brasil and belonging to the CNPJ and Participant Code.

The Client Certificate must be issued through the V10 chain, and must contain the following attributes:

**Distinguished Name**

* **businessCategory (OID 2.5.4.15):** Type of business category, which must contain: "Private Organization" or "Government Entity" or "Business Entity" or "Non-Commercial Entity"
* **jurisdictionCountryName (OID: 1.3.6.1.4.1.311.60.2.1.3):** BR
* **serialNumber (OID 2.5.4.5):** CNPJ
* **countryName (OID 2.5.4.6):** BR
* **organizationName (OID 2.5.4.10):** Company Name
* **stateOrProvinceName (OID 2.5.4.8):** Federation unit of the certificate holder's physical address
* **localityName (OID 2.5.4.7):** City of the holder's physical address
* **organizationIdentifier (OID 2.5.4.97):** Participant Code associated with the CNPJ listed in the Directory Service of Open Finance Brasil. *For certificates issued until August 31:  **organizationalUnitName (OID 2.5.4.11):** Participant Code associated with the CNPJ listed in the Directory Service of Open Finance Brasil*
* **UID (OID 0.9.2342.19200300.100.1.1):** Software Statement ID generated by Open Finance Brasil Directory
* **commonName (OID 2.5.4.3):** FQDN or Wildcard

**Certificate Extensions**

* **keyUsage:** critical,digitalSignature,keyEncipherment
* **extendedKeyUsage:** clientAuth

**Subject Alternative Name**

* **dNSName:** FQDN or Wildcard

### Signature Certificate

Signature Certificates are used to perform payload signature through the use of JWS (JSON Web Signature).

#### Open Finance Brasil Attributes Present in the Certificate

* **UID:** Participant Code associated with the CNPJ listed in the Directory Service of Open Finance Brasil;
* **commonName:** Company Name registered in the Directory Service of Open Finance Brasil and belonging to the CNPJ and Participant Code.

The Signature Certificate must be issued through the V5 chain, and must contain the following attributes:

**Distinguished Name**

* **UID (OID 0.9.2342.19200300.100.1.1):** Participant Code associated with the CNPJ listed in the Directory Service of Open Finance Brazil
* **countryName (OID 2.5.4.6):** BR
* **organizationName (OID 2.5.4.10):** ICP-Brasil
* **organizationalUnitName (OID 2.5.4.11):** Certificate Authority Name
* **organizationalUnitName (OID 2.5.4.11):** CNPJ of the Registration Authority
* **organizationalUnitName (OID 2.5.4.11):** Type of identification used (in person, videoconference or digital certificate)
* **commonName (OID 2.5.4.3):** Company Name

**Certificate Extensions**

* **keyUsage:** critical,digitalSignature,nonRepudiation

**Subject Alternative Name**

* **otherName (OID 2.16.76.1.3.2 – ICP-Brasil):** Name of the person responsible for the certificate
* **otherName (OID 2.16.76.1.3.3 – ICP-Brasil):** National Register of Legal Entities (CNPJ) of the legal entity holding the certificate;
* **otherName (OID 2.16.76.1.3.4 – ICP-Brasil):** Responsible for the certificate of legal entity holding the certificate (date of birth, CPF, PIS/PASEP/CI, RG);
* **otherName (OID 2.16.76.1.3.7 – ICP-Brasil):** INSS Specific Registry Number (CEI) of the legal entity holding the certificate.

### Front-End Certificates

Front-End certificates are utilized to make services available, generally web pages, using TLS, that are acessible by the end users. Due to their function, and in order to guarantee better interoperability, those certificates must be of the type EV (Extended Validation) and must be generated by a valid certificate authority, following definitions of RFC 5280 e RFC 2818, in conformance with WebTrust principles and criteria.

### About certificates for exchanging information between authorized institutions and partners (non-participating)

According to section IV of Joint Resolution No. 1 of May 4, 2020, the establishment of bilateral partnerships between authorized institutions and partners is an arrangement provided for in the regulation which must observe, where applicable, the same standards and certificates requirements that are applicable to exchange of information between participating institutions.

In accordance with §2 of Art. 10 of Provisional Measure 2200-2 of August 24, 2001 and with the provisions of item 3.12 in BCB Normative Instruction No. 134, for bilateral communication between institutions and partners, the use is authorized, by mutual agreement between the parties, of a private PKI, provided that the requirements of this _profile for security certificates_ are observed, including their formatting, algorithms and established attributes.

The values for filling in the attributes required in this specification, but not applicable to the partner, should be defined in common agreement between the authorized institution and the partner, which does not exempt the authorized institution from the responsibility for filling it in properly.

# Acknowledgements

Thanks to all who have set the foundations for secure and safe data sharing through the formation of the OpenID Foundation FAPI Working Group, the Open Finance Brasil GT Security and to the pioneers who will stand on their shoulders.

The following people contributed to this document:

* João Rodolfo Vieira (Itaú)
* José Michael Dias (Grupo Pan)
* Marcos Rodrigues (Itaú)
* Nic Marcondes (Quanto)
* Ralph Bragg (Raidiam)

# Notices

Copyright (c) 2022 Open Finance Brasil Initial Structure.

The Open Finance Brasil Initial Structure (OFBIS) grants to any Contributor, developer, implementer, or other interested party a non-exclusive, royalty-free, worldwide copyright license to reproduce, prepare derivative works from, distribute, perform and display, this Implementers Draft or Final Specification solely for the purposes of (i) developing specifications, and (ii) implementing Implementers Drafts and Final Specifications based on such documents, provided that attribution be made to the OFBIS as the source of the material, but that such attribution does not indicate an endorsement by the OFBIS.

The technology described in this specification was made available from contributions from various sources, including members of the OpenID Foundation, the Open Finance Brasil GT Security Working Group and others. Although the Open Finance Brasil Initial Structure has taken steps to help ensure that the technology is available for distribution, it takes no position regarding the validity or scope of any intellectual property or other rights that might be claimed to pertain to the implementation or use of the technology described in this specification or the extent to which any license under such rights might or might not be available; neither does it represent that it has made any independent effort to identify any such rights. The Open Finance Brasil Initial Structure and the contributors to this specification make no (and hereby expressly disclaim any) warranties (express, implied, or otherwise), including implied warranties of merchantability, non-infringement, fitness for a particular purpose, or title, related to this specification, and the entire risk as to implementing this specification is assumed by the implementer. The Open Finance Brasil Intellectual Property Rights policy requires contributors to offer a patent promise not to assert certain patent claims against other contributors and against implementers. The Open Finance Brasil Initial Structure invites any interested party to bring to its attention any copyrights, patents, patent applications, or other proprietary rights that may cover technology that may be required to practice this specification.


# Appendix

## Configuration Template for Client Certificate - OpenSSL - For certificates issued until August 31, 2022

```
[req]
default_bits = 2048
default_md = sha256
encrypt_key = yes
prompt = no
string_mask = nombstr
distinguished_name = client_distinguished_name
req_extensions = req_cert_extensions

[ client_distinguished_name ]
businessCategory = <type of organization>
jurisdictionCountryName = BR
serialNumber = <CNPJ>
countryName = BR
organizationName = <Company Name>
stateOrProvinceName = <UF>
localityName = <City>
organizationalUnitName = <Participant Code>
UID = <Software Statement ID issued by the Directory>
commonName = <FQDN|Wildcard>

[ req_cert_extensions ]
basicConstraints = CA:FALSE
subjectAltName = @alt_name
keyUsage = critical,digitalSignature,keyEncipherment
extendedKeyUsage = clientAuth

[ alt_name ]
DNS = <FQDN|Wildcard>
```

## Configuration Template for Client Certificate - OpenSSL - For certificates issued after August 31, 2022

```
oid_section = OIDs

[req]
default_bits = 2048
default_md = sha256
encrypt_key = yes
prompt = no
string_mask = nombstr
distinguished_name = client_distinguished_name
req_extensions = req_cert_extensions

[ OIDs ]
organizationIdentifier = 2.5.4.97

[ client_distinguished_name ]
businessCategory = <type of organization>
jurisdictionCountryName = BR
serialNumber = <CNPJ>
countryName = BR
organizationName = <Company Name>
stateOrProvinceName = <UF>
localityName = <City>
organizationIdentifier = OFBBR-<Participant Code>
UID = <Software Statement ID issued by the Directory>
commonName = <FQDN|Wildcard>

[ req_cert_extensions ]
basicConstraints = CA:FALSE
subjectAltName = @alt_name
keyUsage = critical,digitalSignature,keyEncipherment
extendedKeyUsage = clientAuth

[ alt_name ]
DNS = <FQDN|Wildcard>
```

## Configuration Template for Signature Certificate - OpenSSL

```
[req]
default_bits = 2048
default_md = sha256
encrypt_key = yes
prompt = no
string_mask = nombstr
distinguished_name = client_distinguished_name
req_extensions = req_cert_extensions

[ client_distinguished_name ]
UID = <Participant Code>
countryName = BR
organizationName = ICP-Brasil
0.organizationalUnitName = <Certificate Authority>
1.organizationalUnitName = <CNPJ of the Registration Authority>
2.organizationalUnitName = <Validation type>
commonName = <Company Name>

[ req_cert_extensions ]
basicConstraints = CA:FALSE
subjectAltName = @alt_name
keyUsage = critical,digitalSignature,nonRepudiation

[ alt_name ]
otherName.0 = 2.16.76.1.3.2;PRINTABLESTRING:<Name of the person responsible for the organization>
otherName.1 = 2.16.76.1.3.3;PRINTABLESTRING:<CNPJ>
otherName.2 = 2.16.76.1.3.4;PRINTABLESTRING:<CPF/PIS/RF of the responsible person>
otherName.3 = 2.16.76.1.3.7;PRINTABLESTRING:<INSS Number>
```

## Endpoints vs Certificate type and mTLS requirements
Below we present which endpoints can be published utilizing the EV certificate as consent authentication and the endpoints of private/bussiness API authentication using the ICP certificate. You will also be able to check which endpoints must protect its connections using mTLS.

ASPSP may choose the certificate that should be adopted for Phase 1 endpoints, which, by nature, are publicly accessible.

| OFB Phase | group                  | endpoint                                   | certificate type       | mTLS     |
|-----------|------------------------|---------------------------------------|-------------------|----------|
| NA        | OIDC                   | .well-known/openid-configuration      | EV or ICP WEB SSL |          |
| NA        | OIDC                   | jwks_uri                              | EV or ICP WEB SSL |          |
| NA        | OIDC                   | authorization_endpoint                | EV                |          |  
| NA        | OIDC                   | token_endpoint                        | ICP WEB SSL       | Required |
| NA        | OIDC                   | userinfo_endpoint                     | ICP WEB SSL       | Required |
| NA        | OIDC                   | pushed_authorization_request_endpoint | ICP WEB SSL       | Required |
| NA        | DCR                    | registration_endpoint                 | ICP WEB SSL       | Required |
| NA        | OIDC                   | revocation_endpoint                   | ICP WEB SSL       | Required |
| 2         | Consentimentos         | /consents/*                           | ICP WEB SSL       | Required |
| 2         | Resources              | /resources/*                          | ICP WEB SSL       | Required |
| 2         | Dados                  | /customers/*                          | ICP WEB SSL       | Required |
| 2         | Cartão                 | /credit-cards-accounts/*              | ICP WEB SSL       | Required |
| 2         | Contas                 | /accounts/*                           | ICP WEB SSL       | Required |
| 2         | Empréstimos            | /loans/*                              | ICP WEB SSL       | Required |
| 2         | Financiamentos         | /financings/*                         | ICP WEB SSL       | Required |
| 2         | Adiantamento           | /unarranged-accounts-overdraft/*      | ICP WEB SSL       | Required |
| 2         | Direitos   Creditórios | /invoice-financings/*                 | ICP WEB SSL       | Required |
| 3         | Pagamentos             | /payments/*                           | ICP WEB SSL       | Required |

## Open Finance Client Certificate Subject DN Pattern - After January 19, 2023 {#subjectDNtemplates}
On January 19, 2023 the sequence and encoding of the Subject DN used in Open Finance Client Certificates was standardized. Below is determined the sequence and coding of how the attributes of the certificates should be presented in the Subject DN.

The coexistence period between the different types of Subject DN must be considered, so the participants of the ecosystem should not implement blocking controls that limit the use of only certificates with the Subject DN standardized below. Participants must ensure that the other DN standards already in use continue to function until the end of the coexistence period, a date yet to be determined.

Special attention is required from the participants during the Subject DN generation process, as below are presented Subject DN and RDN formats. The Ecosystem expects the use of RDN in compliance with RFC4514.

When in doubt:
- check the JWKS of your `software-id` application
- check the KID of the certificate you want the Subject DN for, customize the URL and access: ``https://keystore.directory.openbankingbrasil.org.br/<org-id>/<software-ID>/transport.jwks ``

``Example: https://keystore.directory.openbankingbrasil.org.br/9c721898-9ce0-50f1-bf85-05075557850b/793c382e-edb1-4a64-b5c5-9e27366099b9/transport.jwks``
- search for the KID of the certificate, then search for Claim: x5dn


### Public Key of Certificate Example: 
https://keystore.directory.openbankingbrasil.org.br/d7384bd0-842f-43c5-be02-9d2b2d5efc2c/bc97b8f0-cae0-4f2f-9978-d93f0e56a833/wdHeYDz0v4m9tzxpNjsfovbl1fKCFAUvsSIs-ljM4xU.pem


### Example Subject Distinguished Name of the Certificate - Human readable:
```
subject=businessCategory = Private Organization, jurisdictionC = BR, serialNumber = 43142666000197, C = BR, O = Chicago Advisory Partners, ST = SP, L = Sao Paulo, organizationIdentifier = OFBBR-d7384bd0-842f-43c5-be02-9d2b2d5efc2c, UID = bc97b8f0-cae0-4f2f-9978-d93f0e56a833, CN = web.conftpp.directory.openbankingbrasil.org.br
```

### Relative Distinguished Name (RDN) - Human readable:
```
subject=CN=web.conftpp.directory.openbankingbrasil.org.br,UID=bc97b8f0-cae0-4f2f-9978-d93f0e56a833,organizationIdentifier=OFBBR-d7384bd0-842f-43c5-be02-9d2b2d5efc2c,L=Sao Paulo,ST=SP,O=Chicago Advisory Partners,C=BR,serialNumber=43142666000197,jurisdictionC=BR,businessCategory=Private Organization
```

### Relative Distinguished Name (RDN) using OID - ANS.1:
```
subject=2.5.4.3=#0C2E7765622E636F6E667470702E6469726563746F72792E6F70656E62616E6B696E6762726173696C2E6F72672E6272,0.9.2342.19200300.100.1.1=#0C2462633937623866302D636165302D346632662D393937382D643933663065353661383333,2.5.4.97=#0C2A4F464242522D64373338346264302D383432662D343363352D626530322D396432623264356566633263,2.5.4.7=#0C0953616F205061756C6F,2.5.4.8=#0C025350,2.5.4.10=#0C194368696361676F2041647669736F727920506172746E657273,2.5.4.6=#13024252,2.5.4.5=#130E3433313432363636303030313937,1.3.6.1.4.1.311.60.2.1.3=#13024252,2.5.4.15=#0C1450726976617465204F7267616E697A6174696F6E
```

### Subject DN in RDN - According to RFC4514 - Open Finance Brazil Ecosystem Standard:
```
CN=web.conftpp.directory.openbankingbrasil.org.br,UID=bc97b8f0-cae0-4f2f-9978-d93f0e56a833,2.5.4.97=#0c2a4f464242522d64373338346264302d383432662d343363352d626530322d396432623264356566633263,L=Sao Paulo,ST=SP,O=Chicago Advisory Partners,C=BR,2.5.4.5=#130e3433313432363636303030313937,1.3.6.1.4.1.311.60.2.1.3=#13024252,2.5.4.15=#0c1450726976617465204f7267616e697a6174696f6e
```

### Table with RDN and details of the OIDs and Encodings.
| RDN Order | OID | Attribute | ASN.1 - Bit String | Enconding |
|--------------|-----|----------|-------------------|-------------|
| 1 | 2.5.4.3 | CN | #0C | UTF8 | 
| 2 | 0.9.2342.19200300.100.1.1 | UID | #0C | UTF8 | 
| 3 | 2.5.4.97 | organizationIdentifier | #0C | UTF8 | 
| 4 | 2.5.4.7 | L | #0C | UTF8 | 
| 5 | 2.5.4.8 | ST | #0C | UTF8 | 
| 6 | 2.5.4.10 | O | #0C | UTF8 | 
| 7 | 2.5.4.6 | C | #13 | PrintableString | 
| 8 | 2.5.4.5 | serialNumber | #13 | PrintableString | 
| 9 | 1.3.6.1.4.1.311.60.2.1.3 | jurisdictionCountryName | #13 | PrintableString | 
| 10 | 2.5.4.15 | businessCategory | #0C | UTF8 | 
