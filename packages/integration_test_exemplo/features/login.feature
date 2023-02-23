# language: pt

@Login
Funcionalidade: Para verificar o fluxo de Login no app

  Contexto: Acessando App
    Dado que o app inicializa

  @Login_1
  Cenario: Fazendo login e Logout no app
    Quando o login foi preenchido com "guilherme.silva@dextra-sw.com" e "Dextr@123"
    Entao saio do app

  @Login_2
  Cenario: Fazendo login com email errado
    Quando "email" esta errado com "teste@teste.com"
    Entao verifico "mensagemLoginIncorreto"

  @Login_3
  Cenario: Fazendo login com senha errada
    E email foi preenchido com "guilherme.silva@dextra-sw.com"
    Quando "senha" esta errado com "1234567"
    Entao verifico "mensagemSenhaIncorreto"

  @Login_4
  Cenario: Fazendo login acessando Esqueci minha senha
    E email foi preenchido com "guilherme.silva@dextra-sw.com"
    Quando clico em Esqueci minha senha
    Entao verifico "mensagemCodigoValidacao"