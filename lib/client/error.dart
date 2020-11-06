class ApiException implements Exception {

  @override
  String toString() => this.message;

  ApiException(this.message);

  String message;
}
