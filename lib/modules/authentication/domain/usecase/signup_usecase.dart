import 'package:authentication_apps/core/utils/usecase.dart';
import 'package:authentication_apps/modules/authentication/domain/auth_repository.dart';

import '../entities/signup_response_model.dart';
import '../params/signup_params.dart';

class SignupUseCase extends UseCase<SignupResponseModel, SignupParams> {
  final AuthRepository authRepository;

  SignupUseCase({
    required this.authRepository,
  });

  @override
  Future<SignupResponseModel> call(SignupParams params) async {
    final result = await authRepository
        .signupUser(params.toJson()); // Pass params.toJson()
    if (result.data?.token != null) {
      authRepository.setToken(result.data?.token ?? '');
    }
    return result;
  }
}
