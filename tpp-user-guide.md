# Third Party Provider End To End User Guide

## 1.0 Registering an Application

At a high level the following major steps are required in order to onboard a new application into the Open Finance Brasil ecosystem.

1. Register your organisation on the directory of participants (User Interface)
2. Register your application on the directory of participants (User Interface)
3. Obtain credentials for your application from the Brasil ICP (Out of scope of this document)
4. Register your credentials for your application on the directory of participants (User Interface)
5. Identify providers of Account information or Payment Services of interest to customers of your application by searching the directory of participants (API)
6. Register your application with each provider (API)

### 1.1 Sequence Diagram

![Sequence Diagram](images/application-registration.png)

### 1.1 Directory Overview

The trust framework services provided by Open Finance Brasil provide all of the discovery services necessary
for TPPs and ASPSPs to interact with each other without being required to validate
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
 process with the Open Finance Brasil Initial Structure and have completed all of the necessary onboarding,
  contract signing and individual administrator onboarding processes.

![Login Image](images/directory_logon.png)

### 1.3 Creating a new Software Statement

A software statement is an 'App' on what can be thought of as the Open Finance Brasil App Store.
 This App record contains all of the information necessary for a Bank to Technically Identity
  and Interact with it as well as containing all of the information that assist consumers
  using the application with confirming its legitimacy.

A new application or software statement can be registered by logging on to the Directory,
navigating to 'Software Statements' and clicking 'Create New' and populating the form. Help text is provided for each field on the screen. Please remember that the majority of this information will be displayed to customers by the Banks as part of the redirection or authorization process. As such it is important that all URIs and Descriptions are relevant for customer audience.

![New Software Statement Image](images/ssa_form.png)

#### 1.3.1 Assigning Software Regulatory Roles

In a complex and diverse data sharing ecosystem, the regulatory roles that an organisation can have can change.
They can be added and revoked. This means that software added to the directory can be given permission
 to have 0 or more regulatory roles. A administrator can assign to a given software any and all
  permissions that the organisation that owns the software can have.

> Should an organisation lose a regulatory role then all software with that regulatory role will be revoked from the ecosystem so it is very important that an application is only given the roles that it actually needs in order to function.

A real world example of this could be 'Amazon', Amazon has two applications, 'Amazon Accounting' and
 'Amazon Prime'. Amazon as an organisation is an authorized DADOS and PISP, and is allowed to
 handle customer data as well as make Open Finance Payments. Amazon Accounting should be assigned
 the domain role of DADOS and Amazon Prime should be assigned a domain role of PISP.

In the future, should Amazon lose regulatory permission to be a PISP then only the Amazon Prime
application would be removed from the ecosystem. Amazon Account would continue to function without issue.

### 1.4 Creating and Uploading Certificates

#### 1.4.1 Sandbox

The Open Finance Directory contains a PKI that can be used to create certificates for the Applications
 being registered. Simply select certificates from the drop down menu and follow the instructions.

The directory supports multiple certificate and key types and an openssl command and configuration
file is made available as an example. Once you have created the necessary Certificate Signing Request
 (CSR) for both a "Transport" and "Signing" certificate you can submit them to the directory to be
  validated and minted into certificates.

> Please remember to follow your organisations key management practices for certificate generation. These credentials and keys need to be handled carefully. A significant key compromise event could lead to customer data being compromised.

#### 1.4.2 Production

Certificates must be provided by the Brasil ICP. The steps to follow are included in the [Open Finance Brasil Certificate Guide](https://github.com/OpenBanking-Brasil/specs-seguranca/blob/main/open-banking-brasil-ICP-certificate-guide.pdf)

#### 1.4.3 What is a JWT, JWE, JWS and JWK

When certificates are uploaded to the directory, the trust framework advertises them in
 [JSON Web Key Sets](https://tools.ietf.org/html/rfc7517) with each JSON Web Key or JWK
 having a unique 'KID' or Key ID. JWK's in addition to having specific properties describing
 the algorithm and cipher suites that they support also advertise their 'use' which can either
  be of type 'enc' for encryption or 'sig' for signing.

These 'sig' keys and 'enc' key pairs are used in many places within the Open Finance ecosystem to
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
    "userinfo": {
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
      "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"
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

### 2.1 How to communicate with the Directory Authorization Server

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

![DCR](images/dynamic-client-registration.png)

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

Please see Open Finance Brasil Dynamic Client Registration

## 3.4 Saving the RFC7592 Dynamic Client Management Token

Please see Open Finance Brasil Dynamic Client Registration

## 3.5 Modifying a client using RFC7592 Dynamic Client Management Token

Please see Open Finance Brasil Dynamic Client Registration

## 4.0 Obtaining Access to Customers Resources

![Consent](images/consent-process-redirect.png)

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
    "loggedUser": {
      "document": {
        "identification": "11111111111",
        "rel": "CPF"
      }
    },
    "businessEntity": {
      "document": {
        "identification": "11111111111111",
        "rel": "CNPJ"
      }
    },
    "permissions": [
      "ACCOUNTS_READ",
      "ACCOUNTS_OVERDRAFT_LIMITS_READ",
      "RESOURCES_READ"
    ],
    "expirationDateTime": "2022-02-01T23:59:59Z",
    "transactionFromDateTime": "2021-01-01T00:00:00Z",
    "transactionToDateTime": "2022-02-01T23:59:59Z"
  }
}'

{
  "data": {
    "consentId": "urn:bancoex:C1DD33123",
    "creationDateTime": "2021-05-21T08:30:00Z",
    "status": "AWAITING_AUTHORISATION",
    "statusUpdateDateTime": "2021-05-21T08:30:00Z",
    "permissions": [
      "ACCOUNTS_READ",
      "ACCOUNTS_OVERDRAFT_LIMITS_READ",
      "RESOURCES_READ"
    ],
    "expirationDateTime": "2022-02-01T23:59:59Z",
    "transactionFromDateTime": "2021-01-01T00:00:00Z",
    "transactionToDateTime": "2022-02-01T23:59:59Z"
  },
  "links": {
    "self": "https://matls-api.amazingbank.com.br/consents/urn:bancoex:C1DD33123"
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

Different methods of authentication (_private_key_jwt_ and _tls_client_auth_) and of sending Request Object (with and without *PAR*) can be supported by _Authorization Servers_ according to the [FAPI-1.0 Part 2 - Advanced](https://openid.net/specs/openid-financial-api-part-2-1_0.html) specification. Therefore, how does it reinforce the security profile for Open Finance Brasil (item 8 of section 5.2.3 of the [security requirements for the confidential client](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-financial-api-1_ID3.html#section-5.2.3)), *all* combinations (table below) must be supported by API clients.

The table below reflects the different security profiles and combinations that shall be supported by all API clients (as per the [OIDF certified profiles for Open Finance Brazil](https://openid.net/certification/#FAPI_OPs)) .

| OIDF Certification Profile |
| -- |
| BR-OB Adv. OP w/ MTLS |
| BR-OB Adv. OP w/ Private Key |
| BR-OB Adv. OP w/ MTLS, PAR |
| BR-OB Adv. OP w/ Private Key, PAR |

All requirements for the OpenID Request Object are included in Brasil Open Finance Security Profile

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
These claims are defined in the Brasil Open Finance Security Profile. It is also possible for a
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
    "consentId": "urn:bancoex:C1DD33123",
    "creationDateTime": "2021-05-21T08:30:00Z",
    "status": "AWAITING_AUTHORISATION",
    "statusUpdateDateTime": "2021-05-21T08:30:00Z",
    "permissions": [
      "ACCOUNTS_READ",
      "ACCOUNTS_OVERDRAFT_LIMITS_READ",
      "RESOURCES_READ"
    ],
    "expirationDateTime": "2022-02-01T23:59:59Z",
    "transactionFromDateTime": "2021-01-01T00:00:00Z",
    "transactionToDateTime": "2022-02-01T23:59:59Z"
  },
  "links": {
    "self": "https://matls-api.amazingbank.com.br/consents/urn:bancoex:C1DD33123"
  },
  "meta": {
    "totalRecords": 1,
    "totalPages": 1,
    "requestDateTime": "2021-05-21T08:30:00Z"
  }
}
```

### 4.3.5 Access Resources

With the access token that was returned in 4.3.3, the TPP now has the ability to call customers resources.

## Appendix

### A.1 private_key_jwt client credentials grant

```
POST https://matls-auth.mockbank.poc.raidiam.io/token
HEADERS {
  'user-agent': 'openid-client/4.7.4 (https://github.com/panva/node-openid-client)',
  accept: 'application/json',
  'content-type': 'application/x-www-form-urlencoded',
  'content-length': '940',
  'accept-encoding': 'gzip, deflate, br'
}
FORM {
  scope: 'consents',
  grant_type: 'client_credentials',
  client_id: 'IARVYjhBkgd5YspMTDLh1',
  client_assertion: 'eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InFSVlB1Vjc2R2k2dGJsckRxWTJka0JIVXVGZy1fX3JPSFotYnNYeFkweXMifQ.eyJpYXQiOjE2MjI4NDU1NTQsImV4cCI6MTYyMjg0NTYxNCwianRpIjoiU25yTEhfQ1VlTlRDY3pyTUY2MHlVbTJHS1RVVTdWakFVU1ptLUt1ZWd6VSIsImlzcyI6IklBUlZZamhCa2dkNVlzcE1URExoMSIsInN1YiI6IklBUlZZamhCa2dkNVlzcE1URExoMSIsImF1ZCI6Imh0dHBzOi8vbWF0bHMtYXV0aC5tb2NrYmFuay5wb2MucmFpZGlhbS5pby90b2tlbiJ9.dd0TdA3W6OmLhRceKoNVUk2vMwcodwWepa8sBvt6S6W1Mzkl1jCqlkJ7UOzCLYkmElfpRJmGhjlIV9w2NiaX_hs0mbkNnI8H51RLmReZAAtigqAOgO-5bFEdtbAPfWRjUuwnjOuP-RJxAzuXQZQMcBWWggDKTf9nNmjFdowWbntvcaxX3AUtp8g7Ng7m5UElVRe1G6Y-F85S4Hle8E2SNnI_umza1CObViGIyd-6RejCWykjdGncPHDF2PMgIm5NNseC2QbEQV7FDCNCgl3jzRqinhZ4xCj7r6YWf-LpaqWB28Mf0XiZT25k6SYQhmaHfbzJUHeIKZnQXIDl-Y3fkA',
  client_assertion_type: 'urn:ietf:params:oauth:client-assertion-type:jwt-bearer'
}

200 FROM POST https://matls-auth.mockbank.poc.raidiam.io/token
BODY {
  access_token: 'gRQRfA2NYgK6pzqQTv5GdGc7MeBwNI5WSfihMniOIsF',
  expires_in: 600,
  token_type: 'Bearer',
  scope: 'consents'
}
```

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
    "userinfo": {
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

In this example a client is requesting that the Authorization Server only authenticates the customer if the cpf claim matches the provided value. The processing requirements for requests with a specific 'cpf' value are defined in the Open Finance Brasil Security Profile.

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
issued `id_token` as the indication of the resource owner that
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
