import 'package:authentication_apps/modules/authentication/domain/usecase/check_token_usecase.dart';
import 'package:authentication_apps/modules/authentication/infrastructure/api/auth_api.dart';
import 'package:authentication_apps/modules/authentication/infrastructure/auth_repository_impl.dart';
import 'package:authentication_apps/modules/authentication/infrastructure/local_storage/auth_local_storage.dart';
import 'package:authentication_apps/modules/welcome/application/controllers/welcome_controller.dart';
import 'package:get/get.dart';

class WelcomeBindings extends Bindings {
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
      () => CheckTokenUsecase(
        authRepository: Get.find<AuthRepositoryImpl>(),
      ),
    );
    Get.lazyPut(
      () => WelcomeController(
        checkTokenUsecase: Get.find<CheckTokenUsecase>(),
      ),
    );
  }
}
