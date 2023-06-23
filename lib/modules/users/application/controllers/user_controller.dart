import 'package:authentication_apps/modules/authentication/domain/usecase/check_token_usecase.dart';
import 'package:authentication_apps/modules/users/domain/params/user_params.dart';
import 'package:authentication_apps/modules/users/domain/usecase/get_user_usercase.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../authentication/application/controllers/auth_controller.dart';
import '../../domain/entities/user_response_model.dart';

class UserController extends GetxController {
  final AuthController authController = Get.find<AuthController>();
  final GetAllUsersUseCase _getAllUsersUseCase;
  final CheckTokenUsecase checkTokenUsecase;
  final PagingController<int, UserData> pagingController =
      PagingController(firstPageKey: 1);

  RxList<UserData> users = <UserData>[].obs;

  UserController(
      {required GetAllUsersUseCase getAllUsersUseCase,
      required this.checkTokenUsecase})
      : _getAllUsersUseCase = getAllUsersUseCase;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) async {
      await getAllUsers(GetAllUsersParams(page: pageKey));
    });

    super.onInit();
  }

  Future<void> getAllUsers(GetAllUsersParams params) async {
    try {
      final result = await _getAllUsersUseCase.call(params);
      users.addAll(result.data);
      final isLastPage = result.data.length < 10;
      if (isLastPage) {
        pagingController.appendLastPage(result.data);
      } else {
        final nextPage = params.page + 1;
        pagingController.appendPage(result.data, nextPage);
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == 401) {
        await logout();
      } else {
        if (kDebugMode) {
          print("Error: ${error.toString()}");
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error: ${error.toString()}");
      }
    }
  }

  Future<void> logout() async {
    await authController.logoutUser();
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}
