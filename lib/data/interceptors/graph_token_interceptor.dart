import 'package:cloud_craft_solution/domain/token.dart';
import 'package:dio/dio.dart';

class GraphTokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Token.getToken().then((value) {
      options.headers["Authorization"] = "Bearer $value";
    });
    super.onRequest(options, handler);
  }
}
