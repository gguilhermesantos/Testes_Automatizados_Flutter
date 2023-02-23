import 'package:app_vendedor/main_stg.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import 'step_definitions/step_definitions_cotacao.dart';
import 'step_definitions/step_definitions_login.dart';
import 'step_definitions/step_definitions_pedidos.dart';
import 'step_definitions/step_definitions_roteiros.dart';

part 'gherkin_suite_test.g.dart';

@GherkinTestSuite()
void main() {
  const tags = String.fromEnvironment('TAGS');

  executeTestSuite(
    FlutterTestConfiguration.DEFAULT([
      IniciarApp(),
      SairApp(),
      PreencherCamposLogin(),
      DadoErrado(),
      VerificaMensagem(),
      PreencheEmail(),
      EsqueciSenha(),
      AcessoOpcao(),
      PreencherCamposLogin(),
      FiltroPedidos(),
      RemoverCotacao(),
      CotacaoDeletada(),
      ReabrindoCotacao(),
      AcessoCalendario(),
      AcessoPeriodo(),
      AcessoNovaRota(),
      AcessoCotacao(),
      AcessoPaginaCotacoes(),
      AdminCliente(),
      AdminCotacaoLista(),
      DeletaCotacaoLista(),
    ])
      ..defaultTimeout = Duration(minutes: 10)
      ..stopAfterTestFailed = true
      ..tagExpression = tags
      ..reporters = [
        ProgressReporter()
          ..setWriteLineFn(debugPrint)
          ..setWriteFn(debugPrint),
        TestRunSummaryReporter()
          ..setWriteLineFn(debugPrint)
          ..setWriteFn(debugPrint),
        JsonReporter(
          writeReport: (_, __) => Future<void>.value(),
        ),
      ],
    (World world) => app.main(),
  );
}
