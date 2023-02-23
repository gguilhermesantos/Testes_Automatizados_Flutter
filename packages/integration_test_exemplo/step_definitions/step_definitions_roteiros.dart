import 'package:app_vendedor/modules/itinerary/itinerary_controller.dart';
import 'package:app_vendedor/modules/itinerary/pages/create_route/create_route_controller.dart';
import 'package:app_vendedor/modules/suggested_order/pages/info_order/edit_header/components/customer_receiver_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'step_definitions_pedidos.dart';

class AcessoCalendario extends AndWithWorld<FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'acesso o calendario');

  @override
  Future<void> executeStep() async {
    final appDriver = world.appDriver;

    await appDriver.tap(find.byTooltip('Selecione um dia ou um período'));
    await appDriver.waitForAppToSettle();
  }
}

class AcessoPeriodo extends WhenWithWorld<FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'eu seleciono um periodo de data');

  @override
  Future<void> executeStep() async {
    final appDriver = world.appDriver;

    final now = DateTime.now();
    final initialDate = now.subtract(Duration(days: 5));

    await appDriver.tap(find.text('CANCELAR'));

    final controller = Modular.get<ItineraryController>();
    controller.changeDate(
      DateRangePickerSelectionChangedArgs(
        PickerDateRange(
          initialDate,
          now,
        ),
      ),
    );

    controller.selectedFilter();
    Global.dataInicioCalendario = initialDate.day.toString();
    Global.dataFinalCalendario = now.day.toString();
  }
}

class AcessoNovaRota extends When1WithWorld<String, FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'acesso nova rota com cliente {String}');

  @override
  Future<void> executeStep(String cliente) async {
    final appDriver = world.appDriver;

    await appDriver.tap(find.text('ADICIONAR NOVA ROTA'));
    await appDriver.waitForAppToSettle();

    final campoCliente = find.byType(CustomerReceiverForm);
    final campoData = find.byType(TextFormField).last;

    await appDriver.tap(find.text('Cliente recebedor'));
    await appDriver.enterText(campoCliente, cliente);
    await appDriver.waitForAppToSettle();
    await appDriver.tap(find.byType(Flexible).first);
    await appDriver.waitForAppToSettle();
    await appDriver.tap(campoData);

    final now = DateTime.now();
    final today = now.add(Duration(days: 0));
    final controller = Modular.get<CreateRouteController>();

    controller.setDate(
      DateRangePickerSelectionChangedArgs(today),
    );

    await appDriver.waitForAppToSettle();
    await appDriver.tap(find.text('SELECIONAR'));
    await appDriver.waitForAppToSettle();
    await appDriver.tap(find.text('ADICIONAR AO ROTEIRO'));
    await appDriver.waitForAppToSettle();
    await appDriver.tap(find.text('VOLTAR PARA O ROTEIRO'));
    await appDriver.waitForAppToSettle();
  }
}

class AcessoCotacao extends WhenWithWorld<FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'acesso a cotacao');

  @override
  Future<void> executeStep() async {
    final appDriver = world.appDriver;

    debugPrint('Global.dataInicioCalendario');
    await appDriver.tap(find.text('Nova rota').last);
    await appDriver.tap(find.text('ADICIONAR NOVA COTAÇÃO'));
    await appDriver.waitForAppToSettle();
  }
}

class AcessoPaginaCotacoes extends WhenWithWorld<FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'acesso pagina de cotacoes');

  @override
  Future<void> executeStep() async {
    final appDriver = world.appDriver;
    await appDriver.tap(find.text('Nova rota').first);
    await appDriver.waitForAppToSettle();
  }
}

class AdminCliente extends WhenWithWorld<FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'paro administracao de cliente');

  @override
  Future<void> executeStep() async {
    final appDriver = world.appDriver;
    this.expect(find.text('Você está administrando:'), findsOneWidget);
    await appDriver.tap(find.text('Parar'));
  }
}

class AdminCotacaoLista extends WhenWithWorld<FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'acesso uma cotacao da lista');

  @override
  Future<void> executeStep() async {
    final appDriver = world.appDriver;
    if (await appDriver.isPresent(find.text('ADICIONAR NOVA COTAÇÃO'))) {
      await appDriver.tap(find.text('ADICIONAR NOVA COTAÇÃO'));
    } else {
      await appDriver.tap(find.text('CONTINUAR EDITANDO'));
      await appDriver.waitForAppToSettle();
      await appDriver.tap(find.text('SALVAR DEFINIÇÕES'));
      await appDriver.waitForAppToSettle();
      await appDriver.tap(find.text('CONFIRMAR'));
      await appDriver.waitForAppToSettle();
      await appDriver.tap(find.text('OK'));
    }
    await appDriver.waitForAppToSettle();
  }
}

class DeletaCotacaoLista extends WhenWithWorld<FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r'deleto uma rota da lista');

  @override
  Future<void> executeStep() async {
    final appDriver = world.appDriver;
    await appDriver.waitForAppToSettle();
    this.expect(find.text('Roteiro'), findsOneWidget);
    await appDriver.tap(find.byIcon(Icons.delete_outline_outlined).first);
    await appDriver.waitForAppToSettle();
    this.expect(
      find.text('Esta Rota será excluida.\nDeseja continuar?'),
      findsOneWidget,
    );
    await appDriver.tap(find.text('CONTINUAR'));
    await appDriver.waitForAppToSettle();
  }
}
