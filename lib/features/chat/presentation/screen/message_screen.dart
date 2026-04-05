import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_chatting_app/core/common/widgets/custom_appbar.dart';
import 'package:simple_chatting_app/features/chat/data/model/chatlist-model.dart';

class MessageScreen extends StatelessWidget {

  MessageScreen({super.key});
  final ConversationResult conversation = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final participants = conversation.participants;
    log('Data is: ${conversation.toJson()}');
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text("Message Screen"),
      ),
    );
  }
}

