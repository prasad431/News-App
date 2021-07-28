import 'dart:io';

import 'package:news_app/api/news/news_api.dart';

import 'package:news_app/data/models/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/ui/core/utilities/constants/strings.dart';

import '../../data/model/mock_news_model.dart';

class MockNewsService implements NewsAPI {
  @override
  Future<NewsModel> getNews(String urlString, {http.Client client}) async {
    /*final file = File('test_resources/response.json');
    final json = file.readAsStringSync();

    final source = Source(
        id: idValues.map['the-wall-street-journal'],
        name: nameValues.map['The Wall Street Journal']);
    final article = Article(
      author: "Jacob Gallagher",
      title: "How Jeff Bezos’s Space Watch Became a Marketing Win For Omega",
      description: "The Blue Origin and Amazon founder.",
      publishedAt: DateTime.parse("2021-07-23T16:52:29Z"),
      url:
          "https://www.wsj.com/articles/how-jeff-bezoss-space-watch-became-a-marketing-win-for-omega-11627058918",
      urlToImage: "https://images.wsj.net/im-373454/social",
      content:
          "JEFF BEZOSS Blue Origin mission on Tuesday wasnt just a landmark event.",
      source: source,
    );
    NewsModel newsModel = newsModelFromJson(json);

    NewsModel newsmodel = NewsModel(
      status: Strings.HTTP_OK,
      totalResults: 1,
      articles: [article],
    );*/

    return Future.value(
        MockNewsModel.shared.getNewsModel('test_resources/response.json'));
  }
}
