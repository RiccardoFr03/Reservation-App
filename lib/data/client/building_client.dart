import 'package:cloud_craft_solution/data/config.dart';
import 'package:cloud_craft_solution/data/interceptors/erro_interceptor.dart';
import 'package:cloud_craft_solution/data/interceptors/token_interceptor.dart';
import 'package:dio/dio.dart';

class BuildingClient {
  static final options = BaseOptions(
    baseUrl: "$azureUrl/Building/all/active",
    contentType: "application/json; charset=UTF-8",
  );

  static Dio get dio {
    final Dio dio = Dio(options);
    dio.interceptors.addAll([
      TokenInterceptor(),
      ErrorInterceptor(),
      LogInterceptor(requestBody: true, responseBody: true),
    ]);
    return dio;
  }
}
