import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cubit/four_screen/repository/four_repository.dart';
import 'package:cubit/third_screen/entity/third_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';


part 'four_event.dart';
part 'four_state.dart';
part 'four_bloc.g.dart';

class FourBloc extends HydratedBloc<FourEvent, FourState> {

  FourBloc() : super(const FourState()) {
    on<PostFetched>(_onPostFetched);
  }
  Future<void> _onPostFetched(PostFetched event, Emitter<FourState> emit) async {
    try {
      emit(
          state.copyWith(
            status: PostPersonStatus.loading,
          )
      );
      ThirdModel posts = await FourRepository().internetInfo(event.data);
      emit(
          state.copyWith(
            status: PostPersonStatus.success,
            posts: posts.results,
          )
      );
    } on DioError catch (_) {
      if(_.response!.statusCode == 404){
        emit(state.copyWith(status: PostPersonStatus.notFound));
      }else{
        emit(state.copyWith(status: PostPersonStatus.failure));
      }
    }
  }

  @override
  FourState? fromJson(Map<String, dynamic> json) => FourState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(FourState state) => state.toJson();

}
