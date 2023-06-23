import 'package:authentication_apps/core/constants/routes.dart';
import 'package:authentication_apps/modules/authentication/domain/usecase/check_token_usecase.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  final CheckTokenUsecase checkTokenUsecase;

  WelcomeController({required this.checkTokenUsecase});

  @override
  void onInit() {
    checkToken();
    super.onInit();
  }

  Future<void> checkToken() async {
    final isTokenExist = await checkTokenUsecase(null);
    if (isTokenExist) {
      Get.offNamed(RouteNames.homeScreen);
    }
  }
}
