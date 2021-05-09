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
      uri = "https://www.itau.com/"

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

# Referencias Normativas

The following referenced documents are indispensable for the application of this document. For dated references, only the edition cited applied. For undated references, the latest edition of the referenced document (including any amendments) applies.

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
* **UID:** Código de Participante associado ao CNPJ listado no Serviço de Diretório do OpenBanking Brasil;
* **commonName:** Software Statement ID cadastrado no Serviço de Diretório do OpenBanking Brasil e pertencente ao CNPJ e Código de Participante.

O Certificado Cliente deve ser emitido através de cadeia V10, e deve obrigatoriamente conter os seguintes atributos:

**Distinguished Name**

* **businessCategory (OID 2.5.4.15):**  Tipo de categoria comercial, devendo conter: "Private Organization" ou "Government Entity" ou "Business Entity" ou "Non-Commercial Entity"
* **jurisdictionCountryName (OID: 1.3.6.1.4.1.311.60.2.1.3):** BR
* **serialNumber (OID 2.5.4.5):** CNPJ
* **UID (OID 0.9.2342.19200300.100.1.1):** Código de Participante associado ao CNPJ listado no Serviço de Diretório do OpenBanking Brasil
* **countryName (OID 2.5.4.6):** BR
* **organizationName (OID 2.5.4.10):** Razão Social
* **stateOrProvinceName (OID 2.5.4.8):** Unidade da federação do endereço físico do titular do certificado
* **localityName (OID 2.5.4.7):** Cidade do endereço físico do titular
* **commonName (OID 2.5.4.3):** Software Statement ID gerado pelo Diretório do Open Banking Brasil

**Certificate Extensions**

* **keyUsage:** critical,digitalSignature,keyEncipherment
* **extendedKeyUsage:** clientAuth

**Subject Alternative Name**

* **otherName (OID 2.16.76.1.3.2 – ICP Brasil):** Nome do responsável pelo certificado
* **otherName (OID 2.16.76.1.3.3 – ICP Brasil):** Cadastro Nacional de Pessoa Jurídica (CNPJ) da pessoa jurídica titular do certificado
* **otherName (OID 2.16.76.1.3.4 – ICP Brasil):** Dados do responsável pelo certificado de pessoa jurídica titular do certificado (data de nascimento, CPF, PIS/PASEP/CI, RG);
* **otherName (OID 2.16.76.1.3.8 – ICP Brasil):** Nome empresarial constante do CNPJ (Cadastro Nacional de Pessoa Jurídica), sem abreviações.

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

### Certificado Diretorio

TODO

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
UID = <Código de Participante>
countryName = BR
organizationName = <Razao Social>
stateOrProvinceName = <UF>
localityName = <Cidade>
commonName = <Software Statement ID emitido pelo diretório>

[ req_cert_extensions ] 
basicConstraints = CA:FALSE
subjectAltName = @alt_name
keyUsage = critical,digitalSignature,keyEncipherment
extendedKeyUsage = clientAuth,serverAuth

[ alt_name ] 
#Name of the person responsible by the Certificate (Company Representative)
otherName.0 = 2.16.76.1.3.2;UTF8:<Nome da pessoal responsável pela entidade>
otherName.1 = 2.16.76.1.3.3;UTF8<CNPJ>
#Company Representative CPF/PIS/RF
otherName.2 = 2.16.76.1.3.4;UTF8:<CPF/PIS/RF da Pessoa responsável>
otherName.3 = 2.16.76.1.3.8;UTF8:<Razão Social>
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
