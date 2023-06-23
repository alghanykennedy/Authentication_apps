import 'package:authentication_apps/modules/authentication/domain/entities/signup_response_model.dart';
import 'package:authentication_apps/modules/authentication/domain/params/signup_params.dart';
import 'package:authentication_apps/modules/authentication/infrastructure/local_storage/auth_local_storage.dart';

import '../domain/auth_repository.dart';
import '../domain/entities/login_response_model.dart';
import '../domain/params/login_params.dart';
import 'api/auth_api.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi authApi;
  final AuthLocalStorage authLocalStorage;

  AuthRepositoryImpl({
    required this.authApi,
    required this.authLocalStorage,
  });

  @override
  Future<LoginResponseModel> loginUser(LoginParams params) {
    return authApi.loginUser(params);
  }

  @override
  Future<SignupResponseModel> signupUser(Map<String, dynamic> params) {
    final signuParams = SignupParams.fromJson(params);
    return authApi.signupUser(signuParams);
  }

  @override
  Future<void> setToken(String value) {
    return authLocalStorage.setToken(value);
  }

  @override
  Future<String?> getToken() {
    return authLocalStorage.getToken();
  }

  @override
  Future<void> logoutUser() {
    return authLocalStorage.clearToken();
  }
}
