# Open Banking Brasil  {#OpenBankingBrasil}

## Visão geral do ecossistema  {#VisaoGeral}

Em sua essência, o Open Banking Brasil é um ecossistema de compartilhamento de dados onde os clientes de bancos e outras instituições financeiras desejam compartilhar suas informações de conta ou dar permissão para que os pagamentos sejam executados em seu nome com serviços de terceiros.

Há uma série de funções necessárias para vincular qualquer sistema de Identificação, Autenticação e Autorização, independentemente do setor. Todas essas funções são necessárias, mas várias funções podem ser desempenhadas por cada participante. Em geral, o usuário final ("Subject"), está dando a um sistema ("Client") uma autorização ("Access Token") para acessar um recurso protegido mantido pelo Provedor ("Resource Server"). Isso exige que o *Subject* e o *Client* sejam identificados e autenticados e que a autorização seja confirmada.

As regras exatas e os requisitos legais para cada função em um setor específico formam um framework de confiança ('Trust Framework'). Cada ecossistema requer um conjunto padronizado de regras e requisitos legais que abrangem todas as funções e obrigações das interações acima. A combinação de quem fornece qual(is) função(ões), os níveis aos quais eles devem desempenhar essas funções e os padrões pelos quais essas operações devem ser definidas um framework de confiança específico do setor.

Diferentes frameworks de confiança terão diferentes opções de implementação, mas um framework de confiança comum é um pré-requisito para transformar um 'setor' em um 'ecossistema'. Um framework de confiança comum reduz significativamente a complexidade e, portanto, os custos, aumenta a escalabilidade e a interoperabilidade dentro do setor, bem como abre opções para o tipo de padronização intersetorial que o Open Banking Brasil está buscando.

Diferentes implementações podem ser definidas para setores, que têm diferentes prós / contras e custos associados para diferentes participantes. Cada uma das implementações propostas pode ser usada para qualquer setor se os pré-requisitos corretos estiverem em vigor. A solução certa dependerá do apetite e alinhamento de cada conjunto de participantes.

A implementação de um mecanismo comum para o Open Banking Brasil exigirá um compromisso com a simetria entre os setores para incluir detalhes específicos do setor nos princípios do framework de confiança.

É necessário fazer escolhas técnicas para garantir que qualquer implementação forneça uma base estrita e consistente para ter credibilidade, mas mantenha a flexibilidade para se adaptar às necessidades futuras. Isso implica padrões de código-fonte aberto amplamente disponíveis, amplamente compreendidos e que foram experimentados e testados. Além disso, há uma escolha de parceiros que podem apoiar qualquer construção técnica, o que significa que continuará havendo espaço para desenvolvimento comercial de soluções.

### Participantes de um ecossistema de compartilhamento de dados  {#Participantes}

Nos ecossistemas de Open Banking voltados para o consumidor que estamos considerando, temos três participantes principais:

* o usuário (cliente)
* a instituição transmissora de dados (oferecendo serviços bancários)
* a instituição receptora de dados (TPP - Third Party Provider, oferecendo uma proposta de Open Banking):

Em todos os casos a seguir, assumimos:

* Um usuário possui uma conta para um serviço principal ou conjunto de recursos numa instituição transmissora de dados
* Uma instituição receptora de dados oferece ao usuário uma proposta habilitada por meio do compartilhamento inteligente de dados
* O usuário dá consentimento à instituição receptora de dados para fins de entrega dessa proposta
* A instituição transmissora de dados tem a obrigação de salvaguardar os dados do usuário, mas também de compartilhá-los quando instruído.

Também temos provedores de serviços de confiança, que são entidades que fornecem garantia técnica a ambas instituições (transmissoras e receptoras) que todos estão autorizados a participar do ecossistema.

Os **padrões** técnicos necessários para dar suporte ao framework de confiança devem atender a todos os requisitos a seguir.

* Identificação de todos os participantes do ecossistema.
* Autenticação quando exigida de todos os participantes entre si.
* Confirmação de autorização de todos os participantes em um ecossistema de compartilhamento de dados.

Os **serviços** técnicos necessários para suportar um ecossistema devem habilitar todos os requisitos acima **em uma base e em modo contínuos**, isto é, não apenas em um único ponto de registro.

### Princípios de Especificação e Requisitos de Alto Nível  {#Principios}

O Open Banking Brasil adotou os seguintes princípios e requisitos de alto nível no que diz respeito às normas técnicas

* Consentimento
  * Os clientes devem estar sempre no controle de quem tem acesso aos seus dados e para quais fins eles estão sendo usados.
* Minimização de dados
  * Os clientes devem ser capazes de compartilhar apenas os dados de que precisam, pelo tempo que for necessário.
* Segurança
  * Uma modelagem de ameças foi produzido avaliando todas as fraquezas potenciais nos processos de comunicação.
  * Todos os pontos fracos identificados foram corrigidos.
* Identificação
  * Todos os participantes devem ter segurança na identificação de todos os atores do ecossistema.
* Autenticação
  * Todos os participantes devem comunicar as etapas que foram executadas para autenticar cada participante no ecossistema e em que nível isso foi executado.
* Integridade e não repúdio
  * Todos os participantes devem ser capazes de provar que as mensagens não foram adulteradas e, na verdade, foram enviadas apenas por um participante legítimo.

Além dos requisitos de alto nível, os seguintes princípios também foram adotados.

* Não reinventar a roda, se existir uma especificação que seja adequada para o propósito, amplamente adotada e publicamente disponível, use-a.
* Envolva-se com outros órgãos de normalização para aprender com a experiência anterior sobre o que funcionou, o que não funcionou e o que pode ser feito melhor.
* Assegurar o amplo suporte da indústria para garantir o máximo de chances de sucesso e, mais importante, a segurança do cliente.
* Solicite feedback com antecedência e com frequência, reconheça que serão necessárias várias iterações para desenvolver um padrão conforme definido pelos processos da Organização Mundial do Comércio.
* O framework de confiança que sustenta o ecossistema de compartilhamento de dados, que é o Open Banking Brasil, é um framework técnico que precisa ser flexível o suficiente para permitir que os participantes e o ecossistema inovem, cresçam e se desenvolvam, enquanto permanecem interoperáveis.

Todos os participantes devem ter certeza de que todos os atores do ecossistema estão lidando com seus dados com segurança tempo todo. Isso requer que todos os participantes testem publicamente seus sistemas quanto à conformidade com as especificações e disponibilizem os resultados de seus testes de conformidade para exame público de outros participantes.

**Este é um requisito que se aplica a transmissores e receptores de dados.**

## Os principais padrões de segurança  {#Padroes}

### A estrutura de autorização OAuth 2.0  {#OAuth20}

O ecossistema de compartilhamento de dados definido pelo Brasil consiste em muitos padrões diferentes, todos girando em torno de conceitos, funções e obrigações que foram tecnicamente definidos no [OAuth 2.0 Authorization Framework.](https://tools.ietf.org/html/rfc6749).

> A estrutura de autorização OAuth 2.0 permite um aplicativo de uma instituição receptora de dados obter acesso limitado a um serviço HTTP, seja em nome de um proprietário de recurso por meio da orquestração de uma interação de aprovação entre o proprietário do recurso e o serviço HTTP, ou permitindo o aplicativo da instituição receptora obter acesso em seu próprio nome.

A especificação base OAuth 2.0 não fornece, por si só, informações suficientes para atender a todas as necessidades definidas pelo framework de confiança do Open Banking Basil. Mais notavelmente, está faltando uma maneira de transmitir informações de identidade do cliente em um formato padronizado de uma instituição transmissora para uma receptora, e os mecanismos de autenticação que foram definidos na especificação original não são seguros o suficiente para atender aos requisitos de uma indústria altamente regulamentada.

### OpenID Connect - A camada de identidade para a Internet

**_Este perfil herda todas as obrigações do OAuth 2.0_**

> [OpenID Connect](https://openid.net/connect/) é um conjunto de especificações leves que fornecem uma estrutura para interações de identidade por meio de APIs do tipo REST. A implementação mais simples do OpenID Connect permite que clientes de todos os tipos, incluindo clientes baseados em navegador, celulares e clientes javascript, solicitem e recebam informações sobre identidades e sessões atualmente autenticadas. O conjunto de especificações é extensível, permitindo que os participantes também suportem, opcionalmente, criptografia de dados de identidade, descoberta do provedor OpenID e gerenciamento avançado de sessão, incluindo logout.

O grupo de trabalho OpenID Foundations Connect tem sido o guardião do Padrão de Identidade "de fato" da Internet por muitos anos, trabalhando em várias especificações que se baseiam na Estrutura de Autorização OAuth 2.0, adicionando recursos e requisitos de suporte para melhorar a segurança da estrutura subjacente.

[Open ID Connect Core:](https://openid.net/specs/openid-connect-core-1_0.html) é um perfil do OAuth 2.0, o que significa que herda todos os requisitos e obrigações do [OAuth 2.0](https://tools.ietf.org/html/rfc6749), mas define o conceito de um id_token e introduz novos mecanismos de autenticação.

[Open ID Connect Discovery:](https://openid.net/specs/openid-connect-discovery-1_0.html) apresenta o conceito de um documento de descoberta usado por provedores OpenID Connect para anunciar como os clientes OAuth 2.0 podem se comunicar com eles e quais recursos e opções o provedor OIDC oferece suporte.

[RFC7591:](https://tools.ietf.org/html/rfc7591) Além de definir o processo de registro dinâmico de clientes OAuth, esta especificação apresenta o conceito de um [Software Statement](https://tools.ietf.org/html/rfc7591#section-2.3) ("Declaração de Software") que pode ser usada para fornecer informações sobre um cliente que é atestado por um serviço de terceiros. Outros atributos de metadados também são definidos na [OpenID Connect Registration Specification](https://openid.net/specs/openid-connect-registration-1_0.html)

> Esta especificação define mecanismos para registrar dinamicamente Clientes OAuth 2.0 com servidores de autorização ('Authorization Servers'). Pedidos de registro enviam um conjunto de valores de metadados do cliente desejados para o 'Authorization Server'. As respostas de registro resultantes retornam um identificador de cliente para usar no servidor de autorização e os valores de metadados registrados para o cliente. O cliente pode então usar esta informações de registro para se comunicar com o servidor de autorização usando o protocolo OAuth 2.0. Esta especificação também define um conjunto de campos de metadados do cliente e valores para os clientes usarem durante o registro.

[RFC7592:](https://tools.ietf.org/html/rfc7592) Esta especificação define métodos de gerenciamento de registros de cliente dinâmico OAuth 2.0 para casos de uso em que as propriedades de um cliente registrado podem precisar ser alteradas durante a vida do cliente.

As especificações acima são especificações básicas cuja leitura obrigatória sustenta o arcabouço de confiança do Open Banking Brasil, entretanto, eles ainda são insuficientes para atender a todos os requisitos e princípios descritos anteriormente.

### OpenID Financial Grade 1.0: Baseline

**_Este perfil herda todas as obrigações do OpenID Connect Core_**

Reconhecendo as ameaças e riscos restantes que não foram tratados pelo OpenID Connect principal, o foco do grupo de trabalho do Financial Grade é criar uma especificação que visa identificar e, em seguida, abordar os pontos fracos na especificação OpenID Connect subjacente, essencialmente, criar um perfil para casos de uso de alta segurança.

O perfil Baseline foi originalmente planejado para ser mais facilmente implementado por clientes e provedores de OpenID às custas de alguns elementos de segurança e, como tal, não oferece o mesmo grau de proteção contra violação de solicitação e violação de resposta.

### OpenID Financial Grade 1.0: Avançado

**_Este perfil herda todas as obrigações do OpenID FAPI 1.0: Baseline_**

O atual padrão de ouro para API Security, o [FAPI 1.0: Advanced profile](https://openid.net/specs/openid-financial-api-part-2-1_0.html) fornece uma **especificação de arcabouço** que foi usado como ponto de partida para a criação de uma especificação para o Open Banking Brasil.

> Este documento especifica um perfil de segurança avançado do OAuth que é adequado para ser usado para proteger APIs com alto risco inerente. Os exemplos incluem APIs que dão acesso a dados altamente confidenciais ou que podem ser usados para acionar transações financeiras (por exemplo, início de pagamento). Este documento especifica os controles contra ataques, como: violação de solicitação de autorização, violação de resposta de autorização, incluindo injeção de código, injeção de estado e phishing de solicitação de token. Detalhes adicionais estão disponíveis na seção de considerações de segurança.

![Hierachy of OAuth 2.0 Profiles](https://miro.medium.com/max/700/1*R8d0lkvVRlEMG9WBXCZsdQ.png)

# Guia do usuário final para ASPSP

## 1.0 Registrando um Banco

### 1.1 Visão geral do diretório

Os serviços do arcabouço de confiança fornecidos pelo Open Banking Brasil fornecem todos os serviços de descoberta necessários para que TPPs e ASPSPs interajam entre si, sem que sejam necessários para validar a autenticidade de cada um.

Um Authorization Server ou AS conforme definido por [RFC 6749 - The OAuth 2.0 Authorization Framework](https://tools.ietf.org/html/rfc6749) executa várias funções em um ecossistema de compartilhamento de dados como o Open Banking. Antes de prosseguir, certifique-se de que os conceitos de funções e responsabilidades definidos no RFC original sejam bem compreendidos. Além disso, certifique-se de que os conceitos, funções e responsabilidades definidos no [OpenID Connect Core](https://openid.net/specs/openid-connect-core-1_0.html) e como eles estendem os conceitos definidos no RFC 6749 são igualmente bem compreendido.

### 1.2 Registrando um servidor de autorização e provedor de OpenID

Os bancos, geralmente grandes bancos, não serão uma entidade única do ponto de vista das operações de tecnologia. Eles podem ter marcas, segurança e infraestrutura de TI diferentes para diferentes segmentos de clientes ou podem ter alguma infraestrutura de TI que ofereça suporte a várias marcas ou segmentos de clientes. Isso significa que o ecossistema técnico precisa ser flexível o suficiente para suportar uma ampla variedade de implantações de infraestrutura de bancos, garantindo que os serviços necessários possam ser descobertos por clientes de terceiros que precisam interagir com ele.

Um modelo flexível para anunciar serviços de autenticação / autorização e os recursos protegidos pelo AuthN e AuthZ é suportado pelo Diretório.

* **Nome Amigável do Cliente** - Será exibido aos clientes pelos TPPs e já deve ser reconhecido pelos Clientes do Banco.
* **Logotipo amigável ao cliente** - Será exibido aos clientes pelos TPPs para auxiliar no reconhecimento da marca.
* **Descrição** - Isso pode ser exibido aos clientes por TPPs para auxiliar no reconhecimento da marca.
* **Termos de Serviço** - Este é um link para os Termos de Serviço do banco, que podem ser incluídos pelos TPPs.
* **WebHook de notificação** - Os servidores de autorização podem registrar um WebHook que receberá atualizações por push sobre as alterações dos participantes, seus softwares ou certificados.
* **OpenID Well Known Document Uri** - Link para o documento de descoberta do Authorization Server.

Um banco pode optar por ter um servidor de autorização ou muitos, desde que satisfaça os seguintes requisitos.

* Um cliente pode reconhecer o servidor de autorização como um local com o qual normalmente faria interação com o seu banco.
* O Authorization Server pode emitir tokens para os recursos e serviços que um cliente ou TPP está procurando.

### 1.3 Registrando recursos

Depois que um banco registra um servidor de autorização, ele precisa anunciar para quais recursos, APIs ou serviços ele pode fornecer autorização.

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

No exemplo acima, o Amazing Banking está anunciando dois serviços que devem ser reconhecidos pelos clientes. "Amazing Business Banking" e "Amazing Banking". Estes **podem ou não estar** diretamente relacionados a "Marcas", pois bancos diferentes podem precisar anunciar serviços de autenticação diferentes, mesmo dentro de uma submarca.

Além disso, o banco anuncia quais recursos cada um dos servidores de autorização está protegendo ou oferecendo. No exemplo acima, o Amazing Banking é compatível com a versão 1 e a versão 2 da API de informações da conta e o "Amazing Banking" tem dois sistemas separados de autenticação e autorização para Pagamentos e Informações da conta.

Anunciar corretamente quais recursos são oferecidos por cada servidor é importante para atingir a escala prevista pelo Open Banking  Brasil e fundamental para garantir que os clientes possam identificar seu serviço bancário facilmente e que os TPPs possam encaminhar os clientes para o Serviço de Autorização correto com base nos recursos protegidos por cada serviço.

## 2.0 Validando uma solicitação de registro de cliente

Usando o OpenID Connect Discovery e a especificação de Registro de Cliente Dinâmico (DCR) do Open Banking Brasil. Um TPP pode registrar seu aplicativo em cada um dos Servidores de Autorização disponíveis no ecossistema.

### 2.1 Registro OpenID Connect e OAuth 2.0 Dynamic Client Registration

Consulte a Cláusula 7 da Especificação de Registro do Cliente Dinâmico (DCR) do Open Banking Brasil para obter detalhes.

### 2.2 Processamento de declaração de software

Consulte a Cláusula 8 da Especificação de Registro do Cliente Dinâmico (DCR) do Open Banking Brasil para obter detalhes.

## 3.0 Validando um Pedido de Autorização

Consulte a Cláusula 5 do Perfil de Segurança do Open Banking para obter detalhes.
