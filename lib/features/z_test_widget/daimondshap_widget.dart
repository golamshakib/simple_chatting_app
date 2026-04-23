import 'package:flutter/material.dart';
import 'dart:math' as math;

class DiamondShapeWidget extends StatelessWidget {
  final int number;
  final Color diamondColor;
  final String? label;
  final VoidCallback? onTap;

  const DiamondShapeWidget({
    super.key,
    required this.number,
    required this.diamondColor,
    this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: 150, // Adjustable width
        height: 60,  // Fixed height for the "pill" shape
        decoration: BoxDecoration(
          // Dark semi-transparent background like in the image
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(30), // Circular ends (Stadium shape)
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Rotated Container to create the Diamond Shape
            Transform.rotate(
              angle: 50 * math.pi / 180, // Rotate 45 degrees
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: diamondColor,
                  borderRadius: BorderRadius.circular(4), // Slightly rounded diamond tips
                ),
              ),
            ),
            // The Number (Rotated back to 0 degrees so it stays upright)
            Text(
              number.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
