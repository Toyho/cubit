import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'second_event.dart';
part 'second_state.dart';

class SecondBloc extends Bloc<SecondEvent, SecondState> {

  SecondBloc() : super(SecondInitial(0)) {
    IncrementState(state.mainValue + 1);

    on<IncrementEvent>((event, emit) => emit(IncrementState(state.mainValue + 1)));
    on<DecrementEvent>((event, emit) => emit(DecrementState(state.mainValue + 1)));

  }
}
