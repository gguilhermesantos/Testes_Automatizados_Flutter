# language: pt

Funcionalidade: Para verificar o fluxo de Roteiros no app

Contexto: Acessando App ate roteiros
    Dado que o app inicializa
    E o login foi preenchido com "guilherme.silva@dextra-sw.com" e "Dextr@123"
    E acessa "Roteiros"

@Roteiros_1 @Roteiros
  Cenario: Verificando rotas de datas especificas
    E acesso o calendario
    Quando eu seleciono um periodo de data
    Entao verifico "rotasEncontradas"

@Roteiros_2 @Roteiros
  Cenario: Adicionando nova rota e cotacao
    Quando acesso nova rota com cliente "0000004544"
    E acesso a cotacao
    Entao verifico "mensagemEditarCabecalho"

@Roteiros_3 @Roteiros
  Cenario: Acessando cliente e parar administração do cliente
    E acesso pagina de cotacoes
    Quando paro administracao de cliente
    Entao verifico "telaHome"

@Roteiros_4 @Roteiros
  Cenario: Acessando cliente e acessar cotação existente
    E acesso pagina de cotacoes
    Quando acesso uma cotacao da lista
    Entao verifico "mensagemEditarCabecalho"

@Roteiros_5 @Roteiros
  Cenario: Deletando nova rota
    Quando deleto uma rota da lista
    Entao verifico "cotacaoDeletada"