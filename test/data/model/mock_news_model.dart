import 'dart:io';

import 'package:mockito/mockito.dart';
import 'package:news_app/data/models/news_model.dart';

class MockNewsModel extends Mock implements NewsModel {
  static MockNewsModel shared = MockNewsModel();

  NewsModel getNewsModel(String filepath) {
    String json = _getString(filepath);
    return newsModelFromJson(json);
  }

  String _getString(String filepath) {
    File file = File(filepath);
    String json = file.readAsStringSync();
    return json;
  }

  String getResponse({String filepath}) {
    if (filepath != null)
      return newsModelToJson(getNewsModel(filepath));
    else
      return _getString('test_resources/data.json');
  }
}
