import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/main.dart';

void main() {

  testWidgets(
    'Nexus Calculator loads correctly',
        (WidgetTester tester) async {

      await tester.pumpWidget(
        const NexusCalc(),
      );

      expect(
        find.text('NEXUS CALC'),
        findsOneWidget,
      );
    },
  );
}