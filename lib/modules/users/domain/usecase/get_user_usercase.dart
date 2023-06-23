import '../../../../core/utils/usecase.dart';

import '../entities/user_response_model.dart';
import '../params/user_params.dart';
import '../user_repository.dart';

class GetAllUsersUseCase
    implements UseCase<UserResponseModel, GetAllUsersParams> {
  final UserRepository userRepository;

  GetAllUsersUseCase({required this.userRepository});

  @override
  Future<UserResponseModel> call(GetAllUsersParams params) async {
    return await userRepository.getAllUsers(params);
  }
}
