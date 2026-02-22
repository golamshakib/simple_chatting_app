import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simple_chatting_app/core/utils/constants/app_sizes.dart';

import '../../utils/constants/app_colors.dart';
import 'custom_text.dart';

class AppSnackBar {
  static void showError(String message, {String title = 'Error'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Color(0xffDC143C),
      colorText: Colors.white,
      borderRadius: 10.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(15.0),
      duration: const Duration(seconds: 3),
      icon: Icon(Icons.error_outline, color: Colors.white, size: 30),
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
      titleText: CustomText(
        text: title,
        fontSize: getWidth(14),
        fontWeight: FontWeight.w500,
        textColor: AppColors.textWhite,
      ),
      messageText: CustomText(
        text: message,
        fontSize: getWidth(12),
        fontWeight: FontWeight.w400,
        textColor: AppColors.textWhite,
      ),
      // titleText: Text(
      //   title,
      //   style: TextStyle(
      //     fontSize: 20.0,  // Larger font size for the title
      //     fontWeight: FontWeight.bold,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }

  static void showSuccess(String message, {String title = 'Success'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.primary.withValues(alpha: 0.9),
      colorText: Colors.white,
      borderRadius: 10.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(15.0),
      duration: const Duration(seconds: 3),
      icon: Icon(Icons.celebration_outlined, color: Colors.white, size: 30),
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
      titleText: CustomText(
        text: title,
        fontSize: getWidth(14),
        fontWeight: FontWeight.w500,
        textColor: AppColors.textWhite,
      ),
      messageText: CustomText(
        text: message,
        fontSize: getWidth(12),
        fontWeight: FontWeight.w400,
        textColor: AppColors.textWhite,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AppSnackBar {
//   static void showError(String message) {
//     if (Get.isRegistered<GetMaterialController>()) {
//       Get.snackbar(
//         'Error',
//         message,
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red.withOpacity(0.8),
//         colorText: Colors.white,
//       );
//     } else {
//       debugPrint("Snackbar skipped (no overlay): $message");
//     }
//   }

//   static void showSuccess(String message) {
//     if (Get.isRegistered<GetMaterialController>()) {
//       Get.snackbar(
//         'Success',
//         message,
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.green.withOpacity(0.8),
//         colorText: Colors.white,
//       );
//     } else {
//       debugPrint("Snackbar skipped (no overlay): $message");
//     }
//   }
// }
