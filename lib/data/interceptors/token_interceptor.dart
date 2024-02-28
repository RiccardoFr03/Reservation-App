import 'package:cloud_craft_solution/domain/id_token.dart';
import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    IdToken.getToken().then((value) {
      options.headers["Authorization"] = "Bearer $value";
    });
    super.onRequest(options, handler);
  }
}
