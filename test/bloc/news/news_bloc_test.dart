import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/bloc/news/news_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../mock_news_service.dart';

void main() {
  MockNewsService mockNewsService;
  NewsBloc newsBloc;

  setUp(() {
    mockNewsService = MockNewsService();
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
