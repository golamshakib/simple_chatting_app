import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isVisible = true.obs;
  void changeVisible() {
    isVisible.value = !isVisible.value;
  }
}