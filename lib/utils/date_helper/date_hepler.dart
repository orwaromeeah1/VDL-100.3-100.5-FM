import 'package:vdl/data/models/day_model.dart';
import 'package:intl/intl.dart';

class DateHelper{


  static List<DayModel> getDays(){
    List<DayModel> days = [];
    var now = DateTime.now();

// Getting the total number of days of the month
    var totalDays = daysInMonth(now);
    print('total days :'+totalDays.toString());


    // Storing all the dates till the last date
// since we have found the last date using generate
    var listOfDates = new List<int>.generate(totalDays, (i) => i + 1);

    listOfDates.forEach((element) {
      var day = new DateTime(now.year, now.month, element);
      days.add(
        new DayModel(
          name: getDayNameInArabic(DateFormat('EEEE').format(day)),
          number: element,
        )
      );
    });

    return days;
  }

  // this returns the last date of the month using DateTime
  static int daysInMonth(DateTime date){
    var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = new DateTime(firstDayThisMonth.year, firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  static String getDayNameInArabic(String dayName){
    switch(dayName){
      case 'Saturday': return 'السبت';
      case 'Sunday': return 'الاحد';
      case 'Monday': return 'الاثنين';
      case 'Tuesday': return 'الثلاثاء';
      case 'Wednesday': return 'الاربعاء';
      case 'Thursday': return 'الخميس';
      case 'Friday': return 'الجمعة';
      default : return '';
    }
  }

  static String getMonthNameInArabic(int month){
    switch(month){
      case 1: return 'كانون الثاني';
      case 2: return 'شباط';
      case 3: return 'آذار';
      case 4: return 'نيسان';
      case 5: return 'أيار';
      case 6: return 'حزيران';
      case 7: return 'تموز';
      case 8: return 'آب';
      case 9: return 'أيلول';
      case 10: return 'تشرين الأول';
      case 11: return 'تشرين الثاني';
      case 12: return 'كانون الأول';
      default : return '';
    }
  }

}