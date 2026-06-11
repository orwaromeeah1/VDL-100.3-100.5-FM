import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlViewer extends StatelessWidget {
  final String html;

  const HtmlViewer({
    Key? key,
    required this.html,
  }) : super(key: key);

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
                return _WebViewEmbed(html: e.outerHtml, isInstagram: true);
              case 'twitter-tweet':
                return _WebViewEmbed(html: e.outerHtml, isInstagram: false);
            }
          }
          return null;
        },
      ),
    );
  }
}

class _WebViewEmbed extends StatefulWidget {
  final String html;
  final bool isInstagram;

  const _WebViewEmbed({required this.html, required this.isInstagram});

  @override
  State<_WebViewEmbed> createState() => _WebViewEmbedState();
}

class _WebViewEmbedState extends State<_WebViewEmbed> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

    if (widget.isInstagram) {
      final pageHtml = """<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
</head>
<body>
  ${widget.html}
  <script async src="https://www.instagram.com/embed.js"></script>
</body>
</html>""";
      _controller.loadRequest(
        Uri.dataFromString(pageHtml,
            mimeType: 'text/html',
            encoding: Encoding.getByName('utf-8')),
      );
    } else {
      _controller.loadRequest(Uri.parse(
        "https://api.flutter-widget-from-html.vercel.app/iframe.ts?body=${Uri.encodeComponent(widget.html + '<script async src="https://platform.twitter.com/widgets.js"></script>')}",
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: WebViewWidget(controller: _controller),
    );
  }
}
