import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'second_event.dart';
part 'second_state.dart';

class SecondBloc extends Bloc<SecondEvent, SecondState> {
  SecondBloc() : super(SecondInitial()) {
    on<SecondEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
