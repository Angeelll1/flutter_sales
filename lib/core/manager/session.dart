import 'dart:convert';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static Future<bool> set(SessionCode code, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (value is String) {
      prefs.setString(code.name, value);
    } else {
      prefs.setString(code.name, jsonEncode(value));
    }

    return true;
  }

  static Future<dynamic> get(SessionCode code) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(code.name) ?? "";
  }

  static Future<dynamic> getObject(SessionCode code) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String data = prefs.getString(code.name) ?? "";

    if (data == "") return null;

    try {
      return json.decode(data);
    } catch (e) {
      return null;
    }
  }

  static invalidate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

enum SessionCode { token, mUser }
