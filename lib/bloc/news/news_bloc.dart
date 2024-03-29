import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/api/news/news_api.dart';

import 'package:news_app/ui/core/exceptions/api_exceptions.dart';
import 'package:news_app/api/news/news_service.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:news_app/ui/core/utilities/constants/strings.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvents, NewsState> {
  NewsBloc({this.newsService}) : super(NewsInitState());
  NewsAPI newsService;

  @override
  Stream<NewsState> mapEventToState(NewsEvents event) async* {
    if (newsService == null) newsService = NewsService.shared;
    switch (event) {
      case NewsEvents.fetchNews:
        yield NewsLoading();
        try {
          NewsModel newsmodel = await newsService.getNews(Strings.newsapi);
          if (newsmodel.articles.length != 0) {
            yield NewsLoaded(newsModel: newsmodel);
          }
        } on SocketException {
          yield NewsListError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield NewsListError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield NewsListError(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          yield NewsListError(
            error: UnknownException(e.toString()),
          );
        }

        break;
    }
  }
}
