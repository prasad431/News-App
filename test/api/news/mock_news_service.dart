import 'package:news_app/api/news/news_service.dart';
import 'package:news_app/data/models/news_model.dart';
import 'package:news_app/ui/core/exceptions/api_exceptions.dart';
import 'package:news_app/ui/core/utilities/constants/strings.dart';
import 'package:http/http.dart' as http;
import '../../data/model/mock_news_model.dart';

class MockNewsService implements NewsService {
  @override
  Future<NewsModel> getNews({String urlString, http.Client client}) async {
    if (urlString == null) throw InvalidFormatException('Invalid link format');
    if (urlString != Strings.newsapi)
      throw NoServiceFoundException('No service found');
    if (client == null) throw UnknownException('client not provided');

    return Future.value(
        MockNewsModel.shared.getNewsModel('test_resources/data.json'));
  }
}
