import 'dart:convert';
import 'package:cloud_craft_solution/data/client/auth_client.dart';
import 'package:cloud_craft_solution/data/client/user_client.dart';
import 'package:cloud_craft_solution/data/config.dart';
import 'package:cloud_craft_solution/domain/id_token.dart';
import 'package:cloud_craft_solution/domain/models/login_model.dart';
import 'package:cloud_craft_solution/domain/models/register_model.dart';
import 'package:cloud_craft_solution/domain/oauth_config.dart';
import 'package:cloud_craft_solution/domain/token.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AuthRepository {
  static var log = Logger();
  static Future<void> login(LoginModel model) async {
    try {
      final response = await AuthClient.dio.post(
        "/SignIn",
        data: jsonEncode(model.toJson()),
      );
      final result = response.data["token"];
      Token.saveToken(result);
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }

  static Future<void> register(RegisterModel model) async {
    try {
      await AuthClient.dio.post(
        "/SignUp",
        data: jsonEncode(model.toJson()),
      );
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }

  static Future<void> saveUser() async {
    try {
      await UserClient.dio.post("${azureUrl}User/create");
    } on DioException catch (e) {
      throw e.error as Object;
    }
  }

  static void logout(BuildContext context) {
    Token.removeToken();
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  static Future<void> azureLogin() async {
    try {
      final result = await OauthConfig.aadOAuth.login();
      result.fold(
        (failure) => throw Exception(failure.message),
        (token) => log.i(
          'Logged in successfully, your access token: ${token.accessToken}',
        ),
      );
      final token = await OauthConfig.aadOAuth.getAccessToken();
      final idToken = await OauthConfig.aadOAuth.getIdToken();
      Token.saveToken(token!);
      IdToken.saveToken(idToken!);
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }

  static Future<void> azureLogout() async {
    Token.removeToken();
    await OauthConfig.aadOAuth.logout();
  }
}
