import 'package:cloud_craft_solution/data/client/room_client.dart';
import 'package:cloud_craft_solution/domain/models/room_model.dart';
import 'package:dio/dio.dart';

class RoomRepository {
  static Future<List<RoomModel>> getAllRoom() async {
    try {
      final response = await RoomClient.dio.get("");
      Iterable data = response.data;
      final result = data.map((e) => RoomModel.fromJson(e)).toList();
      return result;
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }
}
