import 'package:flutter/material.dart';
import 'package:simple_chatting_app/core/common/widgets/custom_appbar.dart';
import 'package:simple_chatting_app/core/common/widgets/custom_text.dart';
import 'package:simple_chatting_app/core/utils/constants/app_sizes.dart';

class ChattingListScreen extends StatelessWidget {
  const ChattingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackIcon: false,
        title: "Chats",
        titleSize: getWidth(24),
        centerTitle: false,
      ),
      body: Center(child: CustomText(text: 'Chatting List Screen')),
    );
  }
}
