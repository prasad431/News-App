import 'dart:io';

import 'package:mockito/mockito.dart';
import 'package:news_app/data/models/news_model.dart';

class MockNewsModel extends Mock implements NewsModel {
  static MockNewsModel shared = MockNewsModel();

  NewsModel getNewsModel(String filepath) {
    final file = File(filepath);
    final json = file.readAsStringSync();
    return newsModelFromJson(json);
  }

  String getResponse(String filepath) =>
      newsModelToJson(getNewsModel(filepath));
}
