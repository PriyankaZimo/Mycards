import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserId(String uId, String fName, String lName ,String otpN ,String otp)async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('uId', uId);
  prefs.setString('fName', fName);
  prefs.setString('lName', lName);
  prefs.setString('mobile_no', otpN);
  prefs.setString('email', otp);
  print(uId);
}
getUID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('uID');
}
getName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return '${prefs.getString('fName')}  ${prefs.getString('lName')} ';
}
getC() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return '${prefs.getString('mobile_no')}';
}
getO() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return '${prefs.getString('email')}';
}
clearLocalData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  print('logout');
}
