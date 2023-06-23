// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:authentication_apps/modules/users/domain/entities/user_response_model.dart';
import 'package:authentication_apps/modules/users/domain/params/user_params.dart';

import '../domain/user_repository.dart';
import 'api/user_api.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi userApi;
  UserRepositoryImpl({
    required this.userApi,
  });
  @override
  Future<UserResponseModel> getAllUsers(GetAllUsersParams params) {
    return userApi.getAllUsers(params);
  }
}
