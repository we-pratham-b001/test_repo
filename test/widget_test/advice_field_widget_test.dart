import 'package:advicer/application/pages/advice_page/widgets/advice_field.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget widgetUnderTest({required String adviceText}) {
    return MaterialApp(
      home: AdviceField(advice: AdviceEntity(advice: adviceText, id: 1)),
    );
  }

  ;

  group("Advice field Tests", () {
    group('Text should be displayed correctly', () {
      testWidgets('when Short Text is Given', (WidgetTester) async {
        final text = 'a';
        await WidgetTester.pumpWidget(widgetUnderTest(adviceText: 'a'));
        await WidgetTester.pumpAndSettle();

        final adviceFieldFinder = find.textContaining('a');
        expect(adviceFieldFinder, findsOneWidget);
      });
      testWidgets('when Long Text is Given', (WidgetTester) async {
        final text =
            'this is a long text for the purpose of testing the advice field widget testing so i will just try to make the test as long as I can since a long Text is required';
        await WidgetTester.pumpWidget(widgetUnderTest(adviceText: text));
        await WidgetTester.pumpAndSettle();

        final adviceFieldFinder = find.byType(AdviceField);
        expect(adviceFieldFinder, findsOneWidget);
      });

      testWidgets('when Long Text is Given', (WidgetTester) async {
        final text = '';
        await WidgetTester.pumpWidget(widgetUnderTest(adviceText: text));
        await WidgetTester.pumpAndSettle();

        final adviceFieldFinder = find.byType(AdviceField);
        expect(adviceFieldFinder, findsOneWidget);
      });
    });
  });
}
