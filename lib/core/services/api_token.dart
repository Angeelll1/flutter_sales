import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/url.dart';
import '../manager/session.dart';
import '../model/m_user.dart';

Future getToken({Map? body}) async {
  var url = URL.API_JS + '/auth';

  print('url : ' + url);

  print("body = ${body}");

  try {
    http.Response response = await http
        .post(Uri.parse(url), body: body)
        .timeout(Duration(seconds: 6),
            onTimeout: () => throw Exception("Server Timeout"));

    final int statusCode = response.statusCode;

    if (statusCode == 200) {
      final jsonData = json.decode(response.body);

      //set user
      await Session.set(SessionCode.mUser, MUser.fromJson(jsonData["user"]));

      String resultData = jsonData['token'];

      print(jsonData);

      return resultData;
    } else if (statusCode == 500) {
      return 'Offline';
    } else {
      return response.body;
    }
  } catch (e) {
    print("file : api_token(25) ~~ error : " + e.toString());
    return "Error = ${e.toString()}";
  }
}

Future<String> checkActiveSession(String token) async {
  var url = URL.API_JS + 'auth/check-token';
  try {
    http.Response response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'x-access-token': 'Bearer $token'
    }).timeout(Duration(seconds: 20), onTimeout: () {
      return http.Response('Time out', 500);
    });

    print("respon token = " + response.body);
    final int statusCode = response.statusCode;
    if (statusCode == 200) {
      return "Active";
    } else {
      return "Inactive";
    }
  } catch (e) {
    print("file:api_token 58 ~~ error =" + e.toString());
    return "Inactive";
  }
}

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class TokenService {
  final String baseUrl =
      URL.API_JS + '/auth/check-token'; // Sesuaikan URL server Anda

  Future<bool> checkToken(String token) async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Sertakan token di header
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Token valid: ${data['user']}'); // Debugging
        return true;
      } else {
        print('Token tidak valid: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
