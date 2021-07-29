import 'package:news_app/api/news/news_api.dart';

import 'package:news_app/data/models/news_model.dart';
import 'package:http/http.dart' as http;
import '../../data/model/mock_news_model.dart';

class MockNewsAPI implements NewsAPI {
  @override
  Future<NewsModel> getNews({String urlString, http.Client client}) async {
    return Future.value(
        MockNewsModel.shared.getNewsModel('test_resources/response.json'));
  }
}
