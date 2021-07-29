import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/api/news/news_service.dart';
import 'package:news_app/ui/core/utilities/constants/strings.dart';

void main() {
  NewsService newsService;
  setUp(() {
    newsService = NewsService.shared;
  });
  group('NewsService', () {
    test('when url link not given. it should return Exception type', () async {
      try {
        await newsService.getNews();
      } catch (e) {
        expect(e.toString(), 'Exception: service url not provided');
      }
    });

    test('when url link is invalid. it should return FormatException type',
        () async {
      try {
        await newsService.getNews(urlString: 'https://');
      } catch (e) {
        expect(e.runtimeType, FormatException);
      }
    });

    test(
        'when client is unreachble and url is valid. it should return SocketException type',
        () async {
      try {
        await newsService.getNews(urlString: Strings.newsapi);
      } catch (e) {
        expect(e.runtimeType, SocketException);
      }
    });
  });
}
