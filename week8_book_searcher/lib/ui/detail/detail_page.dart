import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:week8_book_searcher/data/model/place.dart';

class DetailPage extends StatelessWidget {
  final Place place;
  const DetailPage({super.key, required this.place});

  String _toHttps(String url) {
    if (url.startsWith('http://')) {
      return url.replaceFirst('http://', 'https://');
    }
    return url;
  }

  @override
  Widget build(BuildContext context) {
    print(place.placeUrl);
    return Scaffold(
      appBar: AppBar(title: Text(place.placeName)),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(_toHttps(place.placeUrl))),
        initialSettings: InAppWebViewSettings(
          userAgent:
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36',
        ),
      ),
    );
  }
}
