part of 'second_bloc.dart';

@immutable
abstract class SecondEvent {
  const SecondEvent();
}

class IncrementEvent extends SecondEvent {
   const IncrementEvent();
}

class DecrementEvent extends SecondEvent {
   const DecrementEvent();
}
