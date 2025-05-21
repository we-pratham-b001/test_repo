import 'package:advicer/data/data_sources/remote_data_source.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/repositories/advice_repositiry.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImpl implements AdviceRepo {

  final AdviceRemoteDataSource adviceRemoteDataSource =AdviceRemoteDataSourceImp();

  @override
  Future<Either<Failures, AdviceEntity>> getAdviceFromDataSource() async{
   final result = await adviceRemoteDataSource.getRandomAdviceFromApi();
    return right(result);
  }
}
