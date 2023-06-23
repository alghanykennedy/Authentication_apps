// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/utils/usecase.dart';
import '../auth_repository.dart';
import '../entities/login_response_model.dart';
import '../params/login_params.dart';

class LoginUseCase implements UseCase<LoginResponseModel, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase({
    required this.authRepository,
  });

  @override
  Future<LoginResponseModel> call(LoginParams params) async {
    final result = await authRepository.loginUser(params);
    if (result.data != null) {
      authRepository.setToken(result.data?.token ?? '');
    }
    return result;
  }
}
