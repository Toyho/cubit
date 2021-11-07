import 'package:cubit/third_screen/entity/third_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'third_api.g.dart';

@RestApi(baseUrl: "https://rickandmortyapi.com/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/character/?page={page}')
  Future<ThirdModel> getInfo(@Path("page") int page);
}