import 'dart:async';

import 'package:cubit/four_screen/api/four_api.dart';
import 'package:dio/dio.dart';

class FourRepository {
  static final FourRepository _singletonUserRepository =
  FourRepository._internal();

  factory FourRepository() {
    return _singletonUserRepository;
  }

  FourRepository._internal();

  Future<dynamic> internetInfo(String namePerson) async {
    return await ApiClient(Dio()).getPerson(namePerson);
  }
}