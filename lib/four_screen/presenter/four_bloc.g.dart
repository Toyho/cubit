// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'four_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FourState _$FourStateFromJson(Map<String, dynamic> json) => FourState(
      status: $enumDecodeNullable(_$PostPersonStatusEnumMap, json['status']) ??
          PostPersonStatus.initial,
      posts: (json['posts'] as List<dynamic>?)
              ?.map((e) => Results.fromJson(e))
              .toList() ??
          const <Results>[],
    );

Map<String, dynamic> _$FourStateToJson(FourState instance) => <String, dynamic>{
      'status': _$PostPersonStatusEnumMap[instance.status],
      'posts': instance.posts,
    };

const _$PostPersonStatusEnumMap = {
  PostPersonStatus.initial: 'initial',
  PostPersonStatus.success: 'success',
  PostPersonStatus.failure: 'failure',
  PostPersonStatus.notFound: 'notFound',
  PostPersonStatus.loading: 'loading',
};
