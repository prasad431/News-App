import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/api/rest_client/api_manager.dart';
import 'package:news_app/ui/core/utilities/constants/strings.dart';
import 'package:test/test.dart';
import 'api_manager_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  MockClient client;
  String link;

  setUp(() {
    client = MockClient();
    link = 'https://jsonplaceholder.typicode.com/albums/1';
  });

  group('ApiManager', () {
    test('when http calls completed. it does returns response string in map',
        () async {
      String response = '{"userId": 1, "id": 2, "title": "mock"}';
      when(client.get(Uri.parse(link)))
          .thenAnswer((_) async => http.Response(response, 200));

      expect(await APIManager.shared.getRequest(client, link),
          {'response': response, 'error': ''});
    });

    test('when http calls completed. it should return exception string',
        () async {
      when(client.get(Uri.parse('https://'))).thenThrow(Exception('Bad url'));
      expect(await APIManager.shared.getRequest(client, 'https://'),
          {'error': 'Exception: Bad url'});
    });

    test(
        'when http calls completed. it should return errorvalue something went wrong',
        () async {
      when(client.get(Uri.parse(link))).thenAnswer(
          (_) async => http.Response('Not Found', Strings.HTTP_FAILURE));
      expect(await APIManager.shared.getRequest(client, link),
          {'error': 'something went worng'});
    });
  });
}
