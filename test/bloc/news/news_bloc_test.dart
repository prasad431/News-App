import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/bloc/news/news_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../api/news/mock_news_api.dart';

void main() {
  MockNewsAPI mockNewsService;
  NewsBloc newsBloc;
  setUp(() {
    mockNewsService = MockNewsAPI();
    newsBloc = NewsBloc(newsService: mockNewsService);
  });

  tearDown(() {
    newsBloc.close();
  });
  group('NewsBloc', () {
    blocTest('emits events in order NewsLoading, NewsLoaded',
        build: () => newsBloc,
        act: (bloc) => bloc.add(NewsEvents.fetchNews),
        expect: () => [isA<NewsLoading>(), isA<NewsLoaded>()]);
    blocTest('emits event NewsInitState',
        build: () => newsBloc, expect: () => []);
  });
}
