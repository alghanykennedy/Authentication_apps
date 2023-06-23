import 'package:authentication_apps/core/constants/api_client.dart';
import 'package:authentication_apps/modules/authentication/domain/entities/signup_response_model.dart';
import 'package:authentication_apps/modules/authentication/domain/params/signup_params.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/login_response_model.dart';
import '../../domain/params/login_params.dart';

class AuthApi {
  final Dio httpClient = Dio();

  Future<LoginResponseModel> loginUser(LoginParams data) async {
    var url = Uri.parse(
      ApiEndPoints.baseUrl + ApiEndPoints.login,
    );
    final response = await httpClient.post(
      url.toString(),
      data: data.toJson(),
    );
    return LoginResponseModel.fromJson(response.data);
  }

  Future<SignupResponseModel> signupUser(SignupParams data) async {
    var url = Uri.parse(
      ApiEndPoints.baseUrl + ApiEndPoints.register,
    );
    final response = await httpClient.post(
      url.toString(),
      data: data.toJson(),
    );
    return SignupResponseModel.fromJson(response.data);
  }
}
