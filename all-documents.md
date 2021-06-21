* TOC
{:toc}

# Segurança  {#seguranca}

## Introdução   {#introducao}

Esta seção tem como finalidade auxiliar na auto avaliação aos cumprimentos dos requisitos de segurança da informação relacionados à autorização e autenticação de APIs e clientes de bancos e outras instituições financeiras, emissão de certificados digitais e requisitos para o onboarding no Diretório de Participantes para as instituições participantes do Open Banking Brasil.

As instituições participantes do Open Banking Brasil possuem a obrigação de acompanhar a edição e a revogação de eventuais normas com impacto no tema, de forma a estar permanentemente em dia com as determinações legais. Compõem, de forma não exaustiva, o rol de atos normativos cuja observância é essencial pelas instituições participantes do Open Banking Brasil:

[Resolução Conjunta CMN/BCB nº 1, de 2020](https://www.bcb.gov.br/estabilidadefinanceira/exibenormativo?tipo=Resolu%C3%A7%C3%A3o%20Conjunta&numero=1)

[Resolução CMN nº 4.658, de 2018](https://www.bcb.gov.br/pre/normativos/busca/downloadNormativo.asp?arquivo=/Lists/Normativos/Attachments/50581/Res_4658_v1_O.pdf)

[Circular BCB nº 3.909, de 2018](https://www.bcb.gov.br/pre/normativos/busca/downloadNormativo.asp?arquivo=/Lists/Normativos/Attachments/50645/Circ_3909_v1_O.pdf)

[Resolução BCB nº 37, de 4 de Novembro de 2020](https://www.bcb.gov.br/estabilidadefinanceira/exibenormativo?tipo=Instru%C3%A7%C3%A3o%20Normativa%20BCB&numero=37)

[Resolução BCB n° 32 de 29/10/2020](https://www.bcb.gov.br/estabilidadefinanceira/exibenormativo?tipo=Resolu%C3%A7%C3%A3o%20BCB&numero=32)

[Lei Geral de Proteção de Dados Pessoais (LGPD - Lei nº 13.709, de 2018)](http://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/L13709.htm)

Estas especificações baseiam-se, referenciam, e complementam, quando aplicável, os seguintes documentos:

[BCP 195/RFC 7525](https://tools.ietf.org/html/rfc7525)

[Owasp API Top 10](https://owasp.org/www-project-api-security/)

[Sans Top 25 Software Errors](https://www.sans.org/top25-software-errors)

[CWE Top 25 Software Weaknesses](https://cwe.mitre.org/top25/archive/2020/2020_cwe_top25.html)

Além desse guia, foi elaborado um checklist para auxiliar os participantes do Open Banking Brasil a alcançar um nível adequado de segurança da informação. Esse checklist pode ser baixado em formato Word ou Excel a seguir.

[Download Autoavaliação dos requisitos de SI - 1.0.docx](https://openbanking-brasil.github.io/areadesenvolvedor/documents/Autoavalia%C3%A7%C3%A3o_dos_requisitos_de%20_SI-1.0.docx)

[Download Autoavaliação dos requisitos de SI - 1.0.xlsx](https://openbanking-brasil.github.io/areadesenvolvedor/documents/Autoavalia%C3%A7%C3%A3o_dos_requisitos_de%20_SI-1.0.xlsx)

## Visão Geral do Ecossistema  {#visao-geral-ecossistema}

Em sua essência, o Open Banking Brasil é um ecossistema de compartilhamento de dados onde os clientes de bancos e outras instituições financeiras desejam compartilhar suas informações de conta ou dar permissão para que os pagamentos sejam executados em seu nome com serviços de terceiros.

Há uma série de funções necessárias para vincular qualquer sistema de identificação, autenticação e autorização, independentemente do setor. Todas essas funções são necessárias, mas várias funções podem ser desempenhadas por cada participante. Em geral, o usuário final está dando à um sistema uma autorização (*access token*) para acessar um recurso protegido mantido pelo provedor (*resource server*). Isso exige que o usuário final e o sistema sejam identificados e autenticados e que a autorização seja confirmada.

As regras exatas e os requisitos legais para cada função em um setor específico formam um framework de confiança (*trust framework*). Cada ecossistema requer um conjunto padronizado de regras e requisitos legais que abrangem todas as funções e obrigações das interações acima. A combinação de quem fornece qual(is) função(ões), os níveis aos quais eles devem desempenhar essas funções, e os padrões pelos quais essas operações devem ser realizadas, devem ser definidas por um framework de confiança específico do setor.

Diferentes frameworks de confiança terão diferentes opções de implementação, mas um framework de confiança comum é um pré-requisito para transformar um *setor* em um *ecossistema*. Um framework de confiança comum reduz significativamente a complexidade e custos, aumenta a escalabilidade e a interoperabilidade dentro do setor, bem como abre opções para o tipo de padronização intersetorial que o Open Banking Brasil está buscando.

Diferentes implementações podem ser definidas para setores, com diferentes prós e contras e custos associados para diferentes participantes. Cada uma das implementações propostas pode ser usada para qualquer setor se os pré-requisitos corretos estiverem em vigor. A solução certa dependerá do apetite e alinhamento de cada conjunto de participantes.

A implementação de um mecanismo comum para o Open Banking Brasil exigirá um compromisso com a simetria entre os setores para incluir detalhes específicos do setor nos princípios do framework de confiança.

É necessário fazer escolhas técnicas para garantir que qualquer implementação forneça uma base estrita e consistente para ter credibilidade, mas mantenha a flexibilidade para se adaptar às necessidades futuras. Isso implica padrões de código-fonte aberto amplamente disponíveis, amplamente compreendidos e que foram experimentados e testados. Além de habilitar um gama de parceiros e fornecedores que podem apoiar qualquer construção técnica, o que significa que continuará havendo espaço para desenvolvimento comercial de soluções.

### Participantes de um Ecossistema de Compartilhamento de Dados  {#participantes-ecossistema-compartilhamento-dados}

Nos ecossistemas de Open Banking voltados para o consumidor que estamos considerando, temos três participantes principais:

* o cliente (usuário final que possui as informações que se deseja acessar);
* a instituição transmissora de dados, que oferece serviços bancários;
* a instituição receptora de dados, que oferece uma proposta de Open Banking para o cliente.

Em todos os casos a seguir, assumimos:

* Um cliente possui uma conta para um serviço principal ou conjunto de recursos numa instituição transmissora de dados;
* Uma instituição receptora de dados oferece ao cliente uma proposta habilitada por meio do compartilhamento inteligente de dados;
* O cliente dá consentimento à instituição receptora de dados para fins de entrega dessa proposta;
* A instituição transmissora de dados tem a obrigação de salvaguardar os dados do cliente, mas também de compartilhá-los quando instruído.

O ecossistema também possui provedores de serviços de confiança, que são entidades que fornecem garantia técnica a ambas instituições (transmissoras e receptoras) de que todos estão autorizados a participar do ecossistema.

Os **padrões** técnicos necessários para dar suporte ao framework de confiança devem atender todos os requisitos a seguir:

* Identificação de todos os participantes do ecossistema;
* Autenticação quando exigida de todos os participantes entre si;
* Confirmação de autorização de todos os participantes em um ecossistema de compartilhamento de dados.

Os **serviços** técnicos necessários para suportar um ecossistema devem habilitar todos os requisitos acima **em uma base e modo contínuos**, isto é, não apenas em um único ponto de registro.

### Princípios de Requisitos  {#principios-requisitos}

O Open Banking Brasil adotou os seguintes princípios e requisitos no que diz respeito às normas técnicas do ecossistema:

* Consentimento
  * Os clientes devem estar sempre no controle de quem tem acesso aos seus dados e para quais fins eles estão sendo usados.
* Minimização de dados
  * Os clientes devem ser capazes de compartilhar apenas os dados de que precisam, pelo tempo que for necessário.
* Segurança
  * Uma modelagem de ameaças foi produzida avaliando todas as fraquezas potenciais nos processos de comunicação.
  * Todos os pontos fracos identificados foram corrigidos.
* Identificação
  * Todos os participantes devem ter segurança na identificação de todos os atores do ecossistema.
* Autenticação
  * Todos os participantes devem comunicar as etapas que foram executadas para autenticar cada participante no ecossistema e em que nível isso foi executado.
* Integridade e não repúdio
  * Todos os participantes devem ser capazes de provar que as mensagens não foram adulteradas e, na verdade, foram enviadas apenas por um participante legítimo.

Além disse, as seguintes diretrizes também foram adotadas:

* Não reinventar a roda, se existir uma especificação que seja adequada para o propósito, amplamente adotada e publicamente disponível, deve-se adotá-la;
* Envolver-se com outros órgãos de normalização para aprender com experiências anteriores sobre o que funcionou, o que não funcionou, e o que pode ser feito melhor;
* Assegurar o amplo suporte da indústria para garantir o máximo de chances de sucesso e, mais importante, a segurança do cliente;
* Solicitar feedback com antecedência e com frequência, reconhecer que serão necessárias várias iterações para desenvolver um padrão;
* O framework de confiança que sustenta o ecossistema de compartilhamento de dados, que é o Open Banking Brasil, é um framework técnico que precisa ser flexível o suficiente para permitir que os participantes e o ecossistema inovem, cresçam e se desenvolvam, enquanto permanecem interoperáveis.

Todos os participantes devem ter certeza de que todos os atores do ecossistema estão lidando com seus dados com segurança tempo todo. Isso requer que todos os participantes testem publicamente seus sistemas quanto à conformidade com as especificações e disponibilizem os resultados de seus testes de conformidade para exame público de outros participantes.

**Este é um requisito aplicável às instituições participantes transmissoras e receptoras de dados.**

## Convenções Notacionais  {#convencoes-notacionais}

As palavras-chave "**deve**" (*shall*), "**não deve**" (*shall not*), "**deveria**" (*should*), "**não deveria**" (*should not*) e "**pode**" (*may*) presentes nesse documento devem ser interpretadas conforme as diretrizes descritas em [ISO Directive Part 2][ISODIR2], observando a seguinte equivalência:

* "deve" => equivalente ao termo "shall" e expressa um requerimento definido no documento (nas traduções é similar ao termo "must", que pode denotar um requerimento externo ao documento);
* "não deve" => equivalente ao termo "shall not" e também expressa um requerimento definido no documento;
* "deveria" e "não deveria"=> equivalente ao termo "should" e "should not" e expressa uma recomendação
* "pode" => equivalente ao termo "may" indica uma permissão

Estas palavras-chave não são usadas conforme significado de dicionário, de modo que qualquer ocorrência deles deve ser interpretada como palavras-chave e não devem ser interpretados com seus significados de linguagem natural.

## Referências Normativas  {#referencias-normativas}

Os seguintes documentos referenciados são indispensáveis para a adoção das especificações deste documento. Para referências datadas, apenas a edição citada se aplica. Para referências não datadas, deve-se aplicar a última edição do documento referenciado (incluindo quaisquer emendas).

[ISODIR2]: https://www.iso.org/sites/directives/current/part2/index.xhtml
[ISODIR2] - ISO/IEC Directives Part 2

[ISO29100]: https://www.iso.org/standard/45123.html
[ISO29100] - Information technology - Security techniques - Privacy framework

[RFC6749]: https://tools.ietf.org/html/rfc6749
[RFC6749] - The OAuth 2.0 Authorization Framework

[RFC6750]: https://tools.ietf.org/html/rfc6750
[RFC6750] - The OAuth 2.0 Authorization Framework: Bearer Token Usage

[RFC7636]: https://tools.ietf.org/html/rfc7636
[RFC7636] - Proof Key for Code Exchange by OAuth Public Clients

[RFC6819]: https://tools.ietf.org/html/rfc6819
[RFC6819] - OAuth 2.0 Threat Model and Security Considerations

[RFC7519]: https://tools.ietf.org/html/rfc7519
[RFC7519] - JSON Web Token (JWT)

[RFC7591]: https://tools.ietf.org/html/rfc7591
[RFC7591] - OAuth 2.0 Dynamic Client Registration Protocol

[RFC7592]: https://tools.ietf.org/html/rfc7592
[RFC7592] - OAuth 2.0 Dynamic Client Registration Management Protocol

[BCP195]: https://tools.ietf.org/html/bcp195
[BCP195] - Recommendations for Secure Use of Transport Layer Security (TLS) and Datagram Transport Layer Security (DTLS)

[OIDC]: https://openid.net/specs/openid-connect-core-1_0.html
[OIDC] - OpenID Connect Core 1.0 incorporating errata set 1

[FAPI-CIBA]: https://bitbucket.org/openid/fapi/src/master/Financial_API_WD_CIBA.md
[FAPI-CIBA] - Financial-grade API: Client Initiated Backchannel Authentication Profile

[OIDD]: https://openid.net/specs/openid-connect-discovery-1_0.html
[OIDD] - OpenID Connect Discovery 1.0 incorporating errata set 1

[OIDR]: https://openid.net/specs/openid-connect-registration-1_0.html
[OIDR] - OpenID Connect Registration 1.0 incorporating errata set 1

[RFC8705]: https://tools.ietf.org/html/rfc8705
[RFC8705] - OAuth 2.0 Mutual TLS Client Authentication and Certificate Bound Access Tokens

[JARM]: https://bitbucket.org/openid/fapi/src/master/Financial_API_JWT_Secured_Authorization_Response_Mode.md
[JARM] - Financial-grade API: JWT Secured Authorization Response Mode for OAuth 2.0 (JARM)

[PAR]: https://tools.ietf.org/html/draft-ietf-oauth-par
[PAR] - OAuth 2.0 Pushed Authorization Requests

[JAR]: https://tools.ietf.org/html/draft-ietf-oauth-jwsreq
[JAR] - OAuth 2.0 JWT Secured Authorization Request

[FAPI-1-Baseline]: https://openid.net/specs/openid-financial-api-part-1-1_0.html
[FAPI-1-Baseline] - Financial-grade API Security Profile 1.0 - Part 1: Baseline

[FAPI-1-Advanced]: https://openid.net/specs/openid-financial-api-part-2-1_0.html
[FAPI-1-Advanced] - Financial-grade API Security Profile 1.0 - Part 2: Advanced

[FAPI-2-Baseline]: https://bitbucket.org/openid/fapi/src/master/FAPI_2_0_Baseline_Profile.md
[FAPI-2-Baseline] - Financial-grade API Security Profile 2.0 - Part 1: Baseline

[LIWP]: https://bitbucket.org/openid/fapi/src/master/Financial_API_Lodging_Intent.md
[LIWP] - OIDF FAPI WG Lodging Intent Working Paper

[OBB-FAPI]: #perfil-seguranca-obb-fapi
[OBB-FAPI] - Perfil de Segurança Open Banking Brasil Financial-grade API 1.0

[OBB-FAPI-DCR]: #dynamic-client-registration-profile
[OBB-FAPI-DCR] - Open Banking Brasil Dynamic Client Registration Profile 1.0

[OBB-Cert-Standards]: #padrao-certificados-obb
[OBB-Cert-Standards] - Padrão de Certificados Open Banking Brasil

## Glossário  {#glossario}

Sigla | Descrição | Informação
-----|------|------
AISP | Account Information Service Provider | Um provedor de serviços de informações de conta permite coletar informações de uma ou mais s contas de pagamento que podem ser mantidas em diferentes bancos ou provedores de serviços financeiros, em um só local. Um AISP permite obter informações consolidadas ou agregadas da conta
API	| Application Programming Interface | Uma interface de programação de aplicativo é um conjunto de rotinas, protocolos e ferramentas para construir aplicativos de software. Uma API especifica como os componentes de software devem interagir
AC | Autoridade Certificadora | É uma entidade, que pode ser pública ou privada, responsável por emitir, distribuir, renovar, revogar e gerenciar Certificados Digitais dos solicitantes ou de outras ACs que estejam abaixo dela
AES	| Advanced Encryption Standard | Algoritmo de criptografia de bloco simétrico com uma chave de criptografia de 256 bits
AR | Autoridade de Registro	| A AR está abaixo da Autoridade Certificadora (AC) e tem como missão receber o cliente para realizar conferência da documentação e emissão do certificado
ASPSP | Account Servicing Payment Service Provide | Um ASPSP é qualquer instituição financeira (transmissora ou provedora de serviços de pagamento de manutenção de contas) que oferece uma conta de pagamento com acesso online. Os ASPSPs devem fornecer acesso para permitir que terceiros (TPP) registrados acessem as informações da conta através de APIs
Autenticação mútua |  | Chamamos de autenticação mútua quando ambos cliente e servidor apresentam certificados para serem validados pelo par
CIBA | Client Initiated Backchannel Authentication | A autenticação de backchannel iniciada pelo cliente (CIBA) é um dos padrões mais recentes da OpenID Foundation. são categorizados como "fluxo desacoplado", Ele permite novas maneiras de obter o consentimento do usuário final
Claims | | São escopos/declarações usadas em uma API durante a autenticação para autorizar o acesso aos detalhes de um usuário, como nome e imagem por exemplo. Cada escopo retorna um conjunto de atributos do usuário, que são chamados de declarações
Cliente | | Identificação de usuário final que possui as informações que se deseja acessar
CSR	| Certificate Signing Request | Contém informação que irá ser incluída no seu certificado como o nome da empresa/organização, common name (domínio), localidade e país. Também contém a chave pública (public key) que será incluída no seu certificado. Normalmente é também criada uma chave privada (private key) ao mesmo tempo que é criado o CSR
DCR | Dynamic Client Registration | Especificação que define mecanismos para registrar dinamicamente clientes OAuth 2.0 com Authorization Servers
ECDHE | Elliptic-curve Diffie–Hellman | É um protocolo de contrato chave que permite que duas partes, cada uma com um par de chaves público-privado de curva elíptica, estabeleçam um segredo compartilhado em um canal inseguro
ECDSA | Elliptic Curve Digital Signature Algorithm | É um algoritmo de método de assinatura digital de documentos utilizando criptografia baseada em curvas elípticas.
EIOBB | Estrutura Inicial do Open Banking Brasil | Responsável por criar padrões e especificações necessárias para atender aos requisitos e obrigações da Legislação do Open Banking do Brasil, conforme originalmente delineado pelo Banco Central do Brasil
FAPI | Financial-grade API | Especificação técnica de API e define requisitos técnicos adicionais para o setor financeiro
Header | | É o cabeçalho de uma solicitação ou resposta que transmite contexto e metadados adicionais sobre a solicitação ou resposta. Por exemplo, em uma mensagem de solicitação podem ser usados para fornecer credenciais de autenticação
HTTP | Hyper Text Transfer Protocol | É um protocolo de comunicação base para a comunicação de dados da World Wide Web
ICP-Brasil | Infraestrutura de Chaves Públicas Brasileira | Na definição oficial, “uma cadeia hierárquica de confiança que viabiliza a emissão de certificados digitais para identificação virtual do cidadão
Json | JavaScript Object Notation | Json é um modelo para armazenamento e transmissão de informações no formato texto
JWS | JSON Web Signature | É uma forma de garantir a integridade das informações em um formato altamente serializado
JWT | JSON Web Token | É uma técnica definida na RFC 7519 para autenticação remota entre duas partes. Ele é uma das formas mais utilizadas para autenticar usuários em APIs RESTful
MAC | Código de Autenticação de Mensagem | Permite que as declarações sejam assinadas digitalmente ou protegidas por integridade utilizando JWS
MFA | Multi-Factor Authentication | Adiciona uma camada de proteção ao processo de entrada. Os usuários fornecem uma verificação de identidade adicional ao acessar contas ou aplicativos, como a leitura de uma impressão digital ou a adição de um código recebido por telefone
mTLS | Mutual Transport Layer Security | É uma extensão do TLS que requer que ambos o servidor e o cliente verifiquem seus certificados
Oauth | | O OAuth é um protocolo de autorização para API's web voltado a permitir que aplicações client acessem um recurso protegido em nome de um usuário.
OIDC | OpenID Connect | OpenID Connect é um protocolo de identidade simples com padrão aberto
OIDF | OpenID Foundation | A OpenID Foundation é uma organização internacional sem fins lucrativos de padronização comprometida em habilitar, promover e proteger as tecnologias OpenID
Payload | | O Payload é a carga útil do token JWT. É aqui que você coloca informações como a quem o token pertence, qual a expiração dele, quando ele foi criado, entre outras coisas
PISP | Payment Initiation Service Provider | Instituição prestadora de serviço de iniciação de pagamentos
PKCE | Proof Key for Code Exchange | Chave de prova para troca de código por clientes públicos Oauth
REST | Representational State Transfer | É um estilo arquitetural da World Wide Web que consiste de um conjunto coordenado de restrições aplicadas a componentes, conectores e elementos de dados dentro de um sistema
SHA256 | Secure Hash Algorithm | É um conjunto de funções criptográficas de hash
SS | Software Statement | É um JSON Web Token (JWT) que contém metadados sobre o software cliente como um pacote, sendo atestado por um serviço de terceiros.
SSA | Software Statement Assertion | É um JSON Web Token (JWT) que contém metadados sobre uma instância de aplicativo client desenvolvida por um TPP. O JWT é emitido e assinado pelo Diretório do Open Banking Brasi
TLS	| Transport Layer Security | É um protocolo de segurança projetado para fornecer segurança nas comunicações sobre uma rede de computadores
TPP	| Third Party Provider | As instituições provedoras são organizações que usam APIs desenvolvidas pelos ASPSP para acessar contas de clientes, a fim de fornecer serviços de informações de contas. No Open Baking Brasil são chamadas de instituições receptoras de dados.

## Principais Padrões de Segurança  {#principais-padroes-seguranca}

### Estrutura de Autorização OAuth 2.0  {#estrutura-autorizacao-oauth20}

O ecossistema de compartilhamento de dados definido pelo Open Banking Brasil consiste em muitos padrões diferentes, todos girando em torno de conceitos, funções e obrigações que foram tecnicamente definidos no [OAuth 2.0 Authorization Framework.](https://tools.ietf.org/html/rfc6749).

> A estrutura de autorização OAuth 2.0 permite uma aplicação de terceiros (*third-party application*) obter acesso limitado a um serviço HTTP, seja em nome do proprietário de recurso (*resource owner*) por meio da orquestração de uma interação de aprovação entre o proprietário do recurso e o serviço HTTP, ou permitindo a aplicação de terceiros obter acesso em seu próprio nome.

A especificação base OAuth 2.0 não fornece, por si só, informações suficientes para atender a todas as necessidades definidas pelo framework de confiança do Open Banking Brasil, pois não possui uma maneira de transmitir informações de identidade do cliente em um formato padronizado de uma instituição transmissora para uma receptora, e os mecanismos de autenticação que foram definidos na especificação original não são seguros o suficiente para atender aos requisitos de uma indústria altamente regulamentada.

### OpenID Connect - A Camada de Identidade para a Internet  {#openid-connect-camada-identidade-internet}

**_Este perfil herda todas as obrigações do OAuth 2.0_**

> [OpenID Connect](https://openid.net/connect/) é um conjunto de especificações simplificadas que fornecem uma estrutura para interações de identidade por meio de APIs do tipo REST. A implementação mais simples do OpenID Connect permite que aplicações clientes de todos os tipos, incluindo baseados em navegador, celulares e javascript, solicitem e recebam informações sobre identidades e sessões atualmente autenticadas. O conjunto de especificações é extensível, permitindo que os participantes também suportem, opcionalmente, criptografia de dados de identidade, descoberta do OpenID Provider e gerenciamento avançado de sessão, incluindo logout.

O grupo de trabalho OpenID Foundations Connect tem sido o guardião do padrão de identidade "de fato" da internet por muitos anos, trabalhando em várias especificações que se baseiam no framework de autorização OAuth 2.0, adicionando recursos e requisitos de suporte para melhorar a segurança do framework em si.

[Open ID Connect Core:](https://openid.net/specs/openid-connect-core-1_0.html) é um perfil do OAuth 2.0, o que significa que herda todos os requisitos e obrigações do [OAuth 2.0](https://tools.ietf.org/html/rfc6749), mas define o conceito de um `id_token` e introduz novos mecanismos de autenticação.

[Open ID Connect Discovery:](https://openid.net/specs/openid-connect-discovery-1_0.html) apresenta o conceito de um documento de descoberta usado por OIDC Providers para anunciar como os clientes OAuth 2.0 podem se comunicar com eles e quais recursos e opções o OIDC Provider oferece suporte.

[RFC7591:](https://tools.ietf.org/html/rfc7591) além de definir o processo de Dynamic Client Registration, esta especificação apresenta o conceito de [Software Statement](https://tools.ietf.org/html/rfc7591#section-2.3), que pode ser usada para fornecer informações sobre um software cliente que é atestado por um serviço de terceiros. Outros atributos de metadados também são definidos no [OpenID Connect Registration Specification](https://openid.net/specs/openid-connect-registration-1_0.html)

> Esta especificação define mecanismos para registrar dinamicamente cliente OAuth 2.0 com Authorization Servers. Pedidos de registro enviam um conjunto de valores de metadados do cliente desejado para o *Authorization Server*. As respostas de registro resultantes retornam um identificador de cliente para ser usado no *Authorization Server* e os valores de metadados registrados para o cliente. O cliente pode então usar esta informação de registro para se comunicar com o Authorization Server usando o protocolo OAuth 2.0. Esta especificação também define um conjunto de campos de metadados do cliente e valores para que devem ser usados durante o registro.

[RFC7592:](https://tools.ietf.org/html/rfc7592) Esta especificação define métodos de gerenciamento de Dynamic Client Registration do OAuth 2.0 para casos de uso em que as propriedades de um cliente registrado necessitam ser alteradas durante seu ciclo de vida.

As especificações acima são especificações básicas cuja leitura obrigatória sustenta o framework de confiança do Open Banking Brasil. Entretanto, eles ainda são insuficientes para atender a todos os requisitos e princípios descritos anteriormente.

### OpenID Financial Grade 1.0: Baseline  {#openid-financial-grade-baseline}

**_Este perfil herda todas as obrigações do OpenID Connect Core_**

Reconhecendo as ameaças e riscos restantes que não foram tratados pelo OpenID Connect Core, o grupo de trabalho Financial Grade tem como foco criar uma especificação que visa identificar e endereçar os pontos fracos na especificação OpenID Connect, essencialmente criando um perfil para casos de uso que exigem alto nível segurança.

O perfil Baseline foi originalmente planejado para ser mais facilmente implementado por cliente e OpenID Providers às custas de alguns elementos de segurança e, como tal, não oferece um alto nível de proteção contra violação de solicitação e resposta.

### OpenID Financial Grade 1.0: Advanced  {#openid-financial-grade-advanced}

**_Este perfil herda todas as obrigações do OpenID FAPI 1.0: Baseline_**

O [FAPI 1.0: Advanced profile](https://openid.net/specs/openid-financial-api-part-2-1_0.html) é atual padrão ouro para API Security, fornecendo um framework que foi usado como ponto de partida para a criação da especificação para o Open Banking Brasil.

> Este padrão especifica um perfil de segurança avançado do OAuth que é adequado para ser usado para proteger APIs com alto risco inerente. Os exemplos incluem APIs que dão acesso a dados altamente confidenciais ou que podem ser usados para acionar transações financeiras (por exemplo, início de pagamento). Este padrão especifica os controles contra ataques, como: violação de solicitação de autorização, violação de resposta de autorização incluindo injeção de código, injeção de estado e phishing de solicitação de token.

![Hierachy of OAuth 2.0 Profiles](images/fapi.png)

## Perfil de Segurança Open Banking Brasil Financial-grade API 1.0 {#perfil-seguranca-obb-fapi}

A Financial-grade API do Open Banking Brasil é um perfil OAuth altamente seguro que visa fornecer diretrizes de implementação específicas para segurança e interoperabilidade que podem ser aplicadas a APIs na área de Open Banking do Brasil que requerem um nível de privacidade superior ao fornecido pelo padrão [Financial-grade API Security Profile 1.0 - Part 2: Advanced][FAPI-1-Advanced]. Entre outras melhorias, esta especificação aborda considerações de privacidade identificadas em [FAPI-1-Advanced] que são relevantes nas especificações do Open Banking Brasil, mas não foram, até agora, exigidas por outras jurisdições.

Embora seja possível codificar um provedor de OpenID e parte de confiança a partir dos primeiros princípios usando esta especificação, o público principal para esta especificação são as partes que já possuem uma implementação certificada do [Financial-grade API Security Profile 1.0 - Part 2: Advanced][FAPI-1-Advanced] e deseja obter a certificação para o programa Brasil Open Banking.

### Introdução  {#secintroduction}

O perfil de segurança do Open Banking Brasil especifica requisitos adicionais de segurança e de  identificação para o acesso a API´s com recursos críticos protegidas pelo OAuth 2.0 Authorization Framework, que consiste em [RFC6749], [RFC6750], [RFC7636], [FAPI-1-Baseline], [FAPI-1-Advanced] e outras especificações.

Este perfil descreve as capacidades e os recursos de segurança que devem ser oferecidos por servidores e clientes que são necessários para o Programa do Open Banking Brasil, definindo as medidas para mitigar ou endereçar:

* ataques que abordam considerações de privacidade identificadas na cláusula 9.1 de [FAPI-1 Advanced].
* o requisito de concessão de acesso granular a recursos, com vistas à minimização de dados;
* o requisito de informar sobre o contexto da autenticação do usuário (claim Authentication Context Request - acr) que foi realizada por um Provedor OpenID, com vistas a favorecer o adequado gerenciamento do risco decorrente do acesso do usuário;
* o requisito para que os clientes de API declarem um relacionamento prévio com o usuário, afirmando em uma `claim` de identificação do usuário como parte do fluxo de autorização.

Este profile especifica o método para os aplicativos

* obterem de maneira segura os tokens OAuth necessários para acesso a dados críticos de acordo com os requisitos do [Open Banking Brasil](https://www.in.gov.br/en/web/dou/-/resolucao-conjunta-n-1-de-4-de-maio-de-2020-255165055);
* utilizarem o OpenID Connect para identificação do usuário do Open Banking; e
* utilizarem o OpenID Connect para afirmar a identidade do cliente.

Este profile é aplicável a todos os participantes do Open Banking no Brasil.

### Disposições de Segurança do Open Banking Brasil  {#authserver}

O Open Banking Brasil tem um requisito para endereçar considerações de privacidade que foram identificadas, mas não abordadas na especificação final [FAPI-1-Advanced], sem impor requisitos adicionais aos Servidores de Autorização que estão sendo propostos em [FAPI-2-Baseline].

Os participantes desse ecossistema precisam que os clientes de API solicitem a um provedor openid a confirmação dos valores das `claims` de identificação do usuário como parte de uma solicitação de autorização usando o mecanismo definido na cláusula 5.5.1 de [OIDC].

O uso do parâmetro `claims` para solicitar a validação de valores de identificação explícitos requer que os clientes de API protejam com criptografia o Request Object para evitar vazamento de informações. Este risco é identificado na cláusula 7.4.1 do [FAPI-1-Advanced].

Além disso, este perfil descreve o escopo específico, valores de `acr` e requisitos de gerenciamento de clientes necessários para dar suporte ao ecossistema Open Banking Brasil mais amplo.

Como um perfil do OAuth 2.0 Authorization Framework, este documento exige o seguinte para o perfil de segurança do Open Banking Brasil.

#### Servidor de Autorização  {#authprovisions}

O Servidor de Autorização **deve** suportar as disposições especificadas na cláusula 5.2.2 de [Financial-grade API Security Profile 1.0 - Parte 2: Advanced] [FAPI-1-Advanced].

Além disso, ele deve:

1. deve suportar Request Objects JWE assinados e criptografados passados por valor ou deve exigir requisições do tipo "pushed authorization requests" [PAR]
2. deve publicar metadados de descoberta (incluindo a do endpoint de autorização) por meio do documento de metadado especificado em [OIDD] e [RFC8414] (".well-known")
3. deve suportar os parâmetros `claims` como definido no item 5.5 do [OpenID Connect Core][OIDC]
4. deve suportar o atributo `claim` padrão oidc "cpf" conforme definido no item 5.2.2.2 deste documento
5. deve suportar o atributo `claim` padrão oidc "cnpj" conforme definido no item 5.2.2.3 deste documento
6. deve suportar o atributo `acr` "urn:brasil:openbanking:loa2" como definido no item 5.2.2.4 deste documento
7. deveria suportar o atributo `acr` "urn:brasil:openbanking:loa3" como definido no item 5.2.2.4 deste documento
8. deve implementar o endpoint "userinfo" como definido no item 5.3 do [OpenID Connect Core][OIDC]
9. deve suportar o escopo parametrizável ("parameterized OAuth 2.0 resource scope") _consent_ como definido no item 6.3.1 de [OIDF FAPI WG Lodging Intent Pattern][LIWP]
10. pode suportar [Financial-grade API: Client Initiated Backchannel Authentication Profile][FAPI-CIBA]
11. deve suportar [Financial-grade API: Client Initiated Backchannel Authentication Profile][FAPI-CIBA] se suportar o scope _payments_
12. deve suportar `refresh tokens`
13. deve emitir `access tokens` com o tempo de expiração entre 300 (mínimo) e 900 (máximo) segundos.

##### Token de ID como assinatura separada  {#detached}

O Servidor de Autorização *deve* suportar as disposições especificadas na cláusula 5.2.2.1 de [Financial-grade API Security Profile 1.0 - Parte 2: Advanced] [FAPI-1-Advanced]

Além disso, se o valor `response_type` `code id_token` for usado, o servidor de autorização:

1. **não deveria** retornar Informação de Identificação Pessoal (PII) confidenciais no token de ID na resposta de autorização, mas se for necessário, então ele **deve** criptografar o token de ID.

##### Solicitando uma "claim" **cpf**  {#cpf}

Este perfil define "cpf" como uma nova `claim` padrão de acordo com cláusula 5.1 [OIDC]

O número do **CPF** (Cadastro de Pessoas Físicas) é o cadastro de pessoa física **brasileira**. Este número é atribuído pela Receita Federal **Brasileira** para brasileiros e estrangeiros residentes que, direta ou indiretamente, pagar impostos no **Brasil**.

No modelo de identidade do Open Banking Brasil, o cpf é uma string composta por números 11 caracteres de comprimento e podem começar com 0.

Se a Claim **cpf** for solicitada como essencial para constar no ID token ou na resposta ao endpoint de UserInfo e na solicitação constar no parâmetro `value` com determinado **CPF** exigido, o Authorization Server **DEVE** retornar no atributo **cpf** o valor que corresponda ao da solicitação.

Se a Claim **cpf** for solicitada como essencial para constar no ID Token ou na resposta no endpoint de UserInfo, o Authorization Server deve retornar no atributo **cpf** o valor com o **CPF** do usuário autenticado.

Se a Claim **cpf** indicada como essencial não puder ser preenchida ou não for compatível com o requisito, o Authorization Server deve tratar a solicitação como uma tentativa de autenticação com falha.

Nome: cpf, Tipo: String, Regex: '^\d{11}$'

##### Solicitando a "claim" **cnpj**  {#cnpj}

Este perfil define "cnpj" como uma nova reivindicação padrão de acordo com cláusula 5.1 [OIDC]

**CNPJ**, abreviação de Cadastro Nacional de Pessoas Jurídicas, é um número de identificação de empresas **brasileiras** emitidas pelo Ministério da Fazenda **brasileira**, **na** "Secretaria da Receita Federal" ou "Ministério da Fazenda" do Brasil. No modelo de identidade do Open Banking Brasil, pessoas físicas podem se associar a 0 ou mais CNPJs. Um CNPJ é uma string que consiste em números de 14 dígitos e pode começar com 0, os primeiros oito dígitos identificam a empresa, os quatro dígitos após a barra identificam a filial ou subsidiária ("0001" padrão para a sede), e os dois últimos são dígitos de soma de verificação. Para este perfil, o pedido de cnpj deve ser solicitado e fornecido como o número de 14 dígitos.

Se a Claim **cnpj** for solicitada como essencial para constar no ID Token ou na resposta ao endpoint UserInfo e na solicitação constar, no parâmetro `value`, determinado **CNPJ** exigido, o Authorization Server **DEVE** retornar no atributo **cnpj** um **conjunto** de **CNPJs** relacionado com o usuário, um dos quais deve incluir valor que corresponda ao da solicitação.

Se a Claim **cnpj** for solicitada como essencial para constar no ID Token ou na resposta ao endpoint UserInfo, o Authorization Server deve incluir no ID Token ou na resposta ao endpoint UserInfo um **conjunto** que inclua um elemento com o número do **CNPJ** relacionado à conta utilizada na autenticação do usuário.

Se a Claim **cnpj** indicada como essencial não puder ser preenchida ou validada, o Authorization Server deve tratar a solicitação como uma tentativa de autenticação com falha.

Nome: cnpj, Tipo: Array of Strings, Array Element Regex: '^\d{14}$'

##### Solicitando o "urn:brasil:openbanking:loa2" ou "urn:brasil:openbanking:loa3" Solicitação de contexto de autenticação  {#loa}

* **LoA2**: mecanismo de autenticação com a adoção de um único fator
* **LoA3**: mecanismo de autenticação com múltiplos fatores de autenticação

A seguinte regra deve ser adotada para o mecanismo de autenticação:

* **Para controle de acesso às API´s definidas na FASE 2 (leitura de dados)**: os `Authorization Servers` das instituições transmissoras de dados devem condicionar a autenticação do usuário proprietário do dado, no mínimo, a adoção de método compatível com `LoA2`. A adoção de mecanismo de autenticação mais rigoroso (`LoA3`) fica a critério da instituição transmissora de acordo com sua avaliação de riscos.
* **Para acesso às API´s das fases subsequentes (em especial pagamento)**: o acesso deve ser condicionado à método de autenticação compatível com `LoA3` ou superior.  

**Esclarecimentos adicionais sobre fatores de autenticação**

São fatores de autenticação:
* Aquilo que **você conhece**, como uma senha ou frase secreta
* Aquilo que **você tem**, como um token, smartcard ou dispositivo
* Aquilo que **"você é"**, ou seja, autenticação condicionada a apresentação de uma característica física exclusivamente sua, como a validação por biometria

Para realizar autenticação por múltiplos fatores (MFA) é necessário que o usuário apresente, ao menos, dois diferentes  fatores dos listados acima. Um mesmo fator usado mais de uma vez - por exemplo, a apresentação de suas senhas que ele conhece - não pode ser aceito como MFA.

#### Cliente confidencial  {#client}

Um cliente confidencial deve apoiar as disposições especificadas na cláusula 5.2.3 de
[Financial-grade API Security Profile 1.0 - Part 2: Advanced][FAPI-1-Advanced],

Além disso, o cliente confidencial

1. deve suportar objetos de solicitação _encrypted_
2. deve suportar solicitações de autorização push (pushed authorization requests) [PAR]
3. deve usar objetos de solicitação _encrypted_ se não usar [PAR]
4. deve suportar o escopo de recurso OAuth 2.0 parametrizado _consent_ conforme definido na cláusula 6.3.1 [OIDF FAPI WG Lodging Intent Pattern][LIWP]
5. deve suportar `refresh tokens`

### Considerações de segurança  {#authserver}

Os participantes devem apoiar todas as considerações de segurança especificadas na cláusula 8 [Financial-grade API Security Profile 1.0 - Parte 2: Advanced] [FAPI-1-Advanced] e o [Manual de Segurança de Banco Central do Brasil] (https://www.bcb.gov.br/estabilidadefinanceira/exibenormativo?tipo=Instru%C3%A7%C3%A3o%20Normativa%20BCB&numero=99). O ICP brasileiro emite certificados RSA x509 somente, portanto, para simplificar, a seção remove o suporte para algoritmos EC e exige que apenas algoritmos de criptografia recomendados pela IANA sejam usados.

#### Considerações de algoritmo  {#alg}

Para JWS, clientes e servidores de autorização

1. devem usar o algoritmo PS256;

##### Considerações de algoritmo de criptografia  {#cipher}

Para JWE, clientes e servidores de autorização

1. devem usar RSA-OAEP com A256GCM

##### Considerações sobre o uso seguro do Transport Layer Security  {#tls}

Para TLS, endpoints do Servidor de Autenticação e endpoints do Servidor de Recursos usados diretamente pelo cliente:

1. devem suportar `TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256`
2. devem suportar `TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384`

### Considerações sobre compartilhamento de dados  {#dados}

#### Mecanismo de Autorização  {#authmech}

Os mecanismos existentes para gerenciar adequadamente o acesso aos recursos definidos em [RFC6749] são insuficientes para atender aos requisitos de um ecossistema de compartilhamento de dados moderno. Aproveitar strings de escopo estático não fornece aos consumidores controle de granularidade suficiente para compartilhar com terceiros. O Open Banking Brasil optou por implementar uma [API de consentimento](https://openbanking-brasil.github.io/areadesenvolvedor/swagger/swagger_consents_apis.yaml) como um recurso protegido OAuth 2.0 que pode ser usado para gerenciar o acesso granular aos recursos. A referência ao recurso de consentimento será transmitida como parte de um escopo de recurso dinâmico OAuth 2.0.

### Definição de Escopo de Consentimento Dinâmico  {#consent}

Este perfil define o escopo dinâmico do OAuth 2.0 "consentimento" da seguinte maneira:

* string 'consent'; e
* delimitador de dois pontos ":"; e
* Consent API REST Resource Id retornado por uma criação bem-sucedida de [Open Banking Consent Resource](https://openbanking-brasil.github.io/areadesenvolvedor/#fase-2-apis-do-open-banking-brasil-api-consentimento);

Adicionalmente:

* Consent Resource Id deve incluir caracteres seguros para url;
* Consent Resource Id deve ser "namespaced";
* Consent Resource Id deve ter propriedades de um `nonce` [Nonce](https://openid.net/specs/openid-connect-core-1_0.html#NonceNotes);

#### Exemplo de Dynamic Consent Scope  {#consentexample}

consent:urn:bancoex:C1DD33123

#### Exemplo de escopo de consentimento dinâmico  {#consentid}

consent:urn:bancoex:C1DD33123

### Ciclo de vida da autorização  {#lifecycle}

O recurso de consentimento tem um ciclo de vida gerenciado separada e distintamente da estrutura de autorização OAuth 2.0. As transições de estado e comportamentos esperados e condições de erro esperados dos Recursos REST protegidos com este perfil são definidos nas especificações funcionais da API publicadas pelo Open Banking Brasil.

#### Servidor de autorização  {#lifecycleauth}

Além dos requisitos descritos nas disposições de segurança do Open Banking Brasil, o Servidor de Autorização

1. deve emitir _refresh tokens_ com validade igual ao *expirationDateTime* definido no Consentimento (Consent Resource) relacionado;
2. deve revogar os _refresh tokens_ e, quando aplicável, os _access tokens_ quando o Consentimento (Consent Resource) relacionado for apagado;
3. deve garantir que os _access tokens_ são emitidos com os _scopes_ necessários para permitir acesso aos dados especificados em elemento _Permission_ do Consentimento (Consent Resource Object) relacionado;
4. não deve rejeitar pedido de autorização com _scopes_ além do necessário para permitir acesso a dados definidos em elemento _Permission_ do Consentimento (Consent Resource Object) relacionado;
5. pode reduzir o escopo solicitado para um nível que seja suficiente para permitir o acesso aos dados definidos em elemento _Permission_ do Consentimento (Consent Resource Object) relacionado;
6. deve manter registros sobre o histórico dos consentimentos para permitir a adequada formação de trilhas de auditoria em conformidade com a regulação em vigor.

#### Cliente confidencial  {#clientconfidential}

Além dos requisitos descritos nas disposições de segurança do Open Banking Brasil, o Cliente Confidencial

1. deve, sempre que possível, revogar e cessar o uso de _refresh_ e de _access tokens_  vinculados a um consentimento (Consent Resource Object) que foi excluído;
2. deve excluir consentimentos (Consent Resource Objects) que estão expirados;

## Dynamic Client Registration Profile 1.0 {#dynamic-client-registration-profile}

### Introdução  {#introducao}

O Dynamic Client Registration DCR do Financal-grade API (FAPI) do Open Banking Brasil é um perfil de [RFC7591], [RFC7592] e [OIDR] que visa fornecer diretrizes de implementação específicas para segurança e interoperabilidade que podem ser aplicadas à identificação, registro e gerenciamento de clientes OAuth operando no ecossistema Open Banking Brasil.

Embora seja possível codificar um OpenID Provider e Relying Party desde o princípio usando esta especificação, o principal público para esta especificação são as partes que já possuem uma implementação certificada do [OpenID Connect] [OIDC] e desejam obter a certificação para o Open Banking Brasil.

Este profile especifica o método para:

* aplicativos cadastrados no [Diretório de Participantes do Open Banking](https://web.directory.openbankingbrasil.org.br) para descobrir OpenID Providers que oferecem serviços no ecossistema Open Banking Brasil;
* aplicativos para usar o [OpenID Connect Registration][OIDR] para integrar seus aplicativos com OpenID Providers dos bancos; e
* aplicativos para usar [OAuth 2.0 Dynamic Client Registration Management Protocol][RFC7592] para gerenciar seus aplicativos com OpenID Providers;

Este profile é aplicável a todos os participantes do Open Banking no Brasil.

### Diretório de Participantes  {#diretorio-participantes}

O ecossistema Open Banking Brasil apoia-se em no *Diretório de Participantes* como provedor de confiança e a fonte mais valiosa de informações sobre participantes credenciados e softwares que estão autorizados a participar do ecossistema Open Banking Brasil.

Os serviços do Diretório incluem:

* Registro e gerenciamento de software;
* Registro e gerenciamento de credenciais de software usando certificados ICP-Brasil;
* Geração de Software Statement Assertion (SSA).

Os participantes do ecossistema devem aproveitar esses serviços para facilitar o registro de clientes OAuth orientado por API usando o processo descrito na cláusula 3.1.1 da [RFC7591], com metadados adicionais necessários para oferecer suporte ao OpenID Connect definido em [OpenID Connect Registration][OIDR].

Sempre que possível, os Authorization Servers devem comparar os metadados do cliente declarados por um cliente, feito como parte do registro ou solicitação de gerenciamento, com as declarações de metadados contidas em um software statement. Nem todos os metadados que um cliente deseja fornecer podem estar contidos em software statement., por exemplo,inguagens de metadados e valores de script alternativos (mais informações em [Metadata Languages and Script](https://openid.net/specs/openid-connect-registration-1_0.html#LanguagesAndScripts)).

### Provisionamentos do OpenID Connect Discovery  {#provisionamento-openid-connect-discovery}

#### Authorization Servers  {#authoriztion-servers}

O Authorization Server deve suportar o [OpenID Connect Discovery][OIDD], conforme exigido pelo [Financial-grade API Security Profile 1.0 - Part 1: Baseline][FAPI-1-Baseline].

Adicionalmente, o Authorization Server:

1. deve anunciar sua presença no ecossistema Open Banking Brasil, sendo listada no Diretório de Participantes;
2. deve anunciar todos os recursos API REST do Open Banking Brasil protegidos pelo OpenID Provider no Diretório de Participantes;
3. deve anunciar suporte para todos os mecanismos de assinatura, criptografia, autenticação e padrões necessários para suportar o [Perfil de Segurança Open Banking Brasil Financial-grade API][OBB-FAPI];
4. deve anunciar suporte para [OpenID Dynamic Client Registration][OIDR];
5. deve anunciar `mtls_endpoint_aliases` de acordo com a cláusula 5 [RFC 8705 OAuth 2.0 Mutual-TLS Client Authentication e Certificate-Bound Access Tokens][RF8705] o `token_endpoint`, `registration_endpoint` e `userinfo_endpoint`;
6. se suportar [OAuth 2.0 Pushed Authorisation Requests][PAR], deve anunciar por meio de [OIDD] `mtls_endpoint_aliases` o `push_authorization_request_endpoint`;
7. se suportar [Financial API - Client Initiated Back Channel Authentication][FAPI-CIBA], deve anunciar através de [OIDD] `mtls_endpoint_aliases` o `backchannel_authentication_endpoint`;

#### Cliente OpenID {#client-openid}

O cliente OpenID deve suportar [OpenID Connect Discovery][OIDD] conforme exigido pelo [Financial-grade API Security Profile 1.0 - Part 1: Baseline][FAPI-1-Baseline].

Além disso, o Authorization Server:

1. deve contar com serviços de descoberta do ecossistema fornecidos apenas pelo Diretório de Participantes;
2. deve derivar os metadados necessários do Authorization Server somente por meio do serviço OpenID Connect Discovery dos Authorization Servers;
3. quando presente, deve usar endpoints anunciados em `mtls_endpoint_aliases` conforme a cláusula 5 [RFC 8705 OAuth 2.0 Mutual-TLS Client Authentication e Certificate-Bound Access Tokens][RF8705];

### Requisitos de Registro OpenID Connect  {#requisitos-registro-openid-connect}

#### Authorization Server  {#authorization-server}

O Authorization Server deve suportar a [RFC7591], [RFC7592] e [OpenID Registration][OIDR].

Além disso, o Authorization Server:

1. deve rejeitar as solicitações de DCR não realizadas em uma conexão protegida com mTLS usando certificados emitidos pelo ICP-Brasil (produção) ou o Diretório de Participantes (sandbox);
2. deve validar que a solicitação contém `software_statement` JWT assinado usando o algoritmo `PS256` emitido pelo Diretório de Participantes do Open Banking Brasil;
3. deve validar que o `software_statement` foi emitido (iat  - *issued at*) não mais de 5 minutos antes do pedido ser recebido;
4. deve validar que um `jwks` (chave definida por valor) **não** foi incluído;
5. deve exigir e validar que o `jwks_uri` corresponda ao `software_jwks_uri` fornecido na declaração do software (SS);
6. deve exigir e validar que o `redirect_uris` corresponde ou contém um subconjunto de `software_redirect_uris` fornecido na declaração do software (SS);
7. deve exigir e validar que todos os mecanismos de autenticação de cliente cumpram os requisitos definidos em [Financial-grade API Security Profile 1.0 - Part 2: Advanced](https://openid.net/specs/openid-financial-api-part-2-1_0.html);
8. deve exigir requisições criptografadas de objetos conforme exigido pelo Perfil de Segurança do Open Banking Brasil;
9. deve validar se os escopos solicitados são adequados para as funções regulatórias autorizadas do software;
10. deve, sempre que possível, validar os metadados declarados pelo cliente em relação aos metadados fornecidos no `software_statement`;
11. deve aceitar todos os nomes x.500 AttributeType no *Distinguished Name* dos certificado conforme definidos no [Padrão de Certificados Open Banking Brasil][OBB-Cert-Standards];
12. se for compatível com o mecanismo de autenticação do cliente `tls_client_auth`, conforme definido em [RFC8705], somente deve aceitar `tls_client_auth_subject_dn` como uma indicação do valor do assunto do certificado, conforme definido na cláusula 2.1.2 [RFC8705];

Estas disposições aplicam-se igualmente ao processamento de pedidos da [RFC7591], [RFC7592] e [OpenID Registration][OIDR].

##### Aplicando Server Defaults  {#aplicando-server-defaults}

Quando as propriedades de uma solicitação DCR não estão incluídas e não são obrigatórias na especificação, o Authorization Server deve aplicar os *defaults* do cliente da seguinte maneira:

1. deve selecionar e aplicar o algoritmo de criptografia e a escolha da cifra a partir dos conjuntos mais recomendados de cifra da IANA que são suportados pelo Authorization Server;
2. deve preencher *defaults* a partir de valores do SSA, sempre que possível;
3. deve conceder ao cliente permissão para o conjunto completo de escopos potenciais com base nas permissões regulatórias de softwares incluídas no `software_statement`;

##### Análise do Distinguished Name do Certificado  {#analise-dn-certificado}

A cláusula 3 do [Lightweight Directory Access Protocol (LDAP): String Representation of Distinguished Names][RFC4514] define os OIDs obrigatórios cujo os nomes do AttributeType (descritores) devem ser reconhecidos pelos implementadores. Esta lista obrigatória não inclui vários dos OIDs definidos em [Padrão de Certificados do Open Banking Brasil][OBB-Cert-Standards], nem existe um mecanismo definido para os Authorization Servers publicarem informações sobre o formato que eles esperam de uma solicitação DCR que inclui um `tls_client_auth_subject_dn`.

Para resolver essa ambiguidade, o Authorization Server deve aceitar todas os nomes de AttributeType (descritores) definidas no último parágrafo da cláusula 3 [RFC4515], além de todos os AttributeTypes definidos no *Distinguished Name* do [Padrão de Certificados do Open Banking Brasil][OBB-Cert-Standards].

#### Funções Pegulatórias para Mapeamentos OpenID e OAuth 2.0  {#funcoes-regulatorias-mapeamentos-openid-oauth20}

Para participar do ecossistema do Open Banking, as instituições credenciadas devem se cadastrar no Diretório de Participantes de acordo com seus papéis regulatórios. Essas funções refletem a autorização do Banco Central para as instituições e, consequentemente, as APIs que podem utilizar.

A tabela a seguir descreve as funções regulatórias do Open Banking Brasil e o mapeamento de escopos do OAuth 2.0 relacionado. Se os escopos forem omitidos durante o processo de DCR, o Authorization Server deve conceder o conjunto completo de escopos potenciais com base nas funções regulatórias registradas para o banco, conforme descrito na seção [Server Defaults](#aplicando-server-defaults).

| Papel Regulador | Descrição | Escopos Permitidos | Fase-alvo |
| --- | --- | --- | --- |
| DADOS | Instituição transmissora / receptora de dados (AISP) | openid accounts credit-cards-accounts consents customers invoice-financings financings loans unarranged-accounts-overdraft | Phase 2 |
| PAGTO | Instituição prestadora de serviço de iniciação de pagamentos (PISP) | openid payments consents | Phase 3 |
| CONTA | Instituição detentora de conta (ASPSP) | openid | Phase 3 |
| CCORR | Correspondente de crédito | openid | Phase 3* |

##### Nota dos Implementadores  {#nota-implementadores}

Em linha com a orientação do IETF e com o conceito diretivo do gerenciamento de consentimento com menor granularidade, a obrigação recai sobre o Authorization Server para garantir que haja escopo suficiente transmitido em um *access token* necessário para cumprir as permissões transmitidas na solicitação de consentimento. Este princípio e requisito são refletidos API de gerenciamento de consentimentos.

#### Funções Regulatórias para Mapeamentos de Escopo OAuth 2.0 Dinâmicos  {#funcoes-regulatorias-mapeamento-escopo-oauth-dinamicos}

| Papel Regulador | Escopos Permitidos |
| --- | --- |
| DADOS | consent:{ConsentId} |
| PAGTO | consent:{ConsentId} |

### Software Statement {#software-statement}

Um software statement é um JSON Web Token (JWT) [RFC7519] que afirma valores de metadados sobre o software cliente como um todo.

#### Software Statement Claims {#software-statement-claims}

O exemplo a seguir contém todas as *claims* atualmente incluídas em um software statement.

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
  "org_number": "112233445566",
  "software_environment": "production",
  "software_version": "1.1",
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
      "authority_name": "Banco Central",
      "authorisation_role": "CONTA",
      "authority_code": "BCB",
      "status": "Active"
    },
    {
      "authorisation_domain": "Open Banking",
      "authorisations": [],
      "registration_id": "13353236-OBB-DADOS",
      "authority_id": "687a1c94-b360-4e04-9589-0fa5cb16451b",
      "authority_name": "Banco Central",
      "authorisation_role": "DADOS",
      "authority_code": "BCB",
      "status": "Active"
    },
    {
      "authorisation_domain": "Open Banking",
      "authorisations": [],
      "registration_id": "13353236-OBB-PAGTO",
      "authority_id": "687a1c94-b360-4e04-9589-0fa5cb16451b",
      "authority_name": "Banco Central",
      "authorisation_role": "PAGTO",
      "authority_code": "BCB",
      "status": "Active"
    }
  ]
}
```

### Processamento de uma Solicitação DCR  {#processamento-solicitacao-dcr}

!---
![Dynamic Client Registration](images/dcr.svg)
!---

#### Enviando uma Solicitação com um Software Statement  {#enviando-solicitacao-ss}

Este exemplo inclui vários campos opcionais, alguns dos quais podem não ser aplicáveis à algumas implementações. A quebra de linha dentro dos valores é apenas para fins de exibição.

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

#### Open Banking Brasil SSA Key Store e Detalhes do Emissor  {#obb-ssa-key-store-detalhes-emissor}

**Produção**

[https://keystore.directory.openbankingbrasil.org.br/openbanking.jwks](https://keystore.directory.openbankingbrasil.org.br/openbanking.jwks)

Emissor do Open Banking Open Banking Brasil SSA de produção.

**Sandbox**

[https://keystore.sandbox.directory.openbankingbrasil.org.br/openbanking.jwks](https://keystore.sandbox.directory.openbankingbrasil.org.br/openbanking.jwks)

Emissor do Open Banking Open Banking Brasil SSA de sandbox.

### Apêndice

#### A.1 Exemplo de Software Statement Assertion  {#exemplo-ssa}

```
eyJraWQiOiJzaWduZXIiLCJ0eXAiOiJKV1QiLCJhbGciOiJQUzI1NiJ9.eyJzb2Z0d2FyZV9tb2RlIjoiTGl2ZSIsInNvZnR3YXJlX3JlZGlyZWN0X3VyaXMiOlsiaHR0cHM6XC9cL3d3dy5yYWlkaWFtLmNvbVwvYWNjb3VudGluZ1wvY2IiXSwic29mdHdhcmVfc3RhdGVtZW50X3JvbGVzIjpbeyJyb2xlIjoiREFET1MiLCJhdXRob3Jpc2F0aW9uX2RvbWFpbiI6Ik9wZW4gQmFua2luZyIsInN0YXR1cyI6IkFjdGl2ZSJ9LHsicm9sZSI6IlBBR1RPIiwiYXV0aG9yaXNhdGlvbl9kb21haW4iOiJPcGVuIEJhbmtpbmciLCJzdGF0dXMiOiJBY3RpdmUifV0sInNvZnR3YXJlX2NsaWVudF9uYW1lIjoiUmFpZGlhbSBBY2NvdW50aW5nIiwib3JnX3N0YXR1cyI6IkFjdGl2ZSIsInNvZnR3YXJlX2NsaWVudF9pZCI6IkNraTFFYnZqd3loUEIxMk5HTGx6MiIsImlzcyI6Ik9wZW4gQmFua2luZyBPcGVuIEJhbmtpbmcgQnJhc2lsIHByb2QgU1NBIGlzc3VlciIsInNvZnR3YXJlX3Rvc191cmkiOiJodHRwczpcL1wvd3d3LnJhaWRpYW0uY29tXC9hY2NvdW50aW5nXC90b3MuaHRtbCIsInNvZnR3YXJlX2NsaWVudF9kZXNjcmlwdGlvbiI6IlJhaWRpYW0gQWNjb3VudGluZyBsZXZlcmFnZSBjdXR0aW5nIGVkZ2Ugb3BlbiBiYW5raW5nIGFjY2VzcyB0byBicmluZyB5b3UgcmVhbCB0aW1lIHVwIHRvIGRhdGUgdmlld3Mgb2YgeW91ciBmaW5hbmNlcyIsInNvZnR3YXJlX2p3a3NfZW5kcG9pbnQiOiJodHRwczpcL1wva2V5c3RvcmUuZGlyZWN0b3J5Lm9wZW5iYW5raW5nYnJhc2lsLm9yZy5iclwvYjk2MWM0ZWItNTA5ZC00ZWRmLWFmZWItMzU2NDJiMzgxODVkXC8yNTU1NmQ1YS1iOWRkLTRlMjctYWExYS1jY2U3MzJmZTc0ZGVcL2FwcGxpY2F0aW9uLmp3a3MiLCJzb2Z0d2FyZV9wb2xpY3lfdXJpIjoiaHR0cHM6XC9cL3d3dy5yYWlkaWFtLmNvbVwvYWNjb3VudGluZ1wvcG9saWN5Lmh0bWwiLCJzb2Z0d2FyZV9pZCI6IjI1NTU2ZDVhLWI5ZGQtNGUyNy1hYTFhLWNjZTczMmZlNzRkZSIsInNvZnR3YXJlX2NsaWVudF91cmkiOiJodHRwczpcL1wvd3d3LnJhaWRpYW0uY29tXC9hY2NvdW50aW5nLmh0bWwiLCJzb2Z0d2FyZV9qd2tzX2luYWN0aXZlX2VuZHBvaW50IjoiaHR0cHM6XC9cL2tleXN0b3JlLmRpcmVjdG9yeS5vcGVuYmFua2luZ2JyYXNpbC5vcmcuYnJcL2I5NjFjNGViLTUwOWQtNGVkZi1hZmViLTM1NjQyYjM4MTg1ZFwvMjU1NTZkNWEtYjlkZC00ZTI3LWFhMWEtY2NlNzMyZmU3NGRlXC9pbmFjdGl2ZVwvYXBwbGljYXRpb24uandrcyIsInNvZnR3YXJlX2p3a3NfdHJhbnNwb3J0X2luYWN0aXZlX2VuZHBvaW50IjoiaHR0cHM6XC9cL2tleXN0b3JlLmRpcmVjdG9yeS5vcGVuYmFua2luZ2JyYXNpbC5vcmcuYnJcL2I5NjFjNGViLTUwOWQtNGVkZi1hZmViLTM1NjQyYjM4MTg1ZFwvMjU1NTZkNWEtYjlkZC00ZTI3LWFhMWEtY2NlNzMyZmU3NGRlXC9pbmFjdGl2ZVwvdHJhbnNwb3J0Lmp3a3MiLCJzb2Z0d2FyZV9qd2tzX3RyYW5zcG9ydF9lbmRwb2ludCI6Imh0dHBzOlwvXC9rZXlzdG9yZS5kaXJlY3Rvcnkub3BlbmJhbmtpbmdicmFzaWwub3JnLmJyXC9iOTYxYzRlYi01MDlkLTRlZGYtYWZlYi0zNTY0MmIzODE4NWRcLzI1NTU2ZDVhLWI5ZGQtNGUyNy1hYTFhLWNjZTczMmZlNzRkZVwvdHJhbnNwb3J0Lmp3a3MiLCJzb2Z0d2FyZV9sb2dvX3VyaSI6Imh0dHBzOlwvXC93d3cucmFpZGlhbS5jb21cL2FjY291bnRpbmdcL2xvZ28ucG5nIiwib3JnX2lkIjoiYjk2MWM0ZWItNTA5ZC00ZWRmLWFmZWItMzU2NDJiMzgxODVkIiwic29mdHdhcmVfZW52aXJvbm1lbnQiOiJwcm9kdWN0aW9uIiwic29mdHdhcmVfdmVyc2lvbiI6MS4xMCwic29mdHdhcmVfcm9sZXMiOlsiREFET1MiLCJQQUdUTyJdLCJvcmdfbmFtZSI6Ik9wZW4gQmFua2luZyBCcmFzaWwiLCJpYXQiOjE2MTgzMzYyNjIsIm9yZ2FuaXNhdGlvbl9jb21wZXRlbnRfYXV0aG9yaXR5X2NsYWltcyI6W3siYXV0aG9yaXNhdGlvbl9kb21haW4iOiJPcGVuIEJhbmtpbmciLCJhdXRob3Jpc2F0aW9ucyI6W10sInJlZ2lzdHJhdGlvbl9pZCI6IjEzMzUzMjM2LU9CQi1DT05UQSIsImF1dGhvcml0eV9pZCI6IjY4N2ExYzk0LWIzNjAtNGUwNC05NTg5LTBmYTVjYjE2NDUxYiIsImF1dGhvcmlzYXRpb25fcm9sZSI6IkNPTlRBIiwiYXV0aG9yaXR5X2NvZGUiOiJCQ0IiLCJzdGF0dXMiOiJBY3RpdmUifSx7ImF1dGhvcmlzYXRpb25fZG9tYWluIjoiT3BlbiBCYW5raW5nIiwiYXV0aG9yaXNhdGlvbnMiOltdLCJyZWdpc3RyYXRpb25faWQiOiIxMzM1MzIzNi1PQkItREFET1MiLCJhdXRob3JpdHlfaWQiOiI2ODdhMWM5NC1iMzYwLTRlMDQtOTU4OS0wZmE1Y2IxNjQ1MWIiLCJhdXRob3Jpc2F0aW9uX3JvbGUiOiJEQURPUyIsImF1dGhvcml0eV9jb2RlIjoiQkNCIiwic3RhdHVzIjoiQWN0aXZlIn0seyJhdXRob3Jpc2F0aW9uX2RvbWFpbiI6Ik9wZW4gQmFua2luZyIsImF1dGhvcmlzYXRpb25zIjpbXSwicmVnaXN0cmF0aW9uX2lkIjoiMTMzNTMyMzYtT0JCLVBBR1RPIiwiYXV0aG9yaXR5X2lkIjoiNjg3YTFjOTQtYjM2MC00ZTA0LTk1ODktMGZhNWNiMTY0NTFiIiwiYXV0aG9yaXNhdGlvbl9yb2xlIjoiUEFHVE8iLCJhdXRob3JpdHlfY29kZSI6IkJDQiIsInN0YXR1cyI6IkFjdGl2ZSJ9XX0.W6hUAYhjT6I61rxEIVMKYKre93LTbRdzKnk9dJvUdzVgAz5B9KxZNutf27oO3k0hrjYVWBdWq23o_e4Y_AaKdpS9-rtU84JiHtmqV0wcFYIM8nqcUVWqQ-Ux6Nq9L2G-s2YNd3PcJ1e3yGg9h8553Gr7iJusKEgApzXUpkM2rBELQuumktUE_JBiuIkXmWxoRnO1cW-Osbk3MT3bxG43SPcxii07Q5S8qXI6PjCPA3fYlnaUAygwZM3O0oa7jqmSr7d9UsHuDMJfYhIKdq2wyQQKORCN-D2UopmMX-lHMvAVkkrAO08T0-7odjr4PJk-PrwuoCxeAfa7440ZDOrlmQ
```

## Guia do Usuário para Entidades Transmissoras de Dados {#guia-usuario-entidades-transmissoras-dados}

### Registrando um Banco  {#registrando-banco}

#### Visão Geral do Diretório  {#visado-geral-diretorio}

Os serviços do framework de confiança providos pelo Open Banking Brasil fornecem todos os serviços de descoberta necessários para que instituições transmissores e receptoras interajam entre si, sem que seja preciso validar individualmente a autenticidade de cada participante.

Um Authorization Server, conforme definido por [RFC 6749 - The OAuth 2.0 Authorization Framework](https://tools.ietf.org/html/rfc6749), executa várias funções em um ecossistema de compartilhamento de dados como o Open Banking Brasil. Antes de prosseguir, certifique-se de que os conceitos de funções e responsabilidades definidos na RFC original sejam bem compreendidos. Além disso, certifique-se de que os conceitos, funções e responsabilidades definidos no [OpenID Connect Core][OIDC] e como eles estendem os conceitos definidos no RFC 6749 são igualmente bem compreendidos.

#### Registrando um Authorization Server e OpenID Provider {#registrando-as-openid-provider}

Os bancos, geralmente grandes bancos, não serão uma entidade única do ponto de vista das operações de tecnologia. Eles podem ter marcas, segurança e infraestrutura de TI diferentes para diferentes segmentos de clientes, ou podem ter alguma infraestrutura de TI que ofereça suporte a várias marcas ou segmentos de clientes. Isso significa que o ecossistema técnico precisa ser flexível o suficiente para suportar uma ampla variedade de implantações de infraestrutura de bancos, garantindo que os serviços necessários possam ser descobertos por clientes de instituições receptoras que precisam interagir com ele.

Um modelo flexível para anunciar serviços de autenticação/autorização e recursos protegidos pelo AuthN e AuthZ é suportado pelo Diretório.

* **Customer Friendly Name** - Será exibido aos clientes pelas instituições receptoras, e já deve ser reconhecido pelos clientes do banco;
* **Customer Friendly Logo** - Será exibido aos clientes pelas instituições receptoras para auxiliar no reconhecimento da marca;
* **Description** - Isso pode ser exibido aos clientes pelas instituições receptoras para auxiliar no reconhecimento da marca;
* **Terms of Service** - Este é um link para os Termos de Serviço do banco, que podem ser incluídos pelas instituições receptoras;
* **Notification WebHook** - Authorization Servers podem registrar um WebHook que receberá atualizações por push sobre as alterações dos participantes, seus softwares ou certificados;
* **OpenID Well Known Document Uri** - Link para o documento de descoberta do Authorization Server.

Um banco pode optar por ter um Authorization Servers ou muitos, desde que satisfaça os seguintes requisitos:

* Um cliente pode reconhecer o Authorization Server como um local com o qual normalmente faria interação com o seu banco;
* O Authorization Server pode emitir tokens para os recursos e serviços que um cliente ou insituição receptora está procurando.

#### Registrando Recursos  {#registrando-recursos}

Depois que um banco registra um Authorization Server, ele precisa anunciar para quais recursos, APIs ou serviços ele pode fornecer autorização.

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

No exemplo acima, o Amazing Banking está anunciando dois serviços que devem ser reconhecidos pelos clientes. "Amazing Business Banking" e "Amazing Banking". Estes **podem ou não estar** diretamente relacionados à "marcas", pois bancos diferentes podem precisar anunciar serviços de autenticação diferentes, mesmo dentro de uma submarca.

Além disso, o banco anuncia quais recursos cada um dos servidores de autorização está protegendo ou oferecendo. No exemplo acima, o "Amazing Banking" é compatível com a versão 1 e a versão 2 da API de informações da conta, e o "Amazing Banking" tem dois sistemas separados de autenticação e autorização para pagamentos e informações da conta.

Anunciar corretamente quais recursos são oferecidos por cada servidor é importante para atingir a escala prevista pelo Open Banking Brasil, além de ser fundamental para garantir que os clientes possam identificar seu serviço bancário facilmente e que as instituições receptoras possam encaminhar os clientes para o Authorization Server correto com base nos recursos protegidos por cada serviço.

### Validando uma Solicitação de Registro de Cliente  {#validando-solitacao-registro-cliente}

Usando o OpenID Connect Discovery e a especificação do DCR do Open Banking Brasil, uma instituição receptora pode registrar seu aplicativo em cada um dos Authorization Servers disponíveis no ecossistema.

#### Registrando OpenID Connect e OAuth 2.0 Dynamic Client Registration  {#registrando-openid-connetc-oath-dcr}

Consulte o item [Processamento de uma Solicitação DCR](#processamento-solicitacao-dcr) da especificação de Dynamic Client Registration do Open Banking Brasil para obter detalhes.

#### Processamento de Software Statement Assertion) {#processamento-ssa}

Consulte o item [Software Statement](#software-statement) da especificação de Dynamic Client Registration do Open Banking Brasil para obter detalhes.

### Validando um Pedido de Autorização  {#validando-pedido-autorizacao}

Consulte o item [Perfil de Segurança Open Banking Brasil Financial-grade API 1.0](#perfil-seguranca-obb-fapi) para obter detalhes.

## Guia do Usuário para Instituições Receptores de Dados e Iniciadores de Pagamento (TTP/PISP)

### 1.0 Registrando um Aplicativo  {#RegistrantoApp}

Em um alto nível, as seguintes etapas principais são necessárias para integrar um novo aplicativo no ecossistema Open Banking Brasil.

1. Cadastre sua organização no Diretório de Participantes (Interface do Usuário)
2. Cadastre seu aplicativo no Diretório de Participantes (Interface do Usuário)
3. Obtenha credenciais para sua aplicação junto à uma autoridade certificadora ICP-Brasi)(fora do escopo deste documento)
4. Registre suas credenciais para o seu aplicativo no Diretório de Participantes (Interface do Usuário)
5. Identifique provedores de informações de conta ou serviços de pagamento de interesse dos clientes de seu aplicativo, pesquisando o Diretório de Participantes (API)
6. Registre seu aplicativo com cada provedor (API)

#### 1.1 Diagrama de Sequência  {#DiagramaSeq}

![enter image description here](https://www.websequencediagrams.com/files/render?link=XqaI0EvQK7BEN8bkFdykE7gq0frHqu744LprGQVxytViXWvVvCjey3siD0lbnTuZ)

#### 1.1 Visão Geral do Diretório {#VisaoDir}

O framework de confiança do Open Banking Brasil fornece todos os serviços de descoberta necessários para que instituições participantes (receptoras e transmissoras de dados, iniciadoras de pagamento ou detentoras de contas) interajam entre si sem serem obrigadas a validarem a autenticidade de identidades, autorizações, Apps, APIs ou credenciais para acessos por aplicativos uns dos outros. Além disso, fornece um único registro de todas propostas ao consumidor sendo oferecidas no mercado e um único ambiente de controle para as autoridades regulatórias que concedem permissões para gerenciar participantes dentro do ecossistema.

O framework de confiança não tem visibilidade ou visão das interações que ocorrem entre instituições participantes receptoras (TTP) ou transmissoras (ASPSP) de dados. Ele é projetado para fornecer confiança e garantia de identidade e autorização apenas. Ele não se enquadra no fluxo de comunicação entre um consumidor e um provedor e não tem conhecimento ou visibilidade de quaisquer dados do cliente. Este modelo de framework de confiança é conhecido como confiança transitiva onde duas partes, um TPP e um ASPSP, concordam em confiar nas declarações e atestados de legitimidade uns dos outros emitidos por um provedor de confiança comum e, em seguida, prossigam comunicando o que quiserem, sem qualquer validação adicional onerosa ou outro tipo de verificação.

#### 1.2 Acessando o Diretório  {#AcessandoDir}

Este guia do usuário assume que as organizações participantes já passaram pelo processo de iniciação com a Estrutura Inicial do Open Banking Brasil e já concluíram todas as integrações necessárias, processos de assinatura de contrato e inclusão de administrador individual.

![Login Image](images/directory_logon.png)

#### 1.3 Criação de uma Nova Declaração de Software (SSA) {#CriacaoSSA}

Uma declaração de software descreve um aplicativo inserido naquilo que pode ser considerado a 'App Store' do Open Banking Brasil. Este registro de aplicativo contém todas as informações necessárias para que um banco identifique tecnicamente e interaja com o aplicativo, além de conter todas as informações que auxiliam os clientes que estejam utilizando-o a confirmar sua legitimidade.

Um novo aplicativo ou declaração de software pode ser registrado fazendo logon no Diretório, navegando até 'Software Statements', clicando em 'Criar Novo' e preenchendo o formulário. O texto de ajuda é fornecido para cada campo da tela. Lembre-se de que a maioria dessas informações será exibida aos clientes pelos Bancos como parte do processo de redirecionamento ou autorização. Como tal, é importante que todas as URIs e descrições sejam relevantes para o público.

![New Software Statement Image](images/ssa_form.png)

##### 1.3.1 Atribuição de Funções Regulatórias de Software  {#AtribuicaoSoft}

Em um ecossistema de compartilhamento de dados complexo e diversificado, as funções regulatórias de uma organização podem mudar. Eles podem ser adicionados e revogados. Isso significa que o software adicionado ao Diretório pode receber permissão de ter zero (0) ou mais funções regulatórias. Um administrador pode atribuir a um determinado software todo e qualquer permissões que a organização proprietária do software pode ter.

> Se uma organização perder uma função regulatória, todo software com essa função regulatória será revogado do ecossistema, portanto, é muito importante que um aplicativo receba apenas as funções de que realmente precisa para funcionar.

Um exemplo do mundo real disso poderia ser a Amazon. Ela possui dois aplicativos, 'Amazon Accounting' e 'Amazon Prime'. A Amazon como organização é um DADOS e PISP autorizados e tem permissão para lidar com dados de clientes bem como fazer pagamentos via Open Banking. A 'Amazon Accounting' dever receber a função de domínio de DADOS e a 'Amazon Prime' deve receber uma função de domínio de PISP.

No futuro, se a Amazon perder a permissão regulatória para ser um iniciador de pagamento, apenas a aplicação 'Amazon Prime' seria removida do ecossistema. O App 'Amazon Accounting' do exemplo continuaria a funcionar sem problemas.


#### 1.4 Criação e Upload de Certificados  {#CriacaoCerts}

##### 1.4.1 Sandbox  {#Sandbox}

O serviço de Diretório do Open Banking inclui uma infraestrutura de chave pública que pode ser usada para criar certificados para os aplicativos sendo registrados no ambiente Sandbox. Basta selecionar certificados no menu e seguir as instruções.

O Diretório suporta vários certificados, tipos de chave e um comando e configuração openssl será disponibilizado como um exemplo. Depois de criar a solicitação de assinatura de certificado (Certificate Signing Request - CSR) para um certificado de "Transporte" e "Assinatura", você pode enviá-los ao diretório para serem validados e transformados em certificados.

> Lembre-se de seguir as práticas de gerenciamento de chaves de sua organização para a geração de certificados. Essas credenciais e chaves precisam ser manuseadas com cuidado. Um evento significativo de comprometimento de chave pode levar ao comprometimento dos dados do cliente.

##### 1.4.2 Produção  {#Producao}

Os certificados para acesso e assinatura em ambiente de produção devem ser fornecidos pelo ICP Brasil. Os detalhes sobre os certificados e os requisitos para os certificados estão detalhados no [Padrão de Certificados Open Banking Brasil](https://github.com/OpenBanking-Brasil/specs-seguranca/blob/main/open-banking-brasil-certificate-standards-1_ID1.md).

##### 1.4.3 O que é um JWT, JWE, JWS e JWK  {#JWT_JWE_JWS_JWK)

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

O JWK público do JWKS retirado da uri fornecida anteriormente

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

Para conhecer um pouco mais e exercitar, visite o site [JWT-IO](https://jwt.io/).

### 2.0 Interagindo com as APIs de Serviços de Confiança  {#InteragindAPIs}

Quando um aplicativo é registrado no Diretório, o serviço central usa os metadados e certificados fornecidos para criar para o software um cliente OAuth 2.0 que tem um `grant type` do tipo `client credentials`, conforme definido em [RFC6749](https://tools.ietf.org/html/rfc6749) e com um mecanismo de autenticação de cliente definido como `tls_client_auth`, conforme definido em [RFC 8705](https://tools.ietf.org/html/rfc8705).

Usando o ClientID listado na declaração do software (software statement) no Diretório, [OpenID Connect Discovery](https://openid.net/specs/openid-connect-discovery-1_0.html) e a configuração do OpenID Provider Issuer abaixo, um participante tem todos das informações necessárias para descobrir, autenticar e interagir com as APIs do Diretório.

#### 2.1 Emissores do Framework de Confiança do Diretório  {#Emissores}

Produção: [https://auth.directory.openbankingbrasil.org.br/](https://auth.directory.openbankingbrasil.org.br/)

Sandbox: [https://auth.sandbox.directory.openbankingbrasil.org.br/](https://auth.sandbox.directory.openbankingbrasil.org.br/)

Os certificados para acesso às APIs publicadas pelas instituições participantes devem ser obrigatoriamente certificados emitidos no âmbito da ICP-Brasil.

#### 2.2 Como se Comunicar com o Authorization Server do Diretório {#ASDir}

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

#### 2.3 Como se Comunicar com as APIs do Diretório {#ComunicarAPIs}

As APIs do Diretório são recursos RESTful protegidos usando o Perfil de Segurança do Open Banking Brasil. Isso significa que eles têm a mesma postura de segurança das APIs publicadas pelos Bancos. Todas as APIs de Diretório requerem o escopo do recurso OAuth 2.0 de `directory:software` e são protegidos usando mTLS.

Consulte a especificação do Diretório OpenAPI v3 para o conjunto completo de endpoints disponíveis.

#### 2.4 Descobrindo Authorization Servers de Bancos {#BancosServes}

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

### 3.0 Registrando o Aplicativo com um Provedor  {#RegAppProv}

![enter image description here](https://www.websequencediagrams.com/files/render?link=1Xqm7oHVrWJ0Ya34s9kdzG1kHpwLobAftNdQHHvf44ikYZadVrou8iFhiFC9pSMP)

A partir do exemplo dado acima, podemos ver que a localização do "OpenIDDiscoveryDocument" é anunciada por cada um dos Authorization Server.

#### 3.1 Criação de uma Declaração de Software (SSA)  {#CriacaoSSA}

Uma afirmação de declaração de software (software statement assertion - SSA) é um JWT assinado pelo Diretório que contém todas as informações sobre um aplicativo que existe em um determinado momento no Diretório. Inclui a localização de todas as chaves públicas vinculadas à esta declaração de software e todos os outros metadados de que um banco precisa para validar a legitimidade do aplicativo.

Um SSA não tem período de validade, é simplesmente um registro pontual do que existia como atributos válidos no momento em que foi criado. Os bancos devem aceitar um SSA com menos de alguns minutos, mas a janela exata pode ser diferente entre os provedores.

* Obtenha um token de acesso e, em seguida, carregue a declaração do software para um aplicativo no Diretório.

```
curl --cert transport.pem --key transport.key https://matls-auth.directory.openbankingbrasil.org.br/token -X POST -d 'client_id=_jjLAgCC8qucQOyo9wIcX&grant_type=client_credentials&scope=directory:software' -k

{"access_token":"-mqFZH5DwjzlPjHU3bBkP2Lmp97mwGbKZ2yjYb-tVaE","expires_in":600,"token_type":"Bearer","scope":"directory:software"}

curl --cert transport.pem --key transport.key https://matls-api.directory.openbankingbrasil.org.br/organisations/b961c4eb-509d-4edf-afeb-35642b38185d/softwarestatements/6483a2d3-2b0d-4fc8-a756-e7be79013fa0/assertion -H 'Authorization: Bearer -mqFZH5DwjzlPjHU3bBkP2Lmp97mwGbKZ2yjYb-tVaE'

eyJraWQiOiJzaWduZXIiLCJ0eXAiOiJKV1QiLCJhbGciOiJQUzI1NiJ9.eyJzb2Z0d2FyZV9tb2RlIjoiTGl2ZSIsInNvZnR3YXJlX3JlZGlyZWN0X3VyaXMiOlsiaHR0cHM6XC9cL3d3dy5yYWlkaWFtLmNvbVwvYWJnXC9jYjEiLCJodHRwczpcL1wvd3d3LnJhaWRpYW0uY29tXC9hYmdcL2NiMiJdLCJzb2Z0d2FyZV9zdGF0ZW1lbnRfcm9sZXMiOlt7InJvbGUiOiJEQURPUyIsImF1dGhvcmlzYXRpb25fZG9tYWluIjoiT3BlbiBCYW5raW5nIiwic3RhdHVzIjoiQWN0aXZlIn1dLCJzb2Z0d2FyZV9jbGllbnRfbmFtZSI6IkFjY291bnRzIEJlIEdvbmUiLCJvcmdfc3RhdHVzIjoiQWN0aXZlIiwic29mdHdhcmVfY2xpZW50X2lkIjoiX2pqTEFnQ0M4cXVjUU95bzl3SWNYIiwiaXNzIjoiT3BlbiBCYW5raW5nIE9wZW4gQmFua2luZyBCcmFzaWwgcHJvZCBTU0EgaXNzdWVyIiwic29mdHdhcmVfdG9zX3VyaSI6Imh0dHBzOlwvXC93d3cucmFpZGlhbS5jb21cL2FiZ1wvdG9zLmh0bWwiLCJzb2Z0d2FyZV9jbGllbnRfZGVzY3JpcHRpb24iOiJBY2NvdW50cyBiZSBnb25lIHdpbGwgdXNlIHlvdXIgb3BlbiBiYW5raW5nIGRhdGEgdG8gYXV0b21hdGUgeW91ciBhY2NvdW50YW5jeSBhbmQgYm9vayBrZWVwaW5nIG1hc3NpdmUgc2F2aW5nIHlvdSB0aW1lLiIsInNvZnR3YXJlX2p3a3NfZW5kcG9pbnQiOiJodHRwczpcL1wva2V5c3RvcmUuZGlyZWN0b3J5Lm9wZW5iYW5raW5nYnJhc2lsLm9yZy5iclwvYjk2MWM0ZWItNTA5ZC00ZWRmLWFmZWItMzU2NDJiMzgxODVkXC82NDgzYTJkMy0yYjBkLTRmYzgtYTc1Ni1lN2JlNzkwMTNmYTBcL2FwcGxpY2F0aW9uLmp3a3MiLCJzb2Z0d2FyZV9wb2xpY3lfdXJpIjoiaHR0cHM6XC9cL3d3dy5yYWlkaWFtLmNvbVwvYWJnXC9wb2xpY3kuaHRtbCIsInNvZnR3YXJlX2lkIjoiNjQ4M2EyZDMtMmIwZC00ZmM4LWE3NTYtZTdiZTc5MDEzZmEwIiwic29mdHdhcmVfY2xpZW50X3VyaSI6Imh0dHBzOlwvXC93d3cucmFpZGlhbS5jb21cL2FiZy5odG1sIiwic29mdHdhcmVfandrc19pbmFjdGl2ZV9lbmRwb2ludCI6Imh0dHBzOlwvXC9rZXlzdG9yZS5kaXJlY3Rvcnkub3BlbmJhbmtpbmdicmFzaWwub3JnLmJyXC9iOTYxYzRlYi01MDlkLTRlZGYtYWZlYi0zNTY0MmIzODE4NWRcLzY0ODNhMmQzLTJiMGQtNGZjOC1hNzU2LWU3YmU3OTAxM2ZhMFwvaW5hY3RpdmVcL2FwcGxpY2F0aW9uLmp3a3MiLCJzb2Z0d2FyZV9qd2tzX3RyYW5zcG9ydF9pbmFjdGl2ZV9lbmRwb2ludCI6Imh0dHBzOlwvXC9rZXlzdG9yZS5kaXJlY3Rvcnkub3BlbmJhbmtpbmdicmFzaWwub3JnLmJyXC9iOTYxYzRlYi01MDlkLTRlZGYtYWZlYi0zNTY0MmIzODE4NWRcLzY0ODNhMmQzLTJiMGQtNGZjOC1hNzU2LWU3YmU3OTAxM2ZhMFwvaW5hY3RpdmVcL3RyYW5zcG9ydC5qd2tzIiwic29mdHdhcmVfandrc190cmFuc3BvcnRfZW5kcG9pbnQiOiJodHRwczpcL1wva2V5c3RvcmUuZGlyZWN0b3J5Lm9wZW5iYW5raW5nYnJhc2lsLm9yZy5iclwvYjk2MWM0ZWItNTA5ZC00ZWRmLWFmZWItMzU2NDJiMzgxODVkXC82NDgzYTJkMy0yYjBkLTRmYzgtYTc1Ni1lN2JlNzkwMTNmYTBcL3RyYW5zcG9ydC5qd2tzIiwic29mdHdhcmVfbG9nb191cmkiOiJodHRwczpcL1wvd3d3LnJhaWRpYW0uY29tXC9hYmdcL2xvZ28ucG5nIiwib3JnX2lkIjoiYjk2MWM0ZWItNTA5ZC00ZWRmLWFmZWItMzU2NDJiMzgxODVkIiwic29mdHdhcmVfZW52aXJvbm1lbnQiOiJwcm9kdWN0aW9uIiwic29mdHdhcmVfdmVyc2lvbiI6MS4xMCwic29mdHdhcmVfcm9sZXMiOlsiREFET1MiXSwib3JnX25hbWUiOiJPcGVuIEJhbmtpbmcgQnJhc2lsIiwiaWF0IjoxNjE4Njk1OTI4LCJvcmdhbmlzYXRpb25fY29tcGV0ZW50X2F1dGhvcml0eV9jbGFpbXMiOlt7ImF1dGhvcmlzYXRpb25fZG9tYWluIjoiT3BlbiBCYW5raW5nIiwiYXV0aG9yaXNhdGlvbnMiOltdLCJyZWdpc3RyYXRpb25faWQiOiIxMzM1MzIzNi1PQkItQ09OVEEiLCJhdXRob3JpdHlfaWQiOiI2ODdhMWM5NC1iMzYwLTRlMDQtOTU4OS0wZmE1Y2IxNjQ1MWIiLCJhdXRob3Jpc2F0aW9uX3JvbGUiOiJDT05UQSIsImF1dGhvcml0eV9jb2RlIjoiQkNCIiwic3RhdHVzIjoiQWN0aXZlIn0seyJhdXRob3Jpc2F0aW9uX2RvbWFpbiI6Ik9wZW4gQmFua2luZyIsImF1dGhvcmlzYXRpb25zIjpbXSwicmVnaXN0cmF0aW9uX2lkIjoiMTMzNTMyMzYtT0JCLURBRE9TIiwiYXV0aG9yaXR5X2lkIjoiNjg3YTFjOTQtYjM2MC00ZTA0LTk1ODktMGZhNWNiMTY0NTFiIiwiYXV0aG9yaXNhdGlvbl9yb2xlIjoiREFET1MiLCJhdXRob3JpdHlfY29kZSI6IkJDQiIsInN0YXR1cyI6IkFjdGl2ZSJ9LHsiYXV0aG9yaXNhdGlvbl9kb21haW4iOiJPcGVuIEJhbmtpbmciLCJhdXRob3Jpc2F0aW9ucyI6W10sInJlZ2lzdHJhdGlvbl9pZCI6IjEzMzUzMjM2LU9CQi1QQUdUTyIsImF1dGhvcml0eV9pZCI6IjY4N2ExYzk0LWIzNjAtNGUwNC05NTg5LTBmYTVjYjE2NDUxYiIsImF1dGhvcmlzYXRpb25fcm9sZSI6IlBBR1RPIiwiYXV0aG9yaXR5X2NvZGUiOiJCQ0IiLCJzdGF0dXMiOiJBY3RpdmUifV19.axxRvn5aPqBLZtJSZvMXdotcmHyS_iu8jv40VdG2HTplF9qpZ4mDoIviquVceU2eH3eoMINXNcr0BLfBACdp2bLjD_FeCCYlOlgp1w7dCXxAYiFndiMniwkdyI9xxvVx9jJjETpP8owfV6QI_cprPxOCK7fF90s9frq_rby8ixL7K2DHM-UQ_bA320W84WRjwJrmexJlPrlBxEa823_kyaPIUU-tk7yKvve0hU_pSgI6U1g5CJpFr1zJVRJhPZ6E1ekRzkaRq2nnF2FoI96bTNwFLYitKojiqWsHwPMdnUWPAuLS6EY3toYCqISOS8Tzi_u3tp3TMsJhS_lOrkRtpA
```

#### 3.2 Enviando uma Solicitação de Dynamic Client Registration (RFC7591)  {#RFC7591}

Consulte o [Dynamic Client Registration do Open Banking Brasil](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-dynamic-client-registration-1_ID1-ptbr.html)

#### 3.3 Salvando o Token de Dynamic Registration Management (RFC7592)  {#RFC7592}

Consulte o [Dynamic Client Registration do Open Banking Brasil](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-dynamic-client-registration-1_ID1-ptbr.html)

#### 3.4 Modificando um cliente usando Dynamic Client Management Token (RFC7592) {#RFC7592Token}

Consulte o [Dynamic Client Registration do Open Banking Brasil](https://openbanking-brasil.github.io/specs-seguranca/open-banking-brasil-dynamic-client-registration-1_ID1-ptbr.html)

### 4.0 Obtendo Acesso aos Recursos dos Clientes  {#AcessoClientes}

![enter image description here](https://www.websequencediagrams.com/files/render?link=v8xPrADYGTMbCT8aW6qogJ6tQz8y3XBdJKQN6iSyXypJJ7XKnJdauvr9btnAfpog)

Para todas as opções, incluindo todos os códigos de permissão, consulte o [Consent API](https://openbanking-brasil.github.io/areadesenvolvedor/swagger/swagger_consents_apis.yaml). Os exemplos a seguir são exemplos mínimos, mas funcionais para demonstrar o fluxo de ponta a ponta. Esses exemplos pressupõem que o cliente está se comunicando com um provedor de OpenID, aproveitando o mecanismo de autenticação de endpoint do token 'tls_client_auth'. Exemplos alternativos estão disponíveis no apêndice.

#### 4.1 Pré-requisitos  {#PreReqs}

Esses exemplos **não normativos** presumem que o cliente OAuth descobriu os locais de todos os 'endpoints' necessários para se comunicar com os recursos dos bancos do Diretório, incluindo o recurso de consentimento, os recursos de dados e o documento de descoberta de autorização OpenID do Diretório.

#### 4.2 Criando Consentimento  {#CriandoConsent}


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

#### 4.3 Autorizando Consentimento - Redirecionar  {#CriandoConsent}

#### 4.3.1 Criar OpenID Connect Request Object  {#CriarOIDC}

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

#### 4.3.1.1 Solicitação de Claims Específicas  {#SolicitacaoClaims}

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

#### 4.3.2 Redirecionar o Usuário ao Authorization Server para Autorização  {#RedirecionarAuthz}

De acordo com o OpenID Connect Core.
```
https://auth.amazingbank.com.br/auth?client_id=clientIdFromAmazingBank&scope=openid&request=eyJhbGciOiJQUzI1NiIsInR5cCI6Im9hdXRoLWF1dGh6LXJlcStqd3QiLCJraWQiOiJQV0FpNXJ1UWNIZnpQenEySkZkcFk3bkFVaDZMelRUUXRE...j1CpNMT7NtDerEl32E8plGnsuA
```

#### 4.3.3 Obtenção de Token de Acesso por Meio de Troca de Código de Autorização  {#ObtencaoAuthz}

Conforme [RFC 7636 Proof Key for Code Exchange](https://tools.ietf.org/html/rfc7636)

#### 4.3.4 Verificação do Status do Recurso de Consentimento  {#VerificacaoConsent}

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

#### 4.3.5 Acesso aos Recursos  {#AcessoRecursos}

Com o token de acesso que foi retornado em 4.3.3, o TPP agora tem a capacidade de chamar os recursos dos clientes.

### Apêndice  {#Apendice}

#### A.1 Concessão de Credenciais de private_key_jwt client  {#A1}

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

#### A.2 Exemplo de Corpo de Objeto de Solicitação Decodificado  {#A2}

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

#### A.3 Exemplo de Decodificação do Corpo de uma Solicitação com Valores de Reivindicação Específicos Sendo Solicitados  {#A3}

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

#### A.4 Exemplo de Decodificação do Corpo de Solicitação de Autenticação CIBA  {#A4}

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
## Padrão de Certificados Open Banking Brasil {#padrao-certificados-obb}

O objetivo do Padrão de Certificados é especificar o conjunto de certificados necessários que devem ser utilizados pelas entidades participantes do Open Banking Brasil para garantir interoperabilidade para autenticação, confidencialidade, integridade e não repúdio entre os participantes, bem como para os usuários e consumidores destas entidades. O público desta especificação são  entidades participantes do Open Banking Brasil que necessitam fazer a emissão de certificados para se autenticar junto a outras entidades, bem como oferecer a seus clientes um canal de autenticação seguro.

Este documento especifica os tipos de certificados necessários para:

* Autenticar mutuamente (MTLS - Mutual TLS) as aplicações dos participantes;
* Assinatura de Mensagens (JWS - JSON Web Signature) de aplicações para garantir a autenticidade e não repúdio de mensagens entre os participantes;
* Apresentar um canal seguro e confiável para clientes do Open Banking Brasil;
* Autenticar participantes no Diretório de Participantes do Open Banking Brasil.

### Introdução {#Introducao}

O ecossistema do Open Banking Brasil faz uso de cadeias de certificados e protocolo TLS para garantir a confidencialidade, autenticação e integridade do canal de comunicação utilizado pelas APIs das instituições participantes, bem como dos clientes de cada um dos participantes.

Os certificados utilizados pelo Open Banking Brasil também são necessários para autenticar as aplicações através do oAuth 2.0 mTLS ou private_key_jwt, além de também servirem para realizar a assinatura de payload pelo uso de JWS. Outra atribuição importante dos certificados é autenticar e apresentar um canal seguro para o usuário final no ato de autenticação e uso dos serviços prestados pela entidade participante.

### Certificados ICP-Brasil {#CertificadosICPBrasil}

Os certificados emitidos pelas Autoridades Certificadoras autorizadas pelo ICP-Brasil são utilizados apenas na comunicação entre as entidades participantes do ecossistema do Open Banking Brasil.

Os processos de emissão e revogação dos certificados são de responsabilidade das próprias Autoridades Certificadores, sendo regulamentados por Declarações de Prática de Certificação, e supervisionadas pelo Comitê Gestor da Infraestrutura de Chaves Públicas Brasileira.

As práticas, processos, disponibilização e valores praticados pelas Autoridades Certificadoras não são de responsabilidade do Estrutura Inicial do Open Banking Brasil.

**Algoritmos**

Todos os certificados emitidos junto ao ICP-Brasil devem possuir as seguintes características:

* Tipo A do ICP-Brasil;
* Algoritmo de Chaves: RSA 2048 bits;
* Message Digest: SHA 256 bits.

#### Certificado Servidor {#CertificadoServidor}

O Certificado Servidor deve ser emitido para proteger e autenticar o canal TLS utilizado pelas APIs que serão consumidas pelas aplicações cliente de entidades participantes do Open Banking.

O padrão de certificado utilizado deve seguir as práticas de emissão de certificados existentes de "CERTIFICADO PARA SERVIDOR WEB – ICP-Brasil".

#### Certificado Cliente {#CertificadoCliente}

Os Certificados de Aplicação Cliente (Transporte) são utilizados para autenticar o canal mTLS e para realizar a autenticação da aplicação cliente através de oAuth2.0 mTLS ou private_key_jwt, de acordo com o cadastro da aplicação realizado pelo processo de Dynamic Client Registration junto à entidade transmissora.

Para emissão de Certificado Cliente é necessário que a instituição participante do Open Banking Brasil tenha realizado o cadastro da aplicação no Serviço de Diretório, através do processo de emissão de Software Statement Assertion, e com isso já tenha obtido o valor de Software Statement ID.

##### Atributos Open Banking Brasil {#AtributosOpenBankingBrasil}

* **serialNumber:** Cadastro Nacional de Pessoal Jurídica (CNPJ) da pessoa jurídica titular do certificado e associado ao atributo UID e Software Statement ID, durante validação junto ao Serviço de Diretório do Open Banking Brasil;
* **organizationalUnitName:** Código de Participante associado ao CNPJ listado no Serviço de Diretório do Open Banking Brasil;
* **UID:** Software Statement ID cadastrado no Serviço de Diretório do Open Banking Brasil e pertencente ao CNPJ e Código de Participante.

O Certificado Cliente deve ser emitido através de cadeia V10, e deve obrigatoriamente conter os seguintes atributos:

**Distinguished Name**

* **businessCategory (OID 2.5.4.15):**  Tipo de categoria comercial, devendo conter: "Private Organization" ou "Government Entity" ou "Business Entity" ou "Non-Commercial Entity"
* **jurisdictionCountryName (OID: 1.3.6.1.4.1.311.60.2.1.3):** BR
* **serialNumber (OID 2.5.4.5):** CNPJ
* **countryName (OID 2.5.4.6):** BR
* **organizationName (OID 2.5.4.10):** Razão Social
* **stateOrProvinceName (OID 2.5.4.8):** Unidade da federação do endereço físico do titular do certificado
* **localityName (OID 2.5.4.7):** Cidade do endereço físico do titular
* **organizationalUnitName (OID 2.5.4.11):** Código de Participante associado ao CNPJ listado no Serviço de Diretório do Open Banking Brasil
* **UID (OID 0.9.2342.19200300.100.1.1):** Software Statement ID gerado pelo Diretório do Open Banking Brasil
* **commonName (OID 2.5.4.3):** FQDN ou Wildcard

**Certificate Extensions**

* **keyUsage:** critical,digitalSignature,keyEncipherment
* **extendedKeyUsage:** clientAuth

**Subject Alternative Name**

* **dNSName:** FQDN ou Wildcard

#### Certificado de Assinatura {#CertificadoAssinatura}

Os Certificados de Assinatura são utilizados para realizar assinatura do payload através do uso de JWS (JSON Web Signature).

##### Atributos Open Banking Brasil Presentes no Certificado {#AtributosCertificado}

* **UID:** Código de Participante associado ao CNPJ listado no Serviço de Diretório do Open Banking Brasil;
* **commonName:** Razão Social cadastrado no Serviço de Diretório do Open Banking Brasil e pertencente ao CNPJ e Código de Participante.

O Certificado de Assinatura deve ser emitido através de cadeia V5, e deve obrigatoriamente conter os seguintes atributos:

**Distinguished Name**

* **UID (OID 0.9.2342.19200300.100.1.1):**  Código de Participante associado ao CNPJ listado no Serviço de Diretório do Open Banking Brasil
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
* **otherName (OID 2.16.76.1.3.4 – ICP-Brasil):** Responsável pelo certificado de pessoa jurídica titular do certificado (data de nascimento, CPF, PIS/PASEP/CI, RG);
* **otherName (OID 2.16.76.1.3.7  – ICP-Brasil):** Número do Cadastro Especifico do INSS (CEI) da pessoa jurídica titular do certificado.

#### Certificado para Front-End {#CertificadoFrontEnd}

Os certificados para Front-End são utilizados para disponibilizar serviços, em geral páginas Web, com uso de TLS, que são acessados pelo usuário final. Dado a sua finalidade, e para garantir maior interoperabilidade, os certificados devem ser do tipo EV (Extended Validation) e devem ser gerados através de uma autoridade certificadora válida, seguindo as regras definidas na RFC 5280 e RFC 2818, em conformidade com os princípios e critérios WebTrust.

### Autoridades Certificadoras Participantes {#AutoridadesCertificadorasParticipantes}

As seguintes autoridades certificadoras realizaram o processo de onboard ao Open Banking Brasil e estão habilitadas para realizar a emissão de certificados do Open Banking Brasil.

* N/A

### Apêndice {#Apendice}

#### A.1 Modelo de Configuração de Certificado Cliente - OpenSSL {#ModeloConfiguracaoCertificadoClienteOpenSSL}

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

#### A.2 Modelo de Configuração de Certificado de Assinatura - OpenSSL {#ModeloConfiguracaoCertificadoAssinaturaOpenSSL}

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
otherName.0 = 2.16.76.1.3.2;UTF8:<Nome da pessoa responsável pela entidade>#CNPJ
otherName.1 = 2.16.76.1.3.3;UTF8<CNPJ>
otherName.2 = 2.16.76.1.3.4;UTF8:<CPF/PIS/RF da Pessoa responsável>
otherName.3 = 2.16.76.1.3.7;UTF8:<Número de INSS>
```
## Casos de Erro

A convenção do Open Banking Brasil mapeou alguns erros esperados durante o fluxo do usuário no ecossistema. Existem orientações especificas já tratadas no Manual do Usuário. Aqui, trataremos a visão mais técnica do que pode ser feito em caso de erro.

* Durante o redirecionamento do Consentimento, não se encontrou o browser no dispositivo do usuário: Além da orientação ao usuário, deve-se perceber que o fluxo de Consentimento continua pendente. Como a intenção de consentimento segue válida por 60 minutos, deve-se tentar utilizar o mesmo consentimento para tentar novamente a autorização do usuário.
* Durante o redirecionamento do Consentimento, houve um problema inesperado no servidor do Transmissor (HTTP Code 4xx ou 5xx): Além da orientação ao usuário, deve-se perceber que o fluxo de Consentimento continua pendente. Como a intenção de consentimento segue válida por 60 minutos, deve-se tentar utilizar o mesmo consentimento para tentar novamente a autorização do usuário.
* Durante o redirecionamento do Consentimento, houve um problema inesperado no servidor do Transmissor (Timeout, queda de Internet, etc): Além da orientação do usuário, deve-se perceber que o fluxo de Consentimento continua pendente. Como a intenção de consentimento segue válida por 60 minutos, deve-se tentar utilizar o mesmo consentimento para tentar novamente a autorização do usuário.
* Durante o redirecionamento do Consentimento, houve um problema com o Login do usuário (erro de credenciais): Além da orientação ao usuário, deve-se perceber que o fluxo de Consentimento continua pendente. Como a intenção de consentimento segue válida por 60 minutos, deve-se tentar utilizar o mesmo consentimento para tentar novamente a autorização do usuário.
* Após o consentimento do lado do Receptor, o usuário não confirma o compartilhamento: Além da orientação ao usuário, deve-se perceber que o fluxo de Consentimento continua pendente. Como a intenção de consentimento segue válida por 60 minutos, deve-se tentar utilizar o mesmo consentimento para tentar novamente a autorização do usuário.
* Após o consentimento completo, o app do Receptor não consegue acessar os dados por indisponibilidade: Deve-se tentar novamente. Access Token ainda é válido, portanto deve-se tentar novamente sem maiores prejuízos técnicos.
* Após o consentimento completo, o app do Receptor não consegue acessar os dados por pendência de autorização de um terceiro (ex.: Dupla alçada): Deve-se consultar a API de Resources para verificar as pendências e saber como proceder.

##  Redirecionamento App-to-app

O redirecionamento 'App-to-App' permite que a Instituição Receptora redirecione um usuário do seu aplicativo (em um navegador ou app) para o App da Instituição Transmissora, instalado no dispositivo do usuário. Nesse caso, a receptora é capaz de transmitir detalhes de sua solicitação junto com as preferências do usuário (por exemplo, tipo de produto, one-step authentication, etc) e ligar diretamente o seu usuário à tela ou função de login do aplicativo da transmissora, através de um deep-link. O usuário é então autenticado no aplicativo usando as mesmas credenciais/métodos normalmente usados quando ele acessa diretamente sua conta. Isso não deve envolver nenhuma etapa adicional (como, por exemplo, ser redirecionado primeiro para uma página da web para selecionar qual aplicativo da instituição transmissora usar) e não deve exigir que o usuário forneça qualquer identificador ou outras credenciais diferentes das já exigidas pela Instituição Transmissora em seu App. Quando o usuário não tem o App da transmissora, eles devem experimentar um fluxo de redirecionamento que também não deve envolver etapas adicionais do que seria o caso quando ele autentica diretamente na transmissora (por exemplo, ser redirecionado para o site mobile da transmissora).

### Como funciona o fluxo de redirecionamento

Ao usar um serviço baseado no padrão de APIs Open Banking Brasil para redirecionamento, o usuário será redirecionado duas vezes:

1. Da interface instituição receptora para a interface da transmissora (para autenticar e autorizar). O URI do servidor de autorização é especificado por cada transmissora em seu endpoint conhecido.

2. Na volta da interface da transmissora para a interface da receptora (para completar qualquer operação com a receptora). Este redirecionamento é especificado pela receptora como parte do primeiro redirecionamento.

### Implementação de deep links

Uma jornada perfeita para o usuário, que ignora o navegador integrado (por exemplo, Safari) em seu dispositivo mobile, pode ser implementada para qualquer URL, ou seja, ambos: a) para o redirecionamento inicial para o qual a transmissora envia o usuário para os servidores da transmissora, E b) a URL de redirecionamento para o qual a transmissora envia o usuário de volta para a receptora após a autenticação/autorização.

Tanto transmissoras quanto receptoras devem seguir as orientações da Apple e do Google abaixo:

* iOS: https://developer.apple.com/ios/universal-links/ (cobre mais de 99% de todos os usuários iOS, que estão no iOS 9 ou superior).

* Android: https://developer.android.com/training/app-links/index.html (cobre 65% de todos os usuários do Android, que estão no Android 6.0 ou posterior).

No caso de um usuário não ter o aplicativo instalado em seu dispositivo, ou se ele tiver um sistema operacional mais antigo ou sem suporte (por exemplo, Windows Mobile), esses métodos permitirão que o usuário seja redirecionado para uma página web mobile.

