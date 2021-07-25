import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:news_app/data/entities/article.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  const NewsWebView({Key key, this.article}) : super(key: key);
  final Article article;
  @override
  _NewsWebViewState createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    print(this.widget.article.author);
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.article.title),
      ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: this.widget.article.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onProgress: (int progress) {
            print("WebView is loading (progress : $progress%)");
          },
          gestureNavigationEnabled: false,
        );
      }),
    );
  }
}
