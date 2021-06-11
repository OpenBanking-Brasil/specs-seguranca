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
  * Customers must always be in control of who has access to their data and for what purposes it is being used.
* Data Minimisation
  * Customers must be able to share just the data that they need to for just as long as is needed.
* Security
  * A formal threat model has been produced assessing all potential weaknesses in communication processes.
  * All identified weaknesses have been addressed.
* Identification
  * All participants must have surety in the identification of all of the actors within the ecosystem.
* Authentication
  * All participants must convey the steps that were taken to Authenticate each participant in the ecosystem and to what level this was performed.
* Integrity and Non Repudiation
  * All participants must be able to prove that messages have not been tampered with and were indeed sent only by a legitimate participant.

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

[RFC7592:](https://tools.ietf.org/html/rfc7592) This specification defines methods for management of OAuth 2.0 dynamic client registrations for use cases in which the properties of a registered client may need to be changed during the lifetime of the client.

The above specifications are core specifications that are required reading underpin the Open Banking Brasil
trust framework however they still are insufficient to meet all of the requirements and principles outlined earlier.

### OpenID Financial Grade 1.0 : Baseline

**_This profile inherits all of the obligations of OpenID Connect Core_**

Recognising the remaining threats and risks that were not addressed by core OpenID Connect, the Financial Grade Working group focus is create a specification that aims to identify and then address weaknesses in the underlying OpenID Connect specification essentially create a profile for high security use cases.

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

* **Customer Friendly Name** - This is will be displayed to customers by TPPs and should be recognisable by the Banks Customers Already.
* **Customer Friendly Logo** - This will be displayed to customers by TPPs to aid brand recognition.
* **Description** - This may be displayed to customers by TPPs to aid brand recognition.
* **Terms of Service** - This is a link to the Banks Terms of Service which may be included by TPPs.
* **Notification WebHook** - Authorization Servers can register a WebHook that will receive pushed updates regarding changes to participants, their software or certificates.
* **OpenID Well Known Document Uri** - Link to the Authorization Server's Discovery Document.

A Bank may choose to have one Authorization Server or many provided that it can satisfy the following requirements.

* A customer can recognise the Authorization Server as a place that they would normally Bank with.
* The Authorization Server can issue tokens for the resource and services that a customer or TPP is looking for.

### 1.3 Registering Resources

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

Please see Open Banking Brasil Dynamic Client Registration Specification Clause 7 for details.

### 2.2 Software Statement Assertion Processing

Please see Open Banking Brasil Dynamic Client Registration Specification Clause 8 for details.

## 3.0 Validating an Authorization Request

Please see Open Banking Security Profile Clause 5 for details.
