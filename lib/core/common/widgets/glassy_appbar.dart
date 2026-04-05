import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:simple_chatting_app/core/common/widgets/custom_text.dart';

class GlassyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  final String? profileImageUrl;
  final int? badgeCount;
  final VoidCallback? onBackTap;
  final List<Widget>? actions;
  final double blur;

  const GlassyAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.profileImageUrl,
    this.badgeCount,
    this.onBackTap,
    this.actions,
    this.blur = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    const double islandHeight = 50.0;
    bool hasBadge = badgeCount != null && badgeCount! > 0;

    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            // Isolated Floating Back Button
            _FloatingIsland(
              blur: blur,
              isCircle: !hasBadge,
              height: islandHeight,
              child: GestureDetector(
                onTap: onBackTap ?? () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: hasBadge ? 12 : 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black),
                      if (hasBadge)
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: CustomText(
                            text: badgeCount.toString(),
                            textColor: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Isolated Floating Center Title Pill
            Expanded(
              child: _FloatingIsland(
                blur: blur,
                borderRadius: 28,
                height: islandHeight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: title ?? '',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        textOverflow: TextOverflow.ellipsis,
                        textColor: Colors.black,
                      ),
                      if (subtitle != null)
                        CustomText(
                          text: subtitle!,
                          fontSize: 11,
                          textColor: Colors.black54,
                          fontWeight: FontWeight.w400,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Isolated Floating Profile Image
            _FloatingIsland(
              blur: blur,
              isCircle: true,
              height: islandHeight,
              child: Container(
                padding: const EdgeInsets.all(2),
                child: CircleAvatar(
                  radius: 25, // Diameter ~50 fits in 54 height
                  backgroundImage: profileImageUrl != null ? NetworkImage(profileImageUrl!) : null,
                  backgroundColor: Colors.grey[200],
                  child: profileImageUrl == null ? const Icon(Icons.person, color: Colors.grey) : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}

class _FloatingIsland extends StatelessWidget {
  final Widget child;
  final double blur;
  final double borderRadius;
  final bool isCircle;
  final double height;

  const _FloatingIsland({
    required this.child,
    required this.blur,
    required this.height,
    this.borderRadius = 25,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(isCircle ? 50 : borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          height: height,
          width: isCircle ? height : null,
          decoration: BoxDecoration(
            color: Colors.white, // Translucent to show blur
            borderRadius: BorderRadius.circular(isCircle ? 50 : borderRadius),
            border: Border.all(color: Colors.white.withValues(alpha: 0.35), width: 0.6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
