import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sportswatch/client/error.dart';
import 'package:sportswatch/client/percist/percist_client.dart';
import 'package:rxdart/rxdart.dart';

class HttpClient {
  HttpClient({this.baseUrl, this.storage, this.token});

  Future<Map<String, String>> get _headers async {
    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Content-Language': 'da',
    };

    final String token = await storage.get("token");

    if (token != null) {
      headers['Authorization'] = 'Token ' + token;
    }

    return headers;
  }

  final String baseUrl;
  final SecureStorage storage;
  final String token;

  Stream<Response> get(String url) {
    return Stream<Map<String, String>>.fromFuture(_headers).flatMap(
        (headers) => _parseJson(http.get(baseUrl + url, headers: headers)));
  }

  Stream<Response> post(String url, [dynamic body]) {
    return Stream<Map<String, String>>.fromFuture(_headers).flatMap((headers) =>
        _parseJson(http.post(baseUrl + url,
            headers: headers, body: json.encode(body))));
  }

  dynamic _bodyHandler(dynamic body) {
    return body is Map ? jsonEncode(body) : body;
  }

  Stream<Response> _parseJson(Future<http.Response> response) {
    return Stream<http.Response>.fromFuture(response).map((http.Response res) {
      Map<String, dynamic> json = jsonDecode(res.body);

      if (res.statusCode > 300) {
        throw ApiException(Response(res, json));
      }

      return Response(res, json);
    });
  }
}

class Response {
  /// Default constructor
  Response(this.response, this.json);

  /// The HTTP response from the client
  final http.Response response;

  /// Parsed JSON response
  final Map<String, dynamic> json;

  /// HTTP StatusCode
  int statusCode() => response.statusCode;

  /// Check if response is a successful
  bool success() => response.statusCode < 300;
}
