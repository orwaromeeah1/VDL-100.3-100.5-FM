import 'package:http/http.dart';
import 'package:vdl/data/models/credintals.dart';
import 'package:vdl/data/models/homeModel.dart';
import 'package:vdl/data/models/menus_model.dart';
import 'package:vdl/data/models/news_category.dart';
import 'package:vdl/data/models/news_model.dart';
import 'package:vdl/data/networking/http_client.dart';
import 'package:vdl/data/requests/auth_request.dart';
import 'package:vdl/data/responses/auth_response.dart';
import 'package:vdl/data/shared_preferences/auth_prefes_helper.dart';
import 'package:vdl/utils/secrets/app_keys.dart';
import 'package:vdl/utils/urls/urls.dart';
import 'dart:convert' as convert;

Menus menus = Menus();
List<NewsModel> news = [];
List<NewsModel> special = [];
List<NewsCategoryModel> categories = [];

class Repository {
  HttpClient _client;
  AuthPrefsHelper _authPrefsHelper;

  Repository(
    this._client,
    this._authPrefsHelper,
  );

  Future<void> getCredentials() async {
    Credentials credentials = AppKeys.getCredentials();
    AuthRequest authRequest = new AuthRequest(
      clientId: credentials.key,
      clientSecret: credentials.secret,
    );
    var response = await _client.post(
      Urls.AUTH,
      authRequest.toJson(),
    );

    AuthResponse res = AuthResponse.fromJson(response);
    await this._authPrefsHelper.setToken(res.accessToken, res.expiresIn);
  }

  Future<String> getToken() async {
    try {
      var tokenDate = await this._authPrefsHelper.getTokenDate();
      var diff = DateTime.now().difference(tokenDate).inMinutes;
      if (diff.abs() <= 5) {
        return this._authPrefsHelper.getToken();
      } else {
        await getCredentials();
        return this._authPrefsHelper.getToken();
      }
    } catch (e) {
      await getCredentials();
      return this._authPrefsHelper.getToken();
    }
  }

  ///
  ///Menus
  Future<void> getMenus() async {
    try {
      //  String token = await getToken();
      String response = await _client.getMethods(Urls.MENUS, "");
      menus = menusFromJson(response);
    } catch (e) {
      print(e);
    }
  }

  ///
  ///   All news
  Future<List<NewsModel>> getAllNews(int page) async {
    //  String token = await getToken();
    String response = await _client.getMethods(
        Urls.All_NEWS + '?page=${page}&per_page=10', "");
    news = allNewsFromJson(response);
  }

  ///
  ///   All news
  Future<List<NewsModel>> getNewsByCategory(int page, int id) async {
    //  String token = await getToken();
    if (id == 0) {
      String response = await _client.getMethods(
          Urls.All_NEWS + '?page=${page}&per_page=10', "");
      news = allNewsFromJson(response);
      return news;
    } else {
      String response = await _client.getMethods(
          Urls.BASE_API +
              'wp-json/wp/v2/news/?news-category=$id&per_page=10&page=$page',
          "");
      news = allNewsFromJson(response);
      return news;
    }
  }

  ///
  ///   Special Reports
  Future<List<NewsModel>> getSpecialReports(int page) async {
    //  String token = await getToken();
    String response = await _client.getMethods(
        Urls.Special_reports_url + '?page=${page}&per_page=10', "");
    try {
      special = allNewsFromJson(response);
    } catch (e) {
      print(e);
    }
    return special;
  }

  ///
  ///   All news
  Future<void> getNewsCategories() async {
    //  String token = await getToken();
    String response = await _client.getMethods(Urls.News_Categories, "");
    categories = newsCategoriesFromJson(response);
  }

  ///
  ///
  ///
  ///
  ///
  ///  getSingleNewsPage
  Future<NewsModel> getSingleSpecialReportPage(int id) async {
    //  String token = await getToken();
    String response =
        await _client.getMethods(Urls.Special_reports_url + '$id', "");
    return NewsModel.fromJson(convert.jsonDecode(response));
  }

  ///
  ///
  ///
  ///
  ///
  ///  getSingleNewsPage
  Future<NewsModel> getSingleNewsPage(int id) async {
    //  String token = await getToken();
    String response =
        await _client.getMethods(Urls.Single_news_url + '$id', "");
    return NewsModel.fromJson(convert.jsonDecode(response));
  }

  //////
  ///
  ///

  ///   Menus+allNews
  Future<HomeModel> getHomeData() async {
    await Future.wait(
        [getAllNews(1), getMenus(), getNewsCategories(), getSpecialReports(1)]);

    return new HomeModel(
      news: news,
      categories: categories,
      specialReports: special,
      menus: menus,
    );
  }

  ///
  ///
  ///
  ///
  ///
  ///  getArticles
  Future<List<NewsModel>> getArticles(int page) async {
    //  String token = await getToken();
    String response =
        await _client.getMethods(Urls.Articles_Url + '?page=${page}', '');
    return allNewsFromJson(response);
  }

  ///
  ///
  ///
  ///
  ///
  ///  getSingleArticle
  Future<NewsModel> getSingleArticle(int id) async {
    //  String token = await getToken();
    String response = await _client.getMethods(Urls.Articles_Url + '/$id', "");
    return NewsModel.fromJson(convert.jsonDecode(response));
  }
}
