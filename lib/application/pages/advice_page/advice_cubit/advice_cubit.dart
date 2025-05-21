import 'package:advicer/data/data_sources/remote_data_source.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/use_cases/advice_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceCubitState> {
  final AdviceUseCases adviceUseCases ;
  AdviceCubit({required this.adviceUseCases}) : super(AdviceInitial());
  void adviceRequested() async {
    emit(AdviceLoading());
    final adviceOrFailure = await adviceUseCases.getAdvice();
    adviceOrFailure.fold(
      (failures) =>
          emit(AdviceErrorState(errorMessage: errorMessage(failures))),
      (adviceEntity) => emit(AdviceLoaded(advice: adviceEntity)),
    );
  }

  String errorMessage(Failures failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Can't connect to the server at the moment";
      case CacheFailure:
        return "Cache Failed please try again";
      default:
        return "Something went wrong!";
    }
  }
}
