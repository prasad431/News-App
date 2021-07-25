import 'package:http/http.dart' as http;
import 'package:news_app/data/models/sources_model.dart';

abstract class SourcesAPI {
  Future<SourcesModel> getNewsProviders(http.Client client, String urlString);
}
