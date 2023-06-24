import 'package:authentication_apps/data/providers/api_client.dart';
import 'package:dio/dio.dart';

import '../../../authentication/domain/entities/login_response_model.dart';

class AuthApi {
  final Dio httpClient = Dio();

  Future<LoginResponseModel> user() async {
    var url = Uri.parse(
      ApiEndPoints.baseUrl + ApiEndPoints.login,
    );
    final response = await httpClient.get(
      url.toString(),
    );
    return LoginResponseModel.fromJson(response.data);
  }
}
