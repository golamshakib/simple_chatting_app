import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_chatting_app/core/common/widgets/custom_appbar.dart';
import 'package:simple_chatting_app/core/utils/constants/app_sizes.dart';

import '../../controler/chatlist_controller.dart';
import '../widgets/chatlist_item.dart';

class ChattingListScreen extends StatelessWidget {
  const ChattingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatListController());

    return Scaffold(
      appBar: CustomAppBar(
        showBackIcon: false,
        title: "Chats",
        titleSize: getWidth(24),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(getWidth(24)),
          child: Column(
            children: [
             Expanded(
                  child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return ChatListItem();
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


