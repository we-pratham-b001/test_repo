import 'package:advicer/application/pages/advice_page/widgets/advice_field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';

import '../test/data_tests/data_source/advice_remote_data_source_test.dart' as app;

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('tap custom button  new advice loaded', (){
    (widgetTester) async{
      app.main();
      expect(find.text('Tap the button below to get advice'), findsOneWidget);

      final customButtonFinder = find.text('Get Advice');
      await widgetTester.tap(customButtonFinder);
      await widgetTester.pumpAndSettle();
      expect(find.byType(AdviceField), findsOneWidget);
      expect(find.textContaining('" '), findsOneWidget);
      expect(find.textContaining(' "'), findsOneWidget);


    };
  });
}