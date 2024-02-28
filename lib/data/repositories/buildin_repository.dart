import 'package:cloud_craft_solution/data/client/building_client.dart';
import 'package:cloud_craft_solution/domain/models/building_model.dart';
import 'package:dio/dio.dart';

class BuildingRepository {
  static Future<List<BuildingModel>> getAllBuilding() async {
    try {
      final response = await BuildingClient.dio.get("");
      Iterable data = response.data;
      final result = data.map((e) => BuildingModel.fromJson(e)).toList();
      return result;
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }
}
