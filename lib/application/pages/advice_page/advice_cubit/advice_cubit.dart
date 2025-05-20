import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failures.dart';
import 'package:advicer/domain/use_cases/advice_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceCubitState> {
  AdviceCubit() : super(AdviceInitial());

  void adviceRequested() async {
    final AdviceUseCases adviceUseCases = AdviceUseCases();
    emit(AdviceLoading());
    final adviceOrFailure = await adviceUseCases.getAdvice();
    adviceOrFailure.fold(
      (failures) =>
          emit(AdviceErrorState(errorMessage: 'Something went wrong!')),
      (adviceEntity) => emit(AdviceLoaded(advice: adviceEntity)),
    );
  }
}
