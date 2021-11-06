import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(mainValue: 0));

  void increment() => emit(MainState(mainValue: state.mainValue + 1, isIncrementNumber: true));
  void decrement() => emit(MainState(mainValue: state.mainValue - 1, isIncrementNumber: false));
}
