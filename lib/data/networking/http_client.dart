import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:vdl/core/Exceptions.dart';
import 'dart:convert' as convert;

class HttpClient {
  Future<Map<String, dynamic>> get(String url, String token) async {
    try {
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
            return convert.jsonDecode(response.body);
          }

        default:
          {
            throw BadRequestError("");
          }
      }
    } on TimeoutException catch (_) {} catch (e) {
      print(e);
    }
  }

  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> payLoad,
      {String token}) async {
    try {
      var response;
      token != null
          ? response = await http.post(Uri.parse(url),
              headers: {
                "Accept": "application/json",
                "Authorization": "Bearer $token",
              },
              body: convert.jsonEncode(payLoad))
          : response = await http.post(Uri.parse(url),
              headers: {
                "Accept": "application/json",
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
    } on TimeoutException catch (_) {} catch (e) {
      print(e);
    }
  }

  ////
  ///
  ///
  /// Get menus
  Future<String> getMethods(String url, String token) async {
    try {
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
  }
}
