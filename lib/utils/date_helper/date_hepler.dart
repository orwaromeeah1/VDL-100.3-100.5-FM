class DateHelper{


  static getDays(){

    var now = DateTime(2020, 7);

// Getting the total number of days of the month
    var totalDays = daysInMonth(now);

// Stroing all the dates till the last date
// since we have found the last date using generate
    var listOfDates = new List<int>.generate(totalDays, (i) => i + 1);
    print(listOfDates);
  }

  // this returns the last date of the month using DateTime
  static int daysInMonth(DateTime date){
    var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = new DateTime(firstDayThisMonth.year, firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

}