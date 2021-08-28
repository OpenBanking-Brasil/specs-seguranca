# Guia do Usuário para Instituições Receptores de Dados e Iniciadores de Pagamento (TTP/PISP)

TPP - Third Party Provider
PISP - Payment Initiation Service Provider

## 1.0 Registrando um Aplicativo  {#RegistrantoApp}

Em um alto nível, as seguintes etapas principais são necessárias para integrar um novo aplicativo no ecossistema Open Banking Brasil.

1. Cadastre sua organização no Diretório de Participantes (Interface do Usuário)
2. Cadastre seu aplicativo no Diretório de Participantes (Interface do Usuário)
3. Obtenha credenciais para sua aplicação junto à uma autoridade certificadora ICP-Brasi)(fora do escopo deste documento)
4. Registre suas credenciais para o seu aplicativo no Diretório de Participantes (Interface do Usuário)
5. Identifique provedores de informações de conta ou serviços de pagamento de interesse dos clientes de seu aplicativo, pesquisando o Diretório de Participantes (API)
6. Registre seu aplicativo com cada provedor (API)

### 1.1 Diagrama de Sequência  {#DiagramaSeq}

![Registrando um Aplicativo](images/application-registration.png)

### 1.1 Visão Geral do Diretório {#VisaoDir}

O framework de confiança do Open Banking Brasil fornece todos os serviços de descoberta necessários para que instituições participantes (receptoras e transmissoras de dados, iniciadoras de pagamento ou detentoras de contas) interajam entre si sem serem obrigadas a validarem a autenticidade de identidades, autorizações, Apps, APIs ou credenciais para acessos por aplicativos uns dos outros. Além disso, fornece um único registro de todas propostas ao consumidor sendo oferecidas no mercado e um único ambiente de controle para as autoridades regulatórias que concedem permissões para gerenciar participantes dentro do ecossistema.

O framework de confiança não tem visibilidade ou visão das interações que ocorrem entre instituições participantes receptoras (TTP) ou transmissoras (ASPSP) de dados. Ele é projetado para fornecer confiança e garantia de identidade e autorização apenas. Ele não se enquadra no fluxo de comunicação entre um consumidor e um provedor e não tem conhecimento ou visibilidade de quaisquer dados do cliente. Este modelo de framework de confiança é conhecido como confiança transitiva onde duas partes, um TPP e um ASPSP, concordam em confiar nas declarações e atestados de legitimidade uns dos outros emitidos por um provedor de confiança comum e, em seguida, prossigam comunicando o que quiserem, sem qualquer validação adicional onerosa ou outro tipo de verificação.

### 1.2 Acessando o Diretório  {#AcessandoDir}

Este guia do usuário assume que as organizações participantes já passaram pelo processo de iniciação com a Estrutura Inicial do Open Banking Brasil e já concluíram todas as integrações necessárias, processos de assinatura de contrato e inclusão de administrador individual.

![Login Image](images/directory_logon.png)

### 1.3 Criação de uma Nova Declaração de Software (SSA) {#CriacaoSSA}

Uma declaração de software descreve um aplicativo inserido naquilo que pode ser considerado a 'App Store' do Open Banking Brasil. Este registro de aplicativo contém todas as informações necessárias para que um banco identifique tecnicamente e interaja com o aplicativo, além de conter todas as informações que auxiliam os clientes que estejam utilizando-o a confirmar sua legitimidade.

Um novo aplicativo ou declaração de software pode ser registrado fazendo logon no Diretório, navegando até 'Software Statements', clicando em 'Criar Novo' e preenchendo o formulário. O texto de ajuda é fornecido para cada campo da tela. Lembre-se de que a maioria dessas informações será exibida aos clientes pelos Bancos como parte do processo de redirecionamento ou autorização. Como tal, é importante que todas as URIs e descrições sejam relevantes para o público.

![New Software Statement Image](images/ssa_form.png)

#### 1.3.1 Atribuição de Funções Regulatórias de Software  {#AtribuicaoSoft}

Em um ecossistema de compartilhamento de dados complexo e diversificado, as funções regulatórias de uma organização podem mudar. Eles podem ser adicionados e revogados. Isso significa que o software adicionado ao Diretório pode receber permissão de ter zero (0) ou mais funções regulatórias. Um administrador pode atribuir a um determinado software todo e qualquer permissões que a organização proprietária do software pode ter.

> Se uma organização perder uma função regulatória, todo software com essa função regulatória será revogado do ecossistema, portanto, é muito importante que um aplicativo receba apenas as funções de que realmente precisa para funcionar.

Um exemplo do mundo real disso poderia ser a Amazon. Ela possui dois aplicativos, 'Amazon Accounting' e 'Amazon Prime'. A Amazon como organização é um DADOS e PISP autorizados e tem permissão para lidar com dados de clientes bem como fazer pagamentos via Open Banking. A 'Amazon Accounting' dever receber a função de domínio de DADOS e a 'Amazon Prime' deve receber uma função de domínio de PISP.

No futuro, se a Amazon perder a permissão regulatória para ser um iniciador de pagamento, apenas a aplicação 'Amazon Prime' seria removida do ecossistema. O App 'Amazon Accounting' do exemplo continuaria a funcionar sem problemas.


### 1.4 Criação e Upload de Certificados  {#CriacaoCerts}

#### 1.4.1 Sandbox  {#Sandbox}

O serviço de Diretório do Open Banking inclui uma infraestrutura de chave pública que pode ser usada para criar certificados para os aplicativos sendo registrados no ambiente Sandbox. Basta selecionar certificados no menu e seguir as instruções.

O Diretório suporta vários certificados, tipos de chave e um comando e configuração openssl será disponibilizado como um exemplo. Depois de criar a solicitação de assinatura de certificado (Certificate Signing Request - CSR) para um certificado de "Transporte" e "Assinatura", você pode enviá-los ao diretório para serem validados e transformados em certificados.

> Lembre-se de seguir as práticas de gerenciamento de chaves de sua organização para a geração de certificados. Essas credenciais e chaves precisam ser manuseadas com cuidado. Um evento significativo de comprometimento de chave pode levar ao comprometimento dos dados do cliente.

#### 1.4.2 Produção  {#Producao}

Os certificados para acesso e assinatura em ambiente de produção devem ser fornecidos pelo ICP Brasil. Os detalhes sobre os certificados e os requisitos para os certificados estão detalhados no [Padrão de Certificados Open Banking Brasil](https://github.com/OpenBanking-Brasil/specs-seguranca/blob/main/open-banking-brasil-certificate-standards-1_ID1.md).

#### 1.4.3 O que é um JWT, JWE, JWS e JWK  {#JWT_JWE_JWS_JWK)

Quando os certificados são carregados para o Diretório, o framework de confiança os anuncia em [JSON Web Key Sets](https://tools.ietf.org/html/rfc7517) com cada JSON Web Key (JWK) tendo um 'KID' ou um Key ID. Os JWKs, além de ter propriedades específicas que descrevem o algoritmo e os conjuntos de criptografia que eles suportam, também anunciam seu "uso", que pode ser do tipo 'enc' para criptografia ou 'sig' para assinatura.

Essas chaves 'sig' e pares de chaves 'enc' são usadas em muitos lugares dentro do ecossistema do Open Banking para criptografar ou assinar dados usando os padrões definidos em [RFC 7519 JSON Web Token](https://tools.ietf.org/html/rfc7519), que deve ser lido em detalhes pelos desenvolvedores.

Tipos de JWT incluem

* OpenID Connect Request Objects definidos em [Open ID Connect Core](https://openid.net/specs/openid-connect-core-1_0.html)
* OpenID Connect `id_token` definido em [Open ID Connect Core](https://openid.net/specs/openid-connect-core-1_0.html)

Entre muitos outros.

Esses JWTs podem ser criptografados também usando o JSON Web Encryption (JWE). Na maioria dos casos, as chaves que devem ser usadas para validar uma assinatura da Web JSON (JWS) ou a chave que foi usada para criptografar um JWE são geralmente publicadas como uma JSON Web Key em um JSON Web Key Set com a referência à chave que está sendo carregada no campo de cabeçalho 'kid' (Key ID).

**Exemplo de Request Object JWT assinado**

```
eyJhbGciOiJQUzI1NiIsInR5cCI6Im9hdXRoLWF1dGh6LXJlcStqd3QiLCJraWQiOiJQV0FpNXJ1UWNIZnpQenEySkZkcFk3bkFVaDZMelRUUXREQlVwT00zN0pRIn0.

eyJzY29wZSI6Im9wZW5pZCBvcGVuYmFua2luZ2JyYXNpbDpncmFudDpHREVSWkdSV28tZU9FeVE3Q1VmamYiLCJyZXNwb25zZV90eXBlIjoiY29kZSBpZF90b2tlbiIsInJlZGlyZWN0X3VyaSI6Imh0dHBzOi8vdHBwLmxvY2FsaG9zdC9jYiIsImNvZGVfY2hhbGxlbmdlIjoiUzJmeEJVTEtpUFA3cU52azdmeVpQVHFMLWFrSWJyV3FPelpaWFNyNVU2YyIsImNvZGVfY2hhbGxlbmdlX21ldGhvZCI6IlMyNTYiLCJyZXNwb25zZV9tb2RlIjoiZm9ybV9wb3N0Iiwic3RhdGUiOiIwMzUxODE5NjUwNTUzN2UyMTFkZDA4Y2VkYjEyNzExODcwYTU2ZWE0ODg4OTI0ZDU5OGM0YjA2NDAzMDEwNjNiIiwibm9uY2UiOiI4OTgxYzhhNTYwYzIxYzBmODc0NmU5Yjk3OGJmYzAwNGI5Mjc0ZjJiY2Y3ODZhM2UxNWFhOTZjOGRkNTQ5NGRkIiwiY2xhaW1zIjp7ImlkX3Rva2VuIjp7ImF1dGhfdGltZSI6eyJlc3NlbnRpYWwiOnRydWV9LCJuYXRpb25hbF9pZCI6eyJlc3NlbnRpYWwiOnRydWV9LCJnaXZlbl9uYW1lIjp7ImVzc2VudGlhbCI6dHJ1ZX0sImFjciI6eyJ2YWx1ZXMiOlsidXJuOm9wZW5iYW5raW5nYnJhc2lsOnRydXN0ZnJhbWV3b3JrOmdvbGQiXSwiZXNzZW50aWFsIjp0cnVlfX0sInVzZXJfaW5mbyI6eyJhdXRoX3RpbWUiOnsiZXNzZW50aWFsIjp0cnVlfSwibmF0aW9uYWxfaWQiOnsiZXNzZW50aWFsIjp0cnVlfSwiZ2l2ZW5fbmFtZSI6eyJlc3NlbnRpYWwiOnRydWV9LCJhY3IiOnsidmFsdWVzIjpbInVybjpvcGVuYmFua2luZ2JyYXNpbDp0cnVzdGZyYW1ld29yazpnb2xkIl0sImVzc2VudGlhbCI6dHJ1ZX19fSwibWF4X2FnZSI6MzAwLCJpc3MiOiJhQ25CSGpaQnZENmt1M0tWQmFzbEwiLCJhdWQiOiJodHRwczovL2F1dGgubG9jYWxob3N0IiwiY2xpZW50X2lkIjoiYUNuQkhqWkJ2RDZrdTNLVkJhc2xMIiwianRpIjoicThfTlNjSm9xdThuZHJjWGZqN05UQ1VDU2Q2Y1BJOWc1STdxRXlJS2tTVSIsImlhdCI6MTYxODY2NDczOCwiZXhwIjoxNjE4NjY1MDM4LCJuYmYiOjE2MTg2NjQ3Mzh9.

hhi9dxmweydoXsQeyZETBWJFqMjFrTzcRYXulsscdJQ2md6Zkd8siimYRZ7vPNOOL5uxRSgQRMYWza6MnldUr99XfddbilVS6c_RhbvOrppNOmAC7F4J8aIYcOuF-E2EoHF5dK2c4v9IUkwuTnYZbGDoL0V6r5k3Ywil77Z_-lUMudGCXp2n9twx9kEpTdkWFUf2xbJocWMAYbrhvcK2bAWtC8Dg0V9ntlsAhCh-q4o22Ytt9yYFdmrnU8fJNfViTRhroDIgMwpN27BrIMywvX2zhCY037Hj26fFtoZBqEpDvcsa5d_qDWeeiTfHZYUgiydGswBv09D-FL7SH_EieQ
```

O exemplo acima é apresentado decodificado logo abaixo. No cabeçalho está incluso o atributo 'kid' (id da chave) com o valor  `PWAi5ruQcHfzPzq2JFdpY7nAUh6LzTTQtDBUpOM37JQ`, que pode ser localizado no JSON Web KeySet para este cliente [aqui](https://keystore.sandbox.directory.openbankingbrasil.org.br/74e929d9-33b6-4d85-8ba7-c146c867a817/1509a662-6b3a-4cb8-b7c0-ffb6e596eb0d/application.jwks)

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

O JWK público do JWKS retirado da uri fornecido anteriormente

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

A chave privada que foi usada para criar o JWS

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

Se quiser conhecer um pouco mais e exercitar, visite o site [JWT-IO](https://jwt.io/) e conheça um pouco mais.

## 2.0 Interagindo com as APIs de Serviços de Confiança  {#InteragindAPIs}

Quando um aplicativo é registrado no Diretório, o serviço central usa os metadados e certificados fornecidos para criar para o software um cliente OAuth 2.0 que tem um `grant type` do tipo `client credentials`, conforme definido em [RFC6749](https://tools.ietf.org/html/rfc6749) e com um mecanismo de autenticação de cliente definido como `tls_client_auth`, conforme definido em [RFC 8705](https://tools.ietf.org/html/rfc8705).

Usando o ClientID listado na declaração do software (software statement) no Diretório, [OpenID Connect Discovery](https://openid.net/specs/openid-connect-discovery-1_0.html) e a configuração do OpenID Provider Issuer abaixo, um participante tem todos das informações necessárias para descobrir, autenticar e interagir com as APIs do Diretório.

### 2.1 Emissores do Framework de Confiança do Diretório  {#Emissores}

Produção: [https://auth.directory.openbankingbrasil.org.br/](https://auth.directory.openbankingbrasil.org.br/)

Sandbox: [https://auth.sandbox.directory.openbankingbrasil.org.br/](https://auth.sandbox.directory.openbankingbrasil.org.br/)

Os certificados para acesso às API´s publicadas pelas instituições participantes devem ser obrigatoriamente certificados emitidos no âmbito da ICP-Brasil.

### 2.2 Como se Comunicar com o Authorization Server do Diretório {#ASDir}

* Use o OpenID Issuer e a Cláusula 4 da especificação [OpenID Connect Discovery](https://openid.net/specs/openid-connect-discovery-1_0.html) para obter o documento 'openid-configuration'.

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

* Obtenha o 'alias' do endpoint do Mutual TLS Token, conforme definido por [RFC8705 - OAuth 2.0 Mutual-TLS Client Authentication and Certificate-Bound Access Tokens](https://tools.ietf.org/html/rfc8705)

```
"mtls_endpoint_aliases":{
     "token_endpoint":"https://matls-auth.directory.openbankingbrasil.org.br/token"
     }
```

* Estabeleça uma conexão TLS mútua usando o certificado de transporte registrado anteriormente e solicite um token de acesso com o escopo `directory:software`

```
curl --cert transport.pem --key transport.key https://matls-auth.directory.openbankingbrasil.org.br/token -X POST -d 'client_id=_jjLAgCC8qucQOyo9wIcX&grant_type=client_credentials&scope=directory:software'

{"access_token":"gSeWnhpnDIvotI80TYm8KoeFT4MMtJPawIMXJzFFApX","expires_in":600,"token_type":"Bearer","scope":"directory:software"}
```

### 2.3 Como se Comunicar com as APIs do Diretório {#ComunicarAPIs}

As APIs do Diretório são recursos RESTful protegidos usando o Perfil de Segurança do Open Banking Brasil. Isso significa que eles têm a mesma postura de segurança das APIs publicadas pelos Bancos. Todas as APIs de Diretório requerem o escopo do recurso OAuth 2.0 de `directory:software` e são protegidos usando Mutual TLS (mTLS).

Consulte a especificação do Diretório OpenAPI v3 para o conjunto completo de endpoints disponíveis.

### 2.4 Descobrindo Authorization Servers de Bancos {#BancosServes}

Faça uma busca pelo recurso de participantes (informações públicas) e obtenha uma lista de todos os participantes e seus Authorization Servers.

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
Filtre os participantes por aqueles que possuem Authorization Servers protegendo os recursos que você está interessado em acessar para o seu produto. No exemplo acima, existem dois Authorization Server para 'Amazing Bank', um para o negócio de varejo e um para o banco corporativo.

O aplicativo agora descobriu a lista de bancos que estão oferecendo APIs que podem ser úteis para os usuários do aplicativo e pode gerar uma lista de 'customer friendly names' de bancos e logotipos para exibir aos clientes para permitir que eles selecionem o banco a partir do qual desejam compartilhar dados.

## 3.0 Registrando o Aplicativo com um Provedor  {#RegAppProv}

![DCR](images/dynamic-client-registration.png)

A partir do exemplo dado acima, podemos ver que a localização do "OpenIDDiscoveryDocument" é anunciada por cada um dos Authorization Server.

## 3.1 Criação de uma Declaração de Software (SSA)  {#CriacaoSSA}

Uma afirmação de declaração de software (software statement assertion - SSA) é um JWT assinado pelo Diretório que contém todas as informações sobre um aplicativo que existe em um determinado momento no Diretório. Inclui a localização de todas as chaves públicas vinculadas à esta declaração de software e todos os outros metadados de que um banco precisa para validar a legitimidade do aplicativo.

Um SSA não tem período de validade, é simplesmente um registro pontual do que existia como atributos válidos no momento em que foi criado. Os bancos devem aceitar um SSA com menos de alguns minutos, mas a janela exata pode ser diferente entre os provedores.

* Obtenha um token de acesso e, em seguida, carregue a declaração do software para um aplicativo no Diretório.

```
curl --cert transport.pem --key transport.key https://matls-auth.directory.openbankingbrasil.org.br/token -X POST -d 'client_id=_jjLAgCC8qucQOyo9wIcX&grant_type=client_credentials&scope=directory:software' -k

{"access_token":"-mqFZH5DwjzlPjHU3bBkP2Lmp97mwGbKZ2yjYb-tVaE","expires_in":600,"token_type":"Bearer","scope":"directory:software"}

curl --cert transport.pem --key transport.key https://matls-api.directory.openbankingbrasil.org.br/organisations/b961c4eb-509d-4edf-afeb-35642b38185d/softwarestatements/6483a2d3-2b0d-4fc8-a756-e7be79013fa0/assertion -H 'Authorization: Bearer -mqFZH5DwjzlPjHU3bBkP2Lmp97mwGbKZ2yjYb-tVaE'

eyJraWQiOiJzaWduZXIiLCJ0eXAiOiJKV1QiLCJhbGciOiJQUzI1NiJ9.eyJzb2Z0d2FyZV9tb2RlIjoiTGl2ZSIsInNvZnR3YXJlX3JlZGlyZWN0X3VyaXMiOlsiaHR0cHM6XC9cL3d3dy5yYWlkaWFtLmNvbVwvYWJnXC9jYjEiLCJodHRwczpcL1wvd3d3LnJhaWRpYW0uY29tXC9hYmdcL2NiMiJdLCJzb2Z0d2FyZV9zdGF0ZW1lbnRfcm9sZXMiOlt7InJvbGUiOiJEQURPUyIsImF1dGhvcmlzYXRpb25fZG9tYWluIjoiT3BlbiBCYW5raW5nIiwic3RhdHVzIjoiQWN0aXZlIn1dLCJzb2Z0d2FyZV9jbGllbnRfbmFtZSI6IkFjY291bnRzIEJlIEdvbmUiLCJvcmdfc3RhdHVzIjoiQWN0aXZlIiwic29mdHdhcmVfY2xpZW50X2lkIjoiX2pqTEFnQ0M4cXVjUU95bzl3SWNYIiwiaXNzIjoiT3BlbiBCYW5raW5nIE9wZW4gQmFua2luZyBCcmFzaWwgcHJvZCBTU0EgaXNzdWVyIiwic29mdHdhcmVfdG9zX3VyaSI6Imh0dHBzOlwvXC93d3cucmFpZGlhbS5jb21cL2FiZ1wvdG9zLmh0bWwiLCJzb2Z0d2FyZV9jbGllbnRfZGVzY3JpcHRpb24iOiJBY2NvdW50cyBiZSBnb25lIHdpbGwgdXNlIHlvdXIgb3BlbiBiYW5raW5nIGRhdGEgdG8gYXV0b21hdGUgeW91ciBhY2NvdW50YW5jeSBhbmQgYm9vayBrZWVwaW5nIG1hc3NpdmUgc2F2aW5nIHlvdSB0aW1lLiIsInNvZnR3YXJlX2p3a3NfZW5kcG9pbnQiOiJodHRwczpcL1wva2V5c3RvcmUuZGlyZWN0b3J5Lm9wZW5iYW5raW5nYnJhc2lsLm9yZy5iclwvYjk2MWM0ZWItNTA5ZC00ZWRmLWFmZWItMzU2NDJiMzgxODVkXC82NDgzYTJkMy0yYjBkLTRmYzgtYTc1Ni1lN2JlNzkwMTNmYTBcL2FwcGxpY2F0aW9uLmp3a3MiLCJzb2Z0d2FyZV9wb2xpY3lfdXJpIjoiaHR0cHM6XC9cL3d3dy5yYWlkaWFtLmNvbVwvYWJnXC9wb2xpY3kuaHRtbCIsInNvZnR3YXJlX2lkIjoiNjQ4M2EyZDMtMmIwZC00ZmM4LWE3NTYtZTdiZTc5MDEzZmEwIiwic29mdHdhcmVfY2xpZW50X3VyaSI6Imh0dHBzOlwvXC93d3cucmFpZGlhbS5jb21cL2FiZy5odG1sIiwic29mdHdhcmVfandrc19pbmFjdGl2ZV9lbmRwb2ludCI6Imh0dHBzOlwvXC9rZXlzdG9yZS5kaXJlY3Rvcnkub3BlbmJhbmtpbmdicmFzaWwub3JnLmJyXC9iOTYxYzRlYi01MDlkLTRlZGYtYWZlYi0zNTY0MmIzODE4NWRcLzY0ODNhMmQzLTJiMGQtNGZjOC1hNzU2LWU3YmU3OTAxM2ZhMFwvaW5hY3RpdmVcL2FwcGxpY2F0aW9uLmp3a3MiLCJzb2Z0d2FyZV9qd2tzX3RyYW5zcG9ydF9pbmFjdGl2ZV9lbmRwb2ludCI6Imh0dHBzOlwvXC9rZXlzdG9yZS5kaXJlY3Rvcnkub3BlbmJhbmtpbmdicmFzaWwub3JnLmJyXC9iOTYxYzRlYi01MDlkLTRlZGYtYWZlYi0zNTY0MmIzODE4NWRcLzY0ODNhMmQzLTJiMGQtNGZjOC1hNzU2LWU3YmU3OTAxM2ZhMFwvaW5hY3RpdmVcL3RyYW5zcG9ydC5qd2tzIiwic29mdHdhcmVfandrc190cmFuc3BvcnRfZW5kcG9pbnQiOiJodHRwczpcL1wva2V5c3RvcmUuZGlyZWN0b3J5Lm9wZW5iYW5raW5nYnJhc2lsLm9yZy5iclwvYjk2MWM0ZWItNTA5ZC00ZWRmLWFmZWItMzU2NDJiMzgxODVkXC82NDgzYTJkMy0yYjBkLTRmYzgtYTc1Ni1lN2JlNzkwMTNmYTBcL3RyYW5zcG9ydC5qd2tzIiwic29mdHdhcmVfbG9nb191cmkiOiJodHRwczpcL1wvd3d3LnJhaWRpYW0uY29tXC9hYmdcL2xvZ28ucG5nIiwib3JnX2lkIjoiYjk2MWM0ZWItNTA5ZC00ZWRmLWFmZWItMzU2NDJiMzgxODVkIiwic29mdHdhcmVfZW52aXJvbm1lbnQiOiJwcm9kdWN0aW9uIiwic29mdHdhcmVfdmVyc2lvbiI6MS4xMCwic29mdHdhcmVfcm9sZXMiOlsiREFET1MiXSwib3JnX25hbWUiOiJPcGVuIEJhbmtpbmcgQnJhc2lsIiwiaWF0IjoxNjE4Njk1OTI4LCJvcmdhbmlzYXRpb25fY29tcGV0ZW50X2F1dGhvcml0eV9jbGFpbXMiOlt7ImF1dGhvcmlzYXRpb25fZG9tYWluIjoiT3BlbiBCYW5raW5nIiwiYXV0aG9yaXNhdGlvbnMiOltdLCJyZWdpc3RyYXRpb25faWQiOiIxMzM1MzIzNi1PQkItQ09OVEEiLCJhdXRob3JpdHlfaWQiOiI2ODdhMWM5NC1iMzYwLTRlMDQtOTU4OS0wZmE1Y2IxNjQ1MWIiLCJhdXRob3Jpc2F0aW9uX3JvbGUiOiJDT05UQSIsImF1dGhvcml0eV9jb2RlIjoiQkNCIiwic3RhdHVzIjoiQWN0aXZlIn0seyJhdXRob3Jpc2F0aW9uX2RvbWFpbiI6Ik9wZW4gQmFua2luZyIsImF1dGhvcmlzYXRpb25zIjpbXSwicmVnaXN0cmF0aW9uX2lkIjoiMTMzNTMyMzYtT0JCLURBRE9TIiwiYXV0aG9yaXR5X2lkIjoiNjg3YTFjOTQtYjM2MC00ZTA0LTk1ODktMGZhNWNiMTY0NTFiIiwiYXV0aG9yaXNhdGlvbl9yb2xlIjoiREFET1MiLCJhdXRob3JpdHlfY29kZSI6IkJDQiIsInN0YXR1cyI6IkFjdGl2ZSJ9LHsiYXV0aG9yaXNhdGlvbl9kb21haW4iOiJPcGVuIEJhbmtpbmciLCJhdXRob3Jpc2F0aW9ucyI6W10sInJlZ2lzdHJhdGlvbl9pZCI6IjEzMzUzMjM2LU9CQi1QQUdUTyIsImF1dGhvcml0eV9pZCI6IjY4N2ExYzk0LWIzNjAtNGUwNC05NTg5LTBmYTVjYjE2NDUxYiIsImF1dGhvcmlzYXRpb25fcm9sZSI6IlBBR1RPIiwiYXV0aG9yaXR5X2NvZGUiOiJCQ0IiLCJzdGF0dXMiOiJBY3RpdmUifV19.axxRvn5aPqBLZtJSZvMXdotcmHyS_iu8jv40VdG2HTplF9qpZ4mDoIviquVceU2eH3eoMINXNcr0BLfBACdp2bLjD_FeCCYlOlgp1w7dCXxAYiFndiMniwkdyI9xxvVx9jJjETpP8owfV6QI_cprPxOCK7fF90s9frq_rby8ixL7K2DHM-UQ_bA320W84WRjwJrmexJlPrlBxEa823_kyaPIUU-tk7yKvve0hU_pSgI6U1g5CJpFr1zJVRJhPZ6E1ekRzkaRq2nnF2FoI96bTNwFLYitKojiqWsHwPMdnUWPAuLS6EY3toYCqISOS8Tzi_u3tp3TMsJhS_lOrkRtpA
```

## 3.3 Enviando uma Solicitação de Dynamic Client Registration (RFC7591)  {#RFC7591}

Consulte o [Dynamic Client Registration do Open Banking Brasil](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-dynamic-client-registration-1_ID1-ptbr.html)

## 3.4 Salvando o Token de Dynamic Registration Management (RFC7592)  {#RFC7592}

Consulte o [Dynamic Client Registration do Open Banking Brasil](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-dynamic-client-registration-1_ID1-ptbr.html)

## 3.5 Modificando um cliente usando Dynamic Client Management Token (RFC7592) {#RFC7592Token}

Consulte o [Dynamic Client Registration do Open Banking Brasil](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-dynamic-client-registration-1_ID1-ptbr.html)

## 4.0 Obtendo Acesso aos Recursos dos Clientes  {#AcessoClientes}

![Consent](images/consent-process-redirect.png)

Para todas as opções, incluindo todos os códigos de permissão, consulte o [Consent API](https://openbanking-brasil.github.io/areadesenvolvedor/swagger/swagger_consents_apis.yaml). Os exemplos a seguir são exemplos mínimos, mas funcionais para demonstrar o fluxo de ponta a ponta. Esses exemplos pressupõem que o cliente está se comunicando com um provedor de OpenID, aproveitando o mecanismo de autenticação de endpoint do token 'tls_client_auth'. Exemplos alternativos estão disponíveis no apêndice.

### 4.1 Pré-requisitos  {#PreReqs}

Esses exemplos **não normativos** presumem que o cliente OAuth descobriu os locais de todos os 'endpoints' necessários para se comunicar com os recursos dos bancos do Diretório, incluindo o recurso de consentimento, os recursos de dados e o documento de descoberta de autorização OpenID do Diretório.

### 4.2 Criando Consentimento  {#CriandoConsent}


1. Obtendo um Token de Acesso com escopo 'consents'

```
curl --cert transport.pem --key transport.key https://matls-auth.amazingbank.com.br/token -X POST -d 'client_id=clientIdFromAmazingBank&grant_type=client_credentials&scope=consents'

{"access_token":"2Pjwts8m1KRZmm0aJyXbOTB8zRosN55fo8Ewdulhxxa","expires_in":600,"token_type":"Bearer","scope":"consents"}
```

2. Criando um recurso de consentimento

```
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

Resposta

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

### 4.3 Autorizando Consentimento - Redirecionar  {#CriandoConsent}

### 4.3.1 Criar OpenID Connect Request Object  {#CriarOIDC}

Todos os requisitos para o OpenID Request Object estão incluídos no [Perfil de Segurança do Open Banking Brasil](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-financial-api-1_ID1-ptbr.html). Veja o exemplo com JWS a seguir:

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
Assinatura omitida por questões de brevidade
```

### 4.3.1.1 Solicitação de Claims Específicas  {#SolicitacaoClaims}

Também é opcional para TPPs solicitar `claims` de identidade ('Identity Claims') adicionais, incluindo CPF e CNPJ. Essas `claims` são definidas no Perfil de Segurança do Open Banking Brasil. Também é possível para um TPP solicitar que uma `claim` corresponda a um determinado valor, baseando-se em [OpenID Connect Core Clause 5.5.1](https://openid.net/specs/openid-connect-core-1_0.html#IndividualClaimsRequests) para solicitar `claims` individuais.

Por exemplo:

```
"cpf": {
        "essential": true,
        value: 12345678123
      },
```

Nesse exemplo seria exigido que o provedor OpenID retornasse apenas uma autenticação e autorização bem-sucedidas se o usuário que estava autenticando poderia ser confirmado pelo Banco que eles tinham um número de CPF de 12345678123. Se o banco não puder confirmar este número, então a autenticação deve falhar.

Solicitar reivindicações de valor específico é totalmente opcional para o TPP.

### 4.3.2 Redirecionar o Usuário ao Authorization Server para Autorização  {#RedirecionarAuthz}

De acordo com o OpenID Connect Core.
```
https://auth.amazingbank.com.br/auth?client_id=clientIdFromAmazingBank&scope=openid&request=eyJhbGciOiJQUzI1NiIsInR5cCI6Im9hdXRoLWF1dGh6LXJlcStqd3QiLCJraWQiOiJQV0FpNXJ1UWNIZnpQenEySkZkcFk3bkFVaDZMelRUUXRE...j1CpNMT7NtDerEl32E8plGnsuA
```

### 4.3.3 Obtenção de Token de Acesso por Meio de Troca de Código de Autorização  {#ObtencaoAuthz}

Conforme [RFC 7636 Proof Key for Code Exchange](https://tools.ietf.org/html/rfc7636)

### 4.3.4 Verificação do Status do Recurso de Consentimento  {#VerificacaoConsent}

Neste ponto, um TPP pode, opcionalmente, verificar o status da solicitação de consentimento para ver se mudou para totalmente autorizado. Esta etapa não deverá ser necessária para recursos que não requerem consentimento de múltiplos indivíduos, entretanto, para contas comerciais ou contas conjuntas com requisitos de acesso especiais, então pode demorar um pouco para o banco obter as autorizações adicionais necessárias para que esse consentimento seja totalmente autorizado. Os TPPs não devem abusar da verificação do status de consentimento API.

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

### 4.3.5 Acesso aos Recursos  {#AcessoRecursos}

Com o token de acesso que foi retornado em 4.3.3, o TPP agora tem a capacidade de chamar os recursos dos clientes.

## Apêndice  {#Apendice}

### A.1 Concessão de Credenciais de private_key_jwt client  {#A1}

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

### A.2 Exemplo de Corpo de Objeto de Solicitação Decodificado  {#A2}

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

### A.3 Exemplo de Decodificação do Corpo de uma Solicitação com Valores de Reivindicação Específicos Sendo Solicitados  {#A3}

Neste exemplo, um cliente está solicitando que o Authorization Server autentique o cliente apenas se a declaração cpf corresponder ao valor fornecido. Os requisitos de processamento para solicitações com um valor 'cpf' específico são definidos no Perfil de Segurança do Open Banking Brasil.

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

### A.4 Exemplo de Decodificação do Corpo de Solicitação de Autenticação CIBA  {#A4}

Neste exemplo, uma solicitação CIBA está sendo feita para solicitar autorização de consentimento usando um `id_token` emitido como a indicação do proprietário do recurso que
o banco deve entrar em contato para obter autorização.

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
