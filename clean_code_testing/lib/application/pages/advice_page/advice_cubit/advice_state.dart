part of 'advice_cubit.dart';

sealed class AdviceCubitState extends Equatable {
  const AdviceCubitState();
  @override
  List<Object?> get props => [];
}

final class AdviceInitial extends AdviceCubitState {}

final class AdviceLoading extends AdviceCubitState {}

final class AdviceLoaded extends AdviceCubitState {
  final AdviceEntity advice;
  const AdviceLoaded({required this.advice});
  @override
  List<Object?> get props => [advice];
}

final class AdviceErrorState extends AdviceCubitState {
  final String errorMessage;
  const AdviceErrorState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
