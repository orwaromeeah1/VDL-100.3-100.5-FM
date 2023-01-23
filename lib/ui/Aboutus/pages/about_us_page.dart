import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vdl/utils/project_colors/project_color.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 280,
              color: darkBlue,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48.0, right: 35),
                  child: Text(
                    'من نحن',
                    style: TextStyle(
                      fontSize: 32,
                      color: green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 18.0, right: 35, left: 51),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 77,
                        width: 4,
                        color: green,
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Container(
                          height: 89,
                          width: 272,
                          child: Text(
                            "''صوت لبنان'' مؤسسة إعلامية لبنانية وطنية جامعة منفتحة مضمونا واسلوبا على شرائح المجتمع كافة",
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 61.0, top: 28),
                  child: Container(
                    height: 218,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/about_us.png'),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 17, right: 25, left: 57),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'نحن "صوت لبنان" vdl.me 100.5/100.3 و vdl24 إنطلق أول بث لإذاعة "صوت لبنان" عام 1958 وبعد 17 سنة أي في 13 تشرين الأول/ أكتوبر العام 1975، إستأنفت "صوت لبنان" بثها، وهي أول إذاعة خاصة في لبنان.',
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 7, right: 25, left: 37, bottom: 30),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'أطلقت "صوت لبنان " في الثامن والعشرين من آذار / مارس العام 2022، بثا مرئيأ بالصوت والصورة على مدار الساعة، عبر موقعها الإلكتروني: vdl.me،ومن خلال التطبيق الخاص بها على الاجهزة الخلوية Android وIOS وصفحاتها على الSocial media ، وباتت "الاذاعة المرئية"، في تجربة مختلفة ومتقدمة على المستويين اللبناني والعربي. في المرئي، تلمست "صوت لبنان" المتغيرات المتسارعة في مجال الاعلام وتكيفت معها بتقنيات ذكية، لتوسيع نطاق جمهورها .في المسموع، تبث "صوت لبنان" على مدى 20 ساعة يومياً على موجتيها: 100.3/100.5 FM، .كما يمكن الإستماع إليها في سائر دول العالم عبر موقعها الإلكتروني، ومن خلال التطبيق الخاص بها على الاجهزة الخلوية',
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Container(
                    height: 521,
                    color: darkBlue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 70.0, top: 54),
                          child: Container(
                            height: 217,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/about_us_2.png'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 25.0, right: 25),
                            child: Row(
                              children: [
                                Text(
                                  'ماهو هدفنا؟',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 13.0, right: 25, left: 19),
                          child: Container(
                            height: 157,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'تتجاوز "صوت لبنان" صفتها الإخباريّة، وتعمل على إعداد محتوى مرئي ومسموع ومكتوب يسهم في تحقيق الإنفتاح على الداخل والخارج، من خلال برامج تحتوي مضامين مختلفة من نشرات اخبارية وبرامج منوعة وشاملة .',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.8,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 26.0, right: 41, left: 41),
                  child: Container(
                    height: 33,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'السياسة التحريرية',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 21.0),
                  child: Center(
                    child: Container(
                      height: 2,
                      width: 32,
                      color: green,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15.5, right: 32, left: 32),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'تعتمد السياسة التحريرية ل "صوت لبنان" نقل نبض الناس وتحرص على رواية المعلومة بمهنية ووضوح ودقة وصدق وموضوعية، وتقديم الرأي والرأي الاخر بشكل متوازن، بهدف ترسيخ "صوت لبنان"، قيمة مضافة في الفضاء الإعلامي اللبناني والعربي.\n\nلم تكتف "صوت لبنان" بالإعلام مهنة، صنعت الخبر وما وراء الخبر، وكانت في عمق السياسة اللبنانية.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.8,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
