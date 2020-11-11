import 'package:sportswatch/client/api/club_api.dart';
import 'package:sportswatch/client/api/user_api.dart';
import 'package:sportswatch/client/api/users_api.dart';
import 'package:sportswatch/client/http/http.dart';
import 'package:sportswatch/client/percist/percist_client.dart';

class Api {

  static final Api _i = Api._internal();
  static const String domain = "http://127.0.0.1:8000";

  factory Api([String baseUrl = Api.domain, String token = "token"]) {
    print('Running backend on: ' + domain);
    final SecureStorage storage = SecureStorage();
    _i.user = UserApi(
      HttpClient(
          baseUrl: '$baseUrl/api/v1/user', storage: storage, token: token),
    );
    _i.users = UsersApi(
      HttpClient(
          baseUrl: '$baseUrl/api/v1', storage: storage, token: token),
    );
    _i.club = ClubApi(
      HttpClient(
        baseUrl: '$baseUrl/api/v1', storage: storage, token: token),
    );
    return _i;
  }

  Api._internal();

  ClubApi club;
  UserApi user;
  UsersApi users;

  String baseUrl;
}
