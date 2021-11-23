part of 'main_cubit.dart';

@JsonSerializable()
class MainState{
  int mainValue;
  bool isIncrementNumber;

  MainState({required this.mainValue, this.isIncrementNumber = false});

  factory MainState.fromJson(Map<String, dynamic> json) =>
      _$MainStateFromJson(json);

  Map<String, dynamic> toJson() => _$MainStateToJson(this);

}
