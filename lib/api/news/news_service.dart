import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:news_app/api/rest_client/api_manager.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:news_app/ui/core/utilities/constants/strings.dart';
import 'news_api.dart';

class NewsService implements NewsAPI {
  static NewsService shared = NewsService();

  @override
  Future<NewsModel> getNews({String urlString, http.Client client}) async {
    if (client == null) client = http.Client();
    if (urlString == null) throw Exception('service url not provided');
    if (urlString != Strings.newsapi) throw FormatException('invalid link');
    http.Response response = await client.get(Uri.parse(urlString));
    if (response.statusCode == Strings.HTTP_FAILURE)
      throw SocketException('no internet');
    var newsModel;
    var resultMap = await APIManager.shared.getRequest(client, urlString);
    String error = resultMap['error'];
    if (error.length == 0) {
      var response = resultMap['response'];
      newsModel = newsModelFromJson(response);
    }
    return newsModel;
  }
}
