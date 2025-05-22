import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:advicer/application/pages/advice_page/advice_cubit/advice_cubit.dart';
import 'package:advicer/data/data_sources/remote_data_source.dart';
import 'package:advicer/data/repositories/advice_repo_impl.dart';
import 'package:advicer/domain/repositories/advice_repositiry.dart';
import 'package:advicer/domain/use_cases/advice_use_cases.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

Future<void> init() async {
  sl.registerFactory(() => AdviceCubit(adviceUseCases: sl()));

  sl.registerFactory(() => AdviceUseCases(adviceRepo: sl()));

  sl.registerFactory<AdviceRepo>(
    () => AdviceRepoImpl(adviceRemoteDataSource: sl()),
  );
  sl.registerFactory<AdviceRemoteDataSource>(
    () => AdviceRemoteDataSourceImp(client: sl()),
  );
  sl.registerFactory(() => http.Client());
}
