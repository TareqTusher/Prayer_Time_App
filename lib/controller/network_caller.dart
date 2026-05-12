import 'dart:convert';


import 'package:prayer_times_app/controller/network_response.dart';

import 'package:http/http.dart' ;

class NetworkCaller {
  Future<NetworkResponse> postRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    final response = await post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: {
        'Content-Type':'application/json',
      },
    );

    if (response.statusCode == 200) {
      return NetworkResponse(
        isSuccess: true,
        statusCode: 200,
        jsonResponse: jsonDecode(response.body),
      );
    } 
    else if (response.statusCode == 400) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: 400,
        jsonResponse: jsonDecode(response.body),
      );
    } 
    else {
      return NetworkResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        jsonResponse: jsonDecode(response.body),
      );
    }
  }
}
