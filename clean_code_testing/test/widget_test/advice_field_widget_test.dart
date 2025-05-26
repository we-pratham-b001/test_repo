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

  group("AdviceField Tests", () {
    group('Text should be displayed correctly', () {

      testWidgets('when short text is given', (WidgetTester tester) async {
        final text = 'a';
        await tester.pumpWidget(widgetUnderTest(adviceText: text));
        await tester.pumpAndSettle();

        expect(find.textContaining('a'), findsOneWidget);
      });

      testWidgets('when long text is given', (WidgetTester tester) async {
        final text = 'this is a long text for the purpose of testing the advice field widget testing so i will just try to make the test as long as I can since a long Text is required';
        await tester.pumpWidget(widgetUnderTest(adviceText: text));
        await tester.pumpAndSettle();

        expect(find.textContaining('this is a long text'), findsOneWidget);
      });

      testWidgets('when no text is given', (WidgetTester tester) async {
        final text = '';
        await tester.pumpWidget(widgetUnderTest(adviceText: text));
        await tester.pumpAndSettle();

        expect(find.text('""'), findsOneWidget);

        final widget = tester.widget<AdviceField>(find.byType(AdviceField));
        expect(widget.advice.advice, '');
      });
    });
  });
}
