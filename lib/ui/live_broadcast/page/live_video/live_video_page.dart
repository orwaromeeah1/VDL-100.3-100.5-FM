import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:focus_detector/focus_detector.dart';
//import 'package:fwfh_webview/fwfh_webview.dart';
import 'package:vdl/utils/file_path/file_path.dart';
import 'package:vdl/utils/project_colors/project_color.dart';
//import 'package:webview_flutter/webview_flutter.dart';

class LiveVideoPage extends StatefulWidget {
  @override
  _LiveVideoPageState createState() => _LiveVideoPageState();
}

class _LiveVideoPageState extends State<LiveVideoPage> {
  late double width;
  bool viewStream = true;
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
  final urlController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();

    // await _videoViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FocusDetector(
        onVisibilityLost: () {
          setState(() {
            viewStream = false;
          });
        },
        onVisibilityGained: () {
          setState(() {
            viewStream = true;
          });
        },
        child: Container(
          width: width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    FilePath.LIVE_BACKGROUND,
                  ),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
                width: width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(FilePath.MASK), fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        child: Container(
                          width: width,
                          margin: EdgeInsets.only(top: 50),
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  padding: EdgeInsets.only(right: 3),
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white12,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 140),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                FilePath.LOGO,
                                height: 100,
                                width: 100,
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Stack(
                                  children: [
                                    !viewStream
                                        ? Container()
                                        : Container(
                                            color: green,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: AspectRatio(
                                                aspectRatio: 16 / 9,
                                                child: InAppWebView(
                                                  key: webViewKey,
                                                  // contextMenu: contextMenu,
                                                  initialUrlRequest: URLRequest(
                                                      url: WebUri(
                                                          "http://player.l1vetv.com/vdltv")),
                                                  // initialFile: "assets/index.html",
                                                  initialUserScripts:
                                                      UnmodifiableListView<
                                                          UserScript>([]),
                                                  initialOptions: options,
                                                  onWebViewCreated:
                                                      (controller) {
                                                    webViewController =
                                                        controller;
                                                  },
                                                  onLoadStart:
                                                      (controller, url) {
                                                    setState(() {
                                                      this.url = url.toString();
                                                      urlController.text =
                                                          this.url;
                                                    });
                                                  },
                                                  androidOnPermissionRequest:
                                                      (controller, origin,
                                                          resources) async {
                                                    return PermissionRequestResponse(
                                                        resources: resources,
                                                        action:
                                                            PermissionRequestResponseAction
                                                                .GRANT);
                                                  },
                                                  shouldOverrideUrlLoading:
                                                      (controller,
                                                          navigationAction) async {
                                                    var uri = navigationAction
                                                        .request.url;

                                                    if (![
                                                      "http",
                                                      "https",
                                                      "file",
                                                      "chrome",
                                                      "data",
                                                      "javascript",
                                                      "about"
                                                    ].contains(uri?.scheme ?? '')) {
                                                      // URL scheme handled — allow navigation
                                                    }

                                                    return NavigationActionPolicy
                                                        .ALLOW;
                                                  },
                                                  onLoadStop:
                                                      (controller, url) async {
                                                    setState(() {
                                                      this.url = url.toString();
                                                      urlController.text =
                                                          this.url;
                                                    });
                                                  },
                                                  onLoadError: (controller, url,
                                                      code, message) {},
                                                  onProgressChanged:
                                                      (controller, progress) {
                                                    if (progress == 100) {}
                                                    setState(() {
                                                      this.progress =
                                                          progress / 100;
                                                      urlController.text =
                                                          this.url;
                                                    });
                                                  },
                                                  onUpdateVisitedHistory:
                                                      (controller, url,
                                                          androidIsReload) {
                                                    setState(() {
                                                      this.url = url.toString();
                                                      urlController.text =
                                                          this.url;
                                                    });
                                                  },
                                                  onConsoleMessage: (controller,
                                                      consoleMessage) {
                                                    print(consoleMessage);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                    progress < 1.0
                                        ? LinearProgressIndicator(
                                            value: progress)
                                        : Container(),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(FilePath.VIDEO_LOGO),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'بث بالفيديو',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
