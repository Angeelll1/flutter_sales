import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/mode.dart';
import '../widgets/snackbar.dart';

class HttpRequestCallback {
  final Function(dynamic result, {Map? extras}) onSuccess;

  final Function(dynamic e, {Map? extras})? onError;

  final Function(dynamic e, {Map? extras})? onRetry;

  HttpRequestCallback({required this.onSuccess, this.onError, this.onRetry});
}

class ApiCallback {
  execute(
      {url,
      Map<String, String>? headers,
      body,
      HttpRequestCallback? callback,
      Duration? timeout,
      method = MODE.get,
      var isloading,
      extras}) async {
    try {
      http.Response response;

      if (method == MODE.post) {
        response = await http
            .post(Uri.parse(url), headers: {"Content-Type": "application/json"}, body: body != null ? jsonEncode(body) : null)
            .timeout(
              timeout != null ? timeout : Duration(seconds: 6),
              onTimeout: () => throw Exception("Server Timeout!!"),
            );
      } else {
        response = await http.get(Uri.parse(url), headers: headers).timeout(
              timeout != null ? timeout : Duration(seconds: 6),
              onTimeout: () => throw Exception("Server Timeout!!"),
            );
      }

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      CSnackBar.showError(
        message: "$e",
        icon: Icons.wifi_off,
        duration: Duration(seconds: 5),
        buttonText: "Retry",
      );

      return;
    }
  }
}
