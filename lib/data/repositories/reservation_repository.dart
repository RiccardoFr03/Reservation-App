import 'dart:convert';

import 'package:cloud_craft_solution/data/client/reservation_client.dart';
import 'package:cloud_craft_solution/data/config.dart';
import 'package:cloud_craft_solution/domain/models/get_free_desk_model.dart';
import 'package:cloud_craft_solution/domain/models/post_reservation_model.dart';
import 'package:cloud_craft_solution/domain/models/put_reservation_model.dart';
import 'package:cloud_craft_solution/domain/models/reservation_date_model.dart';
import 'package:cloud_craft_solution/domain/models/room_model.dart';
import 'package:cloud_craft_solution/domain/models/user_reservation_by_day_model.dart';
import 'package:cloud_craft_solution/domain/models/user_reservation_model.dart';
import 'package:dio/dio.dart';

class ReservationRepository {
  static Future<List<UserReservationModel>> getReservationByUserId(
      int id) async {
    try {
      final queryParams = {
        'id': "$id",
      };
      final response = await ReservationClient.dio.get(
          "${azureUrl}Reservation/GetAllByUser",
          queryParameters: queryParams);
      Iterable data = response.data;
      final result = data.map((e) => UserReservationModel.fromJson(e)).toList();
      return result;
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }

  static Future<List<UserReservationByDay>>
      getReservationByUserIdByDate() async {
    try {
      final response = await ReservationClient.dio
          .get("${azureUrl}Reservation/all/active/day");

      Iterable data = response.data;
      final result = data.map((e) => UserReservationByDay.fromJson(e)).toList();
      return result;
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }

  static Future<void> deleteReservation(int id) async {
    try {
      await ReservationClient.dio.delete("${azureUrl}Reservation/delete/$id");
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }

  static Future<void> postReservation(PostReservationModel model) async {
    try {
      await ReservationClient.dio.post("${azureUrl}Reservation/create",
          data: jsonEncode(model.toJson()));
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }

  static Future<void> endReservation(int id) async {
    try {
      await ReservationClient.dio.put("${azureUrl}Reservation/endnow/$id");
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }

  static Future<void> editReservationName(PutReservationModel model) async {
    try {
      await ReservationClient.dio
          .put("${azureUrl}Reservation", data: jsonEncode(model.toJson()));
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }

  static Future<List<RoomModel>> getAllFreeRoom(
      ReservatiDateModel model) async {
    try {
      final response = await ReservationClient.dio.post(
          "${azureUrl}Room/all/active/room/available",
          data: jsonEncode(model.toJson()));
      Iterable data = response.data;
      final result = data.map((e) => RoomModel.fromJson(e)).toList();
      return result;
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }

  static Future<GetFreeDeskModel> getAllFreeDesk(
      ReservatiDateModel model) async {
    try {
      final response = await ReservationClient.dio.post(
          "${azureUrl}Room/all/active/desk/available",
          data: jsonEncode(model.toJson()));

      final result = GetFreeDeskModel.fromJson(response.data);
      return result;
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }
}
