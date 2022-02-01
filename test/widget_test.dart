// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:rrrflectly/service_locator.dart' as sl;
import 'package:rrrflectly/ui/screens/welcome/welcome_page.dart';
import 'package:rrrflectly/ui/screens/welcome/welcome_viewmodel_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget createWelcomePage() => ChangeNotifierProvider<WelcomeViewModelImpl>(
      create: (context) => WelcomeViewModelImpl(),
      child: const MaterialApp(
        home: WelcomePage(),
      ),
    );

void main() {
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await sl.init();
  });

  testWidgets('Welcome page widget test', (WidgetTester tester) async {
    await tester.pumpWidget(createWelcomePage());

    final helloFinder = find.text('Hi there');
    final welcomeFinder = find.text('Welcome');
    final ctaFinder = find.text("Let's go!");

    // Search for the childWidget in the tree and verify it exists.
    expect(helloFinder, findsOneWidget);
    expect(welcomeFinder, findsOneWidget);
    expect(ctaFinder, findsOneWidget);
  });
}
