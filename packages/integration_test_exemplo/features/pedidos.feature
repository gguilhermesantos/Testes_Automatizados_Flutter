# language: pt

Funcionalidade: Para verificar o fluxo de Pedidos no app

Contexto: Acessando Pedidos
    Dado que o app inicializa
    E o login foi preenchido com "guilherme.silva@dextra-sw.com" e "Dextr@123"
    E acessa "Pedidos"

@Pedidos_1 @Pedidos
  Cenario: Fazendo busca por pedidos
    Quando busco por "275" usando a opcao de "Pedidos"
    Entao verifico "mensagemTituloPedido_275"

@Pedidos_2 @Pedidos
  Cenario: Fazendo busca por clientes
    Quando busco por "0000004544" usando a opcao de "Cliente"
    Entao verifico "mensagemCorpoPedido_0000004544"
