import 'package:advicer/data/data_sources/remote_data_source.dart';
import 'package:advicer/data/exceptions/exeptions.dart';
import 'package:advicer/data/models/adivce_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advice_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  group("Advice remote Data Source Test", () {
    group('this should return AdviceModel', () {
      test('Client response code is 200 and data is valid data', () async {
        MockClient mockClient = MockClient();
        AdviceRemoteDataSource adviceRemoteDataSourceTest =
            AdviceRemoteDataSourceImp(client: mockClient);
        final responseBody = '{"advice":"test_advice","advice_id" : 2}';
        when(
          mockClient.get(
            Uri.parse('https://api.flutter-community.de/api/v1/advice'),
            headers: {'content-type': 'application/json'},
          ),
        ).thenAnswer(
          (realInvocation) => Future.value(http.Response(responseBody, 200)),
        );
        final result =
            await adviceRemoteDataSourceTest.getRandomAdviceFromApi();
        expect(result, AdviceModel(advice: "test_advice", id: 2));
      });
    });

    group('throw Exception Test', () {
      test(" throw Server Exception when status code is no 200", () {
        final mockClient = MockClient();
        final adviceRemoteDataSourceTest = AdviceRemoteDataSourceImp(
          client: mockClient,
        );

        when(
          mockClient.get(
            Uri.parse('https://api.flutter-community.de/api/v1/advice'),
            headers: {'content-type': 'application/json'},
          ),
        ).thenAnswer((realInvocation) => Future.value(http.Response('', 201)));
        expect(
          () => adviceRemoteDataSourceTest.getRandomAdviceFromApi(),
          throwsA(isA<ServerException>()),
        );
      });
    });
  });
}
