import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_chatting_app/core/utils/constants/app_colors.dart';
import 'package:simple_chatting_app/core/utils/constants/image_path.dart';

class CustomPullRefresh extends StatelessWidget {
  final double pulledExtent;
  final bool refreshing;

  const CustomPullRefresh({
    super.key,
    required this.pulledExtent,
    required this.refreshing,
  });

  @override
  Widget build(BuildContext context) {
    final double size = pulledExtent.clamp(0, 60);

    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 1,
              color: Colors.black.withAlpha(15),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [

            /// Loading indicator
            if (refreshing)
              const SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.textPrimary,
                ),
              ),

            /// App Logo
            SvgPicture.asset(
              ImagePath.appLogo,
              height: 25,
              width: 25,
            ),
          ],
        ),
      ),
    );
  }
}