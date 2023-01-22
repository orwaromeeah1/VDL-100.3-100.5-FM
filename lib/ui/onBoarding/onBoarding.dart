import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vdl/data/shared_preferences/auth_prefes_helper.dart';
import 'package:vdl/ui/main_tabs/page/main_tabs_page.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

import '../../injection.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final _prefsHelper = locator<AuthPrefsHelper>();
  bool isFirstTime = false;

  @override
  void initState() {
    checkFirstTime();
    super.initState();
  }

  void checkFirstTime() async {
    bool res = await _prefsHelper.isFirstTimeInApp();
    if (res == true) {
      if (mounted) {
        setState(() {
          isFirstTime = true;
        });
      }
      await _prefsHelper.setNotFirstTimeInApp();
    } else {
      if (mounted) {
        setState(() {
          isFirstTime = false;
        });
      }
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Directionality(
                textDirection: TextDirection.rtl, child: MainTabsPage()),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isFirstTime
          ? Stack(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/invlebanon.jpg',
                                  ),
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.2),
                                      BlendMode.dstATop),
                                  fit: BoxFit.fill),
                              color: blue,
                              borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(58.0),
                              )),
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.only(
                                bottomRight: const Radius.circular(58.0),
                              )),
                          height: MediaQuery.of(context).size.height / 2,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/images/VDL_LOGO-image.jpg.svg',
                              height: 129,
                              width: 125,
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 2,
                          color: Colors.white,
                        ),
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: blue,
                                  borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(58.0),
                                  )),
                              height: MediaQuery.of(context).size.height / 2,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 2,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/Lebanon.jpg',
                                            ),
                                            colorFilter: new ColorFilter.mode(
                                                Colors.black.withOpacity(0.2),
                                                BlendMode.dstATop),
                                            fit: BoxFit.cover),
                                        color: blue,
                                        borderRadius: new BorderRadius.only(
                                          topLeft: const Radius.circular(58.0),
                                        )),
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: 100,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 31.0, right: 31),
                                              child: Text(
                                                "إذاعة لبنانية جامعة منفتحة،مضمونا واسلوبا،على شرائح المجتمع كافة.",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                        SizedBox(
                                          height: 27,
                                        ),
                                        InkWell(
                                          onTap: () =>
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Directionality(
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                            child:
                                                                MainTabsPage()),
                                                  )),
                                          child: Container(
                                            height: 48,
                                            width: 117,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                border: Border.all(
                                                    width: 2, color: green)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '  إكتشف',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(
                                                  CupertinoIcons.arrow_left,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
            ),
    );
  }
}
