import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news/news_bloc.dart';
import 'package:news_app/data/entities/article.dart';
import 'package:news_app/ui/core/utilities/error.dart';
import 'package:news_app/ui/core/utilities/loading.dart';
import 'package:news_app/ui/core/utilities/txt.dart';
import 'custom_widgets/article_row.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  _loadNews() async {
    BlocProvider.of<NewsBloc>(context).add(NewsEvents.fetchNews);
  }

  @override
  Widget build(BuildContext context) {
    print(Theme.of(context).backgroundColor);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Txt(text: 'Aricles'),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        BlocBuilder<NewsBloc, NewsState>(
            builder: (BuildContext context, NewsState state) {
          if (state is NewsListError) {
            final error = state.error;
            String message = '${error.message}\nTap to Retry.';
            return ErrorTxt(
              message: message,
              onTap: _loadNews,
            );
          }
          if (state is NewsLoaded) {
            List<Article> articles = state.newsModel.articles;
            return _list(articles);
          }
          return Loading(
            loadingtext: 'Please wait while loading your data',
          );
        }),
      ],
    );
  }

  Widget _list(List<Article> articles) {
    return Expanded(
      child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (_, index) {
            var article = articles[index];
            return ArticleRow(article: article);
          }),
    );
  }
}
