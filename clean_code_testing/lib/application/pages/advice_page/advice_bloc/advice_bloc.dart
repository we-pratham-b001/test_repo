import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc() : super(AdviceInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdviceLoading());
      await Future.delayed(Duration(seconds: 5), () {});
      emit(
        AdviceLoaded(
          advice:
              'Time is passing by like a hand waving from a train I wanted to be on',
        ),
      );
    });
  }
}
