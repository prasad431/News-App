part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsInitState extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final NewsModel newsModel;
  NewsLoaded({this.newsModel});
}

class NewsListError extends NewsState {
  final error;
  NewsListError({this.error});
}
