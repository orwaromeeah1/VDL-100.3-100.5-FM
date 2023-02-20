import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlViewer extends StatelessWidget {
  final String html;
  WebViewController _controller;

  HtmlViewer({
    @required this.html,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: HtmlWidget(
        html,
        customWidgetBuilder: (e) {
          if (e.localName == 'blockquote') {
            switch (e.attributes['class']) {
              case 'instagram-media':
                return buildForInstagram(e.outerHtml);
              case 'twitter-tweet':
                return buildForTwitter(e.outerHtml);
            }
          }

          return null;
        },
        webView: true,
      ),
    );
  }

  Widget buildForInstagram(String html) => WebView(
        initialUrl: 'about:blank',
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _controller.loadUrl(
            Uri.dataFromString("""<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
</head>
<body>
  $html
  <script async src="https://www.instagram.com/embed.js"></script>
</body>
</html>""", mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
                .toString(),
          );
        },
      );

  Widget buildForTwitter(String html) => WebView(
        initialUrl:
            "https://api.flutter-widget-from-html.vercel.app/iframe.ts?body=${Uri.encodeComponent(html + '<script async src="https://platform.twitter.com/widgets.js"></script>')}",
      );
}
