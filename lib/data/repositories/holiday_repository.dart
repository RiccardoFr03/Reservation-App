import 'package:cloud_craft_solution/data/client/holiday_client.dart';
import 'package:cloud_craft_solution/data/config.dart';
import 'package:cloud_craft_solution/domain/models/holiday_model.dart';
import 'package:dio/dio.dart';

class HolidayRepository {
  static Future<List<HolidayModel>> getAllHoliday() async {
    try {
      final response = await HolidayClient.dio.get("${azureUrl}Event/all");
      Iterable data = response.data;
      final result = data.map((e) => HolidayModel.fromJson(e)).toList();
      return result;
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }
}
