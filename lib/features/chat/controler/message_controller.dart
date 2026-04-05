import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/model/chatlist-model.dart';

class MessageController extends GetxController {
  final ConversationResult conversation = Get.arguments;
  final TextEditingController messageController = TextEditingController();

  // Observable for any future changes
  var isTextEmpty = true.obs;

  @override
  void onInit() {
    super.onInit();
    messageController.addListener(() {
      isTextEmpty.value = messageController.text.isEmpty;
    });
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      // Logic for sending message
      messageController.clear();
    }
  }
}
