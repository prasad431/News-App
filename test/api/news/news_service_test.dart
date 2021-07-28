import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:news_app/ui/core/exceptions/api_exceptions.dart';
import 'package:news_app/ui/core/utilities/constants/strings.dart';
import 'package:http/http.dart' as http;
import '../../data/model/mock_news_model.dart';
import '../rest_client/api_manager_test.mocks.dart';
import 'mock_news_service.dart';

@GenerateMocks([http.Client])
void main() {
  MockClient mockClient;
  MockNewsService mockNewsService;

  setUp(() {
    mockClient = MockClient();
    mockNewsService = MockNewsService();
  });

  group('NewsService', () {
    test(
        'when http calls completed. it does returns newsmodel with article count > 0',
        () async {
      final response = MockNewsModel.shared.getResponse();
      when(mockClient.get(Uri.parse(Strings.newsapi)))
          .thenAnswer((_) async => http.Response(response, 200));

      NewsModel newsModel = await mockNewsService.getNews(
          urlString: Strings.newsapi, client: mockClient);
      expect(newsModel.articles.length > 0, true);
    });

    test(
        'when url link not given. it should return InvalidFormatException type',
        () async {
      try {
        await mockNewsService.getNews();
      } catch (e) {
        expect(e.runtimeType, InvalidFormatException);
      }
    });

    test(
        'when url link is invalid. it should return NoServiceFoundException type',
        () async {
      try {
        await mockNewsService.getNews(urlString: 'https://');
      } catch (e) {
        expect(e.runtimeType, NoServiceFoundException);
      }
    });

    test(
        'when client is empty and url is valid. it should return UnknownException type with "client not provided"',
        () async {
      try {
        await mockNewsService.getNews(urlString: Strings.newsapi);
      } catch (e) {
        expect(e.runtimeType, UnknownException);
      }
    });
  });
}
