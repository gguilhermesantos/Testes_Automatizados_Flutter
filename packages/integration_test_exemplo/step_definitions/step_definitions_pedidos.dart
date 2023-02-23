import 'package:app_vendedor/modules/quotes/components/quotes_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

class AcessoOpcao extends And1WithWorld<String, FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'acessa {String}');

  @override
  Future<void> executeStep(String opcao) async {
    final appDriver = world.appDriver;
    final opcaoPedidos = find.text(opcao);
    Global.paginaAcesso = opcao;
    await appDriver.tap(opcaoPedidos);
  }
}

class FiltroPedidos extends When2WithWorld<String, String, FlutterWorld> {
  @override
  RegExp get pattern =>
      RegExp(r'busco por {String} usando a opcao de {String}');

  @override
  Future<void> executeStep(String numeroBusca, String filtroBusca) async {
    final appDriver = world.appDriver;

    switch (filtroBusca) {
      case 'Pedidos':
      case 'Cotacao':
        final btnRadio = (find
                .byWidgetPredicate((widget) => widget is Radio<int>)
                .first
                .evaluate()
                .single
                .widget as Radio<int>)
            .groupValue;
        this.expect(btnRadio, 0);
        break;
      case 'Cliente':
        await appDriver
            .tap(find.byWidgetPredicate((widget) => widget is Radio<int>).last);
        break;
      default:
        debugPrint('Texto não identificado');
        return;
    }

    final campo = find.byType(TextFormField);
    final btnLupa = find.byType(IconButton).first;
    if (numeroBusca == 'primeira_cotacao') {
      final cardCotacao = find.byType(QuoteCard).first;
      final textoCotacao = (cardCotacao.evaluate().single.widget as QuoteCard)
          .quote
          .salesForceBusinessDocumentNumber;

      numeroBusca = textoCotacao.toString();
      Global.numeroCotacao = numeroBusca;
    }

    await appDriver.tap(campo);
    await appDriver.enterText(campo, numeroBusca);
    await appDriver.tap(btnLupa);

    if (Global.paginaAcesso == 'Pedidos') {
      final card = find.byType(Column).last;

      await appDriver.tap(card);
    }
  }
}

abstract class Global {
  static String numeroCotacao = '';
  static String paginaAcesso = '';
  static String dataFinalCalendario = '';
  static String dataInicioCalendario = '';
}
