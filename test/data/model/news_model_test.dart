import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/bloc/news/news_bloc.dart';
import 'package:news_app/data/models/news_model.dart';
import '../../api/news/mock_news_service.dart';
import '../../data/model/mock_news_model.dart';

void main() {
  MockNewsService mockNewsService;
  NewsBloc newsBloc;
  String filepath;
  setUp(() {
    mockNewsService = MockNewsService();
    newsBloc = NewsBloc(newsService: mockNewsService);
    filepath = 'test_resources/data.json';
  });

  tearDown(() {
    newsBloc.close();
  });
  group('NewsModel', () {
    test('returns newsmodel using data.json file', () {
      NewsModel newsModel = MockNewsModel.shared.getNewsModel(filepath);
      expect(newsModel == null, false);
      expect(newsModel.articles.length > 0, true);
    });

    test('returns response string using data.json file', () {
      String response = MockNewsModel.shared.getResponse(filepath);
      expect(response == null, false);
    });
  });
}
