part of 'four_bloc.dart';

@immutable
abstract class FourEvent {}

class PostFetched extends FourEvent {
  final String data;

  PostFetched(this.data);
}