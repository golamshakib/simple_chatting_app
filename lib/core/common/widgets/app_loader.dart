import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_chatting_app/core/utils/constants/app_colors.dart';
import 'package:simple_chatting_app/core/utils/constants/image_path.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: Lottie.asset(
          ImagePath.loadingAnimation,
          fit: BoxFit.contain,
          repeat: true,
        ),
      ),
    );
  }
}