part of 'second_bloc.dart';

@immutable
abstract class SecondState {
  int mainValue;

  SecondState(this.mainValue);

  @override
  List<Object> get props => [mainValue];
}

class SecondInitial extends SecondState{
  SecondInitial(int mainValue) : super(mainValue);
}

class IncrementState extends SecondState {
  IncrementState(int mainValue) : super(mainValue);
}

class DecrementState extends SecondState {
  DecrementState(int mainValue) : super(mainValue);
}
