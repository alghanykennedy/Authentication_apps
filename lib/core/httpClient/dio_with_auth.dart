import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_http_client.dart';

class DioHttpClientWithAuth implements BaseHttpClient {
  final Dio dio = Dio();
  @override
  final String baseURL;

  DioHttpClientWithAuth({required this.baseURL}) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          final String token = prefs.getString("token") ?? "";
          options.headers["Authorization"] = "Bearer $token";
          if (kDebugMode) {
            print(options.headers["Authorization"]);
          }
          return handler.next(options);
        },
      ),
    );
  }
}
