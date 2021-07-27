class Urls {
  static const String DOMAIN = "https://www.vdl.me/";
  static const String BASE_API = DOMAIN + "/wp-json/wp/v2/";

  static const String MENUS = BASE_API + "menus/";
  static const String All_NEWS = BASE_API + "news/";
  static const String News_Categories = BASE_API + "news-category";

  static const String Single_news_url = BASE_API + "news/";

  static const String Special_reports_url = BASE_API + "special-reports/";

  static const String Articles_Url = BASE_API + 'articles';
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

  static const String Latest_tweets_url =
      "https://api.twitter.com/2/users/523259744/tweets?max_results=30&tweet.fields=created_at";
}
