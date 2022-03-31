import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_ONBOARDING_SCREEN = "PREFS_KEY_ONBOARDING_SCREEN";
const String PREFS_KEY_IS_USER_LOGGED = "PREFS_KEY_IS_USER_LOGGED";

class AppPreferences {
  final SharedPreferences sharedPreferences;
  AppPreferences(this.sharedPreferences);

  Future<void> setOnBoardingScreenViewed() async {
    sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN) ?? false;
  }

  Future<void> setIsUserLogged() async {
    sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED, true);
  }

  Future<bool> isUserLogged() async {
    return sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED) ?? false;
  }
}
