// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rhhs_app/main.dart';

void main() {
  testWidgets('Navigation smoke test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(const RHHSApp());
    await tester.pumpAndSettle();

    expect(find.widgetWithText(AppBar, 'Announcements'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.event));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(AppBar, 'Calendar'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.people));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(AppBar, 'Clubs'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.link));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(AppBar, 'Resources'), findsOneWidget);
  });
}
