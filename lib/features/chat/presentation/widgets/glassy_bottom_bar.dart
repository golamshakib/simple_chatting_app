import 'dart:ui';
import 'package:flutter/material.dart';

class GlassyBottomBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onAttach;
  final VoidCallback? onSend;
  final VoidCallback? onMicTap;
  final double blur;

  const GlassyBottomBar({
    super.key,
    required this.controller,
    this.onAttach,
    this.onSend,
    this.onMicTap,
    this.blur = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    const double islandHeight = 50.0;

    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Attachment Floating Button
          _BottomFloatingIsland(
            blur: blur,
            isCircle: true,
            height: islandHeight,
            child: IconButton(
              icon: const Icon(Icons.attach_file, color: Colors.grey, size: 28),
              onPressed: onAttach,
            ),
          ),
          const SizedBox(width: 8),

          // Main Input Floating Pill
          Expanded(
            child: _BottomFloatingIsland(
              blur: blur,
              borderRadius: 28,
              height: islandHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: "Message",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.access_time, color: Colors.grey, size: 26),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Microphone Floating Button
          _BottomFloatingIsland(
            blur: blur,
            isCircle: true,
            height: islandHeight,
            child: IconButton(
              icon: const Icon(Icons.mic_none, color: Colors.black87, size: 28),
              onPressed: onMicTap,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomFloatingIsland extends StatelessWidget {
  final Widget child;
  final double blur;
  final double borderRadius;
  final bool isCircle;
  final double height;

  const _BottomFloatingIsland({
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(isCircle ? 50 : borderRadius),
            border: Border.all(color: Colors.white.withValues(alpha: 0.35), width: 0.6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
