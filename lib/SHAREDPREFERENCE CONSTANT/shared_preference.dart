import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData {
  static String userName = 'USERNAME';
  static String userAge = 'USERAGE';
  static String userMail = 'USERMAIL';
  static String userGender = 'USERGENDER';
  static String checkIfDoctor = 'DOCTORPROFILE';

  void getProfileData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.getString(SharedPreferenceData.userName);
  }
}
