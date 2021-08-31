import 'package:coven_native/uitls/app_http.dart';
import 'package:dio/dio.dart';

import 'models/model_history_price_market.dart';
import 'models/model_legends.dart';
import 'models/model_market.dart';

class RepositoryMarket extends AppHttp {
  Future<List<ModelMarket>> searchDataAllMarket(String marketType) async {
    String url = 'indicadores/mercados/internacionales/';
    if (marketType == 'N') {
      url = 'indicadores/mercados/nacionales/';
    }

    Response response;

    Map<String, dynamic> header = await this.getHeader();
    try {
      response = await http.get("${await this.getUrlApi() + url}",
          options: Options(headers: header));
      final parsed = response.data.cast<Map<String, dynamic>>();
      return parsed
          .map<ModelMarket>((json) => ModelMarket.fromJson(json))
          .toList();
    } on DioError catch (e) {
      print('errr');
      Map error = e.response!.data;
      error.forEach((key, value) => throw (value));
      print(e);
      return [];
    }
  }

  Future<List<ModelLegends>> getLegends(String marketType) async {
    Response response;
    Map<String, dynamic> header = await this.getHeader();
    try {
      response = await http.get(
          "${await this.getUrlApi()}indicadores/mercados/leyenda/${marketType}/",
          options: Options(headers: header));
      final parsed = response.data.cast<Map<String, dynamic>>();
      return parsed
          .map<ModelLegends>((json) => ModelLegends.fromJson(json))
          .toList();
    } on DioError catch (e) {
      print('errr');
      Map error = e.response!.data;
      error.forEach((key, value) => throw (value));
      print(e);
      return [];
    }
  }

  Future<List<ModelHistoryPriceMarket>> searchHistoryPricesMarket(
      String market, String typeMarket, String frequency) async {
    Response response;
    Map<String, dynamic> header = await this.getHeader();
    String url = "${await this.getUrlApi('v2')}indicadores/data/${typeMarket}/${market}/?days=${frequency}";

    try {
      response = await http.get(
          url,
          options: Options(headers: header));
      final parsed = response.data.cast<Map<String, dynamic>>();
      return parsed
          .map<ModelHistoryPriceMarket>((json) => ModelHistoryPriceMarket.fromJson(json))
          .toList();
    } on DioError catch (e) {
      Map error = e.response!.data;
      error.forEach((key, value) => throw (value));
      print(e);
      return [];
    }

    return [];
  }
}
