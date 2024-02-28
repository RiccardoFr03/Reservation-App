import 'package:cloud_craft_solution/data/interceptors/erro_interceptor.dart';
import 'package:cloud_craft_solution/data/interceptors/graph_token_interceptor.dart';
import 'package:dio/dio.dart';

class GraphClient {
  static final options = BaseOptions(

    responseType: ResponseType.bytes,
  );

  static Dio get dio {
    final Dio dio = Dio(options);
    dio.interceptors.addAll([
      GraphTokenInterceptor(),
      ErrorInterceptor(),
      LogInterceptor(requestBody: true, responseBody: true),
    ]);
    return dio;
  }
}
