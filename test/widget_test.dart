// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:my_first_app/main.dart';
import 'package:my_first_app/services/app_state.dart';
import 'package:my_first_app/services/local_storage_service.dart';

void main() {
  testWidgets('Portfolio app loads the home screen', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final appState = AppState(LocalStorageService());
    await appState.load();

    await tester.pumpWidget(MyApp(appState: appState));

    expect(find.text('Deepak U K'), findsOneWidget);
    expect(find.text('Projects'), findsWidgets);
    expect(find.text('Settings'), findsOneWidget);
  });
}
