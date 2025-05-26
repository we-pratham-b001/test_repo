import 'package:advicer/application/pages/advice_page/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
   Widget widgetUnderTest(Function()? onTap){
     return MaterialApp(
       home: Scaffold(
         body: CustomButton(
           tap: onTap,
         ),
       )
     );
   }
   
   group('Golden test', (){
     group("Custom",(){
       testWidgets('is enabled', (WidgetTester)async{
         await WidgetTester.pumpWidget(widgetUnderTest((){}));
       await expectLater(find.byType(CustomButton), matchesGoldenFile("key"));
       });
     });
   });
}