import 'package:advicer/data/repositories/advice_repo_impl.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  final adviceRepo = AdviceRepoImpl();

  Future<Either<Failures, AdviceEntity>> getAdvice()  {
    return adviceRepo.getAdviceFromDataSource();
  }
}
