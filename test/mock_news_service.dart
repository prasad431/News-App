import 'package:news_app/api/news/news_api.dart';
import 'package:news_app/data/entities/article.dart';
import 'package:news_app/data/entities/source.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/ui/core/utilities/constants/strings.dart';

class MockNewsService implements NewsAPI {
  @override
  Future<NewsModel> getNews(String urlString, {http.Client client}) {
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
    NewsModel newsmodel = NewsModel(
      status: Strings.HTTP_OK,
      totalResults: 1,
      articles: [article],
    );

    return Future.value(newsmodel);
  }
}
/*
class MockNewsService extends Mock implements NewsService {
  MockNewsService();

  factory MockNewsService.success() {
    var service = MockNewsService();
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
    NewsModel newsmodel = NewsModel(
      status: Strings.HTTP_OK,
      totalResults: 1,
      articles: [article],
    );
    when(service.getNews(Strings.newsapi, client: MockHttpClient()))
        .thenAnswer((_) => Future.value(newsmodel));
    return service;
  }
}

class MockHttpClient extends Mock implements http.Client {}
*/