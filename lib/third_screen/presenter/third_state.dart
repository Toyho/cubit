part of 'third_bloc.dart';

enum PostStatus { initial, success, failure }

@immutable
@JsonSerializable()
class ThirdState extends Equatable{

  const ThirdState({
    this.status = PostStatus.initial,
    this.posts = const <Results>[],
    this.hasReachedMax = false,
    this.currentPage = 1,
  });

  final PostStatus status;
  final List<Results> posts;
  final bool hasReachedMax;
  final int currentPage;

  ThirdState copyWith({
    PostStatus? status,
    List<Results>? posts,
    bool? hasReachedMax,
    int? currentPage,
  }) {
    return ThirdState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage!,
    );
  }

  @override
  List<Object?> get props => [status, posts, hasReachedMax];

  factory ThirdState.fromJson(Map<String, dynamic> json) =>
      _$ThirdStateFromJson(json);

  Map<String, dynamic> toJson() => _$ThirdStateToJson(this);

}
