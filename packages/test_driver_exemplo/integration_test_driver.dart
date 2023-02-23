// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:integration_test/common.dart';
import 'package:integration_test/integration_test_driver.dart'
    as integration_test_driver;
import 'package:path/path.dart' as path;

Future<void> main() async {
  integration_test_driver.testOutputsDirectory = 'integration_test/reports';

  await _integrationDriver();
}

Future<void> _integrationDriver({
  Duration timeout = const Duration(minutes: 20),
}) async {
  final driver = await FlutterDriver.connect();
  final jsonResult = await driver.requestData(null, timeout: timeout);
  final response = Response.fromJson(jsonResult);

  await driver.close();

  if (response.allTestsPassed) {
    print('All tests passed.');
    await _writeGherkinReports(response.data);
    exit(0);
  } else {
    print('Failure Details:\n${response.formattedFailureDetails}');
    await _writeGherkinReports(response.data);
    exit(1);
  }
}

Future<void> _writeGherkinReports(Map<String, dynamic>? data) async {
  final reports =
      json.decode(data!['gherkin_reports'].toString()) as List<dynamic>;

  for (var i = 0; i < reports.length; i += 1) {
    final reportData = reports.elementAt(i) as List<dynamic>;

    await fs
        .directory(integration_test_driver.testOutputsDirectory)
        .create(recursive: true);
    final File file = fs.file(path.join(
      integration_test_driver.testOutputsDirectory,
      'cucumber_report.json',
    ));
    final String resultString = _encodeJson(reportData, true);
    await file.writeAsString(resultString);
  }
  await Process.run('node', ['integration_test/reports/html_generator.js']);
}

const JsonEncoder _prettyEncoder = JsonEncoder.withIndent('  ');

String _encodeJson(Object jsonObject, bool pretty) {
  return pretty ? _prettyEncoder.convert(jsonObject) : json.encode(jsonObject);
}
