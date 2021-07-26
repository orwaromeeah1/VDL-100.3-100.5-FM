import 'package:html/parser.dart';

class Manager {
  static String removeAllHtmlTags(String htmlText) {
    //here goes the function

    final document = parse(htmlText);
    final String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }
}
