import 'package:authentication_apps/core/utils/usecase.dart';
import 'package:authentication_apps/modules/authentication/domain/auth_repository.dart';

class LogoutUseCase implements UseCase<void, void> {
  final AuthRepository authRepository;

  LogoutUseCase({
    required this.authRepository,
  });

  @override
  Future<void> call(void _) async {
    await authRepository.logoutUser();
  }
}
