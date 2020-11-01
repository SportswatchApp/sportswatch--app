class ApiSettings {

  String baseUrl() {
    return 'http://127.0.0.1:8000/api/v1/';
  }

  Map<String, String> headers() {
    return<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Content-Language': 'da'
    };
  }

}
