import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPrefs;

  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  // Clear all
  removeAll() async {
    return _sharedPrefs.clear();
  }

  // API URL address
  set apiUrl(String value) {
    _sharedPrefs.setString("apiUrl", value);
  }

  String get apiUrl => _sharedPrefs.getString("apiUrl") ?? "";

  // User ID
  set userId(int value) {
    _sharedPrefs.setInt("userId", value);
  }

  int get userId => _sharedPrefs.getInt("userId") ?? 0;

  // User Token
  set userToken(String value) {
    _sharedPrefs.setString("userToken", value);
  }

  String get userToken => _sharedPrefs.getString("userToken") ?? "";

  // Device Width
  set deviceWidth(double value) {
    _sharedPrefs.setDouble("deviceWidth", value);
  }

  double get deviceWidth => _sharedPrefs.getDouble("deviceWidth") ?? 0;

  // Device Height
  set deviceHeight(double value) {
    _sharedPrefs.setDouble("deviceHeight", value);
  }

  double get deviceHeight => _sharedPrefs.getDouble("deviceHeight") ?? 0;
}

final sharedPrefs = SharedPrefs();
