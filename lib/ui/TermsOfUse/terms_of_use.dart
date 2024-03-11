import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 53.0,
                right: 23,
              ),
              child: Row(
                children: [
                  Text(
                    'شروط الإستخدام',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 23, left: 23, top: 10),
              child: Column(
                children: [
                  Text(
                      'تنطبق قواعد استخدام موقع الشركة الجديدة للاعلام المرئي والمسموع ( ش . م .ل ) صوت لبنان واي من مواقع وتطبيقات شركاتها الشقيقة، على جميع زوار ومستخدمي الموقع او التطبيق الالكتروني. ويجوز إيقاف و/أو منع و/أو إنهاء استخدام الموقع عن أحد المستخدمين، في حال حدوث انتهاك من قبله لتلك القواعد، أو في حال توافرت أسباب تدعو للاعتقاد بأن احد المستخدمين قد انتهك وخالف شروط وقواعد الاستخدام'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'تحكم شروط الاستخدام الحاضرة عملية دخول المستخدم على الموقع للتعرف على المعلومات او مشاهدة البرامج في كافة النماذج والأشكال وتوزيع وتخزين ومعالجة البيانات المتاحة والتعامل معها ، وكافة المسائل الأخرى ذات الصلة.'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'إن دخول المستخدم على الموقع وتصفحه لمحتواه، وإجرائه أي معاملات باستخدام هذا الموقع يعني موافقته المسبقة على كافة الشروط والأحكام الواردة بشروط استخدام الموقع التالية من دون تحفظ او اعتراض.'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "يتحمَّل المستخدم بمفرده مسؤولية صحة البيانات المقدمة من جانبه\n( في حالة طلبها) وضمان مدى توافقها مع كل من القوانين والأنظمة المعمول بها، والشروط المحددة للخدمة، وشروط استخدام الموقع.\nوتحتفظ الشركة بحقها في الاطلاع على بيانات المستخدم، وذلك لضمان مدى توافقها مع القوانين والأنظمة المعمول بها في الدولة اللبنانية، ومع الشروط المحددة للخدمة وشروط استخدام الموقع."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "يجب أن تتوافق كافة الوسائط والأجهزة والبرامج والأنظمة المستخدمة من قِبل المستخدم لأغراض تخزين ومعالجة ونقل البيانات …. وغيرها مع المعايير الأمنية المعتمدة من قبل الموقع ويجب على المستخدم، متى ما انطبق ذلك وضع إجراءات مناسبة لضمان صحة وتكامل هذه البيانات، ومنع عمليات الدخول أو الإستخدام غير المصرح به للبيانات.\nويجوز للموقع أن يقوم بمعالجة ونقل وتخزين البيانات في أية دولة أخرى إذا ما تطلب حفظ هذه البيانات القيام بذلك. ويُعتبر استخدام المستخدم للخدمات المتاحة بمثابة موافقة من قِبله على هذه المعالجة من قِبل الموقع والشركة مالكة هذا الموقع."),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'يوافق المستخدم على دخول واستخدام الموقع لأغراض مشروعة فقط، ويقر بمسؤوليته الكاملة عن العلم والعمل بالتشريعات والأنظمة والقواعد التي تحكم إستخدامه الموقع.وبمجرد دخول المستخدم على الموقع فإنه يوافق على الامتناع عن ارتكاب أية أعمال أو أفعال قد تتعارض مع شروط استخدام الموقع، ومن بينها على سبيل المثال (لا الحصر) ما يلي:'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      'يوافق المستخدم على دخول واستخدام الموقع لأغراض مشروعة فقط، ويقر بمسؤوليته الكاملة عن العلم والعمل بالتشريعات والأنظمة والقواعد التي تحكم إستخدامه الموقع.وبمجرد دخول المستخدم على الموقع فإنه يوافق على الامتناع عن ارتكاب أية أعمال أو أفعال قد تتعارض مع شروط استخدام الموقع، ومن بينها على سبيل المثال (لا الحصر) ما يلي:\n–استخدام الموقع بقصد ارتكاب مخالفة أو تحريض الآخرين على التورط في أي تصرف قد يعد جريمة جنحية او جنائية أو ينطوي على ثمة مسؤولية مدنية.\n–إدخال أو نشر أي محتويات غير قانونية تتضمن تمييزاً أو تشهيراً أو إساءة أو قدحاً او ذماً أو استخدام الموقع من أجل انتحال شخصيات أو أطراف أخرى.\n–استخدام الموقع لتحميل أي مادة أو برامج تحتوي على فيروسات أو شفرات حاسوبية أو ملفات أو برامج قد تعمل على تغيير أو إعاقة عمل الموقع أو أي جهاز أو برنامج عائد إلى أي شخص يدخل إلى الموقع أو تغيير أو إتلاف أو شطب أي محتوى على الموقع.\n–تحميل أو إدخال أو إرسال أو أي بث بخلاف ذلك لمواد لا يحق للمستخدم بثها بموجب أي قانون أو علاقة تعاقدية أو تعمد تعطيل خطوط الاتصال الاعتيادية بأي شكل كان.\n–نشر أو بث أي إعلان أو مادة دعائية أو أي شكل من أشكال الترويج أو نشر أي مادة تتنافى أو تتعارض مع حقوق الملكية الفكرية للآخرين أو جمع أو تخزين أية معلومات شخصية عن الغير.\n–نشر أو بث أي مادة أو معلومات تتنافى أو تتعارض مع الشرائع السماوية أو العادات أو التقاليد السائدة الدولة اللبنانية.'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'ويُحظر على المستخدمين انتهاك أو محاولة انتهاك الإجراءات والقواعد المعمول بها لحماية الموقع، وعلى سبيل المثال، لا الحصر الأعمال التالية:'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'ويُحظر على المستخدمين انتهاك أو محاولة انتهاك الإجراءات والقواعد المعمول بها لحماية الموقع، وعلى سبيل المثال، لا الحصر الأعمال التالية:\n–         الوصول إلى البيانات التي لا يقصد تقديمها لهذا المستخدم، أو الدخول على خادم او ملقم أو حساب لا يحق للمستخدم بالدخول عليه،\n–         محاولة إجراء اختبار أو مسح أو فحص لإمكانية إصابة نقاط الضعف في نظام أو في الموقع أو انتهاك سلامة الإجراءات أو توثيقها من دون تصريح رسمي من الحكومة اللبنانية.\n–         محاولة التدخل في الخدمة المقدمة لأي مستخدم، أو مستضيف، أو شبكة، بما في ذلك على سبيل المثال وليس الحصر، عن طريق وضع فيروس على الموقع، أو زيادة الحمل عليه، أو إرسال رسائل دعائية إليه، أو إغراقه بالرسائل الإلكترونية، أو محاولة تعطيله.\n–         إرسال رسائل إلكترونية غير مرغوب فيها إلى الموقع، بما في ذلك عمليات الدعاية، و/أو الإعلان عن المنتجات أو الخدمات، أو تزييف أي عنوان لحزمة بروتوكول التحكم في الإرسال / بروتوكول الإنترنت، أو أي جزء من معلومات العنوان في أي رسالة إلكترونية، أو إرسال رسائل مجموعات إخبارية.\n–         استخدام الموقع بأي طريقة كانت لإرسال بريد الكتروني، أو أية أمور نيابة عنه، أو من خلال الإشارة إليه، أو بانتحال اسمه، أو صفته، تتضمن الإساءة أو التشهير بالموقع، أو الشركة الجديدة للاعلام المرئي والمسموع ( ش . م .ل ) صوت لبنان ، أو بأي شخص كان، أو الإعلان عن أخبار أو معلومات غير صحيحة ونسبتها للموقع او للشركة من دون وجه حق.'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'لا يحق للمستخدم بذاته أو بواسطة آخرين أو تابعين له أن يقوم أو يسمح بالقيام بعملية نسخ أو تعديل أو إجراء برمجة عكسية أو تصميم أو تحرير أو ترجمة أو تفكيك أو أية محاولة أخرى بخلاف ذلك لاستخلاص كل أو بعض أو أي جزء من الشفرات الأصلية للخدمات المقدمة عبر الموقع، أو الترخيص من الباطن أو إعادة بيع أو توزيع أي خدمة من دون موافقة خطية مسبقة من الشركة.'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'تحتفظ الشركة لنفسها بالحق في مراقبة أي محتوى يتم إدخاله من المستخدم، ويجوز لها دون أدنى التزام منها في هذا الشأن شطب أو إزالة أي مواد مدخلة من شأنها إنتهاك أحكام شروط الإستخدام.'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'إن مخالفة قواعد الاستخدام وانتهاك النظام أو الشبكة، يعرض المخالف للمسؤولية المدنية والجزائية، ويتم التحقيق في الحالات التي قد تنطوي على مثل هذه المخالفات والانتهاكات وملاحقة المتسبب فيها قضائياً.لإدارة الموقع كامل الحق بوقف أو تعديل أي معلومة أو ميزة او خدمة في الموقع، بما يتضمنه من شروط وأحكام، في أي وقت من دون الحاجة لإشعار أو إخطار، ومن دون أي مسؤولية أو تبعية مهما كان مصدرها.لذا، يجب على المستخدم قراءة ومتابعة التغييرات كونها تحكم تصفح الموقع. يجب الالتزام أيضا بالسياسات  الداخلية بخصوص رفع المسؤولية، وحقوق الملكية الفكرية، وسياسة الخصوصية ويتحمل المستخدم وحده كافة التبعات المباشرة وغير المباشرة المترتبة على الإخلال بذلك.'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'رفع المسؤولية تقوم الشركة الجديدة للاعلام المرئي والمسموع ( ش . م .ل ) صوت لبنان، او اي من الشركات الشقيقة بتشغيل هذه البوابة او الموقع او الخدمة الالكترونية. وبينما يتم بذل العناية اللازمة لتوفير معلومات دقيقة، إلا أن الشركة لا تتحمل مسؤولية أي عارض أو أحداث او اضرار تقع عند تصفحكم لهذا الموقع.'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('لا تتحمل الشركة المسؤولية الناجمة عن:'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      '–         أية أضرار تلحق بأجهزة المستخدم أثناء استخدام أو نتيجة عدم القدرة على استخدام الموقع، أو المواقع المرتبطة به،\n–         مستوى دقة محتويات المواقع من حيث الاكتمال أو الحداثة، أو الخلو من الأخطاء اللغوية، أو المطبعية، أو غيرها، أو انقطاع المعلومات او الخدمة، أو توقفها لأي سبب كان، سواء فني، أو  طارئ، أو مُتعمد،\n–          أي رسائل، أو روابط، أو مؤشرات، أو نصائح، أو توجيهات تتضمنها المواقع الأخرى المرتبطة بالموقع أو تُوجه به،\n–         لا يوصي الموقع بأي شركة خاصة او بأي شخص ثالث سواء اكان شخصاً طبيعياً او معنوياً من اجل تقديم الخدمات عن بعد ولا تصادق عليها.\n–         فقدان او تلف المعلومات او المستندات الاصلية المرسلة عبر البريد، سواء اكانت مرسلة من المستخدم او من الشركة، كونها تقع على مسؤولية شركة البريد.'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'اما بالنسبة الى رفع المسؤولية عن محتوى هذا الموقع، فتبذل الشركة قصارى جهدها لتوفير معلومات دقيقة وحديثة، إلا أنها لا تقدم إيضاحات أو ضمانات من أي نوع، صريحة أو ضمنية.لا تتحمل الشركة تحت أي ظرف المسؤولية الناجمة عن:'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      '–         أي أضرار كانت بما فيها المباشرة أو غير المباشرة، عرضية أو تبعية، خصوصا أو استثنائية، تنشأ عن استخدام الموقع أو عدم القدرة على استخدامه بشكل مُناسب، ويكون المستخدم وحده مسؤولاً عن  سلوكياته في الموقع.'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'ان الشركة لا تقدم أي ضمانات أخرى من أي نوع كانت سواءً صريحة أو ضمنية أو مطلوبة وفقاً للقانون أو خلاف ذلك، بما في ذلك تأمين البيانات، خلو عمليات الخدمات من الأخطاء أو عدم انقطاعها وكل ما يتعلَّق بصلاحية العرض في السوق أو الملائمة لغرض بعينه و/أو عدم الإنتهاك.'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'ولا تتحمَّل الشركة أي مسؤولية أو التزام عن المسح أو الإخفاق في تخزين أي بيانات تتعلق بالمستخدم أو مراسلات/اتصالات أخرى تم الاحتفاظ بها أو تخزينها أو نقلها عبر إستخدام خدمات الموقع، كما لا تتحمل كذلك أي مسؤولية تجاهه عن أي أضرار مباشرة أو غير مباشرة على وجه الإطلاق قد تلحق به، أو سداد أي رسوم أو تكاليف لقاء الحصول عليها باستخدام الموقع.'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'لا يتحمل الموقع المسؤولية عن أي تعويضات، رسوم، مصاريف أو أتعاب محاماة، عن خسائر ناتجة عن مخالفة المستخدم، أو أي شخص ينوب عنه، للشروط والأحكام الخاصة باستخدام هذا الموقع الإلكتروني.'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'حقوق الملكية الفكرية',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'ان حقوق الملكية الفكرية محفوظة للشركة الجديدة للاعلام المرئي والمسموع ( ش . م .ل ) صوت لبنان او لشركاتها الشقيقة، وخاضعة لقانون حماية الملكية الفكرية اللبناني رقم 75/99 تاريخ 03/04/1999، واي تعدي على هذه الملكية يؤدي الى ملاحقة قانونية والمطالبة بالحقوق المتصلة.إن محتويات هذا الموقع الإلكتروني، التي تشمل على سبيل المثال لا الحصر، النصوص، والرسومات، والصور، والفديوهات، والمحتويات المتعددة الوسائط، والملفات، والروابط، وملفات الصوت، والنماذج والرسوم هي ملك للشركة الجديدة للاعلام المرئي والمسموع ( ش . م .ل ) صوت لبنان او احدى شركاتها الشقيقة، وتحميها حقوق الملكية الفكرية. وتحتفظ الشركة بكامل حقوق التأليف وحقوق الملكية التجارية والصناعية من اسرار مهنية وعلامات تجارية وبراءات اختراع وحقوق الملكية المعلوماتية والفنية والادبية وغيرها من ملكيات المعلومات الواردة في هذا الموقع الإلكتروني.ولا يجوز بأي حال من الأحوال استخدام، أو إعادة إنتاج، او نشر أو الطباعة غير المصرح بها لأي من المعلومات، والمواد، وحقوق الملكية الخاصة الواردة في هذا الموقع الإلكتروني.'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'حقوق الملكية الفكرية',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'يضمن الموقع السرية في المعلومات وذلك ضمن ممارسة الحقوق وأداء الواجبات المنوطة به ضمن اطار الخدمات المقدمة عبر الموقع فقط مع بذل العناية الواجبة للحفاظ على سريتها.وبصرف النظر عن أي نص خلاف ذلك وارد في شروط الاستخدام هذه، فإنه يجوز للموقع الإفصاح عن هذه المعلومات بالقدر الذي تتطلبه تشريعات الدولة اللبنانية أو الأحكام القضائية الصادرة بهذا الشأن.ويحق للموقع الرجوع على المستخدم بالتعويضات المناسبة عن الأضرار التي لحقت به جراء إخلاله بالتزاماته بإفشاء المعلومات السرية التي تحصّل عليها من خلال إستخدامه للموقع، ودون الإخلال بحق الموقع في حجب الدخول ومنع استخدام الموقع عن المستخدم نتيجة لذلك.'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'التحديثات',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'تقوم الشركة بإجراء تحديثات أو تعديلات سواء بالإضافة أو الحذف قد ترى إدخالها على شروط الاستخدام أو الخدمات أو التطبيقات أو الأدوات أو المزايا للخدمات المتاحة على الموقع من وقت لآخر أو إضافة أية وظائف جديدة أو بيانات أو تطبيقات أو أدوات أو مزايا لتلك الخدمات بما في ذلك الاسعار، الرسوم وتكلفات الخدمات المقدمة.على أن يسري مفعول تلك التحديثات أو التعديلات على الفور بمجرد نشرها سواءً كانت تلك التعديلات تنطبق على الخدمات الجديدة أو السابقة، ما لم يتم الإشارة على الموقع إلى تحديد تاريخ آخر لسريانها.ويوافق المستخدم بموجب ذلك دون أدنى قيد أو شرط او shall be madeتحفظ على أية تعديلات قد يتم إدراجها على الخدمات المتاحة على الموقع أو يتم إزالتها، على أنه في حالة عدم موافقته على الشروط أو الخدمات المعدلة فإنه يتعين عليه التوقف عن استخدام الخدمة عبر الموقع.'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'الخاتمة',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  Text(
                      'تعتبر المعلومات الواردة في هذا الموقع كمرجع للاستئناس به، حيث يمكن أن تختلف الإجراءات بشكل طفيف تبعا لكل مرجع ولكل دائرة ولكل خدمة. نوصي المُستخدم بالتأكد من دقة جميع المعلومات المنشورة واكتمالها قبل اتخاذ أي قرار يتعلق بأي خدمات، ومعلومات، وبرامج، ومنتجات، وبرمجيات، أو أية أمور أخرى موضحة على الموقع أو المنسوبة إلى مواقع أخرى في محتوى الموقع.وتوصي الشركة بضرورة الالتزام بشروط استخدام الموقع الإلكتروني وحقوق الملكية الفكرية، وسياسة الخصوصية، ويتحمل المستخدم وحده كافة التبعات المباشرة وغير المباشرة المترتبة على الإخلال بذلك.لمزيد من المعلومات، الرجاء التواصل مع قسم إدارة الموقع على البريد الإلكتروني'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'سياسة الخصوصية',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  Text(
                      'تعتبر سياسة الخصوصية وشروطها الواردة أدناه، جزءاً لا يتجزأ من شروط استخدام الموقع والتطبيق الإلكتروني للشركة الجديدة للاعلام المرئي والمسموع ( ش . م .ل ) صوت لبنان.لا يجمع الموقع معلومات شخصية عنك عندما تقوم بزيارته إلا إذا اخترت تحديداً وبمعرفتك تقديم هذه المعلومات، وفي حال اخترت تقديم معلومات لنا، فإننا لا نستخدمها إلا لإنجاز طلبك للحصول على معلومات أو خدمات. وباستخدامك هذا الموقع، فإنك توافق على شروط سياسة الخصوصية هذه.يحتفظ الموقع بالحق في إجراء أي تعديل لشروط سياسة الخصوصية من وقت الى آخر من دون الحاجة إلى تقديم إخطار بذلك. وإذا كنت ترغب بالاستمرار في استخدام موقعنا بعد إدخال التعديلات على سياسة الخصوصية هذه، فإن هذا يعني قبولك لهذه التغييرات.يحق للموقع اتخاذ التدابير التي يراها ملائمة للحماية من أي فقدان أو إساءة استخدام أو تغيير للمعلومات الموجودة على الموقع الإلكتروني وذلك من دون أن يضمن في هذه الحال، الاحتفاظ بسرية محتويات هذا الموقع الإلكتروني، ولا يعتبر مسؤولاً قانوناً عن أي ضرر قد يتعرض له المستخدم أو أي شخص آخر نتيجة لانتهاك السرية بشأن المعلومات التي يكون قد نقلتها إلى الموقع أو التعويض عنه .كما يقوم الموقع بتنفيذ إجراءات دقيقة للحماية من فقدان المعلومات أو إساءة استخدامها أو تغييرها. ومع ذلك فإن الموقع لا يمكنه أن يضمن سرية استخدامك له، وهو لا يعتبر مسؤول عن أي ضرر قد تتعرض له أنت أو أي شخص نتيجة لانتهاك السرية بشأن المعلومات التي تكون قد نقلتها إلى الموقع.يقوم الموقع بإستخدام ملفات تعريف الارتباط cookies و web bacons وغيرها من تكنولوجيا تعريف الارتباط، التي تسمح بخدمتك بشكل افضل، اسرع وآمن. تسمح هذه الملفات بجمع وتخزين معلومات شخصية او بيانات ذات طابع شخصي عنك، وعليه تعتبر انك موافق على استعمال ملفات تعريف الارتباط هذه بمجرد استعمالك للموقع. ويمكنك التحكم بهذه الملفات عبر ضوابط برنامج التصفح سواء بتفعيلها او بحجبها بإرادتك المنفردة، وعندها لا يضمن الموقع نتيجة وعواقب قرارك هذا بالنسبة الى نوعية الخدمة او بالوصول اليها بالشكل المطلوب.'),
                  Row(
                    children: [
                      Text(
                        'القوانين المطبقة',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'تكون قوانين الدولة اللبنانية وحدها هي القوانين واجبة التطبيق في كل ما يتعلق بالنزاعات التي قد تنشأ من جراء استخدام هذا الموقع الإلكتروني، كما تختص محاكم الدولة اللبنانية حصرياً بالنظر في تلك النزاعات والبت فيها.')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 23, left: 23, top: 10),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Terms of use',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'This page explains the rules of using the website of Voice of Lebanon Company (S.A.L) or any of its sister companies’ websites or applications, which will be applied to all users and visitors of the site. The use of the site may be suspended, and/or prevented, and/or ended in case of any violation by any user or if there are good reasons to believe that any user has violated the terms and conditions of use.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The present terms of use govern the user’s login on the site to obtain information or to watch programs in all models, as well as the distribution, storage and handling of available data including all other relevant matters.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The use of the site, the browsing content, and the conduct of any transactions using this site imply consent to all the terms and conditions of use without reservation or objection.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The user assumes responsibility for the accuracy of data provided alone on his part (in case of request) to ensure their compatibility with all the laws and regulations, the specific terms of service and use of the site.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The Company reserves the right to have access to the user’s data to ensure their compatibility with the laws and regulations in force in the Lebanese State, and with the specific terms of service and use of the site.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'All media, devices, software, programs and systems used by the user must be compatible with storing and processing data transfer means…as well as with other Security Standards accredited by the site, when applicable, the user shall establish appropriate procedures to ensure the accuracy and integrity of this data, and to prevent unauthorized access to or use of the data.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The site may be dealing with the transfer and storage of data in any other state if keeping such data requires doing so. By using the services available at the website, the user grants his approval on the data treatment to the site and the company owing this site.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The user agrees to access and use the site only for lawful purposes, and recognizes the full responsibility for knowledge regarding labor legislations, rules and regulations governing the use of the site.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The user agrees to refrain from committing any acts that may be inconsistent with terms of the site including (but not limited to) the following:'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '– Use the site for the purpose of committing an offense or inciting others to engage in any conduct which constitutes a crime or offense or civil responsibility.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '– Introduction or dissemination of any illegal contents including discrimination or defamation or abuse or invective or use the site for identity theft.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '– Use the site to download any material or programs containing viruses or computer codes, files or programs may operate to change or hinder the work of the site or any device or software to any person entering the site or change or damage or delete any content on the site.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '– Upload, input or submit or broadcast materials not permitted under any law or contractual relationship or internationally disable normal lines of communication in any form.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '– Publication or broadcast of any declaration or propaganda material or any other form of promotion of publication of any material incompatible or inconsistent with the intellectual property rights of others or collect or store any personal information about others.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '– Publish or broadcast any material or information which are contrary to or inconsistent with divine laws or customs or traditions prevailing in the Lebanese State.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'Users shall not be permitted to violate or attempt to violate the applicable procedures and regulations for protecting the site, including but not limited to the following:'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '– Accessing data that are not intended to be provided to this user or logging into a server or an account that the user is not authorized to access,'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '– Attempting to conduct any test or survey for finding weakness of any system or network of the site or violating applicable procedures or documenting them without an official permission issued by the Lebanese government.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '– Attempting to interfere in the provided service on the part of any user, host or network including not limited to placing a virus on the site, increasing load to or immersing it, sending commercial messages to it or avalanching it with electronic messages or even destroying it.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '– Sending unwanted electronic messages to the site including commercial and/or advertisements on services or products or falsifying any dispatch control protocol package address/internet protocol or any part of the address details in any electronic message or sending news messages.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '– Using the site by any means for sending an email, anything of it or on its behalf, by referring to it, or assuming the identity of its name involving offence or libel of Voice of Lebanon (S.A.L) or any of its sister companies, portal or any person whomsoever, announcing any untrue news or information and ascribing it to the company unrightfully.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The user shall not directly or indirectly, allow the process of copying, modifying or reverse programming, design or edit, translate, disassemble or any attempt otherwise to extract some or all or any part of the original codes of services provided through the site, or to sub-license or re-sell or distribute any services without the company’s prior written approval.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The Company reserves the right to monitor any content provided by the user, without any obligation in this regard and to remove any postings that violate the terms of use.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'Violating the terms of use, system or network shall expose the involved person to civil and criminal liability. Cases of such violations shall be investigated, and the involved person shall be legally prosecuted.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The site’s portal reserves all the rights to discontinue or modify access to any information or feature or service that are part of the portal including all the terms and conditions at any time without notice, and without enduring any responsibility or attributing reasons whatsoever.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'Accordingly, the user shall read, check the changes and browse the site.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The user is advised to observe the internal policies outlined in the portal with respect to its disclaimer, copyright and privacy policy. Any violation thereof shall be strictly at the risk of the user who shall bear all the direct and indirect consequences.'),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Disclaimer',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                        'Voice of Lebanon (S.A.L) or any of the sister companies runs this platform or site or service. The Company does not bear the responsibility for any incident or event or damage encountered when browsing this site, while due diligence is done to provide accurate information.The Company does not assume responsibility for:'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '–  the level of accuracy of the contents of the sites in terms of completeness or modernity or free from linguistic errors or typographical or other, or interruptions of service or suspension for any reason, whether technical or emergency or intentional,'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '– any messages or links, or indicators, or advice, or guidance contained in other sites associated with the site or directed,'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '– The site does not recommend any probate company or any third person whether a physical person or legal entity to provide remote services and do not endorse it,'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '-Loss of or damage to information or original documents sent via mail, whether sent by the user or by the company, since it is the responsibility of the postal company.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'As for the waiver of responsibility regarding the site’s content, the Company shall exert every effort to provide accurate and current information, but it does not provide explanations or warranties of any kind, either implied or explicit.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text('The Company is not under liability resulting from:'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        '– any damages whatsoever including direct or indirect, incidental or consequential, special or exceptional circumstances, arising from the use of or the inability to use the services properly, the user shall be solely responsible for his behaviors on the site.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The Company does not provide any warranties of any kind, either explicit or implied or required according to the law or otherwise, including services free of errors of interrupted services and all validity of services or appropriate for a particular purpose and/or non-infringement.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The Company does not assume any responsibility or obligation for surveying or failure to store any user data or correspondence/other contacts especially if retained or stored or transferred via the use of the site services, and it also does not assume any responsibility for any damages, direct or indirect, in whatsoever that may cause it, or pay any fees or costs in counter of using the site.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The site does bear responsibility for any compensation, fees, charges or lawyer’s fees, and losses resulting from a violation of the user, or any person on his behalf to the terms and conditions of using this website.'),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Intellectual Property Rights',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        'All intellectual property rights are the sole property of Voice of Lebanon (S.A.L) or its sister companies, and are subject to the Lebanese intellectual property protection law No.75/99 dated on 03/04/1999, and any infringement to this property leads to legal pursuit.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'All content including not limited to texts, images, videos, and multimedia content, files, links, audio files, design and models made available on the site, are the property of Voice of Lebanon (S.A.L) or one of its sister companies, and are protected by intellectual property rights.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The Company reserves the full rights of commercial and industrial properties rights and copyright of professional secrets, trademarks and patents and informatics property rights, artistic and literary and other properties of the information contained in this website.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'In no case, may the use, or the production, dissemination or unauthorized printing of any information, materials and proprietary rights contained in this website shall be permitted.'),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Confidentiality',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The site ensures confidentiality of confidential information within the exercise of rights and performance of duties within the framework of the services provided through the site only and with due care to maintain its confidentiality.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'Regardless of any text otherwise contained in these terms of use, the site may disclose this information to the extent required by the Lebanese State legislations or judicial provisions issued in this regard.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The site reserves the right to pursue the user for appropriate compensation related to the damages suffered due to the breach of its obligations to disclose confidential information obtained through the use of the site, without prejudice to the right of the site to block the user’s access to the said website.'),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Updates',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The company may update these terms of use, either by adding or deleting some terms or services or applications or tools or benefits services available on the site from time to time or the addition of any new posts or data or applications or tools or advantages of those services including prices, fees, and costs for the provided services.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'Updates or modifications shall take effect as soon as they are published, whether those amendments apply to new or previous services, unless it is stated expressly the date of its applicability.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The user agrees without restriction or condition or reservation on any amendment that might be included on the services available or removed from the site, otherwise, he shall stop using the service through the site.'),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Conclusion',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The information contained in this site are considered as reference to elicit, where procedures can slightly vary depending on each repertory and every service. We recommend that the user verifies the accuracy and completeness of all posted information before making any decision regarding any information, services, programs and products, software or any other services stated in the site or attributed to other sites.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The Company recommends the respect of website’s terms of use and the intellectual property, and the privacy policy. The user shall bear all the consequences related to the breach of these rules, directly or indirectly.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'For more information, please communicate with site operators via email:'),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Privacy Policy',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The privacy policy and its conditions mentioned below are an integral part of the terms of use of the site and application belonging to Voice of Lebanon (S.A.L).'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The site shall not collect personal information about you while you access it, unless you specifically and willingly choose to provide such information to us. If you do so, we shall use such details only to process your application for obtaining information or services.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'By using this site, you approve and accept these terms and conditions for privacy. The site shall reserve the right to make any minor or major change in privacy policy terms and conditions from time to time without any prior notice. If you continue using our site after making changes to the privacy policy, this means that you accept them.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The site is entitled to take measures as it deems appropriate for protection from any loss, misuse or alteration of information on the website, without the guarantee in this case, or maintaining the confidentiality of the contents of this website, and without being legally responsible for any damage or compensation to the user or any other person as a result of a violation of the confidentiality of the information reported to the site.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The site implements precise procedures for the protection of information loss or misuse or change. However, the site could not guarantee the confidentiality of your use, and is not responsible for any damage to you or to any other person as a result of a violation of confidentiality on the information to be reported to the site.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'This site uses web beacons along with other tech cookies to serve you better, faster and safer.'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'These files collect and store personal information or data of a personal nature for you; therefore, you agree that we use these cookies as long as you use the site. You can control these files via the browser controls whether activated or concealed voluntarily, while this does not guarantee the smooth quality and operability of the site as a result of your decision.'),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Applicable Laws',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        'The laws of the Lebanese State shall be applicable exclusively in respect to the conflicts that may arise from the use of this website, and also the Lebanese courts shall be competent exclusively to settle such disputes.'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
