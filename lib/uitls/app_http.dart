import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

abstract class AppHttp {
  Dio http = Dio();

  Future <Map<String, dynamic>> getHeader() async {
    String token = await this.getToken();
    return {
      HttpHeaders.authorizationHeader:
      "Token " + token
    };
  }

  Future<String> getToken() async {
    await dotenv.load();
    return dotenv.env['API_TOKEN'].toString();
  }

  Future<String> getUrlApi() async {
    await dotenv.load();
    return dotenv.env['API_SERVER'].toString();
  }
}