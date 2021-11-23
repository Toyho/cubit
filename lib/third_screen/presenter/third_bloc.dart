import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cubit/third_screen/entity/third_model.dart';
import 'package:cubit/third_screen/repository/third_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'third_event.dart';
part 'third_state.dart';
part 'third_bloc.g.dart';

class ThirdBloc extends HydratedBloc<ThirdEvent, ThirdState> {

  ThirdBloc() : super(const ThirdState()) {
    on<PostFetched>(_onPostFetched);
  }
  Future<void> _onPostFetched(PostFetched event, Emitter<ThirdState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status ==  PostStatus.initial) {
        ThirdModel posts = await ThirdRepository().internetInfo(state.currentPage);
        return emit(state.copyWith(
          status: PostStatus.success,
          posts: posts.results,
          hasReachedMax: false,
          currentPage: state.currentPage + 1,
        ));
      }
      ThirdModel posts = await ThirdRepository().internetInfo(state.currentPage);
      posts.results!.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
        state.copyWith(
          status: PostStatus.success,
          posts: List.of(state.posts)..addAll(posts.results as Iterable<Results>),
          hasReachedMax: posts.info!.next == null ? true : false,
          currentPage: state.currentPage + 1,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  @override
  ThirdState? fromJson(Map<String, dynamic> json) => ThirdState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ThirdState state) => state.toJson();
}
