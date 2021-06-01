#####################
# aspsp-user-guide.md
#####################

# Open Banking Brasil

## Ecosystem Overview

At its heart, Open Banking Brasil is a Data Sharing ecosystem where Customers of Banks and other Financial Institutions wish to share their account information or give permission for payments to be executed on their behalf with third party services.

There are a number of roles required to tie any system of Identification, Authentication and Authorization together, irrespective of sector. All these roles are required, but multiple roles may be held by each participant. In general, the end User ("Subject"), is giving a system ("Client") a pass ("Access Token") to access a protected resource held by the Provider ("Resource Server"). This requires the User and Client to be Identified and Authenticated, and for the Authorization to be confirmed.

The exact rules and legal requirements for each role in a specific sector forms a "Trust Framework". Each ecosystem requires a standardised set of rules and legal requirements that covers all the roles and obligations for the above interactions. The combination of who provides which role(s), and the levels to which they must carry out those roles and the standards which they those operations must be performed can be captured in a sector specific "Trust Framework".

Different Trust Frameworks will have different implementation options, but a common Trust Framework is a prerequisite to turn a 'sector' into an 'ecosystem'. A common trust framework significantly reduces complexity and hence costs, increases scalability and interoperability within the sector as well as opening up options for the type of cross-sector standardisation that Open Banking Brasil is pursuing.

Different implementations can be defined for sectors, which have different pros / cons and costs associated for different participants. Each of the proposed implementations could be used for any sector if the right prerequisites are in place. The right solution will depend on the appetite and alignment of each set of participants.

Implementation of a common mechanism for Open Banking Brasil will require a commitment to symmetry across sectors to build sector-specific details into the Trust Framework principles.

Technical choices need to be made to ensure that any implementation provides a strict and consistent base to be credible, but retains the flexibility to adapt to future needs. This implies open-source standards which are widely available, widely understood, and have been tried and tested. In addition, there are a choice of partners who could manage any technical build, meaning any commercial market is maintained.

### Participants in a Data Sharing Ecosystem

In the consumer-focused Open Banking ecosystems we are considering, we have three main players:

* the User (Consumer)
* the Provider (offering core Banking Services)
* and a Third Party Provider (TPP, offering an Open Banking proposition):

In all the cases that follow, we assume:

* A User holds an account for a core service or set of resources from the Provider
* A Third Party offers the User a proposition enabled through Smart Data sharing
* The User provides consent to the Third Party for the purposes of delivering that proposition
* The Provider has obligations to safeguard the User data, but also to share it when instructed.

We also have fourth providers and that is trust service providers which are entities providing technical surety to both Providers (Banks and Third Party Providers (TPPs) that they all authorized to partake in the ecosystem.

The technical **standards** necessary to support the trust framework therefor must address all of the following requirements.

* Identification of all participants in the ecosystem.
* Authentication when required of all participants to each other.
* Authorization confirmation of all participants within a data sharing ecosystem.

The technical **services** necessary to support an ecosystem therefor must enable all of the above requirements **on a continuous and ongoing basis** . Not just at a single point of registration

### Specification Principles and High Level Requirements

Open Banking Brasil has adopted the following high level principles and requirements when it comes to the technical standards

* Consent
  - Customers must always be in control of who has access to their data and for what purposes it is being used.
* Data Minimisation
  - Customers must be able to share just the data that they need to for just as long as is needed.
* Security
  - A formal threat model has been produced assessing all potential weaknesses in communication processes.
  - All identified weaknesses have been addressed.
* Identification
  - All participants must have surety in the identification of all of the actors within the ecosystem.
* Authentication
  - All participants must convey the steps that were taken to Authenticate each participant in the ecosystem and to what level this was performed.
* Integrity and Non Repudiation
  - All participants must be able to prove that messages have not been tampered with and were indeed sent only by a legitimate participant.

In addition to the high level requirements the following principles have also been adopted.

* Don't reinvent the wheel, if a specification exists that is fit for purpose, widely adopted and publicly available. Use it.
* Engage with other standards bodies to learn from past experience regarding what has worked, what has not worked and what can be done better.
* Ensure wide spread industry support and by in to ensure maximum chances of success and most importantly customer safety.
* Solicit feedback early and often and recognise that it will take several iterations to develop a standard as defined by World Trade Organisation processes.
* The Trust Framework underpinning the data sharing ecosystem that is Open Banking Brasil is a technical framework that needs to be flexible enough to allow participants and the ecosystem to innovate, grow and develop whilst remaining interoperable.

All participants must be assured that all actors within the ecosystem are handling their data safely, securely at all times. This requires that all participants publicly test their systems for conformance to the specifications and make available the results of their conformance testing for public scrutiny by other participants.

**This is a requirement that applies to both providers of data (Banks) and consumers of data (TPPs).**

## The Core Security Standards

### The OAuth 2.0 Authorization Framework

The data sharing ecosystem defined by Brazil consists of many different standards all of which revolve around concepts, roles and obligations that were technically defined in the [OAuth 2.0 Authorization Framework.](https://tools.ietf.org/html/rfc6749)

> The OAuth 2.0 authorization framework enables a third-party

application to obtain limited access to an HTTP service, either on

behalf of a resource owner by orchestrating an approval interaction

between the resource owner and the HTTP service, or by allowing the

third-party application to obtain access on its own behalf.

The base OAuth 2.0. specification does not provide by itself enough information in order to meet all of the needs defined by the Open Banking Basil trust framework. Most notably it is missing a way to convey Customer Identity information in a standardized format from a Provider to a Client and the authentication mechanisms that were defined in the original specification are not secure enough to meet the requirements of a highly regulated industry.

### OpenID Connect - The Identity Layer for the Internet

**_This profile inherits all of the obligations of OAuth 2.0_**

> [OpenID Connect](https://openid.net/connect/) is a suite of lightweight specifications that provide a framework for identity interactions via REST like APIs. The simplest deployment of OpenID Connect allows for clients of all types including browser-based, mobile, and javascript clients, to request and receive information about identities and currently authenticated sessions. The specification suite is extensible, allowing participants to optionally also support encryption of identity data, discovery of the OpenID Provider, and advanced session management, including logout.

The OpenID Foundations Connect working group has been the custodian for the internets de-facto Identity Standard for many years working on several specifications that build upon the OAuth 2.0 Authorization Framework adding in supporting features and requirements in order to improve the security of the underlying framework.

[Open ID Connect Core:](https://openid.net/specs/openid-connect-core-1_0.html) Is a profile of OAuth 2.0 meaning it inherits all of the requirements and obligations of [OAuth 2.0](https://tools.ietf.org/html/rfc6749) but defines the concept of an id_token and introduces new authentication mechanisms.

[Open ID Connect Discovery:](https://openid.net/specs/openid-connect-discovery-1_0.html) Introduces the concept of a discovery document that is used by OpenID Connect Providers to advertise how OAuth 2.0 Clients can communicate with it and what features and options the OIDC Provider Supports.

[RFC7591:](https://tools.ietf.org/html/rfc7591) In addition to defining the process for dynamic registartion of OAuth clients, This specification introduces the concept of a [Software Statement](https://tools.ietf.org/html/rfc7591#section-2.3) which can be used to provide information about a a client that is attested by a third party service. Further meta data attributes are also defined in the [OpenID Connect Registration Specification](https://openid.net/specs/openid-connect-registration-1_0.html)

> This specification defines mechanisms for dynamically registering

OAuth 2.0 clients with Authorization Servers. Registration requests 
send a set of desired client metadata values to the Authorization Server. 
The resulting registration responses return a client 
identifier to use at the Authorization Server and the client metadata 
values registered for the client. The client can then use this 
registration information to communicate with the Authorization Server 
using the OAuth 2.0 protocol. This specification also defines a set of common 
client metadata fields and values for clients to use during registration.

[RFC7591:](https://tools.ietf.org/html/rfc7591) This specification defines methods for management of OAuth 2.0 dynamic client registrations for use cases in which the properties of a registered client may need to be changed during the lifetime of the client.

The above specifications are core specifications that are required reading underpin the Open Banking Brasil 
trust framework however they still are insufficient to meet all of the requirements and principles outlined earlier.

### OpenID Financial Grade 1.0 : Baseline

**_This profile inherits all of the obligations of OpenID Connect Core_**

Recognising there were still threats and risks that were not addressed by core OpenID Connect, the Financial Grade Working group focus is create a specification that aims to identify and then address weaknesses in the underlying OpenID Connect specification essentially create a profile for high security use cases.

The Baseline profile was originally intended to more easily implementable by Clients and OpenID Providers at the expense of some security elements and as such does not offer the same degree of protection against request tampering and response tampering.

### OpenID Financial Grade 1.0 : Advanced

**_This profile inherits all of the obligations of OpenID FAPI 1.0: Baseline_**

The current Gold Standard for API Security, the [FAPI 1.0: Advanced profile](https://openid.net/specs/openid-financial-api-part-2-1_0.html) provide a **framework specification** that has been used as a starting point on which to create a specification for Open Banking Brasil.

> This document specifies an advanced security profile of OAuth that is suitable to be used for protecting APIs with high inherent risk. Examples include APIs that give access to highly sensitive data or that can be used to trigger financial transactions (e.g., payment initiation). This document specifies the controls against attacks such as: authorization request tampering, authorization response tampering including code injection, state injection, and token request phishing. Additional details are available in the security considerations section.

![Hierachy of OAuth 2.0 Profiles](https://miro.medium.com/max/700/1*R8d0lkvVRlEMG9WBXCZsdQ.png)

# ASPSP End To End User Guide

## 1.0 Registering a Bank

### 1.1 Directory Overview

The trust framework services provided by Open Banking Brasil provide all of the discovery services necessary for a TPPs and ASPSPs to interact with each other without being required to validate the authenticity of each others Identity, Authorizations, Consumer Offerings (Apps), APIs or Credentials

An Authorization Server or AS as defined by [RFC 6749 - The OAuth 2.0 Authorization Framework](https://tools.ietf.org/html/rfc6749) perform several functions in a Data Sharing ecosystem like Open Banking. Please read ensure that the concepts roles and responsibilities defined in the original RFC are well understood before proceeding. In addition please ensure that the concepts, roles and responsibilities defined in [OpenID Connect Core](https://openid.net/specs/openid-connect-core-1_0.html) and how they extended the concepts defined in RFC 6749 are equally as well understood.

### 1.2 Registering an Authorization Server and OpenID Provider

Banks, typically large banks, will not be a single entity from a technology operations point of view. They may have different brands, security and IT infrastructure for different customer segments or they may have some IT infrastructure that supports multiple brands or customer segments. This means that the technical ecosystem needs to be flexible enough to support a wide variety of Banks Infrastructure Deployments whilst ensuring that the necessary services are discoverable both Third Parties customers that need to interact with it.

A flexible model for advertising authentication/authorization services and the resources that are protected by the AuthN and AuthZ is supported by the Directory.

[Image for Adding new Authorization Server]

[CX/UX Team need to have input here]

* **Customer Friendly Name** - This is will be displayed to customers by TPPs and should be recognisable by the Banks Customers Already.
* **Customer Friendly Logo** - This will be displayed to customers by TPPs to aid brand recognition.
* **Description** - This may be displayed to customers by TPPs to aid brand recognition.
* **Terms of Service** - This is a link to the Banks Terms of Service which may be included by TPPs.
* **Notification WebHook** - Authorization Servers can register a WebHook that will receive pushed updates regarding changes to participants, their software or certificates.
* **OpenID Well Known Document Uri** - Link to the Authorization Server's Discovery Document.

A Bank may choose to have one Authorization Server or many provided that it can satisfy the following requirements.

* A customer can recognise the Authorization Server as a place that they would normally Bank with.
* The Authorization Server can issue tokens for the resource and services that a customer or TPP is looking for.

### 1.2 Registering Resources

Once a Bank has registered an Authorization Server, it needs to advertise what resources, APIs or Services it can provide authorization for.

[Authorization Resources management image]

| Auth Id | Auth Customer Friendly Name | Well Known | Resource | Version |
| --- | --- | --- | --- | --- |
| 1 | Amazing Business Banking | [https://auth.business.amazingbank.org.br/.well-known/openid-configuration](https://auth.business.amazingbank.org.br/.well-known/openid-configuration) | consents | 1 |
| 1 | Amazing Business Banking | [https://auth.business.amazingbank.org.br/.well-known/openid-configuration](https://auth.business.amazingbank.org.br/.well-known/openid-configuration) | business account information | 1 |
| 1 | Amazing Business Banking | [https://auth.business.amazingbank.org.br/.well-known/openid-configuration](https://auth.business.amazingbank.org.br/.well-known/openid-configuration) | payments | 1 |
| 2 | Amazing Banking | [https://auth.amazingbank.org.br/.well-known/openid-configuration](https://auth.amazingbank.org.br/.well-known/openid-configuration) | consents | 1 |
| 2 | Amazing Banking | [https://auth.amazingbank.org.br/.well-known/openid-configuration](https://auth.amazingbank.org.br/.well-known/openid-configuration) | payments | 1 |
| 2 | Amazing Banking | [https://auth.amazingbank.org.br/.well-known/openid-configuration](https://auth.amazingbank.org.br/.well-known/openid-configuration) | account information | 1 |
| 2 | Amazing Banking | [https://auth.amazingbank.org.br/.well-known/openid-configuration](https://auth.amazingbank.org.br/.well-known/openid-configuration) | account information | 2 |
| 3 | Amazing Banking | [https://auth.payments.amazingbank.org.br/.well-known/openid-configuration](https://auth.payments.amazingbank.org.br/.well-known/openid-configuration) | payments consents | 1 |
| 3 | Amazing Banking | [https://auth.payments.amazingbank.org.br/.well-known/openid-configuration](https://auth.payments.amazingbank.org.br/.well-known/openid-configuration) | payments | 1 |

In the above example, Amazing Banking is advertising two services that should be recognisable to customers. "Amazing Business Banking" and "Amazing Banking". These **may or may not be** directly related to "Brands" as different Banks may need to advertise different authentication services even within a sub brand.

In addition the bank advertises what resources each of the Authorization Servers are protecting or offering. In the above example Amazing Banking is supporting both version 1 and version 2 of the account information API and that "Amazing Banking" has two separate authentication and authorization systems for Payments and Account Information .

Correctly advertising what resources are offered by each server is important to achieving the scale envisaged by Brasil Open Banking and critical for ensuring that customers can identify their banking service easily and that TPPs can route customers to the correct Authorization Service based on the resources that protected by each service.

## 2.0 Validating a client registration request

Using OpenID Connect Discovery and the Brasil Open Banking Dynamic Client Registration specification. A TPP can register their application at each of the Authorization Servers available in the ecosystem.

### 2.1 OpenID Connect Registration and OAuth 2.0 Dynamic Client Registration

Please see Open Banking Brasil Dynamic Client Registration Specification Clause X for details.

### 2.2 Software Statement Assertion Processing

Please see Open Banking Brasil Dynamic Client Registration Specification Clause X for details.

## 3.0 Validating an Authorization Request

Please see Open Banking Security Profile Clause X for details.

###################
# tpp-user-guide.md
###################

# Third Party Provider End To End User Guide

## 1.0 Registering an Application

At a high level the following major steps are required in order to onboard a new application into the Open Banking Brasil ecosystem.

1. Register your organisation on the directory of participants (User Interface)
2. Register your application on the directory of participants (User Interface)
3. Obtain credentials for your application from the Brasil ICP (Out of scope of this document)
4. Register your credentials for your application on the directory of participants (User Interface)
5. Identify providers of Account information or Payment Services of interest to customers of your application by searching the directory of participants (API)
6. Register your application with each provider (API)

### 1.1 Sequence Diagram

![enter image description here](https://www.websequencediagrams.com/files/render?link=XqaI0EvQK7BEN8bkFdykE7gq0frHqu744LprGQVxytViXWvVvCjey3siD0lbnTuZ)

### 1.1 Directory Overview

The trust framework services provided by Open Banking Brasil provide all of the discovery services necessary 
for a TPPs and ASPSPs to interact with each other without being required to validate 
the authenticity of each others' Identity, Authorizations, Consumer Offerings (Apps), 
APIs or Credentials for the Applications. In addition it provides a single registry of all 
consumer propositions being offered in the market and a single control plane for the
 regulatory authorities granting permissions to manage participants within the ecosystem.

The trust framework does not have visibility or view of interactions that occur between TPPs and Providers.
 It is designed to provide trust and surety of identity and authorization only.
  It does not sit within the communication flow between a consumer and a provider and it 
  has no knowledge or visbility of any customer data. This trust framework model is known as 
  transitive trust. Where two parties, a TPP and an ASPSP agree to trust a common trust 
  providers statements and attestations regarding the legitimacy of each other and then 
  proceed with communicating whatever they would like with no additional costly validation 
  or checking being required.

### 1.2 Accessing the Directory

This user guide assumes that participating organisations have already been through the onboarding
 process with the Open Banking Brasil Initial Structure and have completed all of the necessary onboarding,
  contract signing and individual administrator onboarding processes.

[Login Image]

### 1.3 Creating a new Software Statement

A software statement is an 'App' on what can be thought of as the Open Banking Brasil App Store.
 This App record contains all of the information necessary for a Bank to Technically Identity
  and Interact with it as well as containing all of the information that assist consumers 
  using the application with confirming its legitimacy.

A new application or software statement can be registered by logging on to the Directory, 
navigating to 'Software Statements' and clicking 'Create New' and populating the form. Help text is provided for each field on the screen. Please remember that the majority of this information will be displayed to customers by the Banks as part of the redirection or authorization process. As such it is important that all URIs and Descriptions are relevant for customer audience.

[New Software Statement Image]

#### 1.3.1 Assigning Software Regulatory Roles

In a complex and diverse data sharing ecosystem, the regulatory roles that an organisation can have can change. 
They can be added and revoked. This means that software added to the directory can be given permission
 to have 0 or more regulatory roles. A administrator can assign to a given software any and all
  permissions that the organisation that owns the software can have.

> Should an organisation lose a regulatory role then all software with that regulatory role will be revoked from the ecosystem so it is very important that an application is only given the roles that it actually needs in order to function.

A real world example of this could be 'Amazon', Amazon has two applications, 'Amazon Accounting' and
 'Amazon Prime'. Amazon as an organisation is an authorized DADOS and PISP, and is allowed to 
 handle customer data as well as make Open Banking Payments. Amazon Accounting should be assigned 
 the domain role of DADOS and Amazon Prime should be assigned a domain role of PISP.

In the future, should Amazon lose regulatory permission to be a PISP then only the Amazon Prime 
application would be removed from the ecosystem. Amazon Account would continue to function without issue.

### 1.4 Creating and Uploading Certificates

#### 1.4.1 Sandbox

The Open Banking Directory contains a PKI that can be used to create certificates for the Applications
 being registered. Simply select certificates from the drop down menu and follow the instructions.

The directory supports multiple certificate and key types and an openssl command and configuration 
file is made available as an example. Once you have created the necessary Certificate Signing Request
 (CSR) for both a "Transport" and "Signing" certificate you can submit them to the directory to be
  validated and minted into certificates.

> Please remember to follow your organisations key management practices for certificate generation. These credentials and keys need to be handled carefully. A significant key compromise event could lead to customer data being compromised.

#### 1.4.2 Production

Certificates must be provided by the Brasil ICP. The steps to follow are included in the [Open Banking Brasil Certificate Guide](https://github.com/OpenBanking-Brasil/specs-seguranca/blob/main/open-banking-brasil-ICP-certificate-guide.pdf)

#### 1.4.3 What is a JWT, JWE, JWS and JWK.

When certificates are uploaded to the directory, the trust framework advertises them in
 [JSON Web Key Sets](https://tools.ietf.org/html/rfc7517) with each JSON Web Key or JWK 
 having a unique 'KID' or Key ID. JWK's in addition to having specific properties describing 
 the algorithm and cipher suites that they support also advertise their 'use' which can either
  be of type 'enc' for encryption or 'sig' for signing.

These 'sig' keys and 'enc' key pairs are used in many places within the open banking ecosystem to
 encrypt or to sign data using the standards defined in [RFC 7519 JSON Web Token](https://tools.ietf.org/html/rfc7519) 
 which should be read in detail by developers.

Types of JWT include

* OpenID Connect Request Objects defined in [Open ID Connect Core](https://openid.net/specs/openid-connect-core-1_0.html)
* OpenID Connect `id_token` defined in [Open ID Connect Core](https://openid.net/specs/openid-connect-core-1_0.html)

Amongst many others.

These JWT's may be encrypted also be encrypted using JSON Web Encryption (JWE). In the majority of cases the 
keys that should be used to validate a JSON Web Signature (JWS) or the key that was used to encrypt a JWE is
 usually published as a JSON Web Key in a JSON Web Key Set with the reference to the key being carried in
  the 'kid' (Key ID) header field.

**As a worked example: An example JWT Request Object**

```
eyJhbGciOiJQUzI1NiIsInR5cCI6Im9hdXRoLWF1dGh6LXJlcStqd3QiLCJraWQiOiJQV0FpNXJ1UWNIZnpQenEySkZkcFk3bkFVaDZMelRUUXREQlVwT00zN0pRIn0.

eyJzY29wZSI6Im9wZW5pZCBvcGVuYmFua2luZ2JyYXNpbDpncmFudDpHREVSWkdSV28tZU9FeVE3Q1VmamYiLCJyZXNwb25zZV90eXBlIjoiY29kZSBpZF90b2tlbiIsInJlZGlyZWN0X3VyaSI6Imh0dHBzOi8vdHBwLmxvY2FsaG9zdC9jYiIsImNvZGVfY2hhbGxlbmdlIjoiUzJmeEJVTEtpUFA3cU52azdmeVpQVHFMLWFrSWJyV3FPelpaWFNyNVU2YyIsImNvZGVfY2hhbGxlbmdlX21ldGhvZCI6IlMyNTYiLCJyZXNwb25zZV9tb2RlIjoiZm9ybV9wb3N0Iiwic3RhdGUiOiIwMzUxODE5NjUwNTUzN2UyMTFkZDA4Y2VkYjEyNzExODcwYTU2ZWE0ODg4OTI0ZDU5OGM0YjA2NDAzMDEwNjNiIiwibm9uY2UiOiI4OTgxYzhhNTYwYzIxYzBmODc0NmU5Yjk3OGJmYzAwNGI5Mjc0ZjJiY2Y3ODZhM2UxNWFhOTZjOGRkNTQ5NGRkIiwiY2xhaW1zIjp7ImlkX3Rva2VuIjp7ImF1dGhfdGltZSI6eyJlc3NlbnRpYWwiOnRydWV9LCJuYXRpb25hbF9pZCI6eyJlc3NlbnRpYWwiOnRydWV9LCJnaXZlbl9uYW1lIjp7ImVzc2VudGlhbCI6dHJ1ZX0sImFjciI6eyJ2YWx1ZXMiOlsidXJuOm9wZW5iYW5raW5nYnJhc2lsOnRydXN0ZnJhbWV3b3JrOmdvbGQiXSwiZXNzZW50aWFsIjp0cnVlfX0sInVzZXJfaW5mbyI6eyJhdXRoX3RpbWUiOnsiZXNzZW50aWFsIjp0cnVlfSwibmF0aW9uYWxfaWQiOnsiZXNzZW50aWFsIjp0cnVlfSwiZ2l2ZW5fbmFtZSI6eyJlc3NlbnRpYWwiOnRydWV9LCJhY3IiOnsidmFsdWVzIjpbInVybjpvcGVuYmFua2luZ2JyYXNpbDp0cnVzdGZyYW1ld29yazpnb2xkIl0sImVzc2VudGlhbCI6dHJ1ZX19fSwibWF4X2FnZSI6MzAwLCJpc3MiOiJhQ25CSGpaQnZENmt1M0tWQmFzbEwiLCJhdWQiOiJodHRwczovL2F1dGgubG9jYWxob3N0IiwiY2xpZW50X2lkIjoiYUNuQkhqWkJ2RDZrdTNLVkJhc2xMIiwianRpIjoicThfTlNjSm9xdThuZHJjWGZqN05UQ1VDU2Q2Y1BJOWc1STdxRXlJS2tTVSIsImlhdCI6MTYxODY2NDczOCwiZXhwIjoxNjE4NjY1MDM4LCJuYmYiOjE2MTg2NjQ3Mzh9.

hhi9dxmweydoXsQeyZETBWJFqMjFrTzcRYXulsscdJQ2md6Zkd8siimYRZ7vPNOOL5uxRSgQRMYWza6MnldUr99XfddbilVS6c_RhbvOrppNOmAC7F4J8aIYcOuF-E2EoHF5dK2c4v9IUkwuTnYZbGDoL0V6r5k3Ywil77Z_-lUMudGCXp2n9twx9kEpTdkWFUf2xbJocWMAYbrhvcK2bAWtC8Dg0V9ntlsAhCh-q4o22Ytt9yYFdmrnU8fJNfViTRhroDIgMwpN27BrIMywvX2zhCY037Hj26fFtoZBqEpDvcsa5d_qDWeeiTfHZYUgiydGswBv09D-FL7SH_EieQ
```

The example above is decoded below. In the header is 'kid' of `PWAi5ruQcHfzPzq2JFdpY7nAUh6LzTTQtDBUpOM37JQ` which can be located in the JSON Web KeySet for this client [here](https://keystore.sandbox.directory.openbankingbrasil.org.br/74e929d9-33b6-4d85-8ba7-c146c867a817/1509a662-6b3a-4cb8-b7c0-ffb6e596eb0d/application.jwks)

```
{
  "alg": "PS256",
  "typ": "oauth-authz-req+jwt",
  "kid": "PWAi5ruQcHfzPzq2JFdpY7nAUh6LzTTQtDBUpOM37JQ"
}
{
  "scope": "openid openbankingbrasil:grant:GDERZGRWo-eOEyQ7CUfjf",
  "response_type": "code id_token",
  "redirect_uri": "https://tpp.localhost/cb",
  "code_challenge": "S2fxBULKiPP7qNvk7fyZPTqL-akIbrWqOzZZXSr5U6c",
  "code_challenge_method": "S256",
  "response_mode": "form_post",
  "state": "03518196505537e211dd08cedb12711870a56ea4888924d598c4b0640301063b",
  "nonce": "8981c8a560c21c0f8746e9b978bfc004b9274f2bcf786a3e15aa96c8dd5494dd",
  "claims": {
    "id_token": {
      "auth_time": {
        "essential": true
      },
      "national_id": {
        "essential": true
      },
      "given_name": {
        "essential": true
      },
      "acr": {
        "values": [
          "urn:openbankingbrasil:trustframework:gold"
        ],
        "essential": true
      }
    },
    "user_info": {
      "auth_time": {
        "essential": true
      },
      "national_id": {
        "essential": true
      },
      "given_name": {
        "essential": true
      },
      "acr": {
        "values": [
          "urn:openbankingbrasil:trustframework:gold"
        ],
        "essential": true
      }
    }
  },
  "max_age": 300,
  "iss": "aCnBHjZBvD6ku3KVBaslL",
  "aud": "https://auth.localhost",
  "client_id": "aCnBHjZBvD6ku3KVBaslL",
  "jti": "q8_NScJoqu8ndrcXfj7NTCUCSd6cPI9g5I7qEyIKkSU",
  "iat": 1618664738,
  "exp": 1618665038,
  "nbf": 1618664738
}
```

The public JWK from the JWKS taken from the uri given earlier

```
{
   "kty":"RSA",
   "use":"sig",
   "x5c":[
      "MIIGXTCCBUWgAwIBAgIUenU+5KQm+Ym2vsMKmjvBaxnJo8UwDQYJKoZIhvcNAQELBQAwcTELMAkGA1UEBhMCQlIxHDAaBgNVBAoTE09wZW4gQmFua2luZyBCcmFzaWwxFTATBgNVBAsTDE9wZW4gQmFua2luZzEtMCsGA1UEAxMkT3BlbiBCYW5raW5nIFNBTkRCT1ggSXNzdWluZyBDQSAtIEcxMB4XDTIxMDMxNDE1MzEwMFoXDTIyMDQxNDAxMzEwMFowgYIxCzAJBgNVBAYTAkJSMRUwEwYDVQQKEwxPcGVuIEJhbmtpbmcxLTArBgNVBAsTJDc0ZTkyOWQ5LTMzYjYtNGQ4NS04YmE3LWMxNDZjODY3YTgxNzEtMCsGA1UEAxMkMTUwOWE2NjItNmIzYS00Y2I4LWI3YzAtZmZiNmU1OTZlYjBkMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA50HaMFjTHfjUYMxd6YrwmgsOEzrnSxG1RqS46i1MHaj9wE+wMgjxg5wJeV9tQ11OiWaxYZ87+KbyW/SgFcHT0BolVTSK9wWOIfXDMgeBzLHIJWmABMWMo9U9iEo4IXVQ5GetpIrBVtgs4xFY5qDVpxOoIEH1l2LjiUc2EJHXCN0uNhE5J151bAj8QGkMcit2JZGav2UUQKShz8p28sYcXzH3IjxFg8BsjDCMnetrwWaAjNKko0KmOIu1bBMEsyBPjH9iZuCsAsiT3T0AefzLPz7Mq/dV45k8Jp26PtQXIlWGgjiIClSM+mw3Ap7fB0ztFRznC4psLvRFQ0DcrJV8lwIDAQABo4IC2TCCAtUwDgYDVR0PAQH/BAQDAgO4MAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFKI8y3/sIxgX0UYqjuGyHVlbQiK7MB8GA1UdIwQYMBaAFIZ/WK0X9YK2TrQFs/uwzhFD30y+MEwGCCsGAQUFBwEBBEAwPjA8BggrBgEFBQcwAYYwaHR0cDovL29jc3Auc2FuZGJveC5wa2kub3BlbmJhbmtpbmdicmFzaWwub3JnLmJyMDUGA1UdEQQuMCyCDmF1dGgubG9jYWxob3N0ghRtYXRscy1hdXRoLmxvY2FsaG9zdIcEfwAAATBLBgNVHR8ERDBCMECgPqA8hjpodHRwOi8vY3JsLnNhbmRib3gucGtpLm9wZW5iYW5raW5nYnJhc2lsLm9yZy5ici9pc3N1ZXIuY3JsMIIBoQYDVR0gBIIBmDCCAZQwggGQBgorBgEEAYO6L2QBMIIBgDCCATYGCCsGAQUFBwICMIIBKAyCASRUaGlzIENlcnRpZmljYXRlIGlzIHNvbGVseSBmb3IgdXNlIHdpdGggUmFpZGlhbSBTZXJ2aWNlcyBMaW1pdGVkIGFuZCBvdGhlciBwYXJ0aWNpcGF0aW5nIG9yZ2FuaXNhdGlvbnMgdXNpbmcgUmFpZGlhbSBTZXJ2aWNlcyBMaW1pdGVkcyBUcnVzdCBGcmFtZXdvcmsgU2VydmljZXMuIEl0cyByZWNlaXB0LCBwb3NzZXNzaW9uIG9yIHVzZSBjb25zdGl0dXRlcyBhY2NlcHRhbmNlIG9mIHRoZSBSYWlkaWFtIFNlcnZpY2VzIEx0ZCBDZXJ0aWZpY2F0ZSBQb2xpY3kgYW5kIHJlbGF0ZWQgZG9jdW1lbnRzIHRoZXJlaW4uMEQGCCsGAQUFBwIBFjhodHRwOi8vY3BzLnNhbmRib3gucGtpLm9wZW5iYW5raW5nYnJhc2lsLm9yZy5ici9wb2xpY2llczANBgkqhkiG9w0BAQsFAAOCAQEAJ1oe8W4ZYvX+TdYDQHtBGfVDBwRS1eRHRu5r10aqvjGOE9okTDX9FYw19b40oPatIewOlOjJp1i8Jy2TJa6sVdS5q6LpNP33MV2TwY9i5SZD5sYVZdX9BwEFmAZXyjiJPNMnhNkd/K8F2zL+HrwjVLBCz2gINH3lE166BtF4adZSA4q5NxhbXT+V5uZcd6m9zdUrEVu1iPPwAU94E9PVuLzBu4//DN7yrwStaW1hIH1JrVpM+w3ROAR0wZ/6GHwprKYY07tkManRSH1ONckXi/kM1Crz6kqWY5qfIrspsNx8m1YXXH6h57gxI4J7izkg5GyNQhnkefB8gF/mOUyK7A=="
   ],
   "n":"50HaMFjTHfjUYMxd6YrwmgsOEzrnSxG1RqS46i1MHaj9wE-wMgjxg5wJeV9tQ11OiWaxYZ87-KbyW_SgFcHT0BolVTSK9wWOIfXDMgeBzLHIJWmABMWMo9U9iEo4IXVQ5GetpIrBVtgs4xFY5qDVpxOoIEH1l2LjiUc2EJHXCN0uNhE5J151bAj8QGkMcit2JZGav2UUQKShz8p28sYcXzH3IjxFg8BsjDCMnetrwWaAjNKko0KmOIu1bBMEsyBPjH9iZuCsAsiT3T0AefzLPz7Mq_dV45k8Jp26PtQXIlWGgjiIClSM-mw3Ap7fB0ztFRznC4psLvRFQ0DcrJV8lw",
   "e":"AQAB",
   "kid":"PWAi5ruQcHfzPzq2JFdpY7nAUh6LzTTQtDBUpOM37JQ",
   "x5u":"https://keystore.sandbox.directory.openbankingbrasil.org.br/74e929d9-33b6-4d85-8ba7-c146c867a817/1509a662-6b3a-4cb8-b7c0-ffb6e596eb0d/PWAi5ruQcHfzPzq2JFdpY7nAUh6LzTTQtDBUpOM37JQ.pem",
   "x5t#256":"PWAi5ruQcHfzPzq2JFdpY7nAUh6LzTTQtDBUpOM37JQ"
}
```

The private key that was used to create the JWS

```
-----BEGIN PRIVATE KEY-----
MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDnQdowWNMd+NRg
zF3pivCaCw4TOudLEbVGpLjqLUwdqP3AT7AyCPGDnAl5X21DXU6JZrFhnzv4pvJb
9KAVwdPQGiVVNIr3BY4h9cMyB4HMscglaYAExYyj1T2ISjghdVDkZ62kisFW2Czj
EVjmoNWnE6ggQfWXYuOJRzYQkdcI3S42ETknXnVsCPxAaQxyK3YlkZq/ZRRApKHP
ynbyxhxfMfciPEWDwGyMMIyd62vBZoCM0qSjQqY4i7VsEwSzIE+Mf2Jm4KwCyJPd
PQB5/Ms/Psyr91XjmTwmnbo+1BciVYaCOIgKVIz6bDcCnt8HTO0VHOcLimwu9EVD
QNyslXyXAgMBAAECggEBAK+x8VHv+h14Uepk+iiX/aobIgtsIhN/lajhNvf7iCu0
m20DXgr1jn/+CZij7oBSoHt1gOh5MPf95n4EgadmBkXBx4FPlRCNsOmOLUmSOIRK
wZPi7ncxm2NRfBlSwghxeA6/0kYDgVY4kQnGwTMfGJOCNKalVjA42kQOzT2Tf7rj
1hLoIzmPAfziy86uo8r6rWRk8T9We8g+uhfq4k6a/aG2cXSUT+2TJdp5UdeyEFWr
+ZYFc2P+dMiUhVIi2bZLu5IZ+iPFxg4bYwSCNvjaPxihUWKfcZ0dzCas04w+TuzA
6994iO4EloF1eGZBkLNe6VcSBfSj3xsKfwbTYSVgVXkCgYEA9/DUGEnAqHChk69j
QCG9PG4XZVseYkaAhJ1fvatSCVR2fyuf6stvjOnGqv0fnNbO4GOIhrTF4a88aU7P
d2AouREM2OathfleikPJPMIurQ6P3TYhBJRCBIbG/4Bf7jkSh+YINVcg13LklpPu
x5dgif/G6U97U53uvYLZ8CEUXpUCgYEA7sYyU0936QY3tRB1FU9VQFatQqEtsllE
Lgbg/LewzfEaARzMPVeSvoEtmILJJRLef/CIS8am4gCHcrP1yatFHKZ5RsAFhhx9
9HqM9zRcnqlHsGPSgFyqUq59/cdDCYGyioimJLYvwKpnlz2ksr8eqXsRmABrzwNE
gL9IxPD4H3sCgYBD80udUHEteJi/qdyQke6T5jQhQgSkuF+2eI7po087YVuMZL9S
EOkEfHlHGVIVoMVXt8+N43Mr8+OhlMjFFaRze9nChA3gXsRrLkKzlSBHq2sAHDqW
T698IBffpCYmWpvahM+RFszYXxOItQhGyRTbHS89d9v7wZfRdlAWQGqdtQKBgQCq
SVlMxwkafB+wlvsZZonDJ83LDg37+uO/+5HrScnjJcbI8lPKj7ENAi2Vbfir4wgh
sFZTzGnqFjyDFkr9N5NDeopVZc7KtXkyqU/tYT+Iu+tvpdFTUEL8UotyOPDbT88Y
M5ph5jiqLB1S5FiYTes9LZL/l5VLfuYU99aa9cvPDwKBgQCTtAiNqsQzpVtjGGBG
fQj0J/lXrXjz4AQb0Ai9UfqewE8+A75bz2VhHdmBzOkPP8HCNau8Jgznnzo5fFfa
LvUzP98HUpwMm7sTukjhpx6jqFJtvNGQwZtFbvAwcphY0dF1OLt3D4RlSwdlhtV4
DerRuq0u0Ed/FKLPiYhqg9kJLA==
-----END PRIVATE KEY-----
```

## 2.0 Interacting with the Trust Services APIs

When an application is registered on the Directory, the central service uses the provided meta data and certificates to create for the software a OAuth 2.0 client that has a grant type of 'client credentials' as defined in [RFC6749](https://tools.ietf.org/html/rfc6749) with a client authentication mechanism of 'tls_client_auth' as defined in [RFC 8705](https://tools.ietf.org/html/rfc8705)

Using the ClientID listed on the software statement in the Directory, [OpenID Connect Discovery](https://openid.net/specs/openid-connect-discovery-1_0.html) and the OpenID Provider Issuer configuration below, a participant has all of the necessary infomation to discover, authenticate and interact with the Directory APIs.

### 2.1 Trust Framework Issuer

Production: [https://auth.directory.openbankingbrasil.org.br/](https://auth.directory.openbankingbrasil.org.br/)

Sandbox: [https://auth.sandbox.directory.openbankingbrasil.org.br/](https://auth.sandbox.directory.openbankingbrasil.org.br/)

### 2.1 How to communicate with the Directory Authorization Server.

* Use the OpenID Issuer and Clause 4 of the OpenID Discovery Specification to retrieve the 'openid-configuration' document.

```
curl https://auth.directory.openbankingbrasil.org.br/.well-known/openid-configuration
{
  "authorization_endpoint":"https://auth.directory.openbankingbrasil.org.br/auth",
  "claims_parameter_supported":true,
  "claims_supported":[
     "sub",
     "email",
     "email_verified",
     "phone_number",
     "phone_number_verified",
     "address",
     "family_name",
     "given_name",
     "sid",
     "auth_time",
     "iss"
  ],
  "code_challenge_methods_supported":[
     "S256"
  ],
  "grant_types_supported":[
     "client_credentials"
  ],
  "id_token_signing_alg_values_supported":[
     "PS256"
  ],
  "issuer":"https://auth.directory.openbankingbrasil.org.br",
  "jwks_uri":"https://auth.directory.openbankingbrasil.org.br/jwks",
  "registration_endpoint":"https://auth.directory.openbankingbrasil.org.br/reg",
  "response_modes_supported":[
     "form_post",
     "fragment",
     "query",
     "jwt",
     "query.jwt",
     "fragment.jwt",
     "form_post.jwt"
  ],
  "response_types_supported":[
     "code id_token"
  ],
  "scopes_supported":[
     "openid",
     "offline_access",
     "profile",
     "email",
     "address",
     "phone",
     "directory:software",
  ],
  "subject_types_supported":[
     "public",
     "pairwise"
  ],
  "token_endpoint_auth_methods_supported":[
     "private_key_jwt",
     "tls_client_auth"
  ],
  "token_endpoint_auth_signing_alg_values_supported":[
     "PS256",
  ],
  "token_endpoint":"https://auth.directory.openbankingbrasil.org.br/token",
  "pushed_authorization_request_endpoint":"https://auth.directory.openbankingbrasil.org.br/request",
  "request_object_signing_alg_values_supported":[
     "PS256",
  ],
  "request_parameter_supported":true,
  "request_uri_parameter_supported":true,
  "require_request_uri_registration":true,
  "userinfo_endpoint":"https://auth.directory.openbankingbrasil.org.br/me",
  "userinfo_signing_alg_values_supported":[
     "PS256",
  ],
  "authorization_signing_alg_values_supported":[
     "PS256",
  ],
  "introspection_endpoint":"https://auth.directory.openbankingbrasil.org.br/token/introspection",
  "introspection_endpoint_auth_methods_supported":[
     "private_key_jwt",
     "tls_client_auth"
  ],
  "introspection_endpoint_auth_signing_alg_values_supported":[
     "PS256",
  ],
  "revocation_endpoint":"https://auth.directory.openbankingbrasil.org.br/token/revocation",
  "revocation_endpoint_auth_methods_supported":[
     "private_key_jwt",
     "tls_client_auth"
  ],
  "revocation_endpoint_auth_signing_alg_values_supported":[
     "PS256",
  ],
  "frontchannel_logout_supported":true,
  "frontchannel_logout_session_supported":true,
  "tls_client_certificate_bound_access_tokens":true,
  "claim_types_supported":[
     "normal"
  ],
  "mtls_endpoint_aliases":{
     "token_endpoint":"https://matls-auth.directory.openbankingbrasil.org.br/token",
     "revocation_endpoint":"https://matls-auth.directory.openbankingbrasil.org.br/token/revocation",
     "introspection_endpoint":"https://matls-auth.directory.openbankingbrasil.org.br/token/introspection",
     "device_authorization_endpoint":"https://matls-auth.directory.openbankingbrasil.org.br/device/auth"
  }
}
```

* Retrieve the Mutual TLS token endpoint alias as defined by [RFC8705 - OAuth 2.0 Mutual-TLS Client Authentication and Certificate-Bound Access Tokens](https://tools.ietf.org/html/rfc8705)

```
"mtls_endpoint_aliases":{
     "token_endpoint":"https://matls-auth.directory.openbankingbrasil.org.br/token"
     }
```

* Establish a Mutual TLS connection using the transport certificate registered early and request an access token with the scope 'directory:software'

```
curl --cert transport.pem --key transport.key https://matls-auth.directory.openbankingbrasil.org.br/token -X POST -d 'client_id=_jjLAgCC8qucQOyo9wIcX&grant_type=client_credentials&scope=directory:software'

{"access_token":"gSeWnhpnDIvotI80TYm8KoeFT4MMtJPawIMXJzFFApX","expires_in":600,"token_type":"Bearer","scope":"directory:software"}
```

### 2.2 How to communicate with the Directory APIs

The Directory APIs are RESTful resources secured using the Brasil Open Banking Security Profile, 
this means that they have the same security posture as Banks APIs. All of the Directories APIs 
require OAuth 2.0 resource scope of `directory:software` and are secured using Mutual TLS.

Please see the Directory OpenAPI v3 specification for full set of endpoints available.

### 2.2 Discovering Banks Authorization Servers

Interrogate the participants (public information) resource and retrieve a list of all participants and their Authorization Servers.

```
curl https://data.directory.openbankingbrasil.org.br/participants

--results filtered for brevity
[
   {
      "Status":"Active",
      "OrgDomainRoleClaims":[
         {
            "Status":"Active",
            "AuthorizationDomain":"Open Banking",
            "Role":"DADOS",
            "RegistrationId":"13353236-OBB-DADOS",
            "Authorizations":[

            ]
         },
         {
            "Status":"Active",
            "AuthorizationDomain":"Open Banking",
            "Role":"PAGTO",
            "RegistrationId":"13353236-OBB-PAGTO",
            "Authorizations":[

            ]
         },
         {
            "Status":"Active",
            "AuthorizationDomain":"Open Banking",
            "Role":"CONTA",
            "RegistrationId":"13353236-OBB-CONTA",
            "Authorizations":[

            ]
         }
      ],
      "AuthorizationServers":[
         {
            "PayloadSigningCertLocationUri":"https://notused.com",
            "ParentAuthorizationServerId":null,
            "OpenIDDiscoveryDocument":"https://auth.amazingbank.org.br/.well-known/openid-configuration",
            "CustomerFriendlyName":"Amazing Bank Business",
            "CustomerFriendlyDescription":"Business Banking by Amazing Bank",
            "TermsOfServiceUri":"https://amazingbank.org.br/termos-de-uso/business",
            "ApiResources":[
               {
                  "ApiFamilyType":"products-services-commercial-transactions",
                  "ApiVersion":1,
                  "ApiResourceId":"d6941b8f-b32d-4723-b05c-02563199df4f",
                  "ApiDiscoveryEndpoints":[
                     {
                        "ApiDiscoveryId":"848ad5f8-7ce8-4b63-9466-5f30832f7a73",
                        "ApiEndpoint":"https://amazingbank.org.br/transactions/commercial/v1"
                     }
                  ]
               },
               {
                  "ApiFamilyType":"products-services-commercial-payments",
                  "ApiVersion":1,
                  "ApiResourceId":"33333-b356d-4723-d09c-52341412343",
                  "ApiDiscoveryEndpoints":[
                     {
                        "ApiDiscoveryId":"555ad5f8-dde8-4b63-4444-5f30832f7333",
                        "ApiEndpoint":"https://amazingbank.org.br/payments/commercial/v1"
                     }
                  ]
               }
            ],
            "AutoRegistrationSupported":true,
            "CustomerFriendlyLogoUri":"https://amazingbank.org.br/business/logo.png",
            "DeveloperPortalUri":"https://amazingbank.org.br/areadesenvolvedor/#introducao",
            "AuthorizationServerId":"6850e112-0d2b-4f92-8955-993e6b9426d2"
         },
         {
            "PayloadSigningCertLocationUri":"https://notused.com",
            "ParentAuthorizationServerId":null,
            "OpenIDDiscoveryDocument":"https://auth.business.amazingbank.org.br/.well-known/openid-configuration",
            "CustomerFriendlyName":"Amazing Business Bank",
            "CustomerFriendlyDescription":"Personal Banking by Amazing Bank",
            "TermsOfServiceUri":"https://amazingbank.org.br/termos-de-uso/personal",
            "ApiResources":[
               {
                  "ApiFamilyType":"products-services-retail-transactions",
                  "ApiVersion":1,
                  "ApiResourceId":"d6941b8f-b32d-4723-b05c-02563199df4f",
                  "ApiDiscoveryEndpoints":[
                     {
                        "ApiDiscoveryId":"848ad5f8-7ce8-4b63-9466-5f30832f7a73",
                        "ApiEndpoint":"https://amazingbank.org.br/transactions/retail/v1"
                     }
                  ]
               },
               {
                  "ApiFamilyType":"products-services-retail-transactions",
                  "ApiVersion":1,
                  "ApiResourceId":"86941b8f-b356d-4723-d09c-02563199f4ds",
                  "ApiDiscoveryEndpoints":[
                     {
                        "ApiDiscoveryId":"222ad5f8-dde8-4b63-4444-5f30832f7333",
                        "ApiEndpoint":"https://amazingbank.org.br/transactions/retail/v1"
                     }
                  ]
               }
            ],
            "AutoRegistrationSupported":true,
            "CustomerFriendlyLogoUri":"https://amazingbank.org.br/retail/logo.png",
            "DeveloperPortalUri":"https://amazingbank.org.br/areadesenvolvedor/#introducao",
            "AuthorizationServerId":"6850e112-0d2b-4f92-8955-993e6b9426d2"
         }
      ],
      "OrgDomainClaims":[
         {
            "Status":"Active",
            "AuthorityName":"Banco Central do Brasil",
            "RegistrationId":"13353236-OBB",
            "AuthorizationDomainName":"Open Banking"
         }
      ],
      "RegistrationId":null,
      "OrganisationId":"b961c4eb-509d-4edf-afeb-35642b38185d",
      "City":"BOTAFOGO",
      "Postcode":"CEP 22290-160",
      "AddressLine2":"BOTAFOGO / RIO DE JANEIRO, RJ",
      "RegisteredName":"Amazing Bank Ltd",
      "AddressLine1":" 116 SA 1504",
      "LegalEntityName":"Amazing Bank Ltd",
      "OrganisationName":"Amazing Bank",
      "Country":"Brasil",
      "RegistrationNumber":"1335323600189",
      "CreatedOn":"2020-12-18T17:53:49.832Z",
      "ParentOrganisationReference":null,
      "CompanyRegister":"Cadastro Nacional Da Pessoa Juridica",
      "CountryOfRegistration":"BR"
   }
]
```

Filter the participants to those that have Authorization Servers protecting resources that you are interested in accessing for your product. In the example above, there are two Authorization Servers for 'Amazing Bank' one for the Retail Business and one for the Business Banking.

The App now has discovered the list of Banks that are offering APIs that might be useful to customers of the Application and the App can now generate a list of Banks 'Customer Friendly Names' and Logos to display to consumers to enable them to select the bank from which they want to share data.

## 3.0 Registering the application with a provider

![enter image description here](https://www.websequencediagrams.com/files/render?link=1Xqm7oHVrWJ0Ya34s9kdzG1kHpwLobAftNdQHHvf44ikYZadVrou8iFhiFC9pSMP)

From the example given above we can see that the location of the "OpenIDDiscoveryDocument" is advertised by each of the Authorization Servers.

## 3.1 Creating a Software Statement

A software statement assertion (SSA) is a signed JWT from the Directory that contains all of the information about an application that exists at a point in time on the directory. It includes the location of all of the public keys that are linked to this software statement and all of the other metadata a bank needs to validate the legitimacy of the application.

An SSA does not have an expiry, it is simply a point in time record of what existed as valid attributes at the point of time that it was created. Banks should accept an SSA that is less than a few minutes old but the exact window may differ between providers.

**Obtain an access token and then retrieve the software statement for a application on the Directory.**

```
curl --cert transport.pem --key transport.key https://matls-auth.directory.openbankingbrasil.org.br/token -X POST -d 'client_id=_jjLAgCC8qucQOyo9wIcX&grant_type=client_credentials&scope=directory:software' -k

{"access_token":"-mqFZH5DwjzlPjHU3bBkP2Lmp97mwGbKZ2yjYb-tVaE","expires_in":600,"token_type":"Bearer","scope":"directory:software"}

curl --cert transport.pem --key transport.key https://matls-api.directory.openbankingbrasil.org.br/organisations/b961c4eb-509d-4edf-afeb-35642b38185d/softwarestatements/6483a2d3-2b0d-4fc8-a756-e7be79013fa0/assertion -H 'Authorization: Bearer -mqFZH5DwjzlPjHU3bBkP2Lmp97mwGbKZ2yjYb-tVaE'

eyJraWQiOiJzaWduZXIiLCJ0eXAiOiJKV1QiLCJhbGciOiJQUzI1NiJ9.eyJzb2Z0d2FyZV9tb2RlIjoiTGl2ZSIsInNvZnR3YXJlX3JlZGlyZWN0X3VyaXMiOlsiaHR0cHM6XC9cL3d3dy5yYWlkaWFtLmNvbVwvYWJnXC9jYjEiLCJodHRwczpcL1wvd3d3LnJhaWRpYW0uY29tXC9hYmdcL2NiMiJdLCJzb2Z0d2FyZV9zdGF0ZW1lbnRfcm9sZXMiOlt7InJvbGUiOiJEQURPUyIsImF1dGhvcmlzYXRpb25fZG9tYWluIjoiT3BlbiBCYW5raW5nIiwic3RhdHVzIjoiQWN0aXZlIn1dLCJzb2Z0d2FyZV9jbGllbnRfbmFtZSI6IkFjY291bnRzIEJlIEdvbmUiLCJvcmdfc3RhdHVzIjoiQWN0aXZlIiwic29mdHdhcmVfY2xpZW50X2lkIjoiX2pqTEFnQ0M4cXVjUU95bzl3SWNYIiwiaXNzIjoiT3BlbiBCYW5raW5nIE9wZW4gQmFua2luZyBCcmFzaWwgcHJvZCBTU0EgaXNzdWVyIiwic29mdHdhcmVfdG9zX3VyaSI6Imh0dHBzOlwvXC93d3cucmFpZGlhbS5jb21cL2FiZ1wvdG9zLmh0bWwiLCJzb2Z0d2FyZV9jbGllbnRfZGVzY3JpcHRpb24iOiJBY2NvdW50cyBiZSBnb25lIHdpbGwgdXNlIHlvdXIgb3BlbiBiYW5raW5nIGRhdGEgdG8gYXV0b21hdGUgeW91ciBhY2NvdW50YW5jeSBhbmQgYm9vayBrZWVwaW5nIG1hc3NpdmUgc2F2aW5nIHlvdSB0aW1lLiIsInNvZnR3YXJlX2p3a3NfZW5kcG9pbnQiOiJodHRwczpcL1wva2V5c3RvcmUuZGlyZWN0b3J5Lm9wZW5iYW5raW5nYnJhc2lsLm9yZy5iclwvYjk2MWM0ZWItNTA5ZC00ZWRmLWFmZWItMzU2NDJiMzgxODVkXC82NDgzYTJkMy0yYjBkLTRmYzgtYTc1Ni1lN2JlNzkwMTNmYTBcL2FwcGxpY2F0aW9uLmp3a3MiLCJzb2Z0d2FyZV9wb2xpY3lfdXJpIjoiaHR0cHM6XC9cL3d3dy5yYWlkaWFtLmNvbVwvYWJnXC9wb2xpY3kuaHRtbCIsInNvZnR3YXJlX2lkIjoiNjQ4M2EyZDMtMmIwZC00ZmM4LWE3NTYtZTdiZTc5MDEzZmEwIiwic29mdHdhcmVfY2xpZW50X3VyaSI6Imh0dHBzOlwvXC93d3cucmFpZGlhbS5jb21cL2FiZy5odG1sIiwic29mdHdhcmVfandrc19pbmFjdGl2ZV9lbmRwb2ludCI6Imh0dHBzOlwvXC9rZXlzdG9yZS5kaXJlY3Rvcnkub3BlbmJhbmtpbmdicmFzaWwub3JnLmJyXC9iOTYxYzRlYi01MDlkLTRlZGYtYWZlYi0zNTY0MmIzODE4NWRcLzY0ODNhMmQzLTJiMGQtNGZjOC1hNzU2LWU3YmU3OTAxM2ZhMFwvaW5hY3RpdmVcL2FwcGxpY2F0aW9uLmp3a3MiLCJzb2Z0d2FyZV9qd2tzX3RyYW5zcG9ydF9pbmFjdGl2ZV9lbmRwb2ludCI6Imh0dHBzOlwvXC9rZXlzdG9yZS5kaXJlY3Rvcnkub3BlbmJhbmtpbmdicmFzaWwub3JnLmJyXC9iOTYxYzRlYi01MDlkLTRlZGYtYWZlYi0zNTY0MmIzODE4NWRcLzY0ODNhMmQzLTJiMGQtNGZjOC1hNzU2LWU3YmU3OTAxM2ZhMFwvaW5hY3RpdmVcL3RyYW5zcG9ydC5qd2tzIiwic29mdHdhcmVfandrc190cmFuc3BvcnRfZW5kcG9pbnQiOiJodHRwczpcL1wva2V5c3RvcmUuZGlyZWN0b3J5Lm9wZW5iYW5raW5nYnJhc2lsLm9yZy5iclwvYjk2MWM0ZWItNTA5ZC00ZWRmLWFmZWItMzU2NDJiMzgxODVkXC82NDgzYTJkMy0yYjBkLTRmYzgtYTc1Ni1lN2JlNzkwMTNmYTBcL3RyYW5zcG9ydC5qd2tzIiwic29mdHdhcmVfbG9nb191cmkiOiJodHRwczpcL1wvd3d3LnJhaWRpYW0uY29tXC9hYmdcL2xvZ28ucG5nIiwib3JnX2lkIjoiYjk2MWM0ZWItNTA5ZC00ZWRmLWFmZWItMzU2NDJiMzgxODVkIiwic29mdHdhcmVfZW52aXJvbm1lbnQiOiJwcm9kdWN0aW9uIiwic29mdHdhcmVfdmVyc2lvbiI6MS4xMCwic29mdHdhcmVfcm9sZXMiOlsiREFET1MiXSwib3JnX25hbWUiOiJPcGVuIEJhbmtpbmcgQnJhc2lsIiwiaWF0IjoxNjE4Njk1OTI4LCJvcmdhbmlzYXRpb25fY29tcGV0ZW50X2F1dGhvcml0eV9jbGFpbXMiOlt7ImF1dGhvcmlzYXRpb25fZG9tYWluIjoiT3BlbiBCYW5raW5nIiwiYXV0aG9yaXNhdGlvbnMiOltdLCJyZWdpc3RyYXRpb25faWQiOiIxMzM1MzIzNi1PQkItQ09OVEEiLCJhdXRob3JpdHlfaWQiOiI2ODdhMWM5NC1iMzYwLTRlMDQtOTU4OS0wZmE1Y2IxNjQ1MWIiLCJhdXRob3Jpc2F0aW9uX3JvbGUiOiJDT05UQSIsImF1dGhvcml0eV9jb2RlIjoiQkNCIiwic3RhdHVzIjoiQWN0aXZlIn0seyJhdXRob3Jpc2F0aW9uX2RvbWFpbiI6Ik9wZW4gQmFua2luZyIsImF1dGhvcmlzYXRpb25zIjpbXSwicmVnaXN0cmF0aW9uX2lkIjoiMTMzNTMyMzYtT0JCLURBRE9TIiwiYXV0aG9yaXR5X2lkIjoiNjg3YTFjOTQtYjM2MC00ZTA0LTk1ODktMGZhNWNiMTY0NTFiIiwiYXV0aG9yaXNhdGlvbl9yb2xlIjoiREFET1MiLCJhdXRob3JpdHlfY29kZSI6IkJDQiIsInN0YXR1cyI6IkFjdGl2ZSJ9LHsiYXV0aG9yaXNhdGlvbl9kb21haW4iOiJPcGVuIEJhbmtpbmciLCJhdXRob3Jpc2F0aW9ucyI6W10sInJlZ2lzdHJhdGlvbl9pZCI6IjEzMzUzMjM2LU9CQi1QQUdUTyIsImF1dGhvcml0eV9pZCI6IjY4N2ExYzk0LWIzNjAtNGUwNC05NTg5LTBmYTVjYjE2NDUxYiIsImF1dGhvcmlzYXRpb25fcm9sZSI6IlBBR1RPIiwiYXV0aG9yaXR5X2NvZGUiOiJCQ0IiLCJzdGF0dXMiOiJBY3RpdmUifV19.axxRvn5aPqBLZtJSZvMXdotcmHyS_iu8jv40VdG2HTplF9qpZ4mDoIviquVceU2eH3eoMINXNcr0BLfBACdp2bLjD_FeCCYlOlgp1w7dCXxAYiFndiMniwkdyI9xxvVx9jJjETpP8owfV6QI_cprPxOCK7fF90s9frq_rby8ixL7K2DHM-UQ_bA320W84WRjwJrmexJlPrlBxEa823_kyaPIUU-tk7yKvve0hU_pSgI6U1g5CJpFr1zJVRJhPZ6E1ekRzkaRq2nnF2FoI96bTNwFLYitKojiqWsHwPMdnUWPAuLS6EY3toYCqISOS8Tzi_u3tp3TMsJhS_lOrkRtpA
```

## 3.3 Sending an RFC7591 Dynamic Client Registration Request

Please see Open Banking Brasil Dynamic Client Registration

## 3.4 Saving the RFC7592 Dynamic Client Management Token

Please see Open Banking Brasil Dynamic Client Registration

## 3.5 Modifying a client using RFC7592 Dynamic Client Management Token

Please see Open Banking Brasil Dynamic Client Registration

## 4.0 Obtaining Access to Customers Resources

![enter image description here](https://www.websequencediagrams.com/files/render?link=v8xPrADYGTMbCT8aW6qogJ6tQz8y3XBdJKQN6iSyXypJJ7XKnJdauvr9btnAfpog)

For all options including all permission codes please see the
 [Consent API](https://openbanking-brasil.github.io/areadesenvolvedor/swagger/swagger_consents_apis.yaml).
  The following examples are minimal but functional examples to demonstrate end to end flow. 
  These examples are assuming that the client is communicating with an OpenID Provider leveraging 
  the 'tls_client_auth' token endpoint authentication mechanism. Alternative examples are available in the appendix.

### 4.1 Pre-requisites

These **non normative** examples assumes that the OAuth Client has discovered the locations of
 all of the necessary endpoints to communicate with the banks resources from the Directory including 
 the consents resource, the data resources and the OpenID authorization discovery document from the Directory.

### 4.2 Creating Consent

```
1. Obtain an Access Token with the scope 'consents'

curl --cert transport.pem --key transport.key https://matls-auth.amazingbank.com.br/token -X POST -d 'client_id=clientIdFromAmazingBank&grant_type=client_credentials&scope=consents'

{"access_token":"2Pjwts8m1KRZmm0aJyXbOTB8zRosN55fo8Ewdulhxxa","expires_in":600,"token_type":"Bearer","scope":"consents"}

2. Create a consent resource
curl --cert transport.pem --key transport.key -H 'Authorization: Bearer 2Pjwts8m1KRZmm0aJyXbOTB8zRosN55fo8Ewdulhxxa'
-H "Content-Type: application/json"
 https://matls-api.amazingbank.com.br/consents/v1/consents
--data
'{
  "data": {
    "permissions": [
      "ACCOUNTS_READ"
    ],
    "expirationDateTime": "2021-05-21T08:30:00Z",
    "transactionFromDateTime": "2021-01-01T00:00:00Z",
    "transactionToDateTime": "2021-02-01T23:59:59Z"
  }
}'

{
  "data": {
    "consentId": "urn:amazingbank:0be7a3bb-33e6-4d73-b60a-9523aee6cc0d",
    "creationDateTime": "2021-05-21T08:30:00Z",
    "status": "AWAITING_AUTHORIZATION",
    "statusUpdateDateTime": "2021-05-21T08:30:00Z",
    "permissions": [
      "ACCOUNTS_READ"
    ],
    "expirationDateTime": "2021-05-21T08:30:00Z",
    "transactionFromDateTime": "2021-01-01T00:00:00Z",
    "transactionToDateTime": "2021-02-01T23:59:59Z"
  },
  "links": {
    "self": "https://matls-api.amazingbank.com.br/consents/v1/consents/urn:amazingbank:0be7a3bb-33e6-4d73-b60a-9523aee6cc0d"
  },
  "meta": {
    "totalRecords": 1,
    "totalPages": 1,
    "requestDateTime": "2021-05-21T08:30:00Z"
  }
}
```

### 4.3 Authorizing Consent - Redirect

### 4.3.1 Create OpenID Connect Request Object

All requirements for the OpenID Request Object are included in Brasil Open Banking Security Profile

```
{
 "alg": "PS256",
 "typ": "oauth-authz-req+jwt",
 "kid": "PWAi5ruQcHfzPzq2JFdpY7nAUh6LzTTQtDBUpOM37JQ"
}
.
{
  "scope": "openid consent:urn:amazingbank:0be7a3bb-33e6-4d73-b60a-9523aee6cc0d accounts",
  "response_type": "code id_token",
  "redirect_uri": "https://tpp.localhost/cb",
  "code_challenge": "0q5idWeuyFAGeHHpawD3k4mjE7WzPhw6hOdKbnAQY7s",
  "code_challenge_method": "S256",
  "state": "19a1456013b8be71e6ce89916c9723e0642e1eb42a9360146cc84178f2bc928e",
  "nonce": "8dedaf2c53f7ba7294825ca25e45aa544c3feda8fd4ac16220c216e973ad5fd7",
  "claims": {
    "id_token": {
      "auth_time": {
        "essential": true
      },
      "cpf": {
        "essential": true
      },
      "given_name": {
        "essential": true
      },
      "acr": {
        "values": [
          "brasil:openbanking:standard"
        ],
        "essential": true
      }
    }
  },
  "max_age": 300,
  "iss": "clientIdFromAmazingBank",
  "aud": "https://auth.amazingbank.com.br",
  "client_id": "clientIdFromAmazingBank",
  "jti": "_fj7iamgC1wDzh8KXaJ7XzJiEK_s25DhoDs7uAxpU-k",
  "iat": 1618672338,
  "exp": 1618672638,
  "nbf": 1618672338
}
Signature ommited for brevity
```

### 4.3.1.1 Requesting Specific Claims

It is also optional for TPPs to request additional Identity Claims including CPF and CNPJ. 
These claims are defined in the Brasil Open Banking Security Profile. It is also possible for a 
TPP to request that a claim MUST match a given mechanism by relying on
 [OpenID Connect Core Clause 5.5.1](https://openid.net/specs/openid-connect-core-1_0.html#IndividualClaimsRequests)
  to request individual claims.

For example

```
"cpf": {
        "essential": true,
        value: 12345678123
      },
```

Would require that the OpenID Provider only return a successful authentication and authorization if the user
 that was authenticating could be confirmed by the Bank that they had a CPF number of 12345678123. If the 
 Bank can not confirm this number then the authentication MUST fail.

Requesting specific value claims is entirely optional from the TPP.

### 4.3.2 Redirect User to Authorization Server for Authorization

As per OpenID Connect Core.

```
https://auth.amazingbank.com.br/auth?client_id=clientIdFromAmazingBank&scope=openid&request=eyJhbGciOiJQUzI1NiIsInR5cCI6Im9hdXRoLWF1dGh6LXJlcStqd3QiLCJraWQiOiJQV0FpNXJ1UWNIZnpQenEySkZkcFk3bkFVaDZMelRUUXRE...j1CpNMT7NtDerEl32E8plGnsuA
```

### 4.3.3 Obtaining Access Token via Authorization Code Exchange

As per [RFC 7636 Proof Key for Code Exchange](https://tools.ietf.org/html/rfc7636)

### 4.3.4 Checking Consent Resource Status

At this point, a TPP can optionally check the status of the consent request to see if it
 has changed to a status of fully authorized. For resources that do not require multi party 
 consent this step should not be necessary however for business accounts or joint accounts with
  special access requirements then it may take a while for the bank to obtain the additional authorizations 
  necessary for this consent to become completely authorized. TPPs should not abuse checking the consent status API

```
1. Check a consent resource
curl --cert transport.pem --key transport.key -H 'Authorization: Bearer 2Pjwts8m1KRZmm0aJyXbOTB8zRosN55fo8Ewdulhxxa'
 https://matls-api.amazingbank.com.br/consents/v1/consents/urn:amazingbank:0be7a3bb-33e6-4d73-b60a-9523aee6cc0d

{
  "data": {
    "consentId": "urn:amazingbank:0be7a3bb-33e6-4d73-b60a-9523aee6cc0d",
    "creationDateTime": "2021-05-21T08:30:00Z",
    "status": "AUTHORIZED",
    "statusUpdateDateTime": "2021-05-21T08:35:00Z",
    "permissions": [
      "ACCOUNTS_READ"
    ],
    "expirationDateTime": "2021-05-21T08:30:00Z",
    "transactionFromDateTime": "2021-01-01T00:00:00Z",
    "transactionToDateTime": "2021-02-01T23:59:59Z"
  },
  "links": {
    "self": "https://matls-api.amazingbank.com.br/consents/v1/consents/urn:amazingbank:0be7a3bb-33e6-4d73-b60a-9523aee6cc0d"
  },
  "meta": {
    "totalRecords": 1,
    "totalPages": 1,
    "requestDateTime": "2021-05-21T08:30:00Z"
  }
}
```

### 4.3.5 Access Resources

With the access token that was returned in 4.2.3, the TPP now has the ability to call customers resources.

### 4.4 Using Refresh tokens

TODO

### 4.5 Authorizing Consent - CIBA

TODO

## Appendix

### A.1 private_key_jwt client credentials grant

### A.2 Example decoded request object body

```
{
  "scope": "openid accounts consent:urn:banco:consent:10bcc1bf-2152-49f5-928a-35595bcdfe89",
  "response_type": "code id_token",
  "redirect_uri": "https://www.raidiam.com/accounting/cb",
  "code_challenge": "-6XMyeS-8YVfItXyZwSMrpr0FIvx8bxOrfSqZo09yjs",
  "code_challenge_method": "S256",
  "state": "dfc5dd1ad3985e1b1bbd49122622f0e468f773fa6a9a7baa8c1a1aa0228c53c0",
  "nonce": "d12c1f4e1f70fb1f14338c74d3fda10141cab13f64222d749c474a848beb2102",
  "claims": {
    "id_token": {
      "auth_time": {
        "essential": true
      },
      "cpf": {
        "essential": true
      },
      "cnpj": {
        "essential": true
      },
      "given_name": {
        "essential": true
      },
      "acr": {
        "values": [
          "urn:openbankingbrasil:trustframework:gold"
        ],
        "essential": true
      }
    },
    "user_info": {
      "auth_time": {
        "essential": true
      },
      "cpf": {
        "essential": true
      },
      "cnpj": {
        "essential": true
      },
      "given_name": {
        "essential": true
      },
      "acr": {
        "values": [
          "urn:openbankingbrasil:trustframework:gold"
        ],
        "essential": true
      }
    }
  },
  "max_age": 300,
  "iss": "aCnBHjZBvD6ku3KVBaslL",
  "aud": "https://auth.raidiam.com",
  "client_id": "aCnBHjZBvD6ku3KVBaslL",
  "jti": "Rgfg7FqsJJJOx35Qq8rYKYYRanJzM1-qOtNh80MBllA",
  "iat": 1618570990,
  "exp": 1618571290,
  "nbf": 1618570990
}
```

### A.2 Example decoded request object body with specific claim values being requested

In this example a client is requesting that the Authorization Server only authenticates the customer if the cpf claim matches the provided value. The processing requirements for requests with a specific 'cpf' value are defined in the Open Banking Brasil Security Profile.

```
{
  "scope": "openid accounts consent:urn:banco:consent:10bcc1bf-2152-49f5-928a-35595bcdfe89",
  "response_type": "code id_token",
  "redirect_uri": "https://www.raidiam.com/accounting/cb",
  "code_challenge": "-6XMyeS-8YVfItXyZwSMrpr0FIvx8bxOrfSqZo09yjs",
  "code_challenge_method": "S256",
  "state": "dfc5dd1ad3985e1b1bbd49122622f0e468f773fa6a9a7baa8c1a1aa0228c53c0",
  "nonce": "d12c1f4e1f70fb1f14338c74d3fda10141cab13f64222d749c474a848beb2102",
  "claims": {
    "id_token": {
      "cpf": {
        "essential": true,
        "value": 76109277673
      },
      "given_name": {
        "essential": true
      },
    },
  },
  "max_age": 300,
  "iss": "aCnBHjZBvD6ku3KVBaslL",
  "aud": "https://auth.raidiam.com",
  "client_id": "aCnBHjZBvD6ku3KVBaslL",
  "jti": "Rgfg7FqsJJJOx35Qq8rYKYYRanJzM1-qOtNh80MBllA",
  "iat": 1618570990,
  "exp": 1618571290,
  "nbf": 1618570990
}
```

### A.3 Example CIBA decoded Authentication Request body

In this example a CIBA request is being made to request consent authorization using a previously 
issued `id_token` from a redirect interaction as the indication of the resource owner that 
the bank should contact to obtain authorization.

```
{
  "iss": "301183373814979",
  "aud": "https://auth.raidiam.com",
  "iat": 1564902738,
  "nbf": 1564902738,
  "exp": 1564903038,
  "jti": "AJxZRpNqlg62UTdy37gu",
  "scope": "openid accounts consent:urn:banco:consent:10bcc1bf-2152-49f5-928a-35595bcdfe89",
  "acr_values": "urn:openbankingbrasil:trustframework:gold",
  "client_notification_token": "_MiUOY07EOCvWR5BVuOL=",
  "id_token_hint": "eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InIxTGtiQm8zOTI1UmIyWkZGckt5VTNNVmV4OVQyODE3S3gwdmJpNmlfS2MifQ.eyJzdWIiOiJyYWxwaC5icmFnZ0BnbWFpbC5jb20iLCJhdXRoX3RpbWUiOjE2MTg1NzE5MjQsIm5hdGlvbmFsX2lkIjoiNzYxMDkyNzc2NzMiLCJnaXZlbl9uYW1lIjoiUmFscGgiLCJhY3IiOiJ1cm46b3BlbmJhbmtpbmdicmFzaWw6dHJ1c3RmcmFtZXdvcms6Z29sZCIsIm5vbmNlIjoiMGIyY2IyNDA1NzM4MTA5YjFiZjQ4Mjg5ODZhMjRlZjNjY2I0MTZiMDM5MGZkNDVhMjlkMjBiMzg2NTY0MjQ1MCIsImF0X2hhc2giOiJzUEN6RlFuRWlIN3pObnY2UUVyNVZRIiwiYXVkIjoiYUNuQkhqWkJ2RDZrdTNLVkJhc2xMIiwiZXhwIjoxNjE4NTc1NTMyLCJpYXQiOjE2MTg1NzE5MzIsImlzcyI6Imh0dHBzOi8vYXV0aC5sb2NhbGhvc3QifQ.ZlBv21fxoqgP659qHjFsINqVUJdDeCBGy4-j6dz8pEC7T-gy-iIvSMjnEawavZI2RFgc9nclrN58y6uL1CJVm5hImJKMHCvwaKBSttWt4H1IM6x1e3H3sdjMkIhbVA27JhdpkuDAnEA6egX5rEwm-F09Bty-8NKIUQEq4BWFLCPx6oHHjQvEI8H0m1s9QFVsVKQc03Q4fhsqeEGgqa3AyxSWJnf-VgOWDf9HDbCmhGw3cLuVZq_zZWJ6Y5w5Ers5lIKPbwiB5a2z3Kd7XbPPVx4cLvPKiVT9XGXf8jdExeCcKBufhh3CohWcjWi7OMV5dHdkkvdo3CHvmtjYD2F_tg",
  "binding_message": "S24R",
  "user_code": "6365",
  "requested_expiry": "120",
  "request_context": {
    "location": {
      "lat": 51.17397,
      "lng": -1.82238
    }
  }
}
```

### A. 4. Example id_token with cpf claim populated

TODO

### A. 5. Example id_token with cpf and cnpjs claim populated

TODO

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


############################################
# open-banking-brasil-financial-api-1_ID1.md
############################################

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

**MFA** - Multi-Factor Authentication

# Brasil Open Banking Security Profile

## Introduction

The Brasil Open Banking Security profile specifies additional security and identity requirements for high risk API resources protected by the OAuth 2.0 Authorization Framework that consists of [RFC6749], [RFC6750], [RFC7636], [FAPI-1-Baseline], [FAPI-1-Advanced] and other specifications.

This profile describes security and features provisions for a server and client that are necessary for the Brasil Open Banking Programme by defining the measures to mitigate or address:

* attacks that address privacy considerations identified in clause 9.1 of [FAPI1 Advanced]
* the requirement to support fine grained access to resources for data minimisation purposes
* the requirement to convey the Authentication Context Request that was performed by an OpenID Provider to a Client to enable a appropriate client management of customer conduct risk.
* the requirement for clients to assert a pre-existing customer relationship by asserting a customer identity claim as part of the authorization flow.

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
12. may require the presence of a populated cpf value claim if scope includes dynamic resource scope _consent_
13. shall support refresh tokens

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

* the Consent Resource Id must include url safe characters only;
* the Consent Resource Id must be namespaced;
* the Consent Resource Id must have the properties of a nonce;

### Dynamic Consent Scope Example

consent:urn-bancoex-C1DD33123

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

##########################################################
# open-banking-brasil-dynamic-client-registration-1_ID1.md
##########################################################

%%%

    #
    # Open Banking Brasil Financial-grade API Dynamic Client Registration Profile 1.0 Implementers Draft 1
    # (open-banking-brasil-dynamic-client-registration-1_ID1)
    #
    #

    Title = "Open Banking Brasil Financial-grade API Dynamic Client Registration 1.0 Implementers Draft 1"
    abbrev = "OBB-FAPI-1-DCR-ID1"
    ipr = "none"
    workgroup = "Open Banking Brasil GT Security"
    keyword = ["FAPI", "Open Banking Brasil GT Security"]

    [seriesInfo]
    name = "Internet-Draft"
    status = "standard"
    value = "open-banking-brasil-dynamic-client-registration-1_ID1"
 
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

* [Open Banking Brasil Financial-grade API Security Profile 1.0][OBB-FAPI]
* Open Banking Brasil Dynamic Client Registration Profile 1.0

These parts are intended to be used with [RFC6749], [RFC6750], [RFC7636], [OIDC], [OIDR], [RFC7591], [RFC7592], [FAPI-1-Baseline] and [FAPI-1-Advanced]

.# Introduction

The Open Banking Brasil Financial-grade API Dynamic Client Registration Profile is a profile of [RFC7591], [RFC7592] and [OIDR] that aims to provide specific implementation guidelines for security and interoperability which can be applied to the identification, registration and management of OAuth Clients operating in the Brasil Open Banking ecosystem.
Although it is possible to code an OpenID Provider and Relying Party from first principles using this specification, the main audience for this specification is parties who already have a certified implementation of [OpenID Connect][OIDC] and want to achieve certification for the Brasil Open Banking programme.

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

* applications registered in the [Open Banking Directory of Participants](https://web.directory.openbankingbrasil.org.br) to discover OpenID Providers offering services in the Open Banking Brasil ecosystem;
* applications to use [OpenID Connect Registration][OIDR] to onboard their applications with Bank OpenID Providers; and
* applications to use [OAuth 2.0 Dynamic Client Registration Management Protocol][RFC7592] to manage their applications with OpenID Providers;

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

[RFC4514] - Lightweight Directory Access Protocol (LDAP): String Representation of Distinguished Names
[RFC4514]: <https://www.rfc-editor.org/rfc/rfc4514

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

[OBB-FAPI] - Open Banking Brasil Financial-grade API Security Profile 1.0
[OBB-FAPI]: <https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-financial-api-1_ID1.html

[OBB-Cert-Standards] - Open Banking Brasil x.509 Certificate Standards
[OBB-Cert-Standards]: <https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-certificate-standards-1_ID1.html

# Terms and definitions

For the purpose of this document, the terms defined in [RFC6749], [RFC6750], [RFC7636], [OpenID Connect Core][OIDC] and ISO29100 apply.

# Symbols and Abbreviated terms

**SSA** – Software Statement Assertion

**SS** – Software Statement

**DCR** – Dynamic Client Registration

**API** – Application Programming Interface

**FAPI** - Financial-grade API

**HTTP** – Hyper Text Transfer Protocol

**OIDF** - OpenID Foundation

**REST** – Representational State Transfer

**TLS** – Transport Layer Security

# Introduction

Brasil Open Bankings ecosystem leverages a federation trust provider or _directory of participants_ as the golden source of information on accredited participants and software that are authorized to partake in the Open Banking Brasil ecosystem.

The services by the Directory include

* Software registration and management.
* Software credential registration and management using ICP Certificates.
* Software Statement Assertion (SSA) generation

Participants within the ecosystem must leverage these services to facilitate API driven OAuth client registration using the process outlined in clause 3.1.1 of [RFC7591] with additional metadata necessary to support OpenID Connect defined in [OpenID Connect Registration][OIDR].

Where possible, authorisation servers should compare client metadata asserted by a client made as part of registration or management request against metadata claims contained within a software statement. Not all metadata that a client wishes to provide may be contained in a software statement, e.g alternative [Metadata Langauges and Script values](https://openid.net/specs/openid-connect-registration-1_0.html#LanguagesAndScripts).

# Open Banking Brasil OpenID Connect Discovery provisions

## Authorization server

The Authorization Server shall support [OpenID Connect Discovery][OIDD] as required by [Financial-grade API Security Profile 1.0 - Part 1: Baseline][FAPI-1-Baseline]

In addition, the Authorization Server

1. shall advertise its presence in the Open Banking Brasil ecosystem by being listed on the Directory of Participants;
1. shall advertise all Open Banking Brasil REST API resources protected by the OpenID Provider on the Directory of Participants;
1. shall advertise support for all signing, encryption, authentication mechanisms and standards required to support [Open Banking Brasil Financial API][OBB-FAPI];
1. shall advertise support for [OpenID Dynamic Client Registration][OIDR];
2. shall advertise `mtls_endpoint_aliases` as per clause 5 [RFC 8705 OAuth 2.0 Mutual-TLS Client Authentication and Certificate-Bound Access Tokens][RF8705] the `token_endpoint`, `registration_endpoint` and `userinfo_endpoint`;
3. if supporting [OAuth 2.0 Pushed Authorisation Requests][PAR] shall advertise through [OIDD] `mtls_endpoint_aliases` the `pushed_authorization_request_endpoint`;
4. if supporting [Financial API - Client Initiated Back Channel Authentication][FAPI-CIBA] shall advertise through [OIDD] `mtls_endpoint_aliases` the `backchannel_authentication_endpoint`;

## Client

The Client shall support [OpenID Connect Discovery][OIDD] as required by [Financial-grade API Security Profile 1.0 - Part 1: Baseline][FAPI-1-Baseline]

In addition, the Authorization Server

1. shall rely on ecosystem discovery services provided by Directory of Participants only;
1. shall derive necessary Authorisation Server metadata by relying on an Authorization Servers OpenID Connect Discovery services only;
1. where present, shall use endpoints advertised in `mtls_endpoint_aliases` as per clause 5 [RFC 8705 OAuth 2.0 Mutual-TLS Client Authentication and Certificate-Bound Access Tokens][RF8705];

# Open Banking Brasil OpenID Connect Registration Provisions

## Authorization server

The Authorization Server shall support the [RFC7591], [RFC7592] and [OpenID Registration][OIDR]

In addition, the Authorization Server

1. shall reject dynamic client registration requests not performed over a connection secured with mutual tls using certificates issued by Brazil ICP (production) or the Directory of Participants (sandbox);
1. shall validate that the request contains software_statement jwt signed using using the PS256 alg issued by the open banking brasil directory of participants;
1. shall validate that the software_statement was issued (iat) not more than 5 minutes prior to the request being received;
1. shall validate that a `jwks` (key set by value) was **not** included;
1. shall require and validate that the `jwks_uri` matches the `software_jwks_uri` provided in the software statement;
1. shall require and validate that `redirect_uris` match or contain a sub set of software_redirect_uris provided in the software statement;
1. shall require and validate that all client authentication mechanism adhere to the requirements defined in [Financial-grade API Security Profile 1.0 - Part 1: Advanced](https://openid.net/specs/openid-financial-api-part-2-1_0.html);
1. shall require encrypted request objects as required by the Brasil Open Banking Security Profile;
1. shall validate that requested scopes are appropriate for the softwares authorized regulatory roles;
1. should where possible validate client asserted metadata against metadata provided in the software_statement;
1. shall accept all x.500 AttributeType name strings defined in the Distinguished Name of the x.509 Certificate Profiles defined in [Open Banking Brasil x.509 Certificate Standards][OBB-Cert-Standards];
1. if supporting `tls_client_auth` client authenication mechanism as defined in [RFC8705] shall only accept `tls_client_auth_subject_dn`  as an indication of the certificate subject value as defined in clause 2.1.2 [RFC8705];

These provisions apply equally to the processing of [RFC7591], [RFC7592] and [OpenID Registration][OIDR] requests

### Applying Server Defaults

Where properties of a DCR request are not included and are not mandatory in the specification the Authorisation Server shall apply client defaults in the following manner

1. shall select and apply the encryption algorithm and cipher choice from the most recommended of the IANA cipher suites that is supported by the Authorisation Server;
1. shall populate defaults from values within the software statement assertion where possible;
1. shall grant the client permission to the complete set of potential scopes based on the softwares regulatory permissions included in the software_statement;

### Certificate Distinguished Name Parsing

Clause 3 of [Lightweight Directory Access Protocol (LDAP): String Representation of Distinguished Names][RFC4514] defines the mandatory OIDs whose AttributeType strings (descriptors) must be recognized by implementers. This mandatory list does not include several of the OIDs defined in [Open Banking Brasil x.509 Certificate Standards][OBB-Cert-Standards] nor is there a defined mechanism for Authorisation Servers to publish  information regarding the format that they would expect a Dynamic Client Registration request that includes a `tls_client_auth_subject_dn` to be presented in.

To address this ambiguity, the Authorization Server must accept all AttributeType name strings (descripters) defined in the last paragraph of clause 3 [RFC4515] in addition to all of the AttributeTypes defined in the Distinguished Name of the [Open Banking Brasil x.509 Certificate Standards][OBB-Cert-Standards].

## Regulatory Roles to OpenID and OAuth 2.0 Mappings

To participate in the Open Banking ecosystem, accredited institutions must register themselves in the directory of participants according to their regulatory roles. Those roles reflect the institutions' authorization from the Central Bank and, consequently, the APIs they are allowed to use.

The following table describes the regulatory roles for Open Banking and the related OAuth 2.0 scopes mapping. If the scopes are omitted during the DCR process, the authorization server shall grant the complete set of potential scopes based on the registering bank's regulatory roles, as described in the Server Defaults section.

| Regulatory Role | Description | Allowed Scopes | Target Phase|
| --- | --- | --- | --- |
| DADOS | Instituição transmissora / receptora de dados (AISP) | openid accounts credit-cards-accounts consents customers invoice-financings financings loans unarragned-accounts-overdraft consents | Phase 2 |
| PAGTO | Instituição prestadora de serviço de iniciação de pagamentos (PISP) | openid payments consents | Phase 3 |
| CONTA | Instituição detentora de conta (ASPSP) | openid | Phase 3 |
| CCORR | Correspondente de crédito | openid | Phase 3* |


### Implementers Note

In line with guidance from the IETF and the direction of travel for fine grained consent management. The obligation falls to the Authorisation Server to ensure that there is sufficient scope conveyed in an access token necessary to fulfill the Permissions conveyed in the Consent Request. This principle and requirement is reflected in the forthcoming Grant Management API.

## Regulatory Roles to dynamic OAuth 2.0 scope Mappings

| Regulatory Role | Allowed Scopes |
| --- | --- |
| DADOS | consent:{ConsentId} |
| PAGTO | consent:{ConsentId} |

# Software Statement

> A software statement is a JSON Web Token (JWT) [RFC7519] that asserts metadata values about the client software as a bundle.

## Software Statement Claims

The following example contains all of the claims currently included in a software statement

```
{
  "software_mode": "Live",
  "software_redirect_uris": [
    "https://www.raidiam.com/accounting/cb"
  ],
  "software_statement_roles": [
    {
      "role": "DADOS",
      "authorisation_domain": "Open Banking",
      "status": "Active"
    },
    {
      "role": "PAGTO",
      "authorisation_domain": "Open Banking",
      "status": "Active"
    }
  ],
  "software_client_name": "Raidiam Accounting",
  "org_status": "Active",
  "software_client_id": "Cki1EbvjwyhPB12NGLlz2",
  "iss": "Open Banking Open Banking Brasil prod SSA issuer",
  "software_tos_uri": "https://www.raidiam.com/accounting/tos.html",
  "software_client_description": "Raidiam Accounting leverage cutting edge open banking access to bring you real time up to date views of your finances",
  "software_jwks_uri": "https://keystore.directory.openbankingbrasil.org.br/b961c4eb-509d-4edf-afeb-35642b38185d/25556d5a-b9dd-4e27-aa1a-cce732fe74de/application.jwks",
  "software_policy_uri": "https://www.raidiam.com/accounting/policy.html",
  "software_id": "25556d5a-b9dd-4e27-aa1a-cce732fe74de",
  "software_client_uri": "https://www.raidiam.com/accounting.html",
  "software_jwks_inactive_uri": "https://keystore.directory.openbankingbrasil.org.br/b961c4eb-509d-4edf-afeb-35642b38185d/25556d5a-b9dd-4e27-aa1a-cce732fe74de/inactive/application.jwks",
  "software_jwks_transport_inactive_uri": "https://keystore.directory.openbankingbrasil.org.br/b961c4eb-509d-4edf-afeb-35642b38185d/25556d5a-b9dd-4e27-aa1a-cce732fe74de/inactive/transport.jwks",
  "software_jwks_transport_uri": "https://keystore.directory.openbankingbrasil.org.br/b961c4eb-509d-4edf-afeb-35642b38185d/25556d5a-b9dd-4e27-aa1a-cce732fe74de/transport.jwks",
  "software_logo_uri": "https://www.raidiam.com/accounting/logo.png",
  "org_id": "b961c4eb-509d-4edf-afeb-35642b38185d",
  "software_environment": "production",
  "software_version": 1.1,
  "software_roles": [
    "DADOS",
    "PAGTO"
  ],
  "org_name": "Open Banking Brasil",
  "iat": 1620060821,
  "organisation_competent_authority_claims": [
    {
      "authorisation_domain": "Open Banking",
      "authorisations": [],
      "registration_id": "13353236-OBB-CONTA",
      "authority_id": "687a1c94-b360-4e04-9589-0fa5cb16451b",
      "authorisation_role": "CONTA",
      "authority_code": "BCB",
      "status": "Active"
    },
    {
      "authorisation_domain": "Open Banking",
      "authorisations": [],
      "registration_id": "13353236-OBB-DADOS",
      "authority_id": "687a1c94-b360-4e04-9589-0fa5cb16451b",
      "authorisation_role": "DADOS",
      "authority_code": "BCB",
      "status": "Active"
    },
    {
      "authorisation_domain": "Open Banking",
      "authorisations": [],
      "registration_id": "13353236-OBB-PAGTO",
      "authority_id": "687a1c94-b360-4e04-9589-0fa5cb16451b",
      "authorisation_role": "PAGTO",
      "authority_code": "BCB",
      "status": "Active"
    }
  ]
}
```

# Dynamic Client Registration Request Processing

!---
![Dynamic Client Registration](images/dcr.svg)
!---

## Posting a request with a software statement

This example includes various optional fields, some of which may not be applicable to some deployments. Line wraps within values are for display purposes only.

```
POST /reg HTTP/1.1
Host: auth.raidiam.com
Content-Type: application/json
{
"application_type": "web",
"grant_types": [
    "client_credentials",
    "authorization_code",
    "refresh_token",
    "implicit"
],
"id_token_signed_response_alg": "PS256",
"require_auth_time": false,
"response_types": [
    "code id_token",
    "id_token"
],
"software_statement": "eyJraWQiOiJzaWduZXIiLCJ0eXAiOiJKV1QiLCJhbGciOiJQUzI1NiJ9.eyJzb2Z0d2FyZV9tb2RlIjoiTGl2ZSIsInNvZnR3YXJlX3JlZGlyZWN0X3VyaXMiOlsiaHR0cHM6XC9cL3d3dy5yYWlkaWFtLmNvbVwvYWNjb3VudGluZ1wvY2IiXSwic29mdHdhcmVfc3RhdGVtZW50X3JvbGVzIjpbeyJyb2xlIjoiREFET1MiLCJhdXRob3Jpc2F0aW9uX2RvbWFpbiI6Ik9wZW4gQmFua2luZyIsInN0YXR1cyI6IkFjdGl2ZSJ9LHsicm9sZSI6IlBBR1RPIiwiYXV0aG9yaXNhdGlvbl9kb21haW4iOiJPcGVuIEJhbmtpbmciLCJzdGF0dXMiOiJBY3RpdmUifV0sInNvZnR3YXJlX2NsaWVudF9uYW1lIjoiUmFpZGlhbSBBY2NvdW50aW5nIiwib3JnX3N0YXR1cyI6IkFjdGl2ZSIsInNvZnR3YXJlX2NsaWVudF9pZCI6IkNraTFFYnZqd3loUEIxMk5HTGx6MiIsImlzcyI6Ik9wZW4gQmFua2luZyBPcGVuIEJhbmtpbmcgQnJhc2lsIHByb2QgU1NBIGlzc3VlciIsInNvZnR3YXJlX3Rvc191cmkiOiJodHRwczpcL1wvd3d3LnJhaWRpYW0uY29tXC9hY2NvdW50aW5nXC90b3MuaHRtbCIsInNvZnR3YXJlX2NsaWVudF9kZXNjcmlwdGlvbiI6IlJhaWRpYW0gQWNjb3VudGluZyBsZXZlcmFnZSBjdXR0aW5nIGVkZ2Ugb3BlbiBiYW5raW5nIGFjY2VzcyB0byBicmluZyB5b3UgcmVhbCB0aW1lIHVwIHRvIGRhdGUgdmlld3Mgb2YgeW91ciBmaW5hbmNlcyIsInNvZnR3YXJlX2p3a3NfZW5kcG9pbnQiOiJodHRwczpcL1wva2V5c3RvcmUuZGlyZWN0b3J5Lm9wZW5iYW5raW5nYnJhc2lsLm9yZy5iclwvYjk2MWM0ZWItNTA5ZC00ZWRmLWFmZWItMzU2NDJiMzgxODVkXC8yNTU1NmQ1YS1iOWRkLTRlMjctYWExYS1jY2U3MzJmZTc0ZGVcL2FwcGxpY2F0aW9uLmp3a3MiLCJzb2Z0d2FyZV9wb2xpY3lfdXJpIjoiaHR0cHM6XC9cL3d3dy5yYWlkaWFtLmNvbVwvYWNjb3VudGluZ1wvcG9saWN5Lmh0bWwiLCJzb2Z0d2FyZV9pZCI6IjI1NTU2ZDVhLWI5ZGQtNGUyNy1hYTFhLWNjZTczMmZlNzRkZSIsInNvZnR3YXJlX2NsaWVudF91cmkiOiJodHRwczpcL1wvd3d3LnJhaWRpYW0uY29tXC9hY2NvdW50aW5nLmh0bWwiLCJzb2Z0d2FyZV9qd2tzX2luYWN0aXZlX2VuZHBvaW50IjoiaHR0cHM6XC9cL2tleXN0b3JlLmRpcmVjdG9yeS5vcGVuYmFua2luZ2JyYXNpbC5vcmcuYnJcL2I5NjFjNGViLTUwOWQtNGVkZi1hZmViLTM1NjQyYjM4MTg1ZFwvMjU1NTZkNWEtYjlkZC00ZTI3LWFhMWEtY2NlNzMyZmU3NGRlXC9pbmFjdGl2ZVwvYXBwbGljYXRpb24uandrcyIsInNvZnR3YXJlX2p3a3NfdHJhbnNwb3J0X2luYWN0aXZlX2VuZHBvaW50IjoiaHR0cHM6XC9cL2tleXN0b3JlLmRpcmVjdG9yeS5vcGVuYmFua2luZ2JyYXNpbC5vcmcuYnJcL2I5NjFjNGViLTUwOWQtNGVkZi1hZmViLTM1NjQyYjM4MTg1ZFwvMjU1NTZkNWEtYjlkZC00ZTI3LWFhMWEtY2NlNzMyZmU3NGRlXC9pbmFjdGl2ZVwvdHJhbnNwb3J0Lmp3a3MiLCJzb2Z0d2FyZV9qd2tzX3RyYW5zcG9ydF9lbmRwb2ludCI6Imh0dHBzOlwvXC9rZXlzdG9yZS5kaXJlY3Rvcnkub3BlbmJhbmtpbmdicmFzaWwub3JnLmJyXC9iOTYxYzRlYi01MDlkLTRlZGYtYWZlYi0zNTY0MmIzODE4NWRcLzI1NTU2ZDVhLWI5ZGQtNGUyNy1hYTFhLWNjZTczMmZlNzRkZVwvdHJhbnNwb3J0Lmp3a3MiLCJzb2Z0d2FyZV9sb2dvX3VyaSI6Imh0dHBzOlwvXC93d3cucmFpZGlhbS5jb21cL2FjY291bnRpbmdcL2xvZ28ucG5nIiwib3JnX2lkIjoiYjk2MWM0ZWItNTA5ZC00ZWRmLWFmZWItMzU2NDJiMzgxODVkIiwic29mdHdhcmVfZW52aXJvbm1lbnQiOiJwcm9kdWN0aW9uIiwic29mdHdhcmVfdmVyc2lvbiI6MS4xMCwic29mdHdhcmVfcm9sZXMiOlsiREFET1MiLCJQQUdUTyJdLCJvcmdfbmFtZSI6Ik9wZW4gQmFua2luZyBCcmFzaWwiLCJpYXQiOjE2MTgzMzYyNjIsIm9yZ2FuaXNhdGlvbl9jb21wZXRlbnRfYXV0aG9yaXR5X2NsYWltcyI6W3siYXV0aG9yaXNhdGlvbl9kb21haW4iOiJPcGVuIEJhbmtpbmciLCJhdXRob3Jpc2F0aW9ucyI6W10sInJlZ2lzdHJhdGlvbl9pZCI6IjEzMzUzMjM2LU9CQi1DT05UQSIsImF1dGhvcml0eV9pZCI6IjY4N2ExYzk0LWIzNjAtNGUwNC05NTg5LTBmYTVjYjE2NDUxYiIsImF1dGhvcmlzYXRpb25fcm9sZSI6IkNPTlRBIiwiYXV0aG9yaXR5X2NvZGUiOiJCQ0IiLCJzdGF0dXMiOiJBY3RpdmUifSx7ImF1dGhvcmlzYXRpb25fZG9tYWluIjoiT3BlbiBCYW5raW5nIiwiYXV0aG9yaXNhdGlvbnMiOltdLCJyZWdpc3RyYXRpb25faWQiOiIxMzM1MzIzNi1PQkItREFET1MiLCJhdXRob3JpdHlfaWQiOiI2ODdhMWM5NC1iMzYwLTRlMDQtOTU4OS0wZmE1Y2IxNjQ1MWIiLCJhdXRob3Jpc2F0aW9uX3JvbGUiOiJEQURPUyIsImF1dGhvcml0eV9jb2RlIjoiQkNCIiwic3RhdHVzIjoiQWN0aXZlIn0seyJhdXRob3Jpc2F0aW9uX2RvbWFpbiI6Ik9wZW4gQmFua2luZyIsImF1dGhvcmlzYXRpb25zIjpbXSwicmVnaXN0cmF0aW9uX2lkIjoiMTMzNTMyMzYtT0JCLVBBR1RPIiwiYXV0aG9yaXR5X2lkIjoiNjg3YTFjOTQtYjM2MC00ZTA0LTk1ODktMGZhNWNiMTY0NTFiIiwiYXV0aG9yaXNhdGlvbl9yb2xlIjoiUEFHVE8iLCJhdXRob3JpdHlfY29kZSI6IkJDQiIsInN0YXR1cyI6IkFjdGl2ZSJ9XX0.W6hUAYhjT6I61rxEIVMKYKre93LTbRdzKnk9dJvUdzVgAz5B9KxZNutf27oO3k0hrjYVWBdWq23o_e4Y_AaKdpS9-rtU84JiHtmqV0wcFYIM8nqcUVWqQ-Ux6Nq9L2G-s2YNd3PcJ1e3yGg9h8553Gr7iJusKEgApzXUpkM2rBELQuumktUE_JBiuIkXmWxoRnO1cW-Osbk3MT3bxG43SPcxii07Q5S8qXI6PjCPA3fYlnaUAygwZM3O0oa7jqmSr7d9UsHuDMJfYhIKdq2wyQQKORCN-D2UopmMX-lHMvAVkkrAO08T0-7odjr4PJk-PrwuoCxeAfa7440ZDOrlmQ",
"subject_type": "public",
"token_endpoint_auth_method": "private_key_jwt",
"introspection_endpoint_auth_method": "private_key_jwt",
"revocation_endpoint_auth_method": "private_key_jwt",
"request_object_signing_alg": "PS256",
"require_signed_request_object": true,
"require_pushed_authorization_requests": false,
"tls_client_certificate_bound_access_tokens": true,
"client_id": "aCnBHjZBvD6ku3KVBaslL",
"client_name": "Raidiam Accounting",
"client_uri": "https://www.raidiam.com/accounting.html",
"request_object_encryption_alg": "RSA-OAEP",
"request_object_encryption_enc": "A256GCM"
"jwks_uri": "https://keystore.directory.openbankingbrasil.org.br/b961c4eb-509d-4edf-afeb-35642b38185d/25556d5a-b9dd-4e27-aa1a-cce732fe74de/application.jwks",
"redirect_uris": [
    "https://www.raidiam.com/accounting/cb"
]
}
```

## Open Banking Brasil SSA Key Store and Issuer Details

**Production**

[https://keystore.directory.openbankingbrasil.org.br/openbanking.jwks](https://keystore.directory.openbankingbrasil.org.br/openbanking.jwks)

Open Banking Open Banking Brasil production SSA issuer

**Sandbox**

[https://keystore.sandbox.directory.openbankingbrasil.org.br/openbanking.jwks](https://keystore.sandbox.directory.openbankingbrasil.org.br/openbanking.jwks)

Open Banking Open Banking Brasil sandbox SSA issuer

# Acknowledgement

With thanks to all who have set the foundations for secure and safe data sharing through the formation of the OpenID Foundation FAPI Working Group, the Open Banking Brasil GT Security and to the pioneers who will stand on their shoulders.

The following people contributed to this document:

* Ralph Bragg (Raidiam)
* Alexandre Siqueira (Mercado Pago)
* Bernardo Vale (Banco Inter)

{backmatter}

# Notices

Copyright (c) 2021 Open Banking Brasil Initial Structure.

The Open Banking Brasil Initial Structure (OBBIS) grants to any Contributor, developer, implementer, or other interested party a non-exclusive, royalty-free, worldwide copyright license to reproduce, prepare derivative works from, distribute, perform and display, this Implementers Draft or Final Specification solely for the purposes of (i) developing specifications, and (ii) implementing Implementers Drafts and Final Specifications based on such documents, provided that attribution be made to the OBBIS as the source of the material, but that such attribution does not indicate an endorsement by the OBBIS.

The technology described in this specification was made available from contributions from various sources, including members of the OpenID Foundation, the Open Banking Brasil GT Security Working Group and others. Although the Open Banking Brasil Initial Structure has taken steps to help ensure that the technology is available for distribution, it takes no position regarding the validity or scope of any intellectual property or other rights that might be claimed to pertain to the implementation or use of the technology described in this specification or the extent to which any license under such rights might or might not be available; neither does it represent that it has made any independent effort to identify any such rights. The Open Banking Brasil Initial Structure and the contributors to this specification make no (and hereby expressly disclaim any) warranties (express, implied, or otherwise), including implied warranties of merchantability, non-infringement, fitness for a particular purpose, or title, related to this specification, and the entire risk as to implementing this specification is assumed by the implementer. The Open Banking Brasil Intellectual Property Rights policy requires contributors to offer a patent promise not to assert certain patent claims against other contributors and against implementers. The Open Banking Brasil Initial Structure invites any interested party to bring to its attention any copyrights, patents, patent applications, or other proprietary rights that may cover technology that may be required to practice this specification.

## Appendix A. Example Software Statement Assertion

```
eyJraWQiOiJzaWduZXIiLCJ0eXAiOiJKV1QiLCJhbGciOiJQUzI1NiJ9.eyJzb2Z0d2FyZV9tb2RlIjoiTGl2ZSIsInNvZnR3YXJlX3JlZGlyZWN0X3VyaXMiOlsiaHR0cHM6XC9cL3d3dy5yYWlkaWFtLmNvbVwvYWNjb3VudGluZ1wvY2IiXSwic29mdHdhcmVfc3RhdGVtZW50X3JvbGVzIjpbeyJyb2xlIjoiREFET1MiLCJhdXRob3Jpc2F0aW9uX2RvbWFpbiI6Ik9wZW4gQmFua2luZyIsInN0YXR1cyI6IkFjdGl2ZSJ9LHsicm9sZSI6IlBBR1RPIiwiYXV0aG9yaXNhdGlvbl9kb21haW4iOiJPcGVuIEJhbmtpbmciLCJzdGF0dXMiOiJBY3RpdmUifV0sInNvZnR3YXJlX2NsaWVudF9uYW1lIjoiUmFpZGlhbSBBY2NvdW50aW5nIiwib3JnX3N0YXR1cyI6IkFjdGl2ZSIsInNvZnR3YXJlX2NsaWVudF9pZCI6IkNraTFFYnZqd3loUEIxMk5HTGx6MiIsImlzcyI6Ik9wZW4gQmFua2luZyBPcGVuIEJhbmtpbmcgQnJhc2lsIHByb2QgU1NBIGlzc3VlciIsInNvZnR3YXJlX3Rvc191cmkiOiJodHRwczpcL1wvd3d3LnJhaWRpYW0uY29tXC9hY2NvdW50aW5nXC90b3MuaHRtbCIsInNvZnR3YXJlX2NsaWVudF9kZXNjcmlwdGlvbiI6IlJhaWRpYW0gQWNjb3VudGluZyBsZXZlcmFnZSBjdXR0aW5nIGVkZ2Ugb3BlbiBiYW5raW5nIGFjY2VzcyB0byBicmluZyB5b3UgcmVhbCB0aW1lIHVwIHRvIGRhdGUgdmlld3Mgb2YgeW91ciBmaW5hbmNlcyIsInNvZnR3YXJlX2p3a3NfZW5kcG9pbnQiOiJodHRwczpcL1wva2V5c3RvcmUuZGlyZWN0b3J5Lm9wZW5iYW5raW5nYnJhc2lsLm9yZy5iclwvYjk2MWM0ZWItNTA5ZC00ZWRmLWFmZWItMzU2NDJiMzgxODVkXC8yNTU1NmQ1YS1iOWRkLTRlMjctYWExYS1jY2U3MzJmZTc0ZGVcL2FwcGxpY2F0aW9uLmp3a3MiLCJzb2Z0d2FyZV9wb2xpY3lfdXJpIjoiaHR0cHM6XC9cL3d3dy5yYWlkaWFtLmNvbVwvYWNjb3VudGluZ1wvcG9saWN5Lmh0bWwiLCJzb2Z0d2FyZV9pZCI6IjI1NTU2ZDVhLWI5ZGQtNGUyNy1hYTFhLWNjZTczMmZlNzRkZSIsInNvZnR3YXJlX2NsaWVudF91cmkiOiJodHRwczpcL1wvd3d3LnJhaWRpYW0uY29tXC9hY2NvdW50aW5nLmh0bWwiLCJzb2Z0d2FyZV9qd2tzX2luYWN0aXZlX2VuZHBvaW50IjoiaHR0cHM6XC9cL2tleXN0b3JlLmRpcmVjdG9yeS5vcGVuYmFua2luZ2JyYXNpbC5vcmcuYnJcL2I5NjFjNGViLTUwOWQtNGVkZi1hZmViLTM1NjQyYjM4MTg1ZFwvMjU1NTZkNWEtYjlkZC00ZTI3LWFhMWEtY2NlNzMyZmU3NGRlXC9pbmFjdGl2ZVwvYXBwbGljYXRpb24uandrcyIsInNvZnR3YXJlX2p3a3NfdHJhbnNwb3J0X2luYWN0aXZlX2VuZHBvaW50IjoiaHR0cHM6XC9cL2tleXN0b3JlLmRpcmVjdG9yeS5vcGVuYmFua2luZ2JyYXNpbC5vcmcuYnJcL2I5NjFjNGViLTUwOWQtNGVkZi1hZmViLTM1NjQyYjM4MTg1ZFwvMjU1NTZkNWEtYjlkZC00ZTI3LWFhMWEtY2NlNzMyZmU3NGRlXC9pbmFjdGl2ZVwvdHJhbnNwb3J0Lmp3a3MiLCJzb2Z0d2FyZV9qd2tzX3RyYW5zcG9ydF9lbmRwb2ludCI6Imh0dHBzOlwvXC9rZXlzdG9yZS5kaXJlY3Rvcnkub3BlbmJhbmtpbmdicmFzaWwub3JnLmJyXC9iOTYxYzRlYi01MDlkLTRlZGYtYWZlYi0zNTY0MmIzODE4NWRcLzI1NTU2ZDVhLWI5ZGQtNGUyNy1hYTFhLWNjZTczMmZlNzRkZVwvdHJhbnNwb3J0Lmp3a3MiLCJzb2Z0d2FyZV9sb2dvX3VyaSI6Imh0dHBzOlwvXC93d3cucmFpZGlhbS5jb21cL2FjY291bnRpbmdcL2xvZ28ucG5nIiwib3JnX2lkIjoiYjk2MWM0ZWItNTA5ZC00ZWRmLWFmZWItMzU2NDJiMzgxODVkIiwic29mdHdhcmVfZW52aXJvbm1lbnQiOiJwcm9kdWN0aW9uIiwic29mdHdhcmVfdmVyc2lvbiI6MS4xMCwic29mdHdhcmVfcm9sZXMiOlsiREFET1MiLCJQQUdUTyJdLCJvcmdfbmFtZSI6Ik9wZW4gQmFua2luZyBCcmFzaWwiLCJpYXQiOjE2MTgzMzYyNjIsIm9yZ2FuaXNhdGlvbl9jb21wZXRlbnRfYXV0aG9yaXR5X2NsYWltcyI6W3siYXV0aG9yaXNhdGlvbl9kb21haW4iOiJPcGVuIEJhbmtpbmciLCJhdXRob3Jpc2F0aW9ucyI6W10sInJlZ2lzdHJhdGlvbl9pZCI6IjEzMzUzMjM2LU9CQi1DT05UQSIsImF1dGhvcml0eV9pZCI6IjY4N2ExYzk0LWIzNjAtNGUwNC05NTg5LTBmYTVjYjE2NDUxYiIsImF1dGhvcmlzYXRpb25fcm9sZSI6IkNPTlRBIiwiYXV0aG9yaXR5X2NvZGUiOiJCQ0IiLCJzdGF0dXMiOiJBY3RpdmUifSx7ImF1dGhvcmlzYXRpb25fZG9tYWluIjoiT3BlbiBCYW5raW5nIiwiYXV0aG9yaXNhdGlvbnMiOltdLCJyZWdpc3RyYXRpb25faWQiOiIxMzM1MzIzNi1PQkItREFET1MiLCJhdXRob3JpdHlfaWQiOiI2ODdhMWM5NC1iMzYwLTRlMDQtOTU4OS0wZmE1Y2IxNjQ1MWIiLCJhdXRob3Jpc2F0aW9uX3JvbGUiOiJEQURPUyIsImF1dGhvcml0eV9jb2RlIjoiQkNCIiwic3RhdHVzIjoiQWN0aXZlIn0seyJhdXRob3Jpc2F0aW9uX2RvbWFpbiI6Ik9wZW4gQmFua2luZyIsImF1dGhvcmlzYXRpb25zIjpbXSwicmVnaXN0cmF0aW9uX2lkIjoiMTMzNTMyMzYtT0JCLVBBR1RPIiwiYXV0aG9yaXR5X2lkIjoiNjg3YTFjOTQtYjM2MC00ZTA0LTk1ODktMGZhNWNiMTY0NTFiIiwiYXV0aG9yaXNhdGlvbl9yb2xlIjoiUEFHVE8iLCJhdXRob3JpdHlfY29kZSI6IkJDQiIsInN0YXR1cyI6IkFjdGl2ZSJ9XX0.W6hUAYhjT6I61rxEIVMKYKre93LTbRdzKnk9dJvUdzVgAz5B9KxZNutf27oO3k0hrjYVWBdWq23o_e4Y_AaKdpS9-rtU84JiHtmqV0wcFYIM8nqcUVWqQ-Ux6Nq9L2G-s2YNd3PcJ1e3yGg9h8553Gr7iJusKEgApzXUpkM2rBELQuumktUE_JBiuIkXmWxoRnO1cW-Osbk3MT3bxG43SPcxii07Q5S8qXI6PjCPA3fYlnaUAygwZM3O0oa7jqmSr7d9UsHuDMJfYhIKdq2wyQQKORCN-D2UopmMX-lHMvAVkkrAO08T0-7odjr4PJk-PrwuoCxeAfa7440ZDOrlmQ
```

%%%

    #
    # Open Banking Brasil Certificate Standards 1.0 Implementers Draft 1
    # (open-banking-brasil-certificate-standards-1_ID1)
    #
    #

    title = "Open Banking Brasil Certificate Standards 1.0 Implementers Draft 1"
    abbrev = "OBB-CERT-1-ID1"
    ipr = "none"
    workgroup = "Open Banking Brasil GT Security"
    keyword = ["FAPI", "CERT", "Open Banking Brasil GT Security"]

    [seriesInfo]
    name = "Internet-Draft"
    status = "standard"
    value = "open-banking-brasil-certificate-standards-1_ID1"

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
    initials = "J."
    surname = "Dias"
    fullname = "Jose Michael Dias"
    organization = "Banco Pan"
    abbrev = "Banco Pan"
      [author.address]
      email = "jose.henrique@grupopan.com"
      uri = "https://www.bancopan.com.br/"

    [[author]]
    initials = "GT"
    surname = "Security"
    fullname = "OBBIS GT Security"
    organization = "Open Banking Brasil Initial Structure"
    abbrev = "OBBIS"
      [author.address]
      email = "gt-seguranca@openbankingbr.org"
      uri = "https://openbankingbrasil.org.br/"


####################################################
# open-banking-brasil-certificate-standards-1_ID1.md
####################################################

%%%

.# Prefácio

A Estrutura Inicial do Open Banking Brasil é responsável por criar padrões e especificações necessárias para garantir que os requisitos e obrigações da Regulações do Open Banking Brasil como originalmente publicadas pelo Banco Central do Brasil. É possível que parte dos elementos deste documento estejam sujeitos a direitos autorais.  A Estrutura Inicial do Open Banking Brasil não deve ser responsável por identificar nenhuma parte ou totalidade destes direitos autorais.

.# Objetivo

Especificar o conjunto de certificados necessários para o Open Banking Brasil são padrões de certificados que devem ser utilizados por seus participantes para garantir interoperabilidade para autenticação, confidencialidade, integridade e não repúdio entre as entidades participantes do Open Banking Brasil, bem como para os usuários e consumidores destas entidades. O público desta especificação são entidades que são participantes do Open Banking Brasil e necessitam fazer a emissão de certificados para autenticar junto a outras entidades bem como oferecer a seus clientes um canal de autenticação seguro.

.# Convenções Notacionais

As palavras-chave "deve", "não deve", "recomenda", "não recomenda", "pode" e "pode" neste documento devem ser interpretadas conforme descrito na [Diretiva ISO Parte 2] [ISODIR2]. Essas palavras-chave não são usadas como termos de dicionário, de forma que qualquer ocorrência delas deve ser interpretada como palavras-chave e não devem ser interpretadas com seus significados em linguagem natural.

{mainmatter}

# Escopo

Este documento especifica os tipos de certificados necessários para:

* Autenticar mutuamente (MTLS - Mutual - TLS) as aplicações dos participantes;
* Assinatura de Mensagens (JWS - JSON Web Signature) de aplicações para garantir a autenticidade e não repúdio de mensagens entre os participantes;
* Apresentar um canal seguro e confiável para clientes do Open Banking Brasil;
* Autenticar participantes junto do Diretório de participantes do Open Banking Brasil.

# Referências Normativas  {#References}

Os seguintes documentos referenciados são indispensáveis para a aplicação deste documento. Para referências datadas, apenas a edição citada se aplica. Para referências não datadas, a última edição do documento referenciado (incluindo quaisquer emendas) se aplica.

* [ISODIR2] - ISO/IEC Directives Part 2 [ISODIR2]: <https://www.iso.org/sites/directives/current/part2/index.xhtml>
* [RFC5280] -  Internet X.509 Public Key Infrastructure Certificate and Certificate Revocation List (CRL) Profile: <https://datatracker.ietf.org/doc/html/rfc5280>
* [RFC7519] - JSON Web Token (JWT) [RFC7519]:<https://tools.ietf.org/html/rfc7519>
* [RFC7515] - JSON Web Signature (JWS) [RFC7515] :<https://datatracker.ietf.org/doc/html/rfc7515>
* [RFC7591] - OAuth 2.0 Dynamic Client Registration Protocol [RFC7591]:<https://tools.ietf.org/html/rfc7591>
* [RFC7592] - OAuth 2.0 Dynamic Client Registration Management Protocol [RFC7592]:<https://tools.ietf.org/html/rfc7592>
* [BCP195] - Recommendations for Secure Use of Transport Layer Security (TLS) and Datagram Transport Layer Security (DTLS) [BCP195]: <https://tools.ietf.org/html/bcp195>
* [RFC8705] - OAuth 2.0 Mutual TLS Client Authentication and Certificate Bound Access Tokens [RFC8705]: <https://tools.ietf.org/html/rfc8705>
* [OBB-FAPI] - Open Banking Brasil Financial-grade API Security Profile 1.0 [OBB-FAPI]: <https://github.com/OpenBanking-Brasil/specs-seguranca/open-banking-brasil-financial-api-1_ID1.html>
* [DOC-ICP-01] - DECLARAÇÃO DE PRÁTICAS DE CERTIFICAÇÃO DA AUTORIDADE CERTIFICADORA RAIZ DA ICP-BRASIL: <https://www.gov.br/iti/pt-br/centrais-de-conteudo/doc-icp-01-v-5-2-dpc-da-ac-raiz-da-icp-brasil-pdf>
* [RFC6749] - The OAuth 2.0 Authorization Framework [RFC6749]: <https://tools.ietf.org/html/rfc6749>
* [BCB-IN99] - Manual de Segurança do Open Banking: <https://www.in.gov.br/en/web/dou/-/instrucao-normativa-bcb-n-99-de-14-de-abril-de-2021-314641007>
* [RFC2818] - HTTP Over TLS: <https://datatracker.ietf.org/doc/html/rfc2818>

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

# Padrao de Certificados Open Banking Brasil

## Introducao

O sistema de Open Banking Brasil faz uso de cadeias de certificados e protocolo TLS para garantir a confidencialidade, autenticação e integridade do canal de comunicação utilizado pelas APIs das instituições participantes do Ecossistema bem como dos clientes de cada um dos participantes.

Os certificados utilizados para o Open Banking Brasil também são necessários para autenticar as aplicações através do oAuth 2.0 mTLS ou private_key_jwt, além de també servirem para realizar a assinatura de payload pelo uso de JWS. Outra atribuição importante dos certificados é realizar a autenticação e apresentar um canal seguro para o consumidor final no ato de autenticação e uso dos serviços prestados pela entidade participante.

## Certificados ICP-Brasil

Os certificados emitidos junto a Autoridades Certificadoras autorizadas pelo ICP-Brasil são utilizados apenas na comunicação entre as entidades participantes do ecossistema do Open Banking Brasil.

Os processos de emissão e revogação dos certificados são de responsabilidade das próprias Autoridades Certificadores, sendo regulamentados por Declarações de Prática de Certificação, e supervisionadas pelo Comitê Gestor da Infraestrutura de Chaves Públicas Brasileira.

As práticas, processos, disponibilização e valores praticados pelas Autoridades Certificadoras não são de responsabilidade do Estrutura Inicial do Open Banking Brasil.

**Algoritmos**

Todos os certificados emitidos junto ao ICP-Brasil devem possuir as seguintes características:

* Tipo A do ICP-Brasil;
* Algoritmo de Chaves: RSA 2048 bits;
* Message Digest: SHA 256 bits.

### Certificado Servidor

O Certificado Servidor deve ser emitido para proteger e autenticar o canal TLS utilizado pelas APIs que serão consumidas pelas aplicações cliente de entidades participantes do Open Banking.

O padrão de certificado utilizado deve seguir as práticas de emissão de certificados existentes de "CERTIFICADO PARA SERVIDOR WEB – ICP-Brasil".

### Certificado Cliente

Os certificados de Open Banking, denominados Certificado de Aplicação Cliente (Transporte) são utilizados para autenticar o canal MTLS.  Os Certificado Cliente também são utilizados para realizar a autenticação da aplicação cliente através de oAuth 2.0 mTLS ou private_key_jwt, de acordo com cadastro da aplicação realizado o processo de Dynamic Client Registration junto a entidade transmissora.

Para emissão de certificado de cliente é necessário que a instituição participante do Open Banking Brasil tenha realizado o cadastro de aplicação ao diretório, através da emissão de Software Statement Assertion, e com isso já tenha obtido o valor de Software Statement ID.

#### Atributos OpenBanking Brasil

* **serialNumber:** Cadastro Nacional de Pessoal Juridica (CNPJ) da pessoa jurídica titular do certificado e associado ao atributo UID e Software Statement ID, durante validação junto ao Serviço de Diretório do OpenBanking Brasil;
* **organizationalUnitName:** Código de Participante associado ao CNPJ listado no Serviço de Diretório do OpenBanking Brasil;
* **UID:** Software Statement ID cadastrado no Serviço de Diretório do OpenBanking Brasil e pertencente ao CNPJ e Código de Participante.

O Certificado Cliente deve ser emitido através de cadeia V10, e deve obrigatoriamente conter os seguintes atributos:

**Distinguished Name**

* **businessCategory (OID 2.5.4.15):**  Tipo de categoria comercial, devendo conter: "Private Organization" ou "Government Entity" ou "Business Entity" ou "Non-Commercial Entity"
* **jurisdictionCountryName (OID: 1.3.6.1.4.1.311.60.2.1.3):** BR
* **serialNumber (OID 2.5.4.5):** CNPJ
* **countryName (OID 2.5.4.6):** BR
* **organizationName (OID 2.5.4.10):** Razão Social
* **stateOrProvinceName (OID 2.5.4.8):** Unidade da federação do endereço físico do titular do certificado
* **localityName (OID 2.5.4.7):** Cidade do endereço físico do titular
* **organizationalUnitName (OID 2.5.4.11):** Código de Participante associado ao CNPJ listado no Serviço de Diretório do OpenBanking Brasil
* **UID (OID 0.9.2342.19200300.100.1.1):** Software Statement ID gerado pelo Diretório do Open Banking Brasil
* **commonName (OID 2.5.4.3):** FQDN ou Wildcard

**Certificate Extensions**

* **keyUsage:** critical,digitalSignature,keyEncipherment
* **extendedKeyUsage:** clientAuth

**Subject Alternative Name**

* **dNSName:** FQDN ou Wildcard

### Certificado de Assinatura

Os certificados de Open Banking, denominados Certificado de Assinatura (Assinatura) são utilizados para realizar assinatura do payload através do uso de JWS (JSON Web Signature).

#### Atributos Open Banking Brasil presentes no Certificado

* **UID:** Código de Participante associado ao CNPJ listado no Serviço de Diretório do OpenBanking Brasil;
* **commonName:** Razão Social cadastrado no Serviço de Diretório do OpenBanking Brasil e pertencente ao CNPJ e Código de Participante.

O Certificado de Assinatura deve ser emitido através de cadeia V5, e deve obrigatoriamente conter os seguintes atributos:

**Distinguished Name**

* **UID (OID 0.9.2342.19200300.100.1.1):**  Código de Participante associado ao CNPJ listado no Serviço de Diretório do OpenBanking Brasil
* **countryName (OID 2.5.4.6):** BR
* **organizationName (OID 2.5.4.10):** ICP-Brasil
* **organizationalUnitName (OID 2.5.4.11):** Nome da Autoridade Certificadora
* **organizationalUnitName (OID 2.5.4.11):** CNPJ da Autoridade de Registro
* **organizationalUnitName (OID 2.5.4.11):** Tipo de identificação utilizada (presencial, videoconferência ou certificado digital)
* **commonName (OID 2.5.4.3):** Nome da Razão Social

**Certificate Extensions**

* **keyUsage:** critical,digitalSignature,nonRepudiation

**Subject Alternative Name**

* **otherName (OID 2.16.76.1.3.2 – ICP-Brasil):** Nome do responsável pelo certificado
* **otherName (OID 2.16.76.1.3.3 – ICP-Brasil):** Cadastro Nacional de Pessoa Jurídica (CNPJ) da pessoa jurídica titular do certificado;
* **otherName (OID 2.16.76.1.3.4 – ICP-Brasil):** Responsável pelo certificado de pessoa jurídica titular do certificado (data de nascimento, CPF, PIS/PASEP/CI, RG);
* **otherName (OID 2.16.76.1.3.7  – ICP-Brasil):** Número do Cadastro Especifico do INSS (CEI) da pessoa jurídica titular do certificado.

#### Autoridades Certificadoras Participantes

A lista abaixa representa a lista de autoridades certificadoras que realizaram o processo de onboard ao Open Banking Brasil e estão habilitadas para realizar a emissão de certificados do Open Banking Brasil.

* N/A

### Certificado para Front-End

Os certificados para Front-End são utilziados para disponibilizar os serviços, em geral páginas Web, com uso de TLS, na qual são acessado por usuário final. Dado a sua finalidade, e para garantir maior interoperabilidade. Os certificados devem ser do tipo EV (Extended Validation) e deve ser ser gerado através de uma autoridade certificadora válida,
seguindo as regras definidas na RFC 5280 e RFC 2818, em conformidade com os princípios e critérios WebTrust.

# Reconhecimento

Agradecemos a todos que estabeleceram as bases para o compartilhamento seguro e seguro de dados por meio da formação do Grupo de Trabalho FAPI da OpenID Foundation, o GT-Segurança do Open Banking Brasil e aos pioneiros que ficarão em seus ombros.

As seguintes pessoas contribuíram para este documento:

* Marcos Rodrigues (Itaú)
* José Michael Dias (Grupo Pan)
* Ralph Bragg (Raidiam)

# Informativo

Copyright (c) 2021 Estrutura Inicial do Open Banking Brasil.

A Estrutura Inicial do Open Banking Brasil (EIOBB) concede a qualquer Colaborador, desenvolvedor, implementador ou outra parte interessada uma licença de direitos autorais mundial não exclusiva, livre de royalties para reproduzir, preparar trabalhos derivados, distribuir, executar e exibir, estes Implementadores Rascunho ou Especificação Final exclusivamente para fins de (i) desenvolver especificações e (ii) implementar Rascunhos de Implementações e Especificações Finais com base em tais documentos, desde que a atribuição seja feita ao EIOBB como a fonte do material, mas que tal atribuição o faça não indica endosso do EIOBB.

A tecnologia descrita nesta especificação foi disponibilizada a partir de contribuições de várias fontes, incluindo membros da OpenID Foundation, do GT-Segurança do Open Banking Brasil e outros. Embora a Estrutura Inicial do Open Banking Brasil tenha tomado medidas para ajudar a garantir que a tecnologia esteja disponível para distribuição, ela não toma posição quanto à validade ou escopo de qualquer propriedade intelectual ou outros direitos que possam ser reivindicados como pertencentes à implementação ou uso do tecnologia descrita nesta especificação ou até que ponto qualquer licença sob tais direitos pode ou não estar disponível; nem representa que fez qualquer esforço independente para identificar tais direitos. A Estrutura Inicial do Open Banking Brasil e os contribuidores desta especificação não oferecem (e por meio deste expressamente se isentam de quaisquer) garantias (expressas, implícitas ou de outra forma), incluindo garantias implícitas de comercialização, não violação, adequação a uma finalidade específica ou título, relacionados a esta especificação, e todo o risco quanto à implementação desta especificação é assumido pelo implementador. A política de Direitos de Propriedade Intelectual do Open Banking Brasil exige que os contribuidores ofereçam uma promessa de patente de não fazer valer certas reivindicações de patentes contra outros contribuidores e implementadores. A Estrutura Inicial do Open Banking Brasil convida qualquer parte interessada a trazer à sua atenção quaisquer direitos autorais, patentes, pedidos de patentes ou outros direitos de propriedade que possam abranger a tecnologia que possa ser necessária para praticar esta especificação.

# Apendice

## Modelo de Configuracao de Certificado Cliente - OpenSSL

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
businessCategory = <tipo de entidade>
jurisdictionCountryName = BR
serialNumber = <CNPJ>
countryName = BR
organizationName = <Razao Social>
stateOrProvinceName = <UF>
localityName = <Cidade>
organizationalUnitName = <Código de Participante>
UID = <Software Statement ID emitido pelo diretório>
commonName = <FQDN|Wildcard>

[ req_cert_extensions ] 
basicConstraints = CA:FALSE
subjectAltName = @alt_name
keyUsage = critical,digitalSignature,keyEncipherment
extendedKeyUsage = clientAuth

[ alt_name ] 
DNS = <FQDN|Wildcard>
```

## Modelo de Configuracao de Certificado de Assinatura - OpenSSL

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
0.organizationalUnitName = <Autoridade Certificadora>
1.organizationalUnitName = <CNPJ da Autoridade Registradora>
2.organizationalUnitName = <Tipo de validação>
commonName = <Razão Social>

[ req_cert_extensions ] 
basicConstraints = CA:FALSE
subjectAltName = @alt_name
keyUsage = critical,digitalSignature,nonRepudiation

[ alt_name ] 
otherName.0 = 2.16.76.1.3.2;UTF8:<Nome da pessoal responsável pela entidade>#CNPJ
otherName.1 = 2.16.76.1.3.3;UTF8<CNPJ>
otherName.2 = 2.16.76.1.3.4;UTF8:<CPF/PIS/RF da Pessoa responsável>
otherName.3 = 2.16.76.1.3.7;UTF8:<Número de INSS>
```
