import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:focus_detector/focus_detector.dart';
//import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
//import 'package:fwfh_webview/fwfh_webview.dart';
import 'package:vdl/injection.dart';
import 'package:vdl/ui/news/bloc/news_bloc.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class LiveStreamWidget extends StatefulWidget {
  const LiveStreamWidget({Key? key}) : super(key: key);

  @override
  _LiveStreamWidgetState createState() => _LiveStreamWidgetState();
}

class _LiveStreamWidgetState extends State<LiveStreamWidget> {
  bool _shrinked = false;

  final GlobalKey webViewKey = GlobalKey();

  late InAppWebViewController webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  String url = "";
  double progress = 0;
  bool viewStream = true;
  final urlController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusLost: () {
        setState(() {
          _shrinked = true;
        });
      },
      onFocusGained: () {
        setState(() {
          //  _shrinked = false;
        });
      },
      child: Stack(
        children: [
          locator<NewsBloc>().dismessdLive
              ? Container()
              : AnimatedPositioned(
                  top: _shrinked
                      ? MediaQuery.of(context).size.height - 150
                      : 100,
                  left: _shrinked ? 15 : 0,
                  duration: Duration(milliseconds: 300),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    color: _shrinked ? null : ProjectColors.ThemeColor,
                    width: _shrinked ? 50 : MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(_shrinked ? 0 : 5.0),
                          child: Container(
                            color: _shrinked ? null : ProjectColors.BLACK,
                            child: _shrinked
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        _shrinked = false;
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: 20,
                                      child: Icon(
                                        CupertinoIcons.tv,
                                        color: Colors.white,
                                      ),
                                      backgroundColor: ProjectColors.BLACK,
                                    ),
                                  )
                                : Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  locator<NewsBloc>()
                                                      .dismessdLive = true;
                                                });
                                              },
                                              icon: Icon(
                                                CupertinoIcons.xmark,
                                                color: Colors.white,
                                              )),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "جديد صوت لبنان",
                                                  style: TextStyle(
                                                      color: green,
                                                      fontSize: 12),
                                                ),
                                                Text("بث مباشر بالصوت والصورة",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                CupertinoIcons.xmark,
                                                color: ProjectColors.BLACK,
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Stack(
                                          children: [
                                            !viewStream
                                                ? Container()
                                                : Container(
                                                    color: green,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: AspectRatio(
                                                        aspectRatio: 16 / 9,
                                                        child: InAppWebView(
                                                          key: webViewKey,
                                                          // contextMenu: contextMenu,
                                                          initialUrlRequest:
                                                              URLRequest(
                                                                  url: WebUri(
                                                                      "http://player.l1vetv.com/vdltv")),
                                                          // initialFile: "assets/index.html",
                                                          initialUserScripts:
                                                              UnmodifiableListView<
                                                                  UserScript>([]),
                                                          initialOptions:
                                                              options,
                                                          onWebViewCreated:
                                                              (controller) {
                                                            webViewController =
                                                                controller;
                                                          },
                                                          onLoadStart:
                                                              (controller,
                                                                  url) {
                                                            setState(() {
                                                              this.url = url
                                                                  .toString();
                                                              urlController
                                                                      .text =
                                                                  this.url;
                                                            });
                                                          },
                                                          androidOnPermissionRequest:
                                                              (controller,
                                                                  origin,
                                                                  resources) async {
                                                            return PermissionRequestResponse(
                                                                resources:
                                                                    resources,
                                                                action:
                                                                    PermissionRequestResponseAction
                                                                        .GRANT);
                                                          },
                                                          shouldOverrideUrlLoading:
                                                              (controller,
                                                                  navigationAction) async {
                                                            var uri =
                                                                navigationAction
                                                                    .request
                                                                    .url;

                                                            if (![
                                                              "http",
                                                              "https",
                                                              "file",
                                                              "chrome",
                                                              "data",
                                                              "javascript",
                                                              "about"
                                                            ].contains(
                                                                uri?.scheme)) {
                                                              // URL scheme handled — allow navigation
                                                            }

                                                            return NavigationActionPolicy
                                                                .ALLOW;
                                                          },
                                                          onLoadStop:
                                                              (controller,
                                                                  url) async {
                                                            setState(() {
                                                              this.url = url
                                                                  .toString();
                                                              urlController
                                                                      .text =
                                                                  this.url;
                                                            });
                                                          },
                                                          onLoadError:
                                                              (controller,
                                                                  url,
                                                                  code,
                                                                  message) {},
                                                          onProgressChanged:
                                                              (controller,
                                                                  progress) {
                                                            if (progress ==
                                                                100) {}
                                                            setState(() {
                                                              this.progress =
                                                                  progress /
                                                                      100;
                                                              urlController
                                                                      .text =
                                                                  this.url;
                                                            });
                                                          },
                                                          onUpdateVisitedHistory:
                                                              (controller, url,
                                                                  androidIsReload) {
                                                            setState(() {
                                                              this.url = url
                                                                  .toString();
                                                              urlController
                                                                      .text =
                                                                  this.url;
                                                            });
                                                          },
                                                          onConsoleMessage:
                                                              (controller,
                                                                  consoleMessage) {
                                                            print(
                                                                consoleMessage);
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                            // HtmlWidget(
                                            //   '<iframe src="http://player.l1vetv.com/vdltv"></iframe>',
                                            //   factoryBuilder: () =>
                                            //       MyWidgetFactory(),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                        _shrinked
                            ? Container()
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _shrinked = true;
                                    print(_shrinked);
                                  });
                                },
                                child: Container(
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RotatedBox(
                                          quarterTurns: 1,
                                          child: Icon(
                                            CupertinoIcons.back,
                                            color: Colors.white,
                                          )),
                                      Text(
                                        "إغلاق",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                                ),
                              ),
                      ],
                    ),
                  ),
                )
        ],
      ),
    );
  }
}

// class MyWidgetFactory extends WidgetFactory with WebViewFactory {
//   bool get webViewMediaPlaybackAlwaysAllow => true;
// }
