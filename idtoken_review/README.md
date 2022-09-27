# Analise requisitos de criptografia ID_TOKEN

## Sumário
O presente documento analisa os diversos padrões e especificações utilizados no Open Banking Brasil e apresenta as informações passíveis de serem trafegadas que demandem a criptografia do ID_TOKEN, bem como as formas como essa criptografia deve ocorrer.

## Fontes de informações sensíveis
O ID_TOKEN pode possuir Claims que contenham informações pessoais, que devem ser protegidas contra acesso não autorizado. Estas Claims são relacionadas na tabela abaixo com a indicação do documento que as define. Maiores informações podem ser obtidas na seção "Documentação de Referência", ao final desse documento.
|Claim|Definição|Descrição|Observações|
|-|-|-|-|
|sub|OIDC Core 1.0 - 2|Identificador unico do usuário final|O AS poderia optar por usar uma PII como identificador, nesse caso a anonimização seria necessária.  O sub é um identificador nunca transferido ou alterado para o usuário final|
|id_token_hint|OIDC Core 1.0 - 3.3.2.1, 3.3.2.2|ID_TOKEN previamente recebido, enviado como dica da identidade que deseja que seja autenticada|Se o ID_TOKEN contiver dados sensíveis o ID_TOKEN_HINT deveria ser criptografado, dado a dificuldade de assegurar a adoção deste critério, recomenda-se que o ID_TOKEN_HINT seja desabilitado no Perfil de Segurança do Open Banking Brasil|
|Claims com PII|OIDC Core 1.0 - 3.3.3.6, Perfil de Segurança OBBr - 5.2.2|O AS pode optar por retornar menos informações do Endpoint de Autorização, do que no Endpoint de Token, se estas representarem riscos a privacidade|Incluir no perfil de segurança que se o Cliente solicitar Claims com PII como Essenciais, mas não tiver chave de criptografia registrada, a solicitação deverá falhar. Caso estas Claims sejam marcadas como Opcionais, elas somente deverão ser retornadas no Endpoint de Autorização se houver chave de criptografia registrada, caso contrário deverão ser retornadas somente no Endpoint de Token.|
|Standard Claims|OIDC Core 1.0 - 5.1|O OpenID Connect define uma série de Claims padrão que podem incluir informações sensíveis como datas de nascimento, endereço e telefone|Vale a mesma regra indicada acima.|
|CPF|Perfil de Segurança OBBr - 5.2.2, 5.2.2.2|Nova claim padrão de acordo com cláusula 5.1 OIDC|Adicionar ao Perfil de Segurança 5.2.2.2, que se o CPF for solicitado como Essencial no Endpoint de Autorização, mas não for possível criptografá-lo, a requisição deverá falhar.|

## Regras para criptografia

|Regra|Documentação|Observações|
|-|-|-|
|ID_TOKENS não devem ser criptografados com base nos cabeçalhos x5u, x5c, jku ou jkw da mensagem JWS ou JW|OIDC Core 1.0 - 2|Pode-se incluir no Perfil de Segurança que o envio de uma Claim KID? (não cabeçalho) para indicar a chave com a qual deseja receber os dados criptografados, na ausência do parâmetro, qualquer chave de criptografia presente no JWKS poderia ser usada|
|O ID_TOKEN deve ser encriptado com base nas chaves informadas no momento do registro do cliente|OIDC Core 1.0 - 3.3.2.12, 3.3.3.7|Conforme jwks_uri informado durante do registro dinâmico|
|AS deve suportar assinatura e criptografia de ID_TOKEN|FAPI 1.0 Advanced - 5.2.2.1||
|Se o AS for enviar PII no ID_TOKEN, este deve ser criptografado|FAPI 1.0 Advanced - 5.2.2.1, Perfil de Segurança OBBr - 5.2.2.1||
|Cliente deve suportar ID_TOKENs assinados e criptografados|FAPI 1.0 Advanced - 5.2.2.1||


# Documentação de Referência

## [OpenID Connect Core 1.0](https://openid.net/specs/openid-connect-core-1_0.html)

### [2.  ID Token](https://openid.net/specs/openid-connect-core-1_0.html#IDToken)

sub
REQUIRED. Subject Identifier. A locally unique and never reassigned identifier within the Issuer for the End-User, which is intended to be consumed by the Client, e.g., 24400320 or AItOawmwtWwcT0k51BayewNvutrJUqsvl6qs7A4. It MUST NOT exceed 255 ASCII characters in length. The sub value is a case sensitive string.

ID Tokens MUST be signed using JWS [JWS] and optionally both signed and then encrypted using JWS [JWS] and JWE [JWE] respectively, thereby providing authentication, integrity, non-repudiation, and optionally, confidentiality, per Section 16.14. If the ID Token is encrypted, it MUST be signed then encrypted, with the result being a Nested JWT, as defined in [JWT]. ID Tokens MUST NOT use none as the alg value unless the Response Type used returns no ID Token from the Authorization Endpoint (such as when using the Authorization Code Flow) and the Client explicitly requested the use of none at Registration time.

ID Tokens SHOULD NOT use the JWS or JWE x5u, x5c, jku, or jwk Header Parameter fields. Instead, references to keys used are communicated in advance using Discovery and Registration parameters, per Section 10.

### [3.3.2.1.  Authentication Request (Hybrid Flow)](https://openid.net/specs/openid-connect-core-1_0.html#HybridAuthRequest)
Authentication Requests are made as defined in Section 3.1.2.1, except that these Authentication Request parameters are used as follows:
#### [3.1.2.1.  Authentication Request](https://openid.net/specs/openid-connect-core-1_0.html#AuthRequest)
This specification also defines the following request parameters:
id_token_hint
OPTIONAL. ID Token previously issued by the Authorization Server being passed as a hint about the End-User's current or past authenticated session with the Client. If the End-User identified by the ID Token is logged in or is logged in by the request, then the Authorization Server returns a positive response; otherwise, it SHOULD return an error, such as login_required. When possible, an id_token_hint SHOULD be present when prompt=none is used and an invalid_request error MAY be returned if it is not; however, the server SHOULD respond successfully when possible, even if it is not present. The Authorization Server need not be listed as an audience of the ID Token when it is used as an id_token_hint value.
If the ID Token received by the RP from the OP is encrypted, to use it as an id_token_hint, the Client MUST decrypt the signed ID Token contained within the encrypted ID Token. The Client MAY re-encrypt the signed ID token to the Authentication Server using a key that enables the server to decrypt the ID Token, and use the re-encrypted ID token as the id_token_hint value.

### [3.3.2.2.  Authentication Request Validation (Hybrid Flow)](https://openid.net/specs/openid-connect-core-1_0.html#HybridValidation)
When using the Hybrid Flow, the Authentication Request is validated in the same manner as for the Authorization Code Flow, as defined in Section 3.1.2.2.
#### [3.1.2.2.  Authentication Request Validation](https://openid.net/specs/openid-connect-core-1_0.html#AuthRequestValidation)
If the sub (subject) Claim is requested with a specific value for the ID Token, the Authorization Server MUST only send a positive response if the End-User identified by that sub value has an active session with the Authorization Server or has been Authenticated as a result of the request. The Authorization Server MUST NOT reply with an ID Token or Access Token for a different user, even if they have an active session with the Authorization Server. Such a request can be made either using an id_token_hint parameter or by requesting a specific Claim Value as described in Section 5.5.1, if the claims parameter is supported by the implementation.

### [3.3.2.12.  ID Token Validation](https://openid.net/specs/openid-connect-core-1_0.html#HybridValidation)
When using the Hybrid Flow, the contents of an ID Token returned from the Authorization Endpoint MUST be validated in the same manner as for the Implicit Flow, as defined in Section 3.2.2.11.
#### [3.2.2.11.  ID Token Validation](https://openid.net/specs/openid-connect-core-1_0.html#ImplicitIDTValidation)
When using the Implicit Flow, the contents of the ID Token MUST be validated in the same manner as for the Authorization Code Flow, as defined in Section 3.1.3.7, with the exception of the differences specified in this section. 
#### [3.1.3.7.  ID Token Validation](https://openid.net/specs/openid-connect-core-1_0.html#IDTokenValidation)
1. If the ID Token is encrypted, decrypt it using the keys and algorithms that the Client specified during Registration that the OP was to use to encrypt the ID Token. If encryption was negotiated with the OP at Registration time and the ID Token is not encrypted, the RP SHOULD reject it.

### [3.3.3.6.  ID Token](https://openid.net/specs/openid-connect-core-1_0.html#HybridIDToken2)
When using the Hybrid Flow, the contents of an ID Token returned from the Token Endpoint are the same as for an ID Token returned from the Authorization Endpoint, as defined in Section 3.3.2.11, with the exception of the differences specified in this section.

If an ID Token is returned from both the Authorization Endpoint and from the Token Endpoint, which is the case for the response_type values code id_token and code id_token token, the iss and sub Claim Values MUST be identical in both ID Tokens. All Claims about the Authentication event present in either SHOULD be present in both. If either ID Token contains Claims about the End-User, any that are present in both SHOULD have the same values in both. Note that the OP MAY choose to return fewer Claims about the End-User from the Authorization Endpoint, for instance, for privacy reasons. The at_hash and c_hash Claims MAY be omitted from the ID Token returned from the Token Endpoint even when these Claims are present in the ID Token returned from the Authorization Endpoint, because the ID Token and Access Token values returned from the Token Endpoint are already cryptographically bound together by the TLS encryption performed by the Token Endpoint.

### [3.3.3.7.  ID Token Validation](https://openid.net/specs/openid-connect-core-1_0.html#HybridIDTValidation2)
When using the Hybrid Flow, the contents of an ID Token returned from the Token Endpoint MUST be validated in the same manner as for the Authorization Code Flow, as defined in Section 3.1.3.7.

### [5.1.  Standard Claims](https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims)
This specification defines a set of standard Claims. They can be requested to be returned either in the UserInfo Response, per Section 5.3.2, or in the ID Token, per Section 2.

|Member |	Type |	Description|
|-|-|-|
|sub |	string |	Subject - Identifier for the End-User at the Issuer.|
|name |	string |	End-User's full name in displayable form including all name parts, possibly including titles and suffixes, ordered according to the End-User's locale and preferences.|
|given_name |	string |	Given name(s) or first name(s) of the End-User. Note that in some cultures, people can have multiple given names; all can be present, with the names being separated by space characters.|
|family_name |	string |	Surname(s) or last name(s) of the End-User. Note that in some cultures, people can have multiple family names or no family name; all can be present, with the names being separated by space characters.|
|middle_name |	string |	Middle name(s) of the End-User. Note that in some cultures, people can have multiple middle names; all can be present, with the names being separated by space characters. Also note that in some cultures, middle names are not used.|
|nickname |	string |	Casual name of the End-User that may or may not be the same as the given_name. For instance, a nickname value of Mike might be returned alongside a given_name value of Michael.|
|preferred_username |	string |	Shorthand name by which the End-User wishes to be referred to at the RP, such as janedoe or j.doe. This value MAY be any valid JSON string including special characters such as @, /, or whitespace. The RP MUST NOT rely upon this value being unique, as discussed in Section 5.7.|
|profile |	string |	URL of the End-User's profile page. The contents of this Web page SHOULD be about the End-User.|
|picture |	string |	URL of the End-User's profile picture. This URL MUST refer to an image file (for example, a PNG, JPEG, or GIF image file), rather than to a Web page containing an image. Note that this URL SHOULD specifically reference a profile photo of the End-User suitable for displaying when describing the End-User, rather than an arbitrary photo taken by the End-User.|
|website |	string |	URL of the End-User's Web page or blog. This Web page SHOULD contain information published by the End-User or an organization that the End-User is affiliated with.|
|email |	string |	End-User's preferred e-mail address. Its value MUST conform to the RFC 5322 [RFC5322] addr-spec syntax. The RP MUST NOT rely upon this value being unique, as discussed in Section 5.7.|
|email_verified |	boolean |	True if the End-User's e-mail address has been verified; otherwise false. When this Claim Value is true, this means that the OP took affirmative steps to ensure that this e-mail address was controlled by the End-User at the time the verification was performed. The means by which an e-mail address is verified is context-specific, and dependent upon the trust framework or contractual agreements within which the parties are operating.|
|gender |	string |	End-User's gender. Values defined by this specification are female and male. Other values MAY be used when neither of the defined values are applicable.|
|birthdate |	string |	End-User's birthday, represented as an ISO 8601:2004 [ISO8601‑2004] YYYY-MM-DD format. The year MAY be 0000, indicating that it is omitted. To represent only the year, YYYY format is allowed. Note that depending on the underlying platform's date related function, providing just year can result in varying month and day, so the implementers need to take this factor into account to correctly process the dates.|
|zoneinfo |	string |	String from zoneinfo [zoneinfo] time zone database representing the End-User's time zone. For example, Europe/Paris or America/Los_Angeles.|
|locale |	string |	End-User's locale, represented as a BCP47 [RFC5646] language tag. This is typically an ISO 639-1 Alpha-2 [ISO639‑1] language code in lowercase and an ISO 3166-1 Alpha-2 [ISO3166‑1] country code in uppercase, separated by a dash. For example, en-US or fr-CA. As a compatibility note, some implementations have used an underscore as the separator rather than a dash, for example, en_US; Relying Parties MAY choose to accept this locale syntax as well.|
|phone_number |	string |	End-User's preferred telephone number. E.164 [E.164] is RECOMMENDED as the format of this Claim, for example, +1 (425) 555-1212 or +56 (2) 687 2400. If the phone number contains an extension, it is RECOMMENDED that the extension be represented using the RFC 3966 [RFC3966] extension syntax, for example, +1 (604) 555-1234;ext=5678.|
|phone_number_verified |	boolean |	True if the End-User's phone number has been verified; otherwise false. When this Claim Value is true, this means that the OP took affirmative steps to ensure that this phone number was controlled by the End-User at the time the verification was performed. The means by which a phone number is verified is context-specific, and dependent upon the trust framework or contractual agreements within which the parties are operating. When true, the phone_number Claim MUST be in E.164 format and any extensions MUST be represented in RFC 3966 format.|
|address |	JSON | object	End-User's preferred postal address. The value of the address member is a JSON [RFC4627] structure containing some or all of the members defined in Section 5.1.1.|
|updated_at |	number |	Time the End-User's information was last updated. Its value is a JSON number representing the number of seconds from 1970-01-01T0:0:0Z as measured in UTC until the date/time.|

## [Financial-grade API Security Profile 1.0 - Part 1: Baseline](https://openid.net/specs/openid-financial-api-part-1-1_0.html)

### [5.2.2.1.  Returning authenticated user's identifier](https://openid.net/specs/openid-financial-api-part-1-1_0.html#returning-authenticated-user-s-identifier)
6. shall issue an ID Token in the token response when openid was included in the requested scope as in Section 3.1.3.3 of OIDC with its sub value corresponding to the authenticated user and optional acr value in ID Token.

### [7.4.1.  Authorization request and response](https://openid.net/specs/openid-financial-api-part-1-1_0.html#authorization-request-and-response)
In this document, the authorization request is not encrypted. Thus, it is possible to leak the information contained if the web browser is compromised.
Authorization response can be encrypted as ID Token can be encrypted.

### [8.  Privacy considerations](https://openid.net/specs/openid-financial-api-part-1-1_0.html#privacy-considerations)
#### [8.1.  Introduction](https://openid.net/specs/openid-financial-api-part-1-1_0.html#introduction-4)
Privacy threats to OAuth and OpenID Connect implementations include the following:
- (User tracking by RPs) Two or more RPs correlating access tokens or ID Tokens to track users.
- (Attacker observing personal data in authorization request) Authorization request might contain personal data. This can be observed by an attacker.
These threats can be mitigated by choosing appropriate options in OAuth or OpenID, or by introducing some operational rules. For example, "Attacker observing personal data in authorization request" can be mitigated by either using authorization request by reference using request_uri or by encrypting the request object. Similarly, "Attacker observing personal data in authorization endpoint response" can be mitigated by encrypting the ID Token or JARM response.

## [Financial-grade API Security Profile 1.0 - Part 2: Advanced](https://openid.net/specs/openid-financial-api-part-2-1_0.html)

### [5.2.2.1.  ID Token as detached signature](https://openid.net/specs/openid-financial-api-part-2-1_0.html#id-token-as-detached-signature-1)
In addition, if the response_type value code id_token is used, the authorization server
3. should support signed and encrypted ID Tokens;
6. should not return sensitive PII in the ID Token in the authorization response, but if it needs to, then it should encrypt the ID Token.
NOTE: The authorization server may return more claims in the ID Token from the token endpoint than in the one from the authorization response

### [5.2.3.  Confidential client](https://openid.net/specs/openid-financial-api-part-2-1_0.html#confidential-client)
#### [5.2.3.1.  ID Token as detached signature](https://openid.net/specs/openid-financial-api-part-2-1_0.html#id-token-as-detached-signature-2)
In addition, if the response_type value code id_token is used, the client
5. shall support both signed and signed & encrypted ID Tokens.

## [Open Banking Brasil Financial-grade API Security Profile 1.0 Implementers Draft 3](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-financial-api-1_ID3-ptbr.html#name-servidor-de-autoriza231227o)

### [5.2.2. Servidor de Autorização](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-financial-api-1_ID3-ptbr.html#name-servidor-de-autoriza231227o)
3. deve suportar os parâmetros claims como definido no item 5.5 do OpenID Connect Core
4. deve suportar o atributo claim padrão oidc "cpf" conforme definido no item 5.2.2.2 deste documento

### [5.2.2.1. Token de ID como assinatura separada](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-financial-api-1_ID3-ptbr.html#section-5.2.2.1)
1. não deveria retornar Informação de Identificação Pessoal (PII) confidenciais no token de ID na resposta de autorização, mas se for necessário, então ele deve criptografar o token de ID.

### [5.2.2.2. Solicitando uma "claim" cpf](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-financial-api-1_ID3-ptbr.html#section-5.2.2.2)
Este perfil define "cpf" como uma nova claim padrão de acordo com cláusula 5.1 OIDC

O número do CPF (Cadastro de Pessoas Físicas, [sepeˈɛfi]; português para "Registro de Pessoas Físicas") é o cadastro de pessoa física brasileira. Este número é atribuído pela Receita Federal Brasileira para brasileiros e estrangeiros residentes que, direta ou indiretamente, pagar impostos no Brasil.

No modelo de identidade do Open Banking Brasil, o cpf é uma string composta por números 11 caracteres de comprimento e podem começar com 0.

Se a Claim cpf for solicitada como essencial para constar no ID token ou na resposta ao endpoint de UserInfo e na solicitação constar no parâmetro value com determinado CPF exigido, o Authorization Server DEVE retornar no atributo cpf o valor que corresponda ao da solicitação.

Se a Claim cpf for solicitada como essencial para constar no ID Token ou na resposta no endpoint de UserInfo, o Authorization Server deve retornar no atributo cpf o valor com o CPF do usuário autenticado.

Se a Claim cpf indicada como essencial não puder ser preenchida ou não for compatível com o requisito, o Authorization Server deve tratar a solicitação como uma tentativa de autenticação com falha.

Nome: cpf, Tipo: String, Regex: 'd{11}$'

