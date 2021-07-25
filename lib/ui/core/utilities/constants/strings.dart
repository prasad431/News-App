class Strings {
  static const String khomePage = '/';
  static const String kwebPage = '/newswebview';

  static const int HTTP_SUCCESS = 200;

  static const String KSELECTED_THEME = 'kthemename';

  static String apikey = '94d4e29b2b1b4b25b30a9b8d8fbb4c85';
  static String sourcesapi =
      'https://newsapi.org/v2/top-headlines/sources?apiKey=$apikey';
  static String newsapi =
      'http://newsapi.org/v2/everything?domains=wsj.com&apiKey=$apikey';
}
