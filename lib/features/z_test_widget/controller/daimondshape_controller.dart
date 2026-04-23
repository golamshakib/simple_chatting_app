import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ShapeController extends GetxController {
  // Reactive list of shapes data
  final items = <Map<String, dynamic>>[
    {'number': 1, 'color': const Color(0xFFFFB822)}, // Yellow
    {'number': 2, 'color': const Color(0xFF888888)}, // Grey
    {'number': 3, 'color': const Color(0xFFF18C44)}, // Orange
    {'number': 4, 'color': const Color(0xFF6DA34D)}, // Green
  ].obs;
}
