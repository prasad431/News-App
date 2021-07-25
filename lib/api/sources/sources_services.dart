import 'package:http/http.dart' as http;

import 'package:news_app/api/rest_client/api_manager.dart';
import 'package:news_app/data/models/sources_model.dart';
import 'sources_api.dart';

class SourcesService implements SourcesAPI {
  static SourcesService shared = SourcesService();

  @override
  Future<SourcesModel> getNewsProviders(
      http.Client client, String urlString) async {
    var sourcesModel;
    var resultMap =
        await APIManager.shared.getRequest(http.Client(), urlString);
    String error = resultMap['error'];
    if (error.length == 0) {
      var response = resultMap['response'];
      sourcesModel = sourcesModelFromJson(response);
    }
    return sourcesModel;
  }
}
