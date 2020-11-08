import 'package:sportswatch/client/api/user_api.dart';
import 'package:sportswatch/client/api/users_api.dart';
import 'package:sportswatch/client/http/http.dart';
import 'package:sportswatch/client/percist/percist_client.dart';

class Api {

  static final Api _i = Api._internal();

  factory Api([String baseUrl = "http://127.0.0.1:8000", String token = "token"]) {
    final SecureStorage storage = SecureStorage();
    _i.user = UserApi(
      HttpClient(
          baseUrl: '$baseUrl/api/v1/user', storage: storage, token: token),
    );
    _i.users = UsersApi(
      HttpClient(
          baseUrl: '$baseUrl/api/v1', storage: storage, token: token),
    );
    return _i;
  }

  Api._internal();


  UserApi user;
  UsersApi users;

  String baseUrl;
}
