import 'package:cubit/third_screen/entity/third_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'four_api.g.dart';

@RestApi(baseUrl: "https://rickandmortyapi.com/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/character/?name={name}')
  Future<ThirdModel> getPerson(@Path("name") String page);
}