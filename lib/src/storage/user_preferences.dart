import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // Token
  get token {
    return _prefs.getString('token') ?? '';
  }

  set token( String value ) {
    _prefs.setString('token', value);
  }
  
  // Account Name
  get accountName {
    return _prefs.getString('accountName') ?? '';
  }

  set accountName( String value ) {
    _prefs.setString('accountName', value);
  }

  // DeviceId
  get deviceId {
    return _prefs.getString('deviceId') ?? '';
  }

  set deviceId( String value ) {
    _prefs.setString('deviceId', value);
  }
}

