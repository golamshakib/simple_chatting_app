import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/daimondshape_controller.dart';
import 'daimondshap_widget.dart';

class ShapeScreen extends StatelessWidget {
  const ShapeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final ShapeController controller = Get.put(ShapeController());

    return Scaffold(
      backgroundColor: Colors.grey[900], // Dark background to match your screenshot
      body: Center(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: controller.items.map((item) {
            return DiamondShapeWidget(
              number: item['number'],
              diamondColor: item['color'],
              onTap: () => print("Tapped on ${item['number']}"),
            );
          }).toList(),
        )),
      ),
    );
  }
}
