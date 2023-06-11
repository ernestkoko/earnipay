import 'package:earnipay/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing App', () {
    testWidgets('Earnipay integration  test', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.text('Photos'), findsOneWidget);
      await tester.pumpAndSettle();

    });
  });
}