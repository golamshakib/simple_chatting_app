import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_chatting_app/core/services/auth_service.dart';
import 'package:simple_chatting_app/core/utils/constants/app_urls.dart';
import 'package:simple_chatting_app/core/utils/helpers/app_helper.dart';
import 'package:simple_chatting_app/routes/app_routes.dart';

import '../../../core/common/widgets/app_snack_bar.dart';
import '../../../core/services/network_caller.dart';

class LoginController extends GetxController {

  final emailController = TextEditingController(text: "a@fexpost.com");
  final passwordController = TextEditingController(text: "123456!A");
  final isVisible = true.obs;
  void changeVisible() {
    isVisible.value = !isVisible.value;
  }

  Future<void> login() async {
    try {
      AppHelperFunctions.showAppLoader();

      final requestBody = {
        "email" : emailController.text.trim().toLowerCase(),
        "password" : passwordController.text.trim(),
        // "fcmToken" : "fcmToken",
      };
      final response = await NetworkCaller().postRequest(
        AppUrls.login,
        body: requestBody,
      );

      // AppHelperFunctions.hideAppLoader();

      if (response.isSuccess) {
        final data = response.responseData?['result'];
        final String? token = data?['accessToken'];
        final String? userId = data?['id'];

        log("RESULT IS: $data");
        log("TOKEN IS : $token");

        if (token == null || token.isEmpty) {
          AppSnackBar.showError('Login failed: Token Missing. Try again later');
          return;
        }
        // Store the token securely for future use
        await AuthService.saveToken(token: token, id: userId);

        // Navigate to the Message List Screen
        Get.offAllNamed(AppRoute.chattingListScreen);
      } else if (response.statusCode == 401) {
        AppSnackBar.showError("Invalid Email or Password");
      } else {
        AppSnackBar.showError("Login failed. Please try again later.");
      }
    } catch (e, s) {
      log("Login Error: ", error: e, stackTrace: s);
      AppSnackBar.showError("Login failed. Please try again later.");
    } finally {
      AppHelperFunctions.hideAppLoader();
    }
  }
}