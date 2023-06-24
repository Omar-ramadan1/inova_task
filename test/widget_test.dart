// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:inova_task/main.dart';

void main() {
  testWidgets('test textfield', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    final enterEmail = find.byKey(ValueKey("TextField"));
    final button = find.byKey(ValueKey("button"));
    // Verify that our counter starts at 0.


    // sorry i have no time for complete test
    
    await tester.pumpWidget(const MyApp());
    await tester.enterText(enterEmail, "omar@gmail.com");
    await tester.tap(button);

    

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();




  });
}
