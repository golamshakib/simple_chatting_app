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
    this.blur = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            // Isolated Floating Back Button
            _FloatingIsland(
              blur: blur,
              child: GestureDetector(
                onTap: onBackTap ?? () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: Colors.black,
                      ),
                      if (badgeCount != null && badgeCount! > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: CustomText(
                            text: badgeCount.toString(),
                            textColor: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Isolated Floating Center Title Pill
            Expanded(
              child: _FloatingIsland(
                blur: blur,
                borderRadius: 30,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 16,
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
            const SizedBox(width: 8),
            // Isolated Floating Profile Image
            _FloatingIsland(
              blur: blur,
              isCircle: true,
              child: Container(
                padding: const EdgeInsets.all(2), // Space for circle effect
                child: CircleAvatar(
                  radius: 23,
                  backgroundImage: profileImageUrl != null
                      ? NetworkImage(profileImageUrl!)
                      : null,
                  backgroundColor: Colors.grey[200],
                  child: profileImageUrl == null
                      ? const Icon(Icons.person, color: Colors.grey)
                      : null,
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

  const _FloatingIsland({
    required this.child,
    required this.blur,
    this.borderRadius = 22,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(isCircle ? 50 : borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.75),
            borderRadius: BorderRadius.circular(isCircle ? 50 : borderRadius),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.3),
              width: 0.6,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
