import 'package:advicer/data/repositories/advice_repo_impl.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/repositories/advice_repositiry.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  AdviceUseCases({required this.adviceRepo});
  final AdviceRepo adviceRepo ;

  Future<Either<Failures, AdviceEntity>> getAdvice()  {
    return adviceRepo.getAdviceFromDataSource();
  }
}
