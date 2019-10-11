import 'package:assigment01/pages/homePage.dart';
// import 'package:assigment01/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'package:assigment01/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyHomePage());

    // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    Key customButton;
        await tester.tap(find.byKey(customButton));
    await tester.pump();

    // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    expect(find.text('Tested'), findsOneWidget);
  });
}
