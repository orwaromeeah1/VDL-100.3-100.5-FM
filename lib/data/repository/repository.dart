
import 'dart:developer';

import 'package:vdl/data/models/category_model.dart';
import 'package:vdl/data/models/credintals.dart';
import 'package:vdl/data/models/programs_schedule.dart';
import 'package:vdl/data/networking/http_client.dart';
import 'package:vdl/data/requests/auth_request.dart';
import 'package:vdl/data/responses/auth_response.dart';
import 'package:vdl/data/responses/news_cast_response.dart';
import 'package:vdl/data/responses/program_categories_response.dart';
import 'package:vdl/data/responses/program_details_response.dart';
import 'package:vdl/data/responses/programs_response.dart';
import 'package:vdl/data/responses/search_response.dart';
import 'package:vdl/data/shared_preferences/auth_prefes_helper.dart';
import 'package:vdl/utils/secrets/app_keys.dart';
import 'package:vdl/utils/urls/urls.dart';

class Repository{

  HttpClient _client;
  AuthPrefsHelper _authPrefsHelper;

  Repository(this._client, this._authPrefsHelper,);


  Future<void> getCredentials()async{
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
    await this._authPrefsHelper.setToken(res.accessToken,res.expiresIn);

  }


  Future<String> getToken()async{
    try{
      var tokenDate = await this._authPrefsHelper.getTokenDate();
      var diff = DateTime.now().difference(tokenDate).inMinutes;
      if (diff.abs() <= 5) {
        return this._authPrefsHelper.getToken();
      }
      else{
         await getCredentials();
         return this._authPrefsHelper.getToken();
      }
    }catch(e){
      await getCredentials();
      return this._authPrefsHelper.getToken();
    }


  }



  Future<List<ProgramsResponse>> getPrograms(int page,int perPage)async{

    dynamic response = await _client.get(
      Urls.PROGRAMS+'?page=$page&per_page=$perPage',
    );

    List<ProgramsResponse> result =[];

    for(int i=0; i<response.length; i++){
      result.add(ProgramsResponse.fromJson(response[i]));
    }

    return result;
  }

  Future<List<ProgramsResponse>> getCategoryPrograms(int categoryId,int page,int perPage)async{

    dynamic response = await _client.get(
      Urls.PROGRAMS+'?program-category=$categoryId&page=$page&per_page=$perPage',
    );

    List<ProgramsResponse> result =[];

    for(int i=0; i<response.length; i++){
      result.add(ProgramsResponse.fromJson(response[i]));
    }

    return result;
  }

  Future<List<CategoryModel>> getProgramsCategories()async{

    dynamic response = await _client.get(
      Urls.PROGRAM_CATEGORIES,
    );
    List<CategoryModel> categories =[];
    for(int i=0; i<response.length; i++){
      categories.add(new CategoryModel(
        id: response[i]["id"],
        name: response[i]["name"],
      ));
    }

    return categories;
  }

  Future<List<ProgramsResponse>> programsSearch(int categoryId,int page,int perPage,String searchQuery)async{
    String queryParameter = categoryId == -100
                             ?'?page=$page&per_page=$perPage&s=$searchQuery'
                             :'?program-category=$categoryId&page=$page&per_page=$perPage&s=$searchQuery';

    dynamic response = await _client.get(
      Urls.PROGRAMS+queryParameter,
    );

    List<ProgramsResponse> result =[];

    for(int i=0; i<response.length; i++){
      result.add(ProgramsResponse.fromJson(response[i]));
    }

    return result;
  }


  Future<ProgramDetailsResponse> getProgramDetails(int programId)async{
    dynamic response = await _client.get(
      Urls.PROGRAMS+'$programId',
    );
    return ProgramDetailsResponse.fromJson(response);
  }

  Future<List<SearchResponse>> search(String searchQuery)async{
    dynamic response = await _client.get(
      Urls.SEARCH+'$searchQuery',
    );
    List<SearchResponse> result =[];

    for(int i=0; i<response.length; i++){
      result.add(SearchResponse.fromJson(response[i]));
    }

    return result;
  }

  Future<List<NewsCastResponse>> getNewsCasts()async{
    dynamic response = await _client.get(
      Urls.NEWS_CASTS,
    );

    List<NewsCastResponse> result =[];

    for(int i=0; i<response.length; i++){
      result.add(NewsCastResponse.fromJson(response[i]));
    }

    return result;
  }

  Future<List<ProgramSchedule>> getProgramsSchedule(String day,int dayNum)async{
    dynamic response = await _client.get(
      Urls.PROGRAMS_SCHEDULE + '?currentScheduleWeekDay=$day&currentScheduleMonthDay=$dayNum',
    );

    return ProgramSchedule.fromJson(response);
  }

}