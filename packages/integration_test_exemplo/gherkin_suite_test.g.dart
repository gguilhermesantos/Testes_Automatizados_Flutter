// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gherkin_suite_test.dart';

// **************************************************************************
// GherkinSuiteTestGenerator
// **************************************************************************

class _CustomGherkinIntegrationTestRunner extends GherkinIntegrationTestRunner {
  _CustomGherkinIntegrationTestRunner(
    TestConfiguration configuration,
    Future<void> Function(World) appMainFunction,
  ) : super(configuration, appMainFunction);

  @override
  void onRun() {
    testFeature0();
    testFeature1();
    testFeature2();
    testFeature3();
  }

  void testFeature0() {
    runFeature(
      'Para verificar o fluxo de Roteiros no app:',
      <String>[],
      () {
        runScenario(
          'Verificando rotas de datas especificas',
          <String>['@Roteiros_1', '@Roteiros'],
          (TestDependencies dependencies) async {
            await runStep(
              'Dado que o app inicializa',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E o login foi preenchido com "guilherme.silva@dextra-sw.com" e "Dextr@123"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E acessa "Roteiros"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E acesso o calendario',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Quando eu seleciono um periodo de data',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Entao verifico "rotasEncontradas"',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: () async => onBeforeRunFeature(
            'Para verificar o fluxo de Roteiros no app',
            <String>[],
          ),
          onAfter: null,
        );

        runScenario(
          'Adicionando nova rota e cotacao',
          <String>['@Roteiros_2', '@Roteiros'],
          (TestDependencies dependencies) async {
            await runStep(
              'Dado que o app inicializa',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E o login foi preenchido com "guilherme.silva@dextra-sw.com" e "Dextr@123"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E acessa "Roteiros"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Quando acesso nova rota com cliente "0000004544"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E acesso a cotacao',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Entao verifico "mensagemEditarCabecalho"',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: null,
          onAfter: null,
        );

        runScenario(
          'Acessando cliente e parar administração do cliente',
          <String>['@Roteiros_3', '@Roteiros'],
          (TestDependencies dependencies) async {
            await runStep(
              'Dado que o app inicializa',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E o login foi preenchido com "guilherme.silva@dextra-sw.com" e "Dextr@123"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E acessa "Roteiros"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E acesso pagina de cotacoes',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Quando paro administracao de cliente',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Entao verifico "telaHome"',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: null,
          onAfter: null,
        );

        runScenario(
          'Acessando cliente e acessar cotação existente',
          <String>['@Roteiros_4', '@Roteiros'],
          (TestDependencies dependencies) async {
            await runStep(
              'Dado que o app inicializa',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E o login foi preenchido com "guilherme.silva@dextra-sw.com" e "Dextr@123"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E acessa "Roteiros"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E acesso pagina de cotacoes',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Quando acesso uma cotacao da lista',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Entao verifico "mensagemEditarCabecalho"',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: null,
          onAfter: null,
        );

        runScenario(
          'Deletando nova rota',
          <String>['@Roteiros_5', '@Roteiros'],
          (TestDependencies dependencies) async {
            await runStep(
              'Dado que o app inicializa',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E o login foi preenchido com "guilherme.silva@dextra-sw.com" e "Dextr@123"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E acessa "Roteiros"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Quando deleto uma rota da lista',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Entao verifico "cotacaoDeletada"',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: null,
          onAfter: () async => onAfterRunFeature(
            'Para verificar o fluxo de Roteiros no app',
          ),
        );
      },
    );
  }

  void testFeature1() {
    runFeature(
      'Para verificar o fluxo de Cotacao no app:',
      <String>[],
      () {
        runScenario(
          'Deletando uma cotacao',
          <String>['@Cotacao_1', '@Cotacao'],
          (TestDependencies dependencies) async {
            await runStep(
              'Dado que o app inicializa',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E o login foi preenchido com "guilherme.silva@dextra-sw.com" e "Dextr@123"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E acessa "Cotações"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E busco por "primeira_cotacao" usando a opcao de "Cotacao"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E opto por "SIM" para remover cotacao',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Quando busco pela cotacao deletada',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Entao verifico "mensagemNEncontrado"',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: () async => onBeforeRunFeature(
            'Para verificar o fluxo de Cotacao no app',
            <String>[],
          ),
          onAfter: null,
        );

        runScenario(
          'Editando uma cotacao',
          <String>['@Cotacao_2', '@Cotacao'],
          (TestDependencies dependencies) async {
            await runStep(
              'Dado que o app inicializa',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E o login foi preenchido com "guilherme.silva@dextra-sw.com" e "Dextr@123"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E acessa "Cotações"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E busco por "0000004544" usando a opcao de "Cliente"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Quando opto por "REABRIR"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Entao verifico "mensagemCotacaoAberta"',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: null,
          onAfter: () async => onAfterRunFeature(
            'Para verificar o fluxo de Cotacao no app',
          ),
        );
      },
    );
  }

  void testFeature2() {
    runFeature(
      'Para verificar o fluxo de Pedidos no app:',
      <String>[],
      () {
        runScenario(
          'Fazendo busca por pedidos',
          <String>['@Pedidos_1', '@Pedidos'],
          (TestDependencies dependencies) async {
            await runStep(
              'Dado que o app inicializa',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E o login foi preenchido com "guilherme.silva@dextra-sw.com" e "Dextr@123"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E acessa "Pedidos"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Quando busco por "275" usando a opcao de "Pedidos"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Entao verifico "mensagemTituloPedido_275"',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: () async => onBeforeRunFeature(
            'Para verificar o fluxo de Pedidos no app',
            <String>[],
          ),
          onAfter: null,
        );

        runScenario(
          'Fazendo busca por clientes',
          <String>['@Pedidos_2', '@Pedidos'],
          (TestDependencies dependencies) async {
            await runStep(
              'Dado que o app inicializa',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E o login foi preenchido com "guilherme.silva@dextra-sw.com" e "Dextr@123"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E acessa "Pedidos"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Quando busco por "0000004544" usando a opcao de "Cliente"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Entao verifico "mensagemCorpoPedido_0000004544"',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: null,
          onAfter: () async => onAfterRunFeature(
            'Para verificar o fluxo de Pedidos no app',
          ),
        );
      },
    );
  }

  void testFeature3() {
    runFeature(
      'Para verificar o fluxo de Login no app:',
      <String>['@Login'],
      () {
        runScenario(
          'Fazendo login e Logout no app',
          <String>['@Login', '@Login_1'],
          (TestDependencies dependencies) async {
            await runStep(
              'Dado que o app inicializa',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Quando o login foi preenchido com "guilherme.silva@dextra-sw.com" e "Dextr@123"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Entao saio do app',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: () async => onBeforeRunFeature(
            'Para verificar o fluxo de Login no app',
            <String>['@Login'],
          ),
          onAfter: null,
        );

        runScenario(
          'Fazendo login com email errado',
          <String>['@Login', '@Login_2'],
          (TestDependencies dependencies) async {
            await runStep(
              'Dado que o app inicializa',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Quando "email" esta errado com "teste@teste.com"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Entao verifico "mensagemLoginIncorreto"',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: null,
          onAfter: null,
        );

        runScenario(
          'Fazendo login com senha errada',
          <String>['@Login', '@Login_3'],
          (TestDependencies dependencies) async {
            await runStep(
              'Dado que o app inicializa',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E email foi preenchido com "guilherme.silva@dextra-sw.com"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Quando "senha" esta errado com "1234567"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Entao verifico "mensagemSenhaIncorreto"',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: null,
          onAfter: null,
        );

        runScenario(
          'Fazendo login acessando Esqueci minha senha',
          <String>['@Login', '@Login_4'],
          (TestDependencies dependencies) async {
            await runStep(
              'Dado que o app inicializa',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'E email foi preenchido com "guilherme.silva@dextra-sw.com"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Quando clico em Esqueci minha senha',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Entao verifico "mensagemCodigoValidacao"',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: null,
          onAfter: () async => onAfterRunFeature(
            'Para verificar o fluxo de Login no app',
          ),
        );
      },
    );
  }
}

void executeTestSuite(
  TestConfiguration configuration,
  Future<void> Function(World) appMainFunction,
) {
  _CustomGherkinIntegrationTestRunner(configuration, appMainFunction).run();
}
