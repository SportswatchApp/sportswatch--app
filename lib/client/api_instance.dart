class ApiConnection {
  static final ApiConnection _singleton = ApiConnection._internal();

  factory ApiConnection() {
    return _singleton;
  }

  ApiConnection._internal();
}
