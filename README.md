<a name="readme-top"></a>
# Testes Automatizados de aplicativo em Flutter

Este projeto tem o intuito de aprender a configurar e desenvolver automação de APP em Flutter.

## Inicializando

Estas instruções fornecerão uma cópia do projeto em execução em sua máquina local para fins de desenvolvimento e teste.

### Pré requisitos

* Ter inicializado e configurado um repositório git
* Caso prefira utilizar um device virtual, ter instalado [Android Studio](https://developer.android.com/studio)
* Baixar [Flutter SDK](https://docs.flutter.dev/get-started/install)

### Instalando

Caso queira começar um novo projeto no Android Studio:
* Descompactar e instalar arquivo do flutter sdk
* Clicar em **Create New Flutter Project**
* Clicar em **Flutter Application**
* Criar um nome para o projeto
* Ajustar pasta do projeto de acordo com o arquivo descompactado
* Clicar em **Next**
* Criar um nome para o pacote
* Clicar em **Finish**

Caso opte por clonar este ou algum projeto, utilizar comando:

* Descompactar e instalar arquivo do **flutter sdk**
* Adicionar a ferramenta do flutter na sua variavel path com o comando 
```sh
 export PATH="$PATH:`pwd`/flutter/bin"
```
Este comando define sua variável PATH apenas para a janela do terminal atual. Para adicionar permanentemente o Flutter ao seu caminho, consulte [Update your path](https://docs.flutter.dev/get-started/install/macos#update-your-path)
* Clonar o projeto exemplo
```sh
git clone https://github.com/gguilhermesantos/Testes_Automatizados_Flutter
```

## Gerando um dispositivo (Android Studio)

* Na tela de boas-vindas do Android Studio, selecione **More Actions > Virtual Device Manager**
* Depois de abrir um projeto, selecione **View > Tool Windows > Device Manager** na barra de menus principal
* clique em **Create device**

## Rodando testes

Para rodar testes:
* No terminal, na pasta do projeto, rodar o comando:
```sh
flutter drive --driver=test_driver/integration_test_driver.dart --target=integration_test/gherkin_suite_test.dart --dart-define=TAGS="@Login_3"
```
Caso rode sem a tag, vai rodar todos os testes

## Comandos úteis

### comandos GIT

```markdown
`git init` - Na pasta do projeto
`git add .` - Para adicionar todos os arquivos
`git add README.md` - Para adicionar o arquivo Readme.me
`git commit -m "message"` - Criar comentário do commit
`git config --global --edit` - Para editar o seu usuario e para configurar o repositório
`git push origin dev` - Enviar as mudanças para o repositório
`git checkout master` - Mudar para outro ganho do repositório
`git fetch` - Atualizar os repositórios locais com o servidor
`git pull` - Pegar as mudanças dos outros desenvolvedores
```

### Flutter

Execute o seguinte comando para ver se há alguma dependência que você precisa instalar para concluir a configuração (para saída detalhada, adicione o sinalizador **-v**):
```sh
flutter doctor
```

* No Android Studio, existe no canto direito uma aba chamada **Flutter Inspector** onde é possivel ver os widget do seu app para criar ações com base nele.

* Para preparar para executar e testar seu aplicativo Flutter em um dispositivo Android
 - Ative as **opções do desenvolvedor** e a **depuração USB** no seu dispositivo
 - Somente Windows: instale o driver USB do Google
 - Usando um cabo USB, conecte o telefone ao computador. Se solicitado em seu dispositivo, autorize seu computador a acessar seu dispositivo.
 - No terminal, execute o comando `flutter devices` para verificar se o Flutter reconhece seu dispositivo Android conectado

* Pastas importantes para automação: `test_driver_exemplo` (vem da pasta flutter test e flutter driver) e `integration_test_exemplo`

* No arquivo pubspec.yaml acrescentar libs:
```
dev_dependencies:
    flutter_test:
        sdk: flutter
    flutter_gherkin: ^3.0.0-rc.9
```

* Para dúvidas: [Clique aqui](https://flutter.dev/docs/get-started/install)

#### slidy
Gerenciador de pacotes CLI e gerador de modelos. Basicamente arquivos .g são gerados com o comando slidy run
[Documentação](https://pub.dev/packages/slidy)

```markdown
`slidy run mobx_build` - Roda a geração de códigos automáticos
`slidy run mobx_watch` - Ativa o servidor que fica escutando o build automático
`slidy run mobx_build_clean` - Roda o mobx_build mas limpa os .g antes e utiliza a flag --delete-conflicting-outputs
`slidy run moor_structure` - Gera estrutura do banco atual do moor
`slidy run moor_helpers` - Gera classes auxiliares para os testes
```

### Vim
Comandos para Vi:
```markdown
 `:q`  – Fecha o arquivo e encerra o Vim
 `:wq` – Salva as alterações, fecha o arquivo e encerra o Vim (junção dos comandos :w, que salva o arquivo, e :q para sair)
 `:q!` – Descarta as alterações, fecha o arquivo e encerra o Vim
```

### Criar chave ssh

Rodar comandos no terminal:
```sh
ssh-keygen -t ed25519 -C <email>
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub
```
Colar no GitHub

### Caso não funcione acesso por ssh

Caso não funcione o push opte por esse metodo: [Clique aqui](https://www.doaction.com.br/en/blog/como-corrigir-o-erro-support-for-password-authentication-was-removed-please-use-a-personal-access-token-instead)

* vá em `Settings` e depois `Developer Settings`
* Clique em `Personal access tokens` e a seguir em `Tokens (classic)`
* Generate new token:
* Dê um nome para seu token em Note e a seguir marque os checkboxes para habilitar as permissões
  - Gerar o token
* Agora, você deve copiar o seu token:
  - A última etapa é adicionar o token recém copiado ao endereço do seu repositório remoto e assim subir alterações para o github:
```sh
git remote set-url origin https://{{TOKEN}}@github.com/gguilhermesantos/Testes_Automatizados_Flutter
git push -u origin master
```
###Links úteis
[Introdução ao Integration Test](https://docs.flutter.dev/cookbook/testing/integration/introduction)
[Introdução ao Flutter driver](https://api.flutter.dev/flutter/flutter_driver/FlutterDriver-class.html)
[Vídeo sobre automação com Flutter](https://www.youtube.com/watch?v=GsxAtdLSjRs)
[Biblioteca para automação](https://api.flutter.dev/flutter/flutter_test/CommonFinders-class.html)
[Como utilizar Gherkin no Flutter](https://pub.dev/packages/flutter_gherkin)
[Biblioteca do Flutter driver](https://api.flutter.dev/flutter/flutter_driver/flutter_driver-library.html)

###Tags para commit
Lista de tags e seus significados para commits:

* **feat:** São quaisquer adições ao código. Enquanto elas podem alterar parte do código já existente, o foco dela é a implementação de features novas ao sistema.

* **fix:** Soluciona um problema no código, ou seja, correção de bugs.

* **docs:** Alteração e criação de documentação.

* **refactor:** Refere-se a quaisquer mudanças no código, porém não alterem sua funcionalidade. Alteração de nome de variável ou função lógica, mas manteve a mesma funcionalidade.

* **test:** É usado para identificar alterações de desenvolvimento relacionadas a testes - como refatoração de testes existentes ou adição de novos testes.

* **perf:** Mudança de código que melhora o desempenho de algo.

* **revert:** Reverter um commit.

* **merge:** Junção de branchs.

* **conflict:** Resolução de conflitos .

<p align="center">(<a href="#readme-top">Voltar ao topo</a>)</p>
