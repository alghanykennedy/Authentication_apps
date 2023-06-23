import 'package:dio/dio.dart';

import '../../../../core/httpClient/dio_with_auth.dart';
import '../../../../utils/api_endpoints.dart';

import '../../domain/entities/user_response_model.dart';
import '../../domain/params/user_params.dart';

class UserApi {
  final Dio httpClientWithAuth = DioHttpClientWithAuth(
    baseURL: ApiEndPoints.baseUrl,
  ).dio;

  Future<UserResponseModel> getAllUsers(
    GetAllUsersParams params,
  ) async {
    var url = Uri.parse(
      ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.userList,
    );
    final response = await httpClientWithAuth.get(
      url.toString(),
      queryParameters: params.toJson(),
    );
    return UserResponseModel.fromJson(response.data);
  }
}
