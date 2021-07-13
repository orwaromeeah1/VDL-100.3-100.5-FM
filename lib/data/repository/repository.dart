
import 'package:vdl/data/models/credintals.dart';
import 'package:vdl/data/networking/http_client.dart';
import 'package:vdl/data/requests/auth_request.dart';
import 'package:vdl/data/responses/auth_response.dart';
import 'package:vdl/data/shared_preferences/auth_prefes_helper.dart';
import 'package:vdl/service/auth/auth_service.dart';
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

}