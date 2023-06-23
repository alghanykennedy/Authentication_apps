import 'package:authentication_apps/modules/users/domain/params/user_params.dart';

import 'entities/user_response_model.dart';

abstract class UserRepository {
  Future<UserResponseModel> getAllUsers(GetAllUsersParams params);
}
