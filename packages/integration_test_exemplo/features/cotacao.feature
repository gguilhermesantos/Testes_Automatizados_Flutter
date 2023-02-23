# language: pt

Funcionalidade: Para verificar o fluxo de Cotacao no app

Contexto: Acessando App ate cotacoes
    Dado que o app inicializa
    E o login foi preenchido com "guilherme.silva@dextra-sw.com" e "Dextr@123"
    E acessa "Cotações"

@Cotacao_1 @Cotacao
  Cenario: Deletando uma cotacao
    E busco por "primeira_cotacao" usando a opcao de "Cotacao"
    E opto por "SIM" para remover cotacao
    Quando busco pela cotacao deletada
    Entao verifico "mensagemNEncontrado"

@Cotacao_2 @Cotacao
  Cenario: Editando uma cotacao
    E busco por "0000004544" usando a opcao de "Cliente"
    Quando opto por "REABRIR"
    Entao verifico "mensagemCotacaoAberta"