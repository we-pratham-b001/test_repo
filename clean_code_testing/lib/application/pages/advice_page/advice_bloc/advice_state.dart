part of 'advice_bloc.dart';

@immutable
sealed class AdviceState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AdviceInitial extends AdviceState {}

final class AdviceLoading extends AdviceState {}

final class AdviceLoaded extends AdviceState {
  final String advice;
  AdviceLoaded({required this.advice});
  @override
  List<Object?> get props => [advice];
}

final class AdviceErrorState extends AdviceState {
  final String errorMessage;
  AdviceErrorState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
