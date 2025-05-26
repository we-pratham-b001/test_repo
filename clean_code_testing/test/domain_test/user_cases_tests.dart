import 'package:advicer/data/repositories/advice_repo_impl.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/use_cases/advice_use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../repositories_test/advice_repository_implementation_test.mocks.dart';
import 'user_cases_tests.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRepoImpl>()])
void main() {
  group("Advice Use Cases", () {
    group('Should Return Advice Entity', () {
      test('when adviceRepoImpl returns a Advice model', () async {
        final mockAdviceRepoImpl = MockAdviceRepoImpl();
        final adviceUseCaseTest = AdviceUseCases(
          adviceRepo: mockAdviceRepoImpl,
        );

        when(mockAdviceRepoImpl.getAdviceFromDataSource()).thenAnswer(
          (_) async => const Right(AdviceEntity(advice: 'test', id: 25)),
        );

        final result = await adviceUseCaseTest.getAdvice();

        expect(result.isRight(), true);
        expect(result.isLeft(), false);
        expect(
          result,
          const Right<Failures, AdviceEntity>(
            AdviceEntity(advice: 'test', id: 25),
          ),
        );

        verify(mockAdviceRepoImpl.getAdviceFromDataSource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepoImpl);
      });
    });

    group('Should Return Failures', () {
      test('Server Failure', () async {
        final mockAdviceRepoImpl = MockAdviceRepoImpl();
        final adviceUseCaseTest = AdviceUseCases(
          adviceRepo: mockAdviceRepoImpl,
        );

        when(
          mockAdviceRepoImpl.getAdviceFromDataSource(),
        ).thenAnswer((_) async => Left(ServerFailure()));

        final result = await adviceUseCaseTest.getAdvice();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failures, AdviceEntity>(ServerFailure()));

        verify(mockAdviceRepoImpl.getAdviceFromDataSource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepoImpl);
      });

      test('General Failure', () async {
        final mockAdviceRepoImpl = MockAdviceRepoImpl();
        final adviceUseCaseTest = AdviceUseCases(
          adviceRepo: mockAdviceRepoImpl,
        );

        when(
          mockAdviceRepoImpl.getAdviceFromDataSource(),
        ).thenAnswer((_) async => Left(GeneralFailure()));

        final result = await adviceUseCaseTest.getAdvice();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failures, AdviceEntity>(GeneralFailure()));

        verify(mockAdviceRepoImpl.getAdviceFromDataSource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepoImpl);
      });
    });
  });
}
