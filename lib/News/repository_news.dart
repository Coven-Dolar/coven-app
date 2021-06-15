import 'package:coven_native/News/model_news.dart';
import 'package:coven_native/News/model_category.dart';
import 'package:coven_native/uitls/app_http.dart';
import 'package:dio/dio.dart';

class RepositoryNews extends AppHttp {
  Future<List<ModelNews>> getNewsForCategory(String categoryUrl) async {
    Response response;

    Map<String, dynamic> header = await this.getHeader();
    try {
      response = await http.get(
          "${await this.getUrlApi()}blog/post/category/${categoryUrl}/",
          options: Options(headers: header));

      final parsed = response.data['results'].cast<Map<String, dynamic>>();
      return parsed.map<ModelNews>((json) => ModelNews.fromJson(json)).toList();
    } on DioError catch (e) {
      print('errr');
      Map error = e.response!.data;
      error.forEach((key, value) => throw (value));
      print(e);
      return [];
    }
  }

  Future<List<ModelNews>> getAllNews() async {
    Response response;

    Map<String, dynamic> header = await this.getHeader();
    try {
      response = await http.get("${await this.getUrlApi()}blog/post/",
          options: Options(headers: header));
      final parsed = response.data['results'].cast<Map<String, dynamic>>();
      return parsed.map<ModelNews>((json) => ModelNews.fromJson(json)).toList();
    } on DioError catch (e) {
      print('errr');
      Map error = e.response!.data;
      error.forEach((key, value) => throw (value));

      return [];
    }
  }

  Future<List<ModelCategory>> getCategories() async {
    Response response;

    Map<String, dynamic> header = await this.getHeader();
    try {
      response = await http.get("${await this.getUrlApi()}blog/category/",
          options: Options(headers: header));

      final parsed = response.data['results'].cast<Map<String, dynamic>>();
      return parsed
          .map<ModelCategory>((json) => ModelCategory.fromJson(json))
          .toList();
    } on DioError catch (e) {
      print('errr');
      Map error = e.response!.data;
      error.forEach((key, value) => throw (value));
      return [];
    }
  }

  Future<ModelNews> getNews(newsUrl) async {
    Response response;

    Map<String, dynamic> header = await this.getHeader();
    try {
      response = await http.get(
          "${await this.getUrlApi()}blog/post/${newsUrl}/",
          options: Options(headers: header));
      return ModelNews.fromJson(response.data);
    } on DioError catch (e) {
      print('errr');
      Map error = e.response!.data;
      error.forEach((key, value) => throw (value));
      return ModelNews.fromJson({});
    }
  }
}
