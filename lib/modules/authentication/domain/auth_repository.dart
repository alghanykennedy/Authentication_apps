import 'package:authentication_apps/modules/authentication/domain/entities/signup_response_model.dart';

import 'entities/login_response_model.dart';
import 'params/login_params.dart';

abstract class AuthRepository {
  Future<LoginResponseModel> loginUser(LoginParams params);
  Future<SignupResponseModel> signupUser(Map<String, dynamic> params);
  Future<void> setToken(String value);
  Future<String?> getToken();
  Future<void> logoutUser();
}
