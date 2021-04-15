library globals;

import 'package:sportswatch/client/models/member_model.dart';
import 'package:sportswatch/client/models/user_model.dart';

int memberId = 0;


MemberModel currentMember(UserModel user) {
  for (MemberModel m in user.members!) {
    if (m.id == memberId) {
      return m;
    }
  }
  throw new Exception("Member not set!");
}
