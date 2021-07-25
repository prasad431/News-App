import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/api/news/news_service.dart';
import 'package:news_app/bloc/news/news_bloc.dart';
import 'package:news_app/data/entities/article.dart';
import 'package:news_app/data/entities/source.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:news_app/ui/core/utilities/constants/strings.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

class MockNewsService extends Mock implements NewsService {}

void main() {
  MockNewsService mockNewsService;
  setUp(() {
    mockNewsService = MockNewsService();
  });

  group('NewsService', () {
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
    final newsmodel = NewsModel(
      status: Strings.HTTP_OK,
      totalResults: 1,
      articles: [article],
    );
    blocTest('emits [NewsLoading, NewsLoaded] when successful',
        build: () {
          print(newsmodel.toJson());
          when(mockNewsService.getNews(http.Client(), Strings.newsapi))
              .thenAnswer((_) async => newsmodel);
          return NewsBloc(newsService: mockNewsService);
        },
        act: (bloc) => bloc.add(NewsEvents.fetchNews),
        expect: () => newsmodel);
  });
}
