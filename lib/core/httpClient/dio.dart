import 'package:dio/dio.dart';

import 'base_http_client.dart';

class DioHttpClient implements BaseHttpClient {
  final Dio client = Dio();

  @override
  final String baseURL;

  DioHttpClient({
    required this.baseURL,
  });
}
