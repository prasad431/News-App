import 'package:flutter/material.dart';
import 'package:news_app/data/entities/article.dart';
import 'package:news_app/ui/core/exceptions/root_exceptions.dart';
import 'package:news_app/ui/core/utilities/constants/strings.dart';
import 'package:news_app/ui/presenters/home_page.dart';
import 'package:news_app/ui/presenters/news_web_view.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Strings.khomePage:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      case Strings.kwebPage:
        return MaterialPageRoute(
          builder: (context) => NewsWebView(
            article: settings.arguments as Article,
          ),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
