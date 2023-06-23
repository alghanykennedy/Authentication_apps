import 'package:authentication_apps/core/utils/usecase.dart';
import 'package:authentication_apps/modules/authentication/domain/auth_repository.dart';

class CheckTokenUsecase implements UseCase<bool, void> {
  final AuthRepository authRepository;

  CheckTokenUsecase({
    required this.authRepository,
  });

  @override
  Future<bool> call(void _) async {
    final token = await authRepository.getToken();
    if (token != null) {
      return true;
    }
    return false;
  }
}
