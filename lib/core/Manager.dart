
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart';

class Manager {
  static String removeAllHtmlTags(String htmlText) {
    //here goes the function

    final document = parse(htmlText);
    final String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }

  static void toastMessage(String message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        textColor: Colors.white,
        backgroundColor: color,
        fontSize: 16.0);
  }
}
