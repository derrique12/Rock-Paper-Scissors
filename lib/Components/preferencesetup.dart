import 'package:shared_preferences/shared_preferences.dart';

addStringToSF(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}
