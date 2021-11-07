import 'dart:async';

import 'package:cubit/third_screen/api/third_api.dart';
import 'package:dio/dio.dart';

class ThirdRepository {
  static final ThirdRepository _singletonUserRepository =
  ThirdRepository._internal();

  factory ThirdRepository() {
    return _singletonUserRepository;
  }

  ThirdRepository._internal();

  Future<dynamic> internetInfo(int page) async {
    return await ApiClient(Dio()).getInfo(page);
  }
}