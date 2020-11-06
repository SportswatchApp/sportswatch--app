class ApiSettings {

  String baseUrl() {
    //String domain = 'http://127.0.0.1:8000'; // Local
    String domain = 'https://test.sportswatchapp.dk'; // Test server
    return domain + '/api/v1/';
  }

  Map<String, String> headers() {
    return<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Content-Language': 'da'
    };
  }

}
