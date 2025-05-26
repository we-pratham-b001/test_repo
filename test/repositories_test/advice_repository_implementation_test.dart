import 'package:advicer/data/data_sources/remote_data_source.dart';
import 'package:advicer/data/exceptions/exeptions.dart';
import 'package:advicer/data/models/adivce_model.dart';
import 'package:advicer/data/repositories/advice_repo_impl.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advice_repository_implementation_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRemoteDataSourceImp>()])
void main() {
  group('AdviceRepoImpl', () {
    late MockAdviceRemoteDataSourceImp mockAdviceRemoteDataSource;
    late AdviceRepoImpl adviceRepoImplTest;

    setUp(() {
      mockAdviceRemoteDataSource = MockAdviceRemoteDataSourceImp();
      adviceRepoImplTest = AdviceRepoImpl(
        adviceRemoteDataSource: mockAdviceRemoteDataSource,
      );
    });

    group('should return AdviceEntity', () {
      test('when AdviceRemoteDataSource returns AdviceModel', () async {
        final tAdviceModel = AdviceModel(advice: 'AdviceTest', id: 25);
        when(
          mockAdviceRemoteDataSource.getRandomAdviceFromApi(),
        ).thenAnswer((_) async => tAdviceModel);

        final result = await adviceRepoImplTest.getAdviceFromDataSource();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failures, AdviceModel>(tAdviceModel));
        verify(mockAdviceRemoteDataSource.getRandomAdviceFromApi()).called(1);
        verifyNoMoreInteractions(mockAdviceRemoteDataSource);
      });
    });

    group('should return Failure', () {
      test('ServerFailure when a ServerException is thrown', () async {
        when(
          mockAdviceRemoteDataSource.getRandomAdviceFromApi(),
        ).thenThrow(ServerException());
        final result = await adviceRepoImplTest.getAdviceFromDataSource();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
  });
}
