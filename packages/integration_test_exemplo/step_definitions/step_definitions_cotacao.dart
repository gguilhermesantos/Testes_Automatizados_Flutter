import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import 'step_definitions_pedidos.dart';

class RemoverCotacao extends And1WithWorld<String, FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'opto por {String} para remover cotacao');

  @override
  Future<void> executeStep(String opcao) async {
    final appDriver = world.appDriver;
    final btnLixeira = find.byTooltip('Deletar Cotação');

    await appDriver.tap(btnLixeira);
    await appDriver.waitForAppToSettle();

    final opcaoRemoverCot = find.text(opcao);

    await appDriver.tap(opcaoRemoverCot);
  }
}

class CotacaoDeletada extends WhenWithWorld<FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'busco pela cotacao deletada');

  @override
  Future<void> executeStep() async {
    final appDriver = world.appDriver;
    final campo = find.byType(TextFormField);
    final btnLupa = find.byType(IconButton).first;
    final numeroBuscaDeletada = Global.numeroCotacao;

    await appDriver.tap(campo);
    await appDriver.enterText(campo, numeroBuscaDeletada);
    await appDriver.tap(btnLupa);

    this.expect(find.text('Pedido não encontrado!'), findsOneWidget);
  }
}

class ReabrindoCotacao extends When1WithWorld<String, FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'opto por {String}');

  @override
  Future<void> executeStep(String opcao) async {
    final appDriver = world.appDriver;
    final btneditar = find.byType(InkWell).first;

    await appDriver.tap(btneditar);

    if (await world.appDriver.isPresent(find.text('REABRIR'))) {
      final btnReabrir = find.text(opcao);

      await appDriver.tap(btnReabrir);
    }
    await world.appDriver.waitForAppToSettle();
  }
}
