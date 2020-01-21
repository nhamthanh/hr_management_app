// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hr_management_app/app/app.dart';
import 'package:hr_management_app/app/config/api_config.dart';

import 'package:hr_management_app/main.dart';

void main() {

  const ApiConfig apiConfig = ApiConfig(
    appName: 'HR',
    flavorName: 'dev',
    apiBaseUrl: 'https://api.hr-dev.zamo.io/api/',
    momoMerchantName: 'Zamo LLC',
    momoMerchantCode: 'MOMOS9HI20191019',
    momoPartnerCode: 'MOMOS9HI20191019',
    momoAppScheme: 'momos9hi20191019'
  );

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App(apiConfig: apiConfig,));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
