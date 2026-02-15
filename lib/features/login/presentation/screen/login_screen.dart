import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_chatting_app/core/common/widgets/custom_appbar.dart';
import 'package:simple_chatting_app/core/common/widgets/custom_text.dart';
import 'package:simple_chatting_app/core/common/widgets/custom_textformfield.dart';
import 'package:simple_chatting_app/core/utils/constants/app_colors.dart';
import 'package:simple_chatting_app/core/utils/constants/app_sizes.dart';
import 'package:simple_chatting_app/core/utils/validators/app_validator.dart';

import '../../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: CustomAppBar(showBackIcon: false),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(getWidth(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Let\' Sign you in!',
                fontSize: getWidth(24),
                fontWeight: FontWeight.w600,
                textColor: Colors.black,
              ),
              SizedBox(height: getHeight(24)),
              CustomText(
                text: 'Email',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: getHeight(12)),
              CustomTextFormField(
                controller: controller.emailController,
                borderRedius: 12,
                containerColor: Colors.white,
                keyboardType: TextInputType.emailAddress,
                containerBorderColor: AppColors.textFormFieldBorder,
                hintText: 'Enter your email',
              ),
              SizedBox(height: getHeight(16)),
              CustomText(
                text: 'Password',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: getHeight(12)),
              Obx(
                () => CustomTextFormField(
                  controller: controller.passwordController,
                  obscureText: controller.isVisible.value,
                  borderRedius: 12,
                  containerColor: Colors.white,
                  containerBorderColor: AppColors.textFormFieldBorder,
                  keyboardType: TextInputType.visiblePassword,
                  validation: AppValidator.validatePassword,
                  hintText: 'Enter your password',
                  suffixIcon: GestureDetector(
                    onTap: () => controller.changeVisible(),
                    child: Icon(
                      controller.isVisible.value
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
