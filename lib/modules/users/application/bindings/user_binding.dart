import 'package:authentication_apps/modules/authentication/application/controllers/auth_controller.dart';
import 'package:authentication_apps/modules/authentication/domain/usecase/check_token_usecase.dart';
import 'package:authentication_apps/modules/authentication/domain/usecase/login_usecase.dart';
import 'package:authentication_apps/modules/authentication/domain/usecase/logout_usecase.dart';
import 'package:authentication_apps/modules/authentication/domain/usecase/signup_usecase.dart';
import 'package:authentication_apps/modules/authentication/infrastructure/auth_repository_impl.dart';
import 'package:get/get.dart';

import '../../domain/usecase/get_user_usercase.dart';
import '../../infrastructure/api/user_api.dart';
import '../../infrastructure/user_repository_impl.dart';
import '../controllers/user_controller.dart';

class UserBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(
        () => UserApi(),
      )
      ..lazyPut(
        () => UserRepositoryImpl(
          userApi: Get.find<UserApi>(),
        ),
      )
      ..lazyPut(
        () => GetAllUsersUseCase(
          userRepository: Get.find<UserRepositoryImpl>(),
        ),
      )
      ..lazyPut(
        () => UserController(
          getAllUsersUseCase: Get.find(),
          checkTokenUsecase: Get.find<CheckTokenUsecase>(),
        ),
      )
      ..lazyPut(
        () => LoginUseCase(
          authRepository: Get.find<AuthRepositoryImpl>(),
        ),
      )
      ..lazyPut(
        () => SignupUseCase(
          authRepository: Get.find<AuthRepositoryImpl>(),
        ),
      )
      ..lazyPut(
        () => LogoutUseCase(
          authRepository: Get.find<AuthRepositoryImpl>(),
        ),
      )
      ..lazyPut(
        () => AuthController(
          loginUseCase: Get.find<LoginUseCase>(),
          signupUseCase: Get.find<SignupUseCase>(),
          checkTokenUsecase: Get.find<CheckTokenUsecase>(),
          logoutUseCase: Get.find<LogoutUseCase>(),
        ),
      );
  }
}
