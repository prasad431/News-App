import 'package:http/http.dart' as http;

import 'package:news_app/ui/core/utilities/constants/strings.dart';

class APIManager {
  static APIManager shared = APIManager();

  Future<Map<String, String>> getRequest(http.Client client, String url) async {
    try {
      var response = await client.get(Uri.parse(url));

      if (response.statusCode == Strings.HTTP_SUCCESS) {
        var jsonString = response.body;
        return {'response': jsonString, 'error': ''};
      }
    } on Exception catch (exception) {
      return {'error': exception.toString()};
    } catch (error) {
      return {'error': error.toString()};
    }
    return {'error': 'something went worng'};
  }
}
