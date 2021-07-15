class Urls {
  static const String DOMAIN = "https://www.vdl.me/";
  static const String BASE_API = DOMAIN + "/wp-json/wp/v2/";


  static const String AUTH = DOMAIN + 'oauth/token/';

  //PROGRAMS
  static const String PROGRAMS = BASE_API + 'program/';
  static const String PROGRAM_DETAILS = BASE_API + 'program/';
  static const String PROGRAM_CATEGORIES = BASE_API + 'program-category'; 


  //SEARCH
  static const String SEARCH = BASE_API +'news/?search=';

  //NEWSCASTS
  static const String NEWS_CASTS = BASE_API + 'newcast/';
}
