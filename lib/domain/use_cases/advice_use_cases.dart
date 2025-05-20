import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  Future<Either<Failures, AdviceEntity>> getAdvice() async {
    await Future.delayed(Duration(seconds: 3), () {});
    // return right(
    //   AdviceEntity(
    //     advice:
    //         'Time is passing by like a hand waving from a train I wanted to be on',
    //     id: 1,
    //   ),
    // );
    
    return left(ServerFailure());
  }
}
