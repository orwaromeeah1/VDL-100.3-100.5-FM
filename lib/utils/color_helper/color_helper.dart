
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorHelper{

  static Color getColor(String category){
    switch(category){
      case 'أرشيف': return Color(0xff00ccff);
      case 'إقتصاد': return Color(0xffcc3333);
      case 'ثقافة': return Color(0xff009999);
      case 'رياضة': return Color(0xff3333ff);
      case 'سياسة': return Color(0xffff6600);
      case 'شبابي': return Color(0xffffcc00);
      case 'صحة': return Color(0xffcc66ff);
      case 'فن': return Color(0xff66cc33);
      case 'مجتمع': return Color(0xff33cccc);
      case 'منوعات': return Color(0xff27b399);
      case 'كل الاخبار':
        return Colors.amber;
        break;
      case 'أمن وقضاء':
        return Colors.cyan;
        break;
      case 'إقتصادية':
        return Colors.blueGrey;
        break;
      case 'إقليمية':
        return Colors.green;
        break;
      case 'تكنلوجيا':
        return Colors.deepPurple;
        break;
      case 'خاص':
        return Colors.teal;
        break;
      case 'دولية':
        return Colors.indigo;
        break;
      case 'رياضية':
        return Colors.lightGreen;
        break;
      case 'صحة':
        return Colors.purple;
        break;
      case 'طقس':
        return Colors.yellow;
        break;

      default : return Color(0xffDB934C);
    }
  }
}