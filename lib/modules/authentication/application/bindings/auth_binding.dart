import 'package:authentication_apps/modules/authentication/domain/usecase/check_token_usecase.dart';
import 'package:authentication_apps/modules/authentication/domain/usecase/signup_usecase.dart';
import 'package:authentication_apps/modules/authentication/infrastructure/local_storage/auth_local_storage.dart';
import 'package:get/get.dart';

import '../../domain/usecase/login_usecase.dart';
import '../../domain/usecase/logout_usecase.dart';
import '../../infrastructure/api/auth_api.dart';
import '../../infrastructure/auth_repository_impl.dart';
import '../controllers/auth_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthApi());
    Get.lazyPut(() => AuthLocalStorage());
    Get.lazyPut(
      () => AuthRepositoryImpl(
        authApi: Get.find<AuthApi>(),
        authLocalStorage: Get.find<AuthLocalStorage>(),
      ),
    );
    Get.lazyPut(
      () => LoginUseCase(
        authRepository: Get.find<AuthRepositoryImpl>(),
      ),
    );
    Get.lazyPut(
      () => SignupUseCase(
        authRepository: Get.find<AuthRepositoryImpl>(),
      ),
    );
    Get.lazyPut(
      () => CheckTokenUsecase(
        authRepository: Get.find<AuthRepositoryImpl>(),
      ),
    );
    Get.lazyPut(
      () => LogoutUseCase(
        authRepository: Get.find<AuthRepositoryImpl>(),
      ),
    );
    Get.lazyPut(
      () => AuthController(
        loginUseCase: Get.find<LoginUseCase>(),
        signupUseCase: Get.find<SignupUseCase>(),
        checkTokenUsecase: Get.find<CheckTokenUsecase>(),
        logoutUseCase: Get.find<LogoutUseCase>(),
      ),
    );
  }
}
