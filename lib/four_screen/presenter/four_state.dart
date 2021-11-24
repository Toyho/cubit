part of 'four_bloc.dart';

enum PostPersonStatus { initial, success, failure, notFound, loading }

@immutable
@JsonSerializable()
class FourState extends Equatable {

  const FourState({
    this.status = PostPersonStatus.initial,
    this.posts = const <Results>[],
  });

  final PostPersonStatus status;
  final List<Results> posts;

  FourState copyWith({
    PostPersonStatus? status,
    List<Results>? posts,
  }) {
    return FourState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
    );
  }

  @override
  List<Object?> get props => [status, posts];

  factory FourState.fromJson(Map<String, dynamic> json) =>
      _$FourStateFromJson(json);

  Map<String, dynamic> toJson() => _$FourStateToJson(this);

}
