import 'package:dio/dio.dart';

import '../../../../utils/api_endpoints.dart';

import '../../../authentication/domain/entities/login_response_model.dart';

class AuthApi {
  final Dio httpClient = Dio();

  Future<LoginResponseModel> user() async {
    var url = Uri.parse(
      ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.userList,
    );
    final response = await httpClient.get(
      url.toString(),
    );
    return LoginResponseModel.fromJson(response.data);
  }
}
