import 'package:cloud_craft_solution/domain/exeptions/exeptions.dart';
import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.response?.statusCode) {
      case 400:
        throw AlreadyExist(message: "Questo account esiste già!");
      case 401:
        throw Unauthorized(message: "Credenziali errate!");
      default:
        throw GenericError(message: "Qualcosa è andato storto!");
    }
  }
}
