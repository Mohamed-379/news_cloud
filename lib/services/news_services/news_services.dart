import 'package:dio/dio.dart';
import 'package:new_cloud/services/news_services/articles_responses.dart';

class NewsServices {
  Dio dio;
  NewsServices({required this.dio});

  Future<List<Articles>> getNews(String category) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/everything?q=$category&lang&apiKey=8ee169f5bba84007a4ad03ac573b3573');
      Map<String, dynamic> jsonData = await response.data;
      ArticlesResponses articlesResponses =
          ArticlesResponses.fromJson(jsonData);
      return articlesResponses.articles!;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}