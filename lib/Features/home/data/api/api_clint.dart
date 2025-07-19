import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiClient {
  // Define your API client methods and properties here
  static Future<http.Response> post(
    String baseUrl,
    bool withAuth,
    Map<String, dynamic> body,
  ) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (withAuth) {
      headers = {
        'Authorization': 'Bearer your_token_here',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    }
    http.Response response = await http.post(
      Uri.parse(baseUrl),
      headers: headers,
      body: json.encode(body),
    );
    log(baseUrl);
    errorHandler(response);
    return response;
  }

  static Future<http.Response> put(
    String baseUrl,
    bool withAuth,
    Map<String, dynamic> body,
  ) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (withAuth) {
      headers = {
        'Authorization': 'Bearer your_token_here',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    }
    http.put(Uri.parse(baseUrl), headers: headers, body: json.encode(body));
    http.Response response = await http.put(
      Uri.parse(baseUrl),
      headers: headers,
      body: json.encode(body),
    );
    log(baseUrl);
    errorHandler(response);
    return response;
  }

  static Future<http.Response> get(String baseUrl, bool withAuth) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (withAuth) {
      headers = {
        'Authorization': 'Bearer your_token_here',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    }
    http.Response response = await http.get(
      Uri.parse(baseUrl),
      headers: headers,
    );
    log(baseUrl);
    errorHandler(response);
    return response;
  }

  static void errorHandler(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      log('Error: ${response.statusCode} - ${response.body}');
      throw Exception('Error: ${response.statusCode} - ${response.body}');
    }
  }
}
