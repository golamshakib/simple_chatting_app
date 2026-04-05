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
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Attachment Floating Button
          _BottomFloatingIsland(
            blur: blur,
            isCircle: true,
            child: IconButton(
              icon: const Icon(Icons.attach_file, color: Colors.grey, size: 28),
              onPressed: onAttach,
              padding: const EdgeInsets.all(12),
            ),
          ),
          const SizedBox(width: 8),

          // Main Input Floating Pill
          Expanded(
            child: _BottomFloatingIsland(
              blur: blur,
              borderRadius: 30,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
            child: IconButton(
              icon: const Icon(Icons.mic_none, color: Colors.black87, size: 28),
              onPressed: onMicTap,
              padding: const EdgeInsets.all(12),
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

  const _BottomFloatingIsland({
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
            color: Colors.white.withValues(alpha: 0.8),
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
          child: child,
        ),
      ),
    );
  }
}
