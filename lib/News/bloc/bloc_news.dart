import 'package:coven/News/model_news.dart';
import 'package:coven/News/model_category.dart';
import 'package:coven/News/repository_news.dart';

class BlocNews {
  final RepositoryNews repository = RepositoryNews();

  Future<List<ModelNews>> getNewsForCategory(String categoryUrl) async {
    return await repository.getNewsForCategory(categoryUrl);
  }

  Future<List<ModelNews>> getAllNews() async {
    return await repository.getAllNews();
  }

  Future<List<ModelCategory>> getCategories() async {
    return await repository.getCategories();
  }

  Future<ModelNews> getNews(newsUrl) async {
    return await repository.getNews(newsUrl);
  }

}
