import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

abstract class AppHttp {
  Dio http = Dio();

  Future<Map<String, dynamic>> getHeader() async {
    String token = await this.getToken();
    return {HttpHeaders.authorizationHeader: "Token " + token};
  }

  static getTokenOneSignal() async {
    await dotenv.load();
    return dotenv.env['ONE_SIGNAL'].toString();
  }

  Future<String> getToken() async {
    await dotenv.load();
    return dotenv.env['API_TOKEN'].toString();
  }

  Future<String> getUrlApi([apiVersion = 'v1']) async {
    await dotenv.load();
    return dotenv.env['API_SERVER'].toString() + apiVersion + '/';
  }
}
