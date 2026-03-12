import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simple_chatting_app/core/common/widgets/custom_text.dart';
import 'package:simple_chatting_app/core/utils/constants/app_colors.dart';
import 'package:simple_chatting_app/core/utils/constants/app_sizes.dart';
import 'package:simple_chatting_app/core/utils/constants/image_path.dart';

import '../../common/widgets/app_loader.dart';

class AppHelperFunctions{
 AppHelperFunctions._();
 static void showSnackBar(String message) {

  Get.showSnackbar(
   GetSnackBar(
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    borderRadius: 16,
    backgroundColor: Colors.black.withAlpha(100),

    duration: const Duration(seconds: 3),
    animationDuration: const Duration(milliseconds: 400),
    boxShadows: [
     // BoxShadow(
     //  color: Colors.black.withOpacity(0.2),
     //  blurRadius: 10,
     //  offset: const Offset(0, 4),
     // )
    ],

    messageText: Row(
     children: [

      /// App Icon
      Container(
       height: getHeight(36),
       width: getWidth(36),
       decoration: BoxDecoration(
        // color: Colors.white.withOpacity(.15),
        borderRadius: BorderRadius.circular(10),
       ),
       child: SvgPicture.asset(
       ImagePath.appLogo,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
       ),
      ),

      const SizedBox(width: 12),

      /// Message
      Expanded(
       child: CustomText(
        text: message,
        fontSize: getWidth(16),
        fontWeight: FontWeight.w600,
        textColor: Colors.white,
       ),
      ),
     ],
    ),
   ),
  );
 }

 static void showAlert(String title, String message) {
  showDialog(
   context: Get.context!,
   builder: (BuildContext context) {
    return AlertDialog(
     title: Text(title),
     content: Text(message),
     actions: [
      TextButton(
       onPressed: () => Navigator.of(context).pop(),
       child: const Text('OK'),
      ),
     ],
    );
   },
  );
 }

  static void showAppLoader() {
  Get.dialog(
   const Dialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    child: AppLoader(),
   ),
   barrierDismissible: false,
   barrierColor: Colors.black.withAlpha(45),
  );
 }

 static void hideAppLoader() {
  if (Get.isDialogOpen ?? false) {
   Get.back();
  }
 }

 static void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.push(
   context,
   MaterialPageRoute(builder: (_) => screen),
  );
 }

 static String truncateText(String text, int maxLength) {
  if (text.length <= maxLength) {
   return text;
  } else {
   return '${text.substring(0, maxLength)}...';
  }
 }

 static bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
 }
 static Size screenSize() {
  return MediaQuery.of(Get.context!).size;
 }

 static double screenHeight() {
  return MediaQuery.of(Get.context!).size.height;
 }
 static double screenWidth() {
  return MediaQuery.of(Get.context!).size.width;
 }

 static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}) {
  return DateFormat(format).format(date);
 }

 static List<T> removeDuplicates<T>(List<T> list) {
  return list.toSet().toList();
 }

 static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
  final wrappedList = <Widget>[];
  for (var i = 0; i < widgets.length; i += rowSize) {
   final rowChildren = widgets.sublist(
    i,
    i + rowSize > widgets.length ? widgets.length : i + rowSize,
   );
   wrappedList.add(Row(children: rowChildren));
  }
  return wrappedList;
 }

}