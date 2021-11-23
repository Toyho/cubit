// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'third_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThirdState _$ThirdStateFromJson(Map<String, dynamic> json) => ThirdState(
      status: $enumDecodeNullable(_$PostStatusEnumMap, json['status']) ??
          PostStatus.initial,
      posts: (json['posts'] as List<dynamic>?)
              ?.map((e) => Results.fromJson(e))
              .toList() ??
          const <Results>[],
      hasReachedMax: json['hasReachedMax'] as bool? ?? false,
      currentPage: json['currentPage'] as int? ?? 1,
    );

Map<String, dynamic> _$ThirdStateToJson(ThirdState instance) =>
    <String, dynamic>{
      'status': _$PostStatusEnumMap[instance.status],
      'posts': instance.posts,
      'hasReachedMax': instance.hasReachedMax,
      'currentPage': instance.currentPage,
    };

const _$PostStatusEnumMap = {
  PostStatus.initial: 'initial',
  PostStatus.success: 'success',
  PostStatus.failure: 'failure',
};
