import 'package:news_app/data/models/news_model.dart';
import 'package:http/http.dart' as http;

abstract class NewsAPI {
  Future<NewsModel> getNews(String urlString, {http.Client client});
}
