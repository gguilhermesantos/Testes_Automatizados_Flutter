import 'package:app_vendedor/splash_screen/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';
import 'package:path_provider/path_provider.dart';

class IniciarApp extends GivenWithWorld<FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'que o app inicializa');

  @override
  Future<void> executeStep() async {
    final appDir = await getApplicationSupportDirectory();
    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
    }

    final cacheDir = await getTemporaryDirectory();
    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
    await world.appDriver.waitUntil(() async {
      await world.appDriver.waitForAppToSettle();
      final image = find.byType(SplashScreenPage);
      return world.appDriver.isPresent(image);
    });
    await world.appDriver.waitUntil(() async {
      await world.appDriver.waitForAppToSettle();
      final image = find.byType(SplashScreenPage);
      return world.appDriver.isAbsent(image);
    });

    await world.appDriver.waitForAppToSettle();
  }
}

class PreencherCamposLogin
    extends When2WithWorld<String, String, FlutterWorld> {
  @override
  RegExp get pattern =>
      RegExp(r'o login foi preenchido com {String} e {String}');

  @override
  Future<void> executeStep(String txtEmail, String txtPassword) async {
    final appDriver = world.appDriver;

    await appDriver.waitForAppToSettle();

    final email = find.byType(TextFormField);
    final btnConfirma = find.byType(ElevatedButton);

    await appDriver.tap(email);
    await appDriver.enterText(email, txtEmail);
    await appDriver.tap(btnConfirma);

    final senha = find.byType(TextFormField);
    final btnConfirma_2 = find.byType(ElevatedButton);

    await appDriver.tap(senha);
    await appDriver.enterText(senha, txtPassword);
    await appDriver.tap(btnConfirma_2);
    await appDriver.waitForAppToSettle();

    await world.appDriver.waitUntil(() async {
      await world.appDriver.waitForAppToSettle(timeout: Duration(minutes: 2));
      final txtSyncSuccess = find.text('Sincronização realizada com sucesso!');
      return world.appDriver.isAbsent(txtSyncSuccess);
    }, timeout: Duration(minutes: 2));
  }
}

class DadoErrado extends When2WithWorld<String, String, FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'{String} esta errado com {String}');

  @override
  Future<void> executeStep(String campo, String txtEmail) async {
    final appDriver = world.appDriver;

    await appDriver.waitForAppToSettle();
    final campo = find.byType(TextFormField);
    final btnConfirma = find.byType(ElevatedButton);

    await appDriver.tap(campo);
    await appDriver.enterText(campo, txtEmail);
    await appDriver.tap(btnConfirma);
  }
}

class VerificaMensagem extends Then1WithWorld<String, FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'verifico {String}');

  @override
  Future<void> executeStep(String mensagemtxt) async {
    final appDriver = world.appDriver;
    String mensagemtxtparc = mensagemtxt.split('_').first;
    switch (mensagemtxtparc) {
      case 'mensagemLoginIncorreto':
        find.text('E-mail não cadastrado');
        return;
      case 'mensagemSenhaIncorreto':
        find.text('Senha incorreta');
        return;
      case 'mensagemCodigoValidacao':
        find.text('Insira o código de validação');
        return;
      case 'mensagemTituloPedido':
        String pedido = 'Pedido ${mensagemtxt.split('_').last}';
        this.expect(find.text(pedido), findsOneWidget);
        return;
      case 'mensagemCorpoPedido':
        String pedido = mensagemtxt.split('_').last;
        debugPrint(pedido);
        this.expect(find.text(pedido), findsOneWidget);
        return;
      case 'mensagemNEncontrado':
        this.expect(find.text('Pedido não encontrado!'), findsOneWidget);
        return;
      case 'mensagemCotacaoAberta':
        await appDriver.waitForAppToSettle();
        expect(Modular.to.path, '/suggestedOrder/');
        return;
      case 'mensagemEditarCabecalho':
        await appDriver.waitForAppToSettle();
        expect(Modular.to.path, '/suggestedOrder/edit_header');
        this.expect(find.text('Editar cabeçalho'), findsOneWidget);
        this.expect(find.text('SALVAR DEFINIÇÕES'), findsOneWidget);
        return;
      case 'rotasEncontradas':
        await appDriver.waitForAppToSettle();
        this.expect(find.text('Suas rotas'), findsOneWidget);
        this.expect(
            find.text('Nenhuma rota encontrada no dia ou período selecionado.'),
            findsNothing);
        this.expect(find.text('Faça uma nova seleção!'), findsNothing);
        return;
      case 'telaHome':
        this.expect(find.text('Roteiros'), findsOneWidget);
        this.expect(find.text('Cotações'), findsOneWidget);
        this.expect(find.text('Pedidos'), findsOneWidget);
        this.expect(find.text('Olá, Guilherme Silva!'), findsOneWidget);
        return;
      case 'cotacaoDeletada':
        this.expect(find.text('Nova rota'), findsNothing);
        return;
      default:
        debugPrint('Texto de verificação não identificado');
        break;
    }
  }
}

class SairApp extends ThenWithWorld<FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'saio do app');

  @override
  Future<void> executeStep() async {
    final appDriver = world.appDriver;
    final buttonConfig = find.byType(IconButton);
    await appDriver.waitForAppToSettle();
    await appDriver.tap(buttonConfig);
    final btnSai = find.text('SAIR');
    await appDriver.tap(btnSai);
    final btnConfma = find.text('CONFIRMAR');
    await appDriver.tap(btnConfma);
  }
}

class PreencheEmail extends And1WithWorld<String, FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'email foi preenchido com {String}');

  @override
  Future<void> executeStep(String txtEmail) async {
    final appDriver = world.appDriver;

    await appDriver.waitForAppToSettle();

    final email = find.byType(TextFormField);
    final btnConfirma = find.byType(ElevatedButton);

    await appDriver.tap(email);
    await appDriver.enterText(email, txtEmail);
    await appDriver.tap(btnConfirma);
  }
}

class EsqueciSenha extends ThenWithWorld<FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'clico em Esqueci minha senha');

  @override
  Future<void> executeStep() async {
    final appDriver = world.appDriver;
    final esqueciLink = find.text('Esqueci minha senha');

    await appDriver.tap(esqueciLink);
  }
}
