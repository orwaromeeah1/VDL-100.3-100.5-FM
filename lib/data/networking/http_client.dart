import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:vdl/core/Exceptions.dart';
import 'dart:convert' as convert;

class HttpClient {
  Future get(String url, {String? token}) async {
    try {
      log('GET :' + url);
      var response;
      response = await http.get(
              Uri.parse(url),
              headers: {
                "Accept": "application/json",
                "Authorization": "Bearer $token",
              },
            );

      switch (response.statusCode) {
        case 200:
          {
            log('response :' + response.body.toString());
            return convert.jsonDecode(response.body);
          }

        default:
          {
            throw BadRequestError("");
          }
      }
    } on TimeoutException catch (_) {
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<Map<String, dynamic>?> post(String url, Map<String, dynamic> payLoad,
      {String? token}) async {
    try {
      log('POST :' + url);
      log('body :' + payLoad.toString());
      var response;
      response = await http.post(Uri.parse(url),
              headers: {
                "Accept": "application/json",
                "Authorization": "Bearer $token",
              },
              body: convert.jsonEncode(payLoad));

      switch (response.statusCode) {
        case 200:
          {
            return convert.jsonDecode(response.body);
          }

        default:
          {
            throw BadRequestError("");
          }
      }
    } on TimeoutException catch (_) {
    } catch (e) {
      print(e);
    }
    return null;
  }

  ////
  ///
  ///
  /// Get menus
  Future<String?> getMethods(String url, String token) async {
    try {
      log('GET :' + url);
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      switch (response.statusCode) {
        case 200:
          {
            return response.body;
          }

        default:
          {
            throw BadRequestError("");
          }
      }
    } on TimeoutException catch (_) {}
    return null;
  }

  /// Get menus
  Future<String?> getTweetsMethod(String url, String token) async {
    try {
      log('GET :' + url);
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
          "start_time": DateTime.now().toString()
        },
      );

      switch (response.statusCode) {
        case 200:
          {
            return response.body;
          }

        default:
          {
            throw BadRequestError("");
          }
      }
    } on TimeoutException catch (_) {
    } catch (e) {
      print(e);
      throw BadRequestError("");
    }
    return null;
  }
}
