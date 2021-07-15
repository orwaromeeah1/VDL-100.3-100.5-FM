class Urls {
  static const String BASE_API = "https://www.vdl.me/";

  static const String AUTH = BASE_API + 'oauth/token/';

  static const String MENUS = BASE_API + "/wp-json/wp/v2/menus/";
  static const String All_NEWS = BASE_API + "wp-json/wp/v2/news/";
  static const String News_Categories =
      BASE_API + "wp-json/wp/v2/news-category";

  static const String Single_article_url = BASE_API + "wp-json/wp/v2/news/";
  static const String Special_reports_url =
      BASE_API + "wp-json/wp/v2/special-reports/";
}
