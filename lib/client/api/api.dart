import 'package:sportswatch/client/api/club_api.dart';
import 'package:sportswatch/client/api/members_api.dart';
import 'package:sportswatch/client/api/time_api.dart';
import 'package:sportswatch/client/api/traniee_api.dart';
import 'package:sportswatch/client/api/user_api.dart';
import 'package:sportswatch/client/api/users_api.dart';
import 'package:sportswatch/client/http/http.dart';
import 'package:sportswatch/client/percist/percist_client.dart';

class Api {
  static final Api _i = Api._internal();
  static const String domain = "http://127.0.0.1:8000";

  //static const String domain = "https://test.sportswatchapp.dk/";

  factory Api([String baseUrl = Api.domain, String token = "token"]) {
    // TODO: Remove this before launch
    print('Running backend on: ' + domain);
    final SecureStorage storage = SecureStorage();
    _i.user = UserApi(
      HttpClient('$baseUrl/api/v1/user', storage, token),
    );
    _i.users = UsersApi(
      HttpClient('$baseUrl/api/v1', storage, token),
    );
    _i.club = ClubApi(
      HttpClient('$baseUrl/api/v1', storage, token),
    );
    _i.time = TimeApi(
      HttpClient('$baseUrl/api/v1/time', storage, token),
    );
    _i.member = MemberApi(HttpClient('$baseUrl/api/v1/', storage, token));
    _i.trainee = TranieeApi(HttpClient('$baseUrl/api/v1/', storage, token));
    return _i;
  }

  Api._internal();

  ClubApi? club;
  UserApi? user;
  UsersApi? users;
  TimeApi? time;
  MemberApi? member;
  TranieeApi? trainee;

  String? baseUrl;

}
