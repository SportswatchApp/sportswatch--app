import 'http/http.dart';

/// Represents an exception from an API call
class ApiException implements Exception {
  /// Create an API exception, when f.x success was false, and errorKey was set
  ApiException(this.response) {
    this.detail = response.json['detail'];
  }

  /// Response involved in the exception
  final Response response;

  /// The message describing the error
  String detail;

  @override
  String toString() => '[ApiException]: ${response.json['detail']}';
}
