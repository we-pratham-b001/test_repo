import 'package:advicer/application/pages/advice_page/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

abstract class OnCustomButtonTap {
  void call();
}

class MockOnCustomButtonTap extends Mock implements OnCustomButtonTap {}

void main() {
  Widget widgetUnderTest({Function()? callback}) {
    return MaterialApp(
      home: Scaffold(
        body: CustomButton(tap: callback),
      ),
    );
  }

  group('CustomButton Widget Tests', () {
    testWidgets('renders button with correct text', (WidgetTester tester) async {
      await tester.pumpWidget(widgetUnderTest(callback: () {}));
      final buttonLabelFinder = find.text('Get Advice');
      expect(buttonLabelFinder, findsOneWidget);
    });

    testWidgets('calls callback when button is tapped', (WidgetTester tester) async {
      final mockCallback = MockOnCustomButtonTap();

      await tester.pumpWidget(widgetUnderTest(callback: mockCallback));
      final customButtonFinder = find.byType(CustomButton);

      await tester.tap(customButtonFinder);
      await tester.pumpAndSettle();
      verify(mockCallback()).called(1);
    });
  });
}
