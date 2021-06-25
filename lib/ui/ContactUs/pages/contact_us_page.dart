import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key key}) : super(key: key);

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 361,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.14),
                      blurRadius: 5,
                      offset: Offset(0, 10),
                    ),
                  ]),
                  child: Column(
                    children: [
                      Container(
                        height: 351,
                        width: MediaQuery.of(context).size.width,
                        color: darkBlue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 48.0, right: 29),
                              child: Container(
                                height: 40,
                                child: Text(
                                  'اتصل بنا',
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 17.0, right: 29.4),
                              child: Container(
                                height: 1,
                                color: Colors.white,
                                width: 32,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 29.0, top: 23.5),
                              child: Container(
                                height: 58,
                                width: 222,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundColor:
                                          backgroundGrey.withOpacity(0.2),
                                      child: Icon(Icons.location_on),
                                    ),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Container(
                                      width: 163,
                                      child: Text(
                                        'الأشرفية - شارع الفريد نقاش، بيروت، لبنان',
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 29.0, top: 17.5),
                              child: Container(
                                height: 46,
                                width: 222,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundColor:
                                          backgroundGrey.withOpacity(0.2),
                                      child: Icon(Icons.call),
                                    ),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Container(
                                      width: 163,
                                      child: Text(
                                        '76 611 005',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 29.0, top: 17.5),
                              child: Container(
                                height: 46,
                                width: 222,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundColor:
                                          backgroundGrey.withOpacity(0.2),
                                      child: Icon(Icons.email),
                                    ),
                                    SizedBox(
                                      width: 14,
                                    ),
                                    Container(
                                      width: 163,
                                      child: Text(
                                        'info@vdl.me',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 10,
                        color: green,
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, right: 21),
                      child: Container(
                        height: 25,
                        child: Text(
                          'تواصل معنا',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 17.0, right: 21.4),
                      child: Container(
                        height: 1,
                        color: green,
                        width: 32,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30.0,
                        right: 21,
                        bottom: 5.0,
                      ),
                      child: Container(
                        child: Text(
                          '*الاسم',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: black.withOpacity(0.38),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0, right: 21),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black54),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                            onSaved: (String value) {},
                            validator: (String value) {
                              if (value.length == 0) {
                                return "Required Field";
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, right: 21),
                      child: Container(
                        child: Text(
                          '*البريد الإلكتروني',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: black.withOpacity(0.38),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0, right: 21),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black54),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                            onSaved: (String value) {},
                            validator: (String value) {
                              if (value.length == 0) {
                                return "Required Field";
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, right: 21),
                      child: Container(
                        child: Text(
                          '*نوع الطلب',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: black.withOpacity(0.38),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0, right: 21),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black54),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                            onSaved: (String value) {},
                            validator: (String value) {
                              if (value.length == 0) {
                                return "Required Field";
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, right: 21),
                      child: Container(
                        child: Text(
                          '*البلد',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: black.withOpacity(0.38),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0, right: 21),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black54),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                            onSaved: (String value) {},
                            validator: (String value) {
                              if (value.length == 0) {
                                return "Required Field";
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, right: 21),
                      child: Container(
                        child: Text(
                          '*البلد',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: black.withOpacity(0.38),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0, right: 21),
                      child: Container(
                        height: 296,
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 100,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            filled: true,
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 21.0),
                      child: Container(
                        width: 145,
                        height: 56,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 7.0, left: 7, top: 7),
                              child: Container(
                                height: 42,
                                width: 138,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 53.0),
                                    child: Text(
                                      'أرسل رسالتك',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: green,
                                      ),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(26)),
                              ),
                            ),
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: green.withOpacity(0.41),
                              child: CircleAvatar(
                                backgroundColor: green,
                                radius: 21,
                                child: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 120,
                    )
                  ],
                )
              ],
            ),
            Positioned(
              top: 40,
              left: 19,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
