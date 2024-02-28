import 'dart:typed_data';

import 'package:cloud_craft_solution/data/client/graph_client.dart';
import 'package:dio/dio.dart';

class GraphRepository {
  static Future<Uint8List> getMyImage() async {
    try {
      final response = await GraphClient.dio
          .get("https://graph.microsoft.com/v1.0/me/photo/\$value");
      return response.data ?? Uint8List(0);
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }

  static Future<Uint8List> getUserImg(String email) async {
    try {
      final response = await GraphClient.dio
          .get("https://graph.microsoft.com/v1.0/users/$email/photo/\$value");
      return response.data ?? Uint8List(0);
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }
}
