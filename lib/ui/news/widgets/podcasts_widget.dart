import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PodcastsWidet extends StatefulWidget {
  const PodcastsWidet({Key key}) : super(key: key);

  @override
  _PodcastsWidetState createState() => _PodcastsWidetState();
}

class _PodcastsWidetState extends State<PodcastsWidet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 19.0, bottom: 98),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.14),
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ], borderRadius: BorderRadius.circular(14), color: Colors.white),
        height: 438,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/images/illustration.svg',
                height: 173,
                width: 216,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 62.0, right: 67),
                child: Text(
                  'إستمع الى اخبارنا أينما كنت عبر منصاتنا',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 43.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 69,
                        width: 69,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.14),
                                blurRadius: 15,
                                offset: Offset(0, 0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(34.5),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/podcasts.png',
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(
                                height: 4.1,
                              ),
                              Text(
                                'Podcasts',
                                style: TextStyle(fontSize: 9),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 69,
                        width: 69,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.14),
                                blurRadius: 15,
                                offset: Offset(0, 0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(34.5),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Image.asset(
                            'assets/images/soundCloud-image.png',
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Positioned(
              top: 78,
              left: 15,
              child: Container(
                height: 69,
                width: 69,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.14),
                        blurRadius: 15,
                        offset: Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(34.5),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: SvgPicture.asset(
                    'assets/images/youtube (1).svg',
                  ),
                ),
              ),
            ),
            Positioned(
              top: 78,
              right: 15,
              child: Container(
                height: 69,
                width: 69,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.14),
                        blurRadius: 15,
                        offset: Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(34.5),
                    color: Colors.white),
                child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/mobile.svg',
                        ),
                        SizedBox(
                          height: 4.1,
                        ),
                        Text(
                          'Mobile app',
                          style: TextStyle(fontSize: 9),
                        )
                      ],
                    )),
              ),
            ),
            Positioned(
              bottom: 62,
              left: 50,
              child: Container(
                height: 69,
                width: 69,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.14),
                        blurRadius: 15,
                        offset: Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(34.5),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Image.asset(
                    'assets/images/Tunein-image.png',
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 62,
              right: 50,
              child: Container(
                height: 69,
                width: 69,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.14),
                        blurRadius: 15,
                        offset: Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(34.5),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Image.asset(
                    'assets/images/Tunein-image.png',
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: Container(
                  height: 69,
                  width: 69,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.14),
                          blurRadius: 15,
                          offset: Offset(0, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(34.5),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/global.svg',
                        ),
                        SizedBox(
                          height: 4.1,
                        ),
                        Text(
                          'Websites',
                          style: TextStyle(fontSize: 9),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
