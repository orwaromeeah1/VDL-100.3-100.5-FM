import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:email_validator/email_validator.dart';
import 'package:sendgrid_mailer/sendgrid_mailer.dart';
import 'package:vdl/core/Manager.dart';
import 'package:vdl/ui/Articles/bloc/articles_state.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key key}) : super(key: key);

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();

  final _country = TextEditingController();
  final _message = TextEditingController();
  String name, email, country, message;
  final formKey = GlobalKey<FormState>();

  final username = "";
  Personalization personalization;

  final mailer = Mailer(
      'YOUR_SENDGRID_API_KEY');

  final toAddress = Address('info@vdl.me');
  final fromAddress = Address('apps2@dlimits.com');

  Content content;
  String subject;
  bool loading = false;
  String type = 'General inquiry';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    personalization = Personalization([toAddress]);
  }

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
                                height: 50,
                                child: Text(
                                  'اتصل بنا',
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: green,
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
                                      child: Icon(
                                        Icons.location_on,
                                        color: green,
                                      ),
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
                                      child: Icon(
                                        Icons.call,
                                        color: green,
                                      ),
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
                                      child: Icon(
                                        Icons.email,
                                        color: green,
                                      ),
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
                        height: 30,
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
                    Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 17.0, right: 21.4),
                              child: Container(
                                height: 1,
                                color: green,
                                width: 32,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20.0,
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
                              padding:
                                  const EdgeInsets.only(left: 19.0, right: 21),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: TextFormField(
                                    controller: _name,
                                    style: TextStyle(color: Colors.black54),
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                    onSaved: (String value) {
                                      name = _name.text.trim();
                                    },
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
                              padding:
                                  const EdgeInsets.only(bottom: 5.0, right: 21),
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
                              padding:
                                  const EdgeInsets.only(left: 19.0, right: 21),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: TextFormField(
                                    controller: _email,
                                    style: TextStyle(color: Colors.black54),
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                    onSaved: (String value) {
                                      email = _email.text.trim();
                                    },
                                    validator: (String value) {
                                      return EmailValidator.validate(
                                              value ?? "")
                                          ? null
                                          : "   email not valid";
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 29,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 5.0, right: 21),
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
                              padding:
                                  const EdgeInsets.only(left: 19.0, right: 21),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: DropdownButton(
                                      hint: Text('نوع الطلب'),
                                      isExpanded: true,
                                      underline: Container(),
                                      value: type,
                                      items: types,
                                      onChanged: (value) {
                                        setState(() {
                                          type = value;
                                        });
                                      },
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 29,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 5.0, right: 21),
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
                              padding:
                                  const EdgeInsets.only(left: 19.0, right: 21),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: TextFormField(
                                    controller: _country,
                                    style: TextStyle(color: Colors.black54),
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                    onSaved: (String value) {
                                      country = _country.text.trim();
                                    },
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
                              padding:
                                  const EdgeInsets.only(bottom: 5.0, right: 21),
                              child: Container(
                                child: Text(
                                  '*رسالتك',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: black.withOpacity(0.38),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 19.0, right: 21),
                              child: Container(
                                height: 296,
                                child: TextFormField(
                                  controller: _message,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 100,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.white,
                                    focusColor: Colors.white,
                                    filled: true,
                                  ),
                                  onChanged: (value) {
                                    message = _message.text.trim();
                                  },
                                  onSaved: (value) {
                                    message = _message.text.trim();
                                  },
                                  validator: (String value) {
                                    if (value.length == 0) {
                                      return "Required Field";
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 26,
                    ),
                    loading
                        ? Padding(
                            padding: const EdgeInsets.only(right: 21.0),
                            child: Container(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              _submit();
                            },
                            child: Padding(
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
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: green,
                                              ),
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(26)),
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

  void _submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      setState(() {
        loading = true;
      });
      subject = type;

      content = Content(
          'text/plain', '$name\n$type \nCountry: $country\nContent:\n$message');
      /////
      ///
      final sendingEmail =
          Email([personalization], fromAddress, subject, content: [content]);
      mailer.send(sendingEmail).then((result) {
        setState(() {
          loading = false;
        });
        result.isError
            ? print(result.asError.error)
            : Manager.toastMessage(
                'Message sent Thank your for contacting us', green);
      });
    }
  }

  List<DropdownMenuItem> types = [
    DropdownMenuItem(
      child: Text('General inquiry'),
      value: 'General inquiry',
    ),
    DropdownMenuItem(
      child: Text('Advertising'),
      value: 'Advertising',
    ),
  ];
}
