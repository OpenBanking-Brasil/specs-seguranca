%%%

    #
    # Open Banking Brasil Certificate Standards 1.0
    # (open-banking-brasil-certificate-standards-1_ID1)
    #
    #

    title = "Open Banking Brasil Certificate Standards 1.0"
    abbrev = "OBB-CERT-1-ID1"
    ipr = "none"
    workgroup = "Open Banking Brasil GT Security"
    keyword = ["FAPI", "CERTIFICATES", "Open Banking Brasil GT Security"]

    [seriesInfo]
    name = "Internet-Draft"
    status = "standard"
    value = "open-banking-brasil-certificate-standards-1_ID1"

    [[author]]
    initials = "GT"
    surname = "Segurança"
    fullname = "GT Segurança"
    organization = "Estrutura Inicial do Open Banking Brasil"
    abbrev = "EIOBB"
      [author.address]
      email = "gt-seguranca@openbankingbr.org"
      uri = "https://openbankingbrasil.org.br/"
%%%

.# The English version of this document is Outdated
Please refer to the [Portuguese version](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-certificate-standards-1_ID1-ptbr.html) for up to date information.

.# Foreword

Este documento também está disponível em [português](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-certificate-standards-1_ID1-ptbr.html).

The Open Banking Brasil Initial Structure is responsible for creating standards and specifications necessary to meet the requirements and obligations of the Brasil Open Banking Legislation as originally outlined by the [Brasil Central Bank](https://www.bcb.gov.br/content/config/Documents/BCB_Open_Banking_Communique-April-2019.pdf). There is a possibility that some of the elements of this document may be the subject to patent rights. OBBIS shall not be held responsible for identifying any or all such patent rights.

.# Objective

Specify the set of necessary certificates that must be used by participating organizations in Open Banking Brasil to ensure interoperability for validation, confidentiality, integrity and non-repudiation among participants, as well as for users and consumers of these entities. The public in this class are entities participating in Open Banking Brasil that issue certificates to authenticate themselves with other entities, as well as offer their customers a secure authentication channel.

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

This document specifies the types of certificates required for:

* Mutually authenticate (MTLS - Mutual TLS) participants' applications;
* Message Signature (JWS - JSON Web Signature) applications to ensure authenticity and non-repudiation of messages between participants;
* Provide a safe and reliable channel for Open Banking Brasil customers;
* Authenticate participants in the Open Banking Brasil Participant Directory.

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
* [OBB-FAPI] - Open Banking Brasil Financial-grade API Security Profile 1.0 [OBB-FAPI]: <https://github.com/OpenBanking-Brasil/specs-seguranca/open-banking-brasil-financial-api-1_ID3.html>
* [OBB-FAPI-DCR] - Open Banking Brasil Financial-grade API Dynamic Client Registration Profile 1.0 [OBB-FAPI-DCR]: <https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-dynamic-client-registration-1_ID2.html
* [DOC-ICP-01] - DECLARAÇÃO DE PRÁTICAS DE CERTIFICAÇÃO DA AUTORIDADE CERTIFICADORA RAIZ DA ICP-BRASIL: <https://www.gov.br/iti/pt-br/centrais-de-conteudo/doc-icp-01-v-5-2-dpc-da-ac-raiz-da-icp-brasil-pdf>
* [RFC6749] - The OAuth 2.0 Authorization Framework [RFC6749]: <https://tools.ietf.org/html/rfc6749>
* [BCB-IN134] - Manual de Segurança do Open Banking: <https://www.in.gov.br/web/dou/-/instrucao-normativa-bcb-n-134-de-22-de-julho-de-2021-3345585364>
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

# Open Banking Brasil Standard

## Introduction

The Open Banking Brazil ecosystem makes use of chains of certificates and TLS protocol to guarantee the confidentiality, authentication and integrity of the communication channel used by the APIs of the participating organizations, as well as the customers of each of the participants.

The certificates used by Open Banking Brasil are also required to authenticate applications through oAuth 2.0 mTLS or private_key_jwt, in addition to being used to perform the payload signature using JWS. Another important attribution of certificates is to authenticate and present a secure channel to the end user in the act of authentication and use of services provided by the participating organizations.

## ICP-Brasil Certificates

Certificates issued by Certifying Authorities authorized by ICP-Brasil are only used for communication between entities participating in the Open Banking Brasil ecosystem.

The certificate issuing and revocation processes are responsibility of the Certifate Authorities themselves, being regulated by Certification Practice Statements, and supervised by the Management Committee of the Brazilian Public Key Infrastructure (Comitê Gestor da Infraestrutura de Chaves Públicas Brasileira).

The practices, processes, availability and values practiced by the Certification Authorities are not responsibility of the Initial Structure of Open Banking Brasil.

**Algorithms**

All certificates issued by ICP-Brasil must have the following characteristics:

* Type A of ICP-Brasil;
* Key Algorithms: RSA 2048 bits;
* Message Digest: SHA 256 bits.

### Server Certificate

The Server Certificate must be issued to protect and authenticate the TLS channel used by the APIs that will be consumed by client applications of organizations participating in Open Banking.

The certificate standard used must follow the existing certificate issuing practices of "CERTIFICATE FOR WEB SERVER – ICP-Brasil".

The server certificate shall be sent with the intermediate chain, according to [RFC5246] (items 7.4.2).

### Client Certificate

Client Application Certificates (Transport) are used to authenticate the mTLS channel and to authenticate the client application through oAuth2.0 mTLS or private_key_jwt, according to the application registration performed by the Dynamic Client Registration process with the transmitting organization. Regarding mTLS, the client certificate shall be sent with the intermediate chain, according to [RFC5246] (items 7.4.2 and 7.4.6).

To issue a Client Certificate, the participating organization in Open Banking Brasil must register the application in the Directory Service through the Software Statement Assertion issue process, and thus have already obtained the Software Statement ID value.

#### Open Banking Brasil Attributes

* **serialNumber:** National Register of Legal Personnel (CNPJ) of the legal entity holding the certificate and associated with the UID attribute and Software Statement ID, during validation with the Directory Service of Open Banking Brasil;
* **organizationalUnitName:** Participant Code associated with the CNPJ listed in the Directory Service of Open Banking Brasil;
* **UID:** Software Statement ID registered in the Directory Service of Open Banking Brasil and belonging to the CNPJ and Participant Code.

The Client Certificate must be issued through the V10 chain, and must contain the following attributes:

**Distinguished Name**

* **businessCategory (OID 2.5.4.15):** Type of business category, which must contain: "Private Organization" or "Government Entity" or "Business Entity" or "Non-Commercial Entity"
* **jurisdictionCountryName (OID: 1.3.6.1.4.1.311.60.2.1.3):** BR
* **serialNumber (OID 2.5.4.5):** CNPJ
* **countryName (OID 2.5.4.6):** BR
* **organizationName (OID 2.5.4.10):** Company Name
* **stateOrProvinceName (OID 2.5.4.8):** Federation unit of the certificate holder's physical address
* **localityName (OID 2.5.4.7):** City of the holder's physical address
* **organizationalUnitName (OID 2.5.4.11):** Participant Code associated with the CNPJ listed in the Directory Service of Open Banking Brasil
* **UID (OID 0.9.2342.19200300.100.1.1):** Software Statement ID generated by Open Banking Brasil Directory
* **commonName (OID 2.5.4.3):** FQDN or Wildcard

**Certificate Extensions**

* **keyUsage:** critical,digitalSignature,keyEncipherment
* **extendedKeyUsage:** clientAuth

**Subject Alternative Name**

* **dNSName:** FQDN or Wildcard

### Signature Certificate

Signature Certificates are used to perform payload signature through the use of JWS (JSON Web Signature).

#### Open Banking Brasil Attributes Present in the Certificate

* **UID:** Participant Code associated with the CNPJ listed in the Directory Service of Open Banking Brasil;
* **commonName:** Company Name registered in the Directory Service of Open Banking Brasil and belonging to the CNPJ and Participant Code.

The Signature Certificate must be issued through the V5 chain, and must contain the following attributes:

**Distinguished Name**

* **UID (OID 0.9.2342.19200300.100.1.1):** Participant Code associated with the CNPJ listed in the Directory Service of Open Banking Brazil
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

#### Participating Certificate Authorities

The following certifying authorities carried out the onboard process for Open Banking Brasil and are authorized to issue Open Banking Brasil certificates using the level 1 certificates listed here:

* CertiSign
    * Root ICP [V5](http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv5.crt), Fingerprint SHA256: [94:EB:D7:63:DC:D3:9A:85:87:48:D1:43:38:54:F7:D4:72:B1:DD:47:DD:D2:70:43:23:6F:83:80:2F:AA:F1:AB](http://acraiz.icpbrasil.gov.br/credenciadas/CERTISIGN/v5/p/AC_Certisign_G7.crt)
    * Root ICP [V10](http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv10.crt), Fingerprint SHA256: [59:6D:25:3B:A2:BE:B7:F1:66:C4:F5:8D:08:78:FB:28:2E:30:8A:28:2C:41:62:69:40:18:BE:5A:17:49:74:19](http://acraiz.icpbrasil.gov.br/credenciadas/CERTISIGN/v10/p/AC-CERTISIGN-ICP-BRASIL-SSL.crt)
    * Root ICP [V10](http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv10.crt), Fingerprint SHA256: [55:A4:89:F6:0F:78:5B:EB:E0:42:E9:9A:69:AC:8E:C3:3C:9F:17:37:4C:C4:B7:66:F6:04:CF:70:79:EA:09:BA](http://acraiz.icpbrasil.gov.br/credenciadas/CERTISIGN/v10/p/AC-CERTISIGN-ICP-BRASIL-SSL-G2.crt)
    * Root ICP [V11](http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv11.crt), Fingerprint SHA256: [EE:A1:8A:57:C0:91:AD:61:E1:A2:4C:1C:27:3C:47:74:C2:5A:51:DF:67:00:AD:CB:36:10:41:73:FB:9D:A4:D8](http://acraiz.icpbrasil.gov.br/credenciadas/CERTISIGN/v11/p/AC-CERTISIGN-ICP-BRASIL-CODE.crt)
* Serasa
    * Root ICP [V5](http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv5.crt), Fingerprint SHA256: [48:E3:35:02:C1:11:39:41:03:20:0A:6F:BB:7D:91:7B:C0:2B:9B:24:41:54:5A:23:0F:B0:B7:FD:37:85:DF:5E](http://acraiz.icpbrasil.gov.br/credenciadas/SERASA_ACP/v10/p/Serasa_Autoridade_Certificadora_Principal_v5.crt)
    * Root ICP [V10](http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv10.crt), Fingerprint SHA256: [50:D0:E2:8B:7B:1A:13:CB:2D:E7:BF:F8:12:A9:3B:74:BE:D4:C5:07:FD:4A:06:20:E6:B6:D8:8E:F6:76:10:53](http://acraiz.icpbrasil.gov.br/credenciadas/SERASA_ACP/v10/p/AC-SERASA-SSL-EV.crt)
    * Root ICP [V10](http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv10.crt), Fingerprint SHA256: [95:E0:F8:9A:8E:0E:12:E3:E4:1D:6D:5A:AB:44:72:D7:32:1C:2E:BC:D9:29:0E:78:D6:16:97:CD:F5:D4:3D:66](http://acraiz.icpbrasil.gov.br/credenciadas/SERASA_ACP/v10/p/AC-SERASA-SSL-EV-V2.crt)
* Serpro
    * Root ICP [V5](http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv5.crt), Fingerprint SHA256: [35:33:05:81:E9:22:4B:72:CB:34:0F:A4:4B:8F:57:DA:79:AC:0A:3C:95:16:0C:BD:45:19:EC:C1:1B:AB:5C:12](http://acraiz.icpbrasil.gov.br/credenciadas/SERPRO/v5/p/Autoridade_Certificadora_Serpro_v4.crt)
    * Root ICP [V10](http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv10.crt), Fingerprint SHA256: [08:FC:94:2D:51:76:E5:68:AC:BE:F9:C5:95:F3:6A:20:DE:6A:CF:9E:A3:0C:6F:5F:CE:DD:48:21:6E:D5:B0:70](http://acraiz.icpbrasil.gov.br/credenciadas/SERPRO/v10/p/AC-SERPRO-SSLv1-v10.crt)
* Soluti
    * Root ICP [V2](http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv2.crt), Fingerprint SHA256: [56:30:5E:CE:76:E0:A9:E1:23:54:2F:1A:BA:11:82:9F:C7:53:59:D9:36:8F:AD:24:65:3D:AE:30:B5:2F:72:ED](http://acraiz.icpbrasil.gov.br/credenciadas/SOLUTI/v2/p/AC_Soluti.crt)
    * Root ICP [V5](http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv5.crt), Fingerprint SHA256: [86:D4:58:36:5C:FA:BF:FA:E4:54:2A:B9:8B:99:39:0F:51:9E:C9:D8:31:81:2B:53:00:45:C4:12:AE:6E:B5:B6](http://acraiz.icpbrasil.gov.br/credenciadas/SOLUTI/v5/p/AC_Soluti_v5.crt)
    * Root ICP [V10](http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv10.crt), Fingerprint SHA256: [16:9C:BF:05:47:F3:DF:C4:E6:3E:4A:F9:E0:25:5A:76:03:77:78:FF:5B:8F:4A:53:6A:BD:FF:3A:91:DF:C3:C5](http://acraiz.icpbrasil.gov.br/credenciadas/SOLUTI/v10/p/AC-SOLUTI-SSL-EV.crt)
    * Root ICP [V11](http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv11.crt), Fingerprint SHA256: [05:7C:D2:C0:18:F6:65:9D:20:D3:40:20:BC:48:86:7C:B1:96:9A:59:4D:B9:62:F9:36:79:0F:02:2D:A4:79:E2](http://acraiz.icpbrasil.gov.br/credenciadas/SOLUTI/v11/p/AC-SOLUTI-CS-EV.crt)

### Front-End Certificates

x509 Certificates that are used to secure communication channels between end-users browsers and banks services must be trusted be issued by a certificate authority certified by the CA Browser Forum. In addition, and to ensure greater interoperability, certificates must meet the requirements for CAB Forum EV (Extended Validation), following the rules defined in RFC 5280 and RFC 2818, in accordance with the principles and WebTrust criteria.

### About certificates for exchanging information between authorized institutions and partners (non-participating)

According to section IV of Joint Resolution No. 1 of May 4, 2020, the establishment of bilateral partnerships between authorized institutions and partners is an arrangement provided in the regulation and which must observe, where applicable, the same standards and certificates requirements that are applicable to exchange of information between participating institutions.

In accordance with §2 of Art. 10 of Provisional Measure 2200-2 of August 24, 2001 and with the provisions of item 3.12 in BCB Normative Instruction No. 134, for bilateral communication between institutions and partners, the use is authorized, by mutual agreement between the parties, of a private PKI, provided that the requirements of this _profile for security certificates_ are observed, including their formatting, algorithms and established attributes.

The values for filling in the attributes required in this specification, but not applicable to the partner, should be defined in common agreement between the authorized institution and the partner, which does not exempt the authorized institution from the responsibility for filling it in properly.

# Acknowledgements

With thanks to all who have set the foundations for secure and safe data sharing through the formation of the OpenID Foundation FAPI Working Group, the Open Banking Brasil GT Security and to the pioneers who will stand on their shoulders.

The following people contributed to this document:

* João Rodolfo Vieira (Itaú)
* José Michael Dias (Grupo Pan)
* Marcos Rodrigues (Itaú)
* Nic Marcondes (Quanto)
* Ralph Bragg (Raidiam)

# Notices

Copyright (c) 2022 Open Banking Brasil Initial Structure.

The Open Banking Brasil Initial Structure (OBBIS) grants to any Contributor, developer, implementer, or other interested party a non-exclusive, royalty-free, worldwide copyright license to reproduce, prepare derivative works from, distribute, perform and display, this Implementers Draft or Final Specification solely for the purposes of (i) developing specifications, and (ii) implementing Implementers Drafts and Final Specifications based on such documents, provided that attribution be made to the OBBIS as the source of the material, but that such attribution does not indicate an endorsement by the OBBIS.

The technology described in this specification was made available from contributions from various sources, including members of the OpenID Foundation, the Open Banking Brasil GT Security Working Group and others. Although the Open Banking Brasil Initial Structure has taken steps to help ensure that the technology is available for distribution, it takes no position regarding the validity or scope of any intellectual property or other rights that might be claimed to pertain to the implementation or use of the technology described in this specification or the extent to which any license under such rights might or might not be available; neither does it represent that it has made any independent effort to identify any such rights. The Open Banking Brasil Initial Structure and the contributors to this specification make no (and hereby expressly disclaim any) warranties (express, implied, or otherwise), including implied warranties of merchantability, non-infringement, fitness for a particular purpose, or title, related to this specification, and the entire risk as to implementing this specification is assumed by the implementer. The Open Banking Brasil Intellectual Property Rights policy requires contributors to offer a patent promise not to assert certain patent claims against other contributors and against implementers. The Open Banking Brasil Initial Structure invites any interested party to bring to its attention any copyrights, patents, patent applications, or other proprietary rights that may cover technology that may be required to practice this specification.


# Appendix

## Configuration Template for Client Certificate - OpenSSL

```
[req]
default_bits = 2048
default_md = sha256
encrypt_key = yes
prompt = no
string_mask = utf8only
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
organizationalUnitName = <PArticipante Code>
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
string_mask = utf8only
distinguished_name = client_distinguished_name
req_extensions = req_cert_extensions

[ client_distinguished_name ]
UID = <Código de Participante>
countryName = BR
organizationName = ICP-Brasil
0.organizationalUnitName = <Certificate Authority>
1.organizationalUnitName = <CNPJ da Registration Authority>
2.organizationalUnitName = <Validation type>
commonName = <Company Name>

[ req_cert_extensions ]
basicConstraints = CA:FALSE
subjectAltName = @alt_name
keyUsage = critical,digitalSignature,nonRepudiation

[ alt_name ]
otherName.0 = 2.16.76.1.3.2;PRINTABLESTRING:<Name of the person responsible for the organization>
otherName.1 = 2.16.76.1.3.3;PRINTABLESTRING:<CNPJ>
otherName.2 = 2.16.76.1.3.4;PRINTABLESTRING:<CPF/PIS/RF of responsible person>
otherName.3 = 2.16.76.1.3.7;PRINTABLESTRING:<INSS Number>
```

## Endpoints vs Certificate type and mTLS requirements

ASPSP may choose the certificate that should be adopted for Phase 1 endpoints, which, by nature, are publicly accessible.

| OBB phase | group                  | endpoint                              | certificate type  | mTLS     |
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
