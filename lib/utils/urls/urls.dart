class Urls {
  static const String DOMAIN = "https://www.vdl.me/";
  static const String BASE_API = DOMAIN + "/wp-json/wp/v2/";

  static const String MENUS = BASE_API + "/wp-json/wp/v2/menus/";
  static const String All_NEWS = BASE_API + "wp-json/wp/v2/news/";
  static const String News_Categories =
      BASE_API + "wp-json/wp/v2/news-category";

  static const String Single_news_url = BASE_API + "wp-json/wp/v2/news/";

  static const String Special_reports_url =
      BASE_API + "wp-json/wp/v2/special-reports/";

  static const String Articles_Url = BASE_API + 'wp-json/wp/v2/articles';
  static const String AUTH = DOMAIN + 'oauth/token/';

  //PROGRAMS
  static const String PROGRAMS = BASE_API + 'program/';
  static const String PROGRAM_DETAILS = BASE_API + 'program/';
  static const String PROGRAM_CATEGORIES = BASE_API + 'program-category';

  //PROGRAMS SCHEDULE
  static const String PROGRAMS_SCHEDULE = BASE_API + 'schedule/';

  //SEARCH
  static const String SEARCH = BASE_API + 'news/?search=';

  //NEWSCASTS
  static const String NEWS_CASTS = BASE_API + 'newcast/';
}
