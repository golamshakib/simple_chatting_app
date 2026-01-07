import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_chatting_app/core/utils/constants/app_sizer.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../../../../core/utils/constants/logo_path.dart';
import '../../../../routes/app_routes.dart';
import '../../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDEF7F8),
      body: Stack(
        children: [
          // Top logo background
          Positioned(
            top: 153,
            left: 35,
            right: 35,
            child: Row(
              children: [
                SvgPicture.asset(
                  ImagePath.appLogo,
                  height: 90.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: getWidth(10)),
                Expanded(
                  child: CustomText(
                    text: 'Chatting App',
                    textAlign: TextAlign.center,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),

          // Bottom splashBacOne image
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              ImagePath.splashBacOne,
              height: 460.h,
              fit: BoxFit.cover,
            ),
          ),

          // Middle splash background image
          Positioned(
            left: 29.w,
            right: 29.w,
            bottom: 122.h,
            child: SizedBox(
              height: 385.h,
              child: Lottie.asset(
                ImagePath.conversationImage,
                fit: BoxFit.contain,
              ),
            ),
          ),

          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getHeight(60)),
              child: SlideAction(
                outerColor: AppColors.primary, // background color
                innerColor: AppColors.backgroundDark, // slider color
                text: 'Swipe to Next',
                elevation: 2,
                textStyle: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600
                ),
                sliderButtonIcon: const Icon(Icons.double_arrow_rounded, color: AppColors.textWhite,),
                submittedIcon: Image.asset(LogoPath.appLogo, height: 30.h, width: 30.w,),
                onSubmit: () async{
                  await Future.delayed(Duration(milliseconds: 500));
                  // Get.offNamed(AppRoute.secondOnboardingScreen);
                  return;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
