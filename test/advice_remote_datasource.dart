import 'package:advicer/data/data_sources/remote_data_source.dart';
import 'package:advicer/data/exceptions/exeptions.dart';
import 'package:advicer/data/models/adivce_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'advice_remote_datasource.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  group('AdviceRemoteDatasource', () {
    group('should return AdviceModel', () {
      test('when client\'s response is 200 and data is valid', () async {
        final mockClient = MockClient();
        final adviceRemoteDataSourceUnderTest = AdviceRemoteDataSourceImp(
          client: mockClient,
        );
        final responseBody = '{"advice": "test advice", "advice_id": 1}';

        when(
          mockClient.get(
            Uri.parse('https://api.flutter-community.de/api/v1/advice'),
            headers: {'content-type': 'application/json'},
          ),
        ).thenAnswer((_) async => http.Response(responseBody, 200));

        final result =
        await adviceRemoteDataSourceUnderTest.getRandomAdviceFromApi();

        expect(result, AdviceModel(advice: "test advice", id: 1));
      });
    });

    group('should throw', () {
      test('a ServerException when response code is NOT 200', () async {
        final mockClient = MockClient();
        final adviceRemoteDataSourceUnderTest =
        AdviceRemoteDataSourceImp(client: mockClient);

        when(
          mockClient.get(
            Uri.parse('https://api.flutter-community.de/api/v1/advice'),
            headers: {'content-type': 'application/json'},
          ),
        ).thenAnswer((_) async => http.Response('', 201)); // not 200

        expect(
              () => adviceRemoteDataSourceUnderTest.getRandomAdviceFromApi(),
          throwsA(isA<ServerException>()),
        );
      });
    });
  });
}

