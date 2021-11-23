import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_state.dart';
part 'main_cubit.g.dart';

class MainCubit extends HydratedCubit<MainState> {
  MainCubit() : super(MainState(mainValue: 0));

  void increment() => emit(MainState(mainValue: state.mainValue + 1, isIncrementNumber: true));
  void decrement() => emit(MainState(mainValue: state.mainValue - 1, isIncrementNumber: false));

  @override
  MainState fromJson(Map<String, dynamic> json) =>
      MainState.fromJson(json);

  @override
  Map<String, dynamic> toJson(MainState state) => state.toJson();


}
